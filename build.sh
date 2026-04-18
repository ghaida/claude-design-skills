#!/bin/bash
# Design with Intent
# Build script: generates platform-specific distributions from source skills
#
# Platforms:
#   .claude/skills/   — Claude Code skills (native format, direct copy)
#   .claude/agents/   — Claude Code subagents (source + injected frontmatter)
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
# CLAUDE CODE — .claude/
# Skills: native format, copied as-is.
# Agents: source stays clean (readable + paste-friendly for Claude Projects,
# web Claude, etc.); Claude-Code-specific frontmatter is injected at build time.
# =============================================================================

echo -e "${GREEN}[1/3] Claude Code (.claude/)${NC}"

CLAUDE_SKILLS_DIR="$SCRIPT_DIR/.claude/skills"
rm -rf "$CLAUDE_SKILLS_DIR"
mkdir -p "$CLAUDE_SKILLS_DIR"

for skill_dir in "$SKILLS_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    cp -r "$skill_dir" "$CLAUDE_SKILLS_DIR/$skill_name"
done

skill_count=$(ls -d "$CLAUDE_SKILLS_DIR"/*/ 2>/dev/null | wc -l | tr -d ' ')
echo "  Skills: $skill_count (native format)"

CLAUDE_AGENTS_DIR="$SCRIPT_DIR/.claude/agents"
rm -rf "$CLAUDE_AGENTS_DIR"
mkdir -p "$CLAUDE_AGENTS_DIR"

# Per-agent descriptions are loaded into named variables via read-d-heredoc
# rather than inline $(cat <<EOF ... EOF) inside a case statement, because
# the inline form trips a bash 3.2 parser bug on stock macOS bash (the first
# case misparses and subsequent heredocs confuse the rest of the parse).
# `IFS= read -r -d ''` reads until EOF and always returns non-zero at EOF,
# so `|| :` prevents `set -e` from killing the script.

IFS= read -r -d '' NOOR_DESC << 'ENDOFDESC' || :
Entry point for Intent UX design work. Use at the start of any design engagement — or anytime the team needs reorientation — to establish project context (users, product, constraints, ethical stance, success criteria), hold the six core UX principles in conversation, flag manipulative patterns against the Intent anti-pattern catalog as they come up, and route to the right specialist agent (ember, wren, vigil, rune, sage). Use when the user says "start a new project", "set up the context", "who are we building for", "is this ethical", "is this a dark pattern", "which agent do I need", or when the specialist isn't yet obvious.
ENDOFDESC

IFS= read -r -d '' EMBER_DESC << 'ENDOFDESC' || :
Strategy and research specialist. Use when a design problem is unclear, fuzzy, or potentially misframed — before any flows, copy, or specs are produced. Frames problems against five foundational questions (problem validation, audience, solution fit, feature validation, competitive landscape), synthesizes existing research, sizes opportunities with evidence, defines testable hypotheses, and scopes projects (will-do / will-not-do). Invoke when starting a new project, when stakeholders disagree on what to build, when research exists but hasn't been synthesized, when someone says "we already know what users want" without evidence, or when the user asks to "frame the problem", "synthesize research", "write a brief", "scope this", or "do we even need to build this".
ENDOFDESC

IFS= read -r -d '' WREN_DESC << 'ENDOFDESC' || :
Experience designer. Use once the problem is framed and the experience itself needs designing — flows, information architecture, or interface copy. Designs end-to-end user journeys (signup, onboarding, checkout, search, error recovery, settings, dashboards), structures navigation and taxonomy, and writes what the product says at every moment (error messages, empty states, CTAs, microcopy, voice and tone). Invoke when users can't find things, can't complete tasks, or don't understand what the product is saying — or when the user says "design this flow", "how should users experience X", "organize the IA", "what should this button say", "write the error copy", or "define the voice".
ENDOFDESC

IFS= read -r -d '' VIGIL_DESC << 'ENDOFDESC' || :
Quality, resilience, and accessibility specialist — the honest evaluator. Use to systematically assess an existing design against Nielsen's 10 heuristics, the Intent anti-pattern catalog, and WCAG 2.2; to stress-test against edge cases, error recovery, empty states, loading states, offline behavior, and real-world chaos; or to audit keyboard, screen reader, cognitive, and motor accessibility. Produces scored UX health reports (0-100) with P0-P3 findings routed to the specialist that owns each fix. Invoke when the user says "review this design", "audit the UX", "find the dark patterns", "is this accessible", "what happens when X fails", "stress test this", "harden this for production", or "run a heuristic evaluation".
ENDOFDESC

IFS= read -r -d '' RUNE_DESC << 'ENDOFDESC' || :
Design-to-engineering handoff specialist. Use when a design is decided and needs to be documented precisely enough to implement — detailed specs per screen (behavior, layout, copy, interaction logic, states, accessibility), copy/variant matrices, edge case documentation, asset inventories, stakeholder presentations, and test plans with success criteria. Also runs ethical review against the Intent anti-pattern catalog before sign-off. Invoke when the user says "write the spec", "prepare the handoff", "document this for engineering", "what does the dev need", "create a review deck", or "is this ready to ship".
ENDOFDESC

IFS= read -r -d '' SAGE_DESC << 'ENDOFDESC' || :
Brainstorming partner for sitting with a problem before solving it. Not a phase — a cognitive mode any other agent can enter when the problem needs more exploration before the next move. Runs a strict three-phase protocol (problem immersion, associative expansion, synthesis only when invited) with cross-domain connection-making, assumption challenging, and structured check-ins. Invoke when the team is stuck, when a problem feels misframed, when the obvious answer isn't satisfying, when another agent's output feels too tidy, or when the user says "I'm stuck", "sit with this", "brainstorm", "go deeper", "think differently", "what am I missing", "go weird with it", "don't filter yourself", "philosopher mode", or "expansive mode".
ENDOFDESC

for agent_file in "$AGENTS_DIR"/*.md; do
    agent_name=$(basename "$agent_file" .md)

    # HOW-TO-USE is documentation for humans, not a subagent
    if [ "$agent_name" = "HOW-TO-USE" ]; then
        continue
    fi

    model=""
    description=""
    case "$agent_name" in
        noor)  description="$NOOR_DESC" ;;
        ember) description="$EMBER_DESC" ;;
        wren)  description="$WREN_DESC" ;;
        vigil) description="$VIGIL_DESC" ;;
        rune)  description="$RUNE_DESC" ;;
        sage)  description="$SAGE_DESC"; model="opus" ;;
        *)
            echo "  Warning: no frontmatter mapping for agent '$agent_name' — skipping" >&2
            continue
            ;;
    esac

    # Strip trailing newline read-d leaves on the captured heredoc content
    description="${description%$'\n'}"

    {
        echo "---"
        echo "name: $agent_name"
        echo "description: $description"
        if [ -n "$model" ]; then
            echo "model: $model"
        fi
        echo "tools: Read, Write, Edit, Glob, Grep, WebSearch, WebFetch, Skill"
        echo "---"
        echo ""
        cat "$agent_file"
    } > "$CLAUDE_AGENTS_DIR/$agent_name.md"
done

agent_count=$(ls "$CLAUDE_AGENTS_DIR"/*.md 2>/dev/null | wc -l | tr -d ' ')
echo "  Agents: $agent_count (frontmatter injected)"

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

    # If this skill has reference docs, emit each as its own .mdc file
    # instead of inlining them (prevents context bloat in Cursor)
    if [ -d "$skill_dir/references" ]; then
        for ref_file in "$skill_dir/references"/*.md; do
            if [ -f "$ref_file" ]; then
                ref_name=$(basename "$ref_file" .md)
                ref_content=$(cat "$ref_file")

                # Generate a trigger description from the reference name
                case "$ref_name" in
                    accessibility-foundations)
                        ref_desc="Intent reference: WCAG 2.2 for designers, screen reader design, keyboard navigation, cognitive and motor accessibility, inclusive design principles and testing methodology. Load when working on accessibility, a11y audits, inclusive design, or assistive technology." ;;
                    content-strategy)
                        ref_desc="Intent reference: voice framework methodology, tone matrices, content modeling, microcopy patterns, terminology governance, readability scoring. Load when working on UX writing, voice and tone, content models, or copy strategy." ;;
                    ethical-design)
                        ref_desc="Intent reference: anti-pattern remediation, dark pattern alternatives, consent design, design ethics frameworks, regulatory compliance patterns. Load when fixing dark patterns, designing consent flows, or reviewing ethical concerns." ;;
                    information-architecture)
                        ref_desc="Intent reference: navigation patterns and trade-offs, taxonomy design, mental model theory, wayfinding principles, search behavior models. Load when designing navigation, site structure, taxonomy, or information hierarchy." ;;
                    interaction-patterns)
                        ref_desc="Intent reference: form design, state management, validation patterns, feedback loops, progressive disclosure, error recovery, undo/redo. Load when designing forms, interactions, input validation, or state transitions." ;;
                    measurement-frameworks)
                        ref_desc="Intent reference: HEART framework, Goal-Signal-Metric mapping, A/B test design, statistical literacy for designers, ethical measurement. Load when defining metrics, designing experiments, or building measurement plans." ;;
                    research-methods)
                        ref_desc="Intent reference: method selection matrix, sample size guidance, interview techniques, usability testing, survey design, synthesis frameworks. Load when planning or conducting user research." ;;
                    service-design)
                        ref_desc="Intent reference: service blueprinting methodology, frontstage/backstage mapping, touchpoint analysis, moment-of-truth design, channel orchestration. Load when mapping services, systems, or cross-channel experiences." ;;
                    *)
                        ref_desc="Intent reference document: $ref_name" ;;
                esac

                cat > "$CURSOR_DIR/intent-ref-$ref_name.mdc" << ENDOFREF
---
description: $ref_desc
alwaysApply: false
---

$ref_content
ENDOFREF
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
WORKFLOWS_BACKUP=""
if [ -d "$GITHUB_DIR/workflows" ]; then
    WORKFLOWS_BACKUP=$(mktemp -d)
    cp -r "$GITHUB_DIR/workflows" "$WORKFLOWS_BACKUP/workflows"
fi
rm -rf "$GITHUB_DIR"
mkdir -p "$COPILOT_SKILLS_DIR"
if [ -n "$WORKFLOWS_BACKUP" ] && [ -d "$WORKFLOWS_BACKUP/workflows" ]; then
    mv "$WORKFLOWS_BACKUP/workflows" "$GITHUB_DIR/workflows"
    rmdir "$WORKFLOWS_BACKUP"
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
echo "  .claude/agents/     — $agent_count agents (frontmatter injected)"
echo "  .cursor/rules/      — $mdc_count rules (.mdc format)"
echo "  .github/            — copilot-instructions.md + AGENTS.md + $copilot_count skills"
echo ""
echo -e "${YELLOW}Note:${NC} Commit the generated directories to make skills and agents"
echo "available in each platform. Run this script again after editing source files."
