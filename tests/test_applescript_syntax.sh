#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/macgtd-syntax.XXXXXX")
trap 'rm -rf "$TEST_DIR"' EXIT
passed=0
failed=0
compile() {
    if osacompile -o "$TEST_DIR/compiled.scpt" "$1" > "$TEST_DIR/output.log" 2>&1; then
        echo "PASS: $2"
        passed=$((passed + 1))
    else
        echo "FAIL: $2"
        cat "$TEST_DIR/output.log"
        failed=$((failed + 1))
    fi
}
while IFS= read -r -d '' script; do
    compile "$script" "$script"
done < <(find workflows/alfred -name '*.scpt' -type f -print0)
for workflow in workflows/*/*.workflow; do
    index=0
    while plutil -extract "actions.$index.action.ActionParameters.source" raw \
        "$workflow/Contents/document.wflow" > "$TEST_DIR/source.applescript" 2>/dev/null; do
        compile "$TEST_DIR/source.applescript" "$workflow action $index"
        index=$((index + 1))
    done
    if [[ "$index" -eq 0 ]]; then
        echo "FAIL: No AppleScript action in $workflow"
        failed=$((failed + 1))
    fi
done
echo "Syntax checks: $passed passed, $failed failed"
[[ "$passed" -gt 0 && "$failed" -eq 0 ]]
