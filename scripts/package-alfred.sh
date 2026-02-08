#!/bin/bash
set -euo pipefail

# Package the Alfred workflow as a .alfredworkflow file (zip archive)
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ALFRED_DIR="${REPO_ROOT}/workflows/alfred/workflow"
OUTPUT_DIR="${REPO_ROOT}/dist"

if [[ ! -d "${ALFRED_DIR}" ]]; then
    echo "Error: Alfred workflow directory not found at ${ALFRED_DIR}" >&2
    exit 1
fi

mkdir -p "${OUTPUT_DIR}"

# .alfredworkflow is just a zip file
cd "${ALFRED_DIR}"
zip -r "${OUTPUT_DIR}/MacGTD.alfredworkflow" . -x "*.DS_Store"

echo "Packaged: ${OUTPUT_DIR}/MacGTD.alfredworkflow"
ls -lh "${OUTPUT_DIR}/MacGTD.alfredworkflow"
