#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/.."
# Compatibility entry point: require an isolated desktop account before mutation.
exec mise exec -- python tests/run.py automator
