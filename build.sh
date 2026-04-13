#!/bin/bash
# Design with Intent
# Build script: generates platform-specific distributions from source skills
#
# Platforms:
#   .claude/skills/   — Claude Code (native format, direct copy)
#   .cursor/rules/    — Cursor (.mdc files, simplified frontmatter)
#   .github/          — VS Code Copilot (copilot-instructions.md + skill files)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/skills"
AGENTS_DIR="$SCRIPT_DIR/agents"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}Design with Intent${NC}"
echo "Building platform distributions..."
echo ""

# =============================================================================
# CLAUDE CODE — .claude/skills/
# Native format. Copy skill directories as-is.
# =============================================================================

echo -e "${GREEN}[1/3] Claude Code (.claude/skills/)${NC}"

CLAUDE_DIR="$SCRIPT_DIR/.claude/skills"
rm -rf "$CLAUDE_DIR"
mkdir -p "$CLAUDE_DIR"

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    cp -r "$skill_dir" "$CLAUDE_DIR/$skill_name"
done

skill_count=$(ls -d "$CLAUDE_DIR"/*/ 2>/dev/null | wc -l | tr -d ' ')
echo "  Copied $skill_count skills (native format)"

# =============================================================================
# CURSOR — .cursor/rules/
# .mdc files with simplified frontmatter (description, alwaysApply)
# Each skill becomes a flat .mdc file. Reference docs are appended to their
# parent skill's .mdc file.
# =============================================================================

echo -e "${GREEN}[2/3] Cursor (.cursor/rules/)${NC}"

CURSOR_DIR="$SCRIPT_DIR/.cursor/rules"
rm -rf "$CURSOR_DIR"
mkdir -p "$CURSOR_DIR"

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    skill_file="$skill_dir/SKILL.md"

    if [ ! -f "$skill_file" ]; then
        continue
    fi

    # Extract description from YAML frontmatter
    # Read everything between first --- and second ---, grab description field
    description=$(awk '
        /^---$/ { count++; next }
        count == 1 && /^description:/ {
            # Get the description value (may be multi-line with >)
            sub(/^description: *>? */, "")
            desc = $0
            # Read continuation lines (indented)
            while ((getline line) > 0) {
                if (line ~ /^  /) {
                    sub(/^  +/, "", line)
                    desc = desc " " line
                } else {
                    break
                }
            }
            print desc
            exit
        }
    ' "$skill_file")

    # Get content after frontmatter (skip YAML block)
    content=$(awk '
        BEGIN { count = 0; printing = 0 }
        /^---$/ { count++; if (count == 2) { printing = 1; next } }
        printing { print }
    ' "$skill_file")

    # If this skill has reference docs, append them
    ref_content=""
    if [ -d "$skill_dir/references" ]; then
        for ref_file in "$skill_dir/references"/*.md; do
            if [ -f "$ref_file" ]; then
                ref_name=$(basename "$ref_file" .md)
                ref_content="$ref_content

---

## Reference: $ref_name

$(cat "$ref_file")"
            fi
        done
    fi

    # Determine if this should always apply
    # Only the intent (master) skill should always apply
    always_apply="false"
    if [ "$skill_name" = "intent" ]; then
        always_apply="true"
    fi

    # Write .mdc file
    cat > "$CURSOR_DIR/$skill_name.mdc" << ENDOFMDC
---
description: $description
alwaysApply: $always_apply
---

$content
$ref_content
ENDOFMDC

done

mdc_count=$(ls "$CURSOR_DIR"/*.mdc 2>/dev/null | wc -l | tr -d ' ')
echo "  Generated $mdc_count .mdc rule files"

# =============================================================================
# VS CODE COPILOT — .github/
# copilot-instructions.md with core Intent principles
# Individual skills as .instructions.md files in .github/copilot/skills/
# =============================================================================

echo -e "${GREEN}[3/3] VS Code Copilot (.github/)${NC}"

GITHUB_DIR="$SCRIPT_DIR/.github"
COPILOT_SKILLS_DIR="$GITHUB_DIR/copilot/skills"
# Preserve workflows directory during rebuild
if [ -d "$GITHUB_DIR/workflows" ]; then
    cp -r "$GITHUB_DIR/workflows" /tmp/_intent_workflows_backup
fi
rm -rf "$GITHUB_DIR"
mkdir -p "$COPILOT_SKILLS_DIR"
if [ -d /tmp/_intent_workflows_backup ]; then
    mv /tmp/_intent_workflows_backup "$GITHUB_DIR/workflows"
fi

# Generate the main copilot-instructions.md from the intent skill
# This is the always-loaded file — contains core principles and routing
intent_content=$(awk '
    BEGIN { count = 0; printing = 0 }
    /^---$/ { count++; if (count == 2) { printing = 1; next } }
    printing { print }
' "$SKILLS_DIR/intent/SKILL.md")

cat > "$GITHUB_DIR/copilot-instructions.md" << ENDOFCOPILOT
# Design with Intent

This project uses the Intent UX design strategy system. When working on design decisions, UX strategy, user research, information architecture, content strategy, accessibility, or engineering handoff, follow these principles and use the specialized skill files in .github/copilot/skills/.

$intent_content
ENDOFCOPILOT

# Copy each skill (except intent, which is in the main file) as a separate file
for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    skill_file="$skill_dir/SKILL.md"

    if [ ! -f "$skill_file" ] || [ "$skill_name" = "intent" ]; then
        continue
    fi

    # Copy skill file
    cp "$skill_file" "$COPILOT_SKILLS_DIR/$skill_name.md"

    # Copy reference docs if they exist
    if [ -d "$skill_dir/references" ]; then
        mkdir -p "$COPILOT_SKILLS_DIR/$skill_name"
        cp "$skill_dir/references"/*.md "$COPILOT_SKILLS_DIR/$skill_name/"
    fi
done

# Also generate AGENTS.md for Copilot agent mode
cat > "$GITHUB_DIR/AGENTS.md" << ENDOFAGENTS
# Design with Intent

This project uses the Intent UX design strategy system.

## Skills

Specialized design skills are available in .github/copilot/skills/:

$(for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    # Extract full description (handles multi-line YAML > format)
    desc=$(awk '
        /^---$/ { count++; next }
        count == 1 && /^description:/ {
            sub(/^description: *>? */, "")
            desc = $0
            while ((getline line) > 0) {
                if (line ~ /^  /) {
                    sub(/^  +/, "", line)
                    desc = desc " " line
                } else {
                    break
                }
            }
            # Truncate to first sentence for AGENTS.md brevity
            match(desc, /\. /)
            if (RSTART > 0) desc = substr(desc, 1, RSTART)
            print desc
            exit
        }
    ' "$skill_dir/SKILL.md" 2>/dev/null)
    echo "- **$skill_name** — $desc"
done)

## Core Principles

- Respect user autonomy — no manipulation, clear choices, easy reversal
- Design for real conditions — slow networks, distraction, disability, stress
- Make intent visible — every screen should answer: what can I do, why should I, what happens next
- Evidence over intuition — research, test, measure
- Systems over screens — a flow is part of a system is part of a user's life
- Ethical defaults — opt-in over opt-out, privacy by default, honest over persuasive

See .github/copilot-instructions.md for the full Intent system and anti-pattern catalog.
ENDOFAGENTS

copilot_count=$(ls "$COPILOT_SKILLS_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  Generated copilot-instructions.md + AGENTS.md + $copilot_count skill files"

# =============================================================================
# Summary
# =============================================================================

echo ""
echo -e "${BLUE}Build complete.${NC}"
echo ""
echo "  .claude/skills/     — $skill_count skills (native format)"
echo "  .cursor/rules/      — $mdc_count rules (.mdc format)"
echo "  .github/            — copilot-instructions.md + AGENTS.md + $copilot_count skills"
echo ""
echo -e "${YELLOW}Note:${NC} Commit the generated directories to make skills available"
echo "in each platform. Run this script again after editing source skills."
