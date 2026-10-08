#!/usr/bin/env python3
"""Fail before GUI or network mutation if dedicated live test configuration is missing."""
import os
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / "tests"))
from support.live_support import REQUIRED


def main():
    if os.environ.get("MACGTD_LIVE_TEST_ACCOUNTS") != "1":
        raise SystemExit("Explicit dedicated test-account confirmation is required")
    missing = [name for names in REQUIRED.values() for name in names if not os.environ.get(name)]
    if missing:
        raise SystemExit("Missing dedicated live test configuration: " + ", ".join(missing))
    print("Dedicated live test configuration is present; credential values are never printed.")


if __name__ == "__main__":
    main()
