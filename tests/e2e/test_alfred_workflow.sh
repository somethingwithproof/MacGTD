#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")/../.."
exec mise exec -- python tests/run.py alfred
