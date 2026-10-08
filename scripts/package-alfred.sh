#!/bin/bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ALFRED_DIR="${REPO_ROOT}/workflows/alfred/workflow"
OUTPUT_DIR="${REPO_ROOT}/dist"
[[ -d "$ALFRED_DIR" ]] || { echo "Missing Alfred workflow: $ALFRED_DIR" >&2; exit 1; }
mkdir -p "$OUTPUT_DIR"
PACKAGE_DIR=$(mktemp -d "$OUTPUT_DIR/.macgtd-package.XXXXXX")
trap 'rm -rf "$PACKAGE_DIR"' EXIT
# Build from scratch: updating an existing ZIP retains deleted source files.
cd "$ALFRED_DIR"
zip -r "$PACKAGE_DIR/MacGTD.alfredworkflow" . -x '*.DS_Store'
unzip -t "$PACKAGE_DIR/MacGTD.alfredworkflow"
mv "$PACKAGE_DIR/MacGTD.alfredworkflow" "$OUTPUT_DIR/MacGTD.alfredworkflow"
echo "Packaged: $OUTPUT_DIR/MacGTD.alfredworkflow"
