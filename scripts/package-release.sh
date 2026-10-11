#!/bin/bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_ROOT"
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
PACKAGE_DIR=$(mktemp -d "$REPO_ROOT/dist/.release.XXXXXX")
trap 'rm -rf "$PACKAGE_DIR"' EXIT
cp -R workflows "$PACKAGE_DIR/workflows"
# Ship the library compiled from current source, with its editable source.
rm -rf "$PACKAGE_DIR/workflows/alfred/GTDLib.scptd"
cp -R dist/GTDLib.scptd "$PACKAGE_DIR/workflows/alfred/GTDLib.scptd"
cp LICENSE README.md "$PACKAGE_DIR/"
cd "$PACKAGE_DIR"
zip -r MacGTD.zip workflows LICENSE README.md -x '*.DS_Store'
unzip -t MacGTD.zip
mv MacGTD.zip "$REPO_ROOT/dist/MacGTD.zip"
cd "$REPO_ROOT/dist"
shasum -a 256 MacGTD.zip MacGTD.alfredworkflow > SHA256SUMS
shasum -a 256 -c SHA256SUMS
