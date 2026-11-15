#!/bin/bash
# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

set -euo pipefail
cd "$(dirname "$0")/../.."
exec mise exec -- python tests/run.py alfred
