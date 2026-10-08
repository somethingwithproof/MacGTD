#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/../.."
TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/macgtd-install.XXXXXX")
trap 'rm -rf "$TEST_DIR"' EXIT
count=0
# Exercise every bundle, including all five Apple workflows and all external targets.
for workflow in workflows/*/*.workflow; do
    installed="$TEST_DIR/$(basename "$workflow")"
    cp -R "$workflow" "$installed"
    diff -r "$workflow" "$installed"
    plutil -lint "$installed/Contents/info.plist" "$installed/Contents/document.wflow"
    index=0
    while plutil -extract "actions.$index.action.ActionParameters.source" raw \
        "$installed/Contents/document.wflow" > "$TEST_DIR/source.applescript" 2>/dev/null; do
        osacompile -o "$TEST_DIR/compiled.scpt" "$TEST_DIR/source.applescript"
        index=$((index + 1))
    done
    [[ "$index" -gt 0 ]] || { echo "No AppleScript actions found: $workflow" >&2; exit 1; }
    count=$((count + 1))
done
[[ "$count" -eq 11 ]] || { echo "Expected 11 workflow bundles, found $count" >&2; exit 1; }
echo "All $count workflow bundles survived installation and compilation"
