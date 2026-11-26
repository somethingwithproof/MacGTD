#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

"""Fail before GUI or network mutation if dedicated live test configuration is missing."""
import os
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tests"))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from i18n import t
from support.live_support import REQUIRED


def main():
    if os.environ.get("MACGTD_LIVE_TEST_ACCOUNTS") != "1":
        raise SystemExit(t("live.confirm_required"))
    missing = [name for names in REQUIRED.values() for name in names if not os.environ.get(name)]
    if missing:
        raise SystemExit(t("live.missing_config", names=", ".join(missing)))
    print(t("live.config_present"))


if __name__ == "__main__":
    main()
