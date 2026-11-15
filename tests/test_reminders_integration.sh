#!/bin/bash
# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

set -euo pipefail
cd "$(dirname "$0")/.."
# Compatibility entry point: require an isolated desktop account before mutation.
exec mise exec -- python tests/run.py automator
