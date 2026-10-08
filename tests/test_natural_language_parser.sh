#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
TEST_DIR=$(mktemp -d "${TMPDIR:-/tmp}/macgtd-parser.XXXXXX")
trap 'rm -rf "$TEST_DIR"' EXIT
osacompile -o "$TEST_DIR/parser.scpt" workflows/alfred/workflow/scripts/natural_language_task.scpt
osascript tests/support/parser.applescript "$TEST_DIR/parser.scpt"
