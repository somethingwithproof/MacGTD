#!/usr/bin/env python3
"""Embed the shared parser in the standalone native Automator capture bundle."""
import argparse
from pathlib import Path
import plistlib
import re

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--check", action="store_true")
args = parser.parse_args()
source = (ROOT / "workflows/alfred/workflow/scripts/natural_language_task.scpt").read_text()
replacement = '''on run {input, parameters}
    display dialog "Enter task (!1/!2/!3 priority, due:today/tomorrow/date, @context, +project):" default answer "" with title "Quick Capture"
    set inputText to text returned of result
    if inputText is "" then return input
    set taskData to my parseTaskInput(inputText)
    if taskText of taskData is "" then return input
    my createSmartTask(taskData)
    return input
end run'''
source = re.sub(r"on run argv\n.*?end run", lambda match: replacement, source, count=1, flags=re.DOTALL)
path = ROOT / "workflows/apple/GTD-QuickCapture.workflow/Contents/document.wflow"
data = plistlib.loads(path.read_bytes())
parameters = data["actions"][0]["action"]["ActionParameters"]
if args.check:
    if parameters["source"] != source:
        raise SystemExit("Native capture parser drifted; run mise exec -- python scripts/sync-native-parser.py")
else:
    parameters["source"] = source
    path.write_bytes(plistlib.dumps(data, sort_keys=False))
