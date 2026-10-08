#!/bin/bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SOURCE="$REPO_ROOT/workflows/alfred/GTDLib.scptd"
OUTPUT="$REPO_ROOT/dist/GTDLib.scptd"
mkdir -p "$REPO_ROOT/dist"
BUILD_DIR=$(mktemp -d "$REPO_ROOT/dist/.gtdlib.XXXXXX")
trap 'rm -rf "$BUILD_DIR"' EXIT
cp -R "$SOURCE" "$BUILD_DIR/GTDLib.scptd"
osacompile -o "$BUILD_DIR/GTDLib.scptd/Contents/Resources/Scripts/main.scpt" \
    "$SOURCE/Contents/Resources/Scripts/main.applescript"
# dist is generated output; replace the complete bundle rather than retaining stale resources.
if [[ -e "$OUTPUT" ]]; then
    mv "$OUTPUT" "$BUILD_DIR/previous.scptd"
fi
mv "$BUILD_DIR/GTDLib.scptd" "$OUTPUT"
echo "Built: $OUTPUT"
