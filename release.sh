#!/bin/bash
# Design with Intent — Release Script
#
# Usage: ./release.sh <version>
# Example: ./release.sh 1.1.0
#
# This script:
#   1. Updates version in all source skill files and plugin manifests
#   2. Rebuilds platform distributions (Claude Code, Cursor, Copilot)
#   3. Commits the version bump
#   4. Creates a git tag (v<version>)
#   5. Pushes commit + tag (triggers GitHub Actions release workflow)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# =============================================================================
# Validate input
# =============================================================================

if [ $# -ne 1 ]; then
    echo -e "${RED}Usage:${NC} ./release.sh <version>"
    echo "  Example: ./release.sh 1.1.0"
    exit 1
fi

VERSION="$1"

# Validate semver format
if ! echo "$VERSION" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+$'; then
    echo -e "${RED}Error:${NC} Version must be semver (e.g., 1.1.0)"
    exit 1
fi

TAG="v$VERSION"

# Check for uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo -e "${RED}Error:${NC} You have uncommitted changes. Commit or stash them first."
    exit 1
fi

# Check tag doesn't already exist
if git rev-parse "$TAG" >/dev/null 2>&1; then
    echo -e "${RED}Error:${NC} Tag $TAG already exists."
    exit 1
fi

# Get current version from plugin.json
CURRENT=$(grep '"version"' "$SCRIPT_DIR/.claude-plugin/plugin.json" | head -1 | sed 's/.*"version": *"\([^"]*\)".*/\1/')

echo -e "${BLUE}Design with Intent — Release${NC}"
echo ""
echo "  Current version: $CURRENT"
echo "  New version:     $VERSION"
echo "  Tag:             $TAG"
echo ""

# =============================================================================
# Bump versions
# =============================================================================

echo -e "${GREEN}[1/4] Bumping versions${NC}"

# Source skill files (frontmatter: version: X.Y.Z)
for skill_file in "$SCRIPT_DIR"/skills/*/SKILL.md; do
    sed -i '' "s/^version: $CURRENT$/version: $VERSION/" "$skill_file"
done
skill_count=$(ls "$SCRIPT_DIR"/skills/*/SKILL.md 2>/dev/null | wc -l | tr -d ' ')
echo "  Updated $skill_count source skill files"

# Plugin manifests (JSON: "version": "X.Y.Z")
sed -i '' "s/\"version\": \"$CURRENT\"/\"version\": \"$VERSION\"/" "$SCRIPT_DIR/.claude-plugin/plugin.json"
sed -i '' "s/\"version\": \"$CURRENT\"/\"version\": \"$VERSION\"/" "$SCRIPT_DIR/.claude-plugin/marketplace.json"
echo "  Updated plugin.json + marketplace.json"

# =============================================================================
# Rebuild distributions
# =============================================================================

echo -e "${GREEN}[2/4] Rebuilding distributions${NC}"
"$SCRIPT_DIR/build.sh"

# =============================================================================
# Commit
# =============================================================================

echo -e "${GREEN}[3/4] Committing${NC}"
git add -A
git commit -m "Release $TAG"

# =============================================================================
# Tag and push
# =============================================================================

echo -e "${GREEN}[4/4] Tagging and pushing${NC}"
git tag "$TAG"
git push
git push origin "$TAG"

echo ""
echo -e "${BLUE}Release $TAG pushed.${NC}"
echo "GitHub Actions will create the release at:"
echo "  https://github.com/ghaida/intent/releases/tag/$TAG"
