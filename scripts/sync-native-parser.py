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
event_replacement = r'''on run {input, parameters}
    set captureTitle to "GTD Event Quick Capture"
    display dialog "Enter event (e.g., Meeting tomorrow 2pm 1h @Conference Room):" default answer "" with title captureTitle
    set inputText to text returned of result
    if inputText is "" then return input
    set eventData to my parseEventInput(inputText)
    set capturedTitle to eventTitle of eventData
    set capturedStart to eventStart of eventData
    set capturedEnd to eventEnd of eventData
    set capturedLocation to eventLocation of eventData
    tell application "Calendar"
        set targetCalendar to first calendar whose writable is true
        make new event at end of events of targetCalendar with properties {summary:capturedTitle, start date:capturedStart, end date:capturedEnd, location:capturedLocation}
    end tell
    display notification ("Event created: " & capturedTitle) with title captureTitle
    return input
end run

on parseEventInput(inputText)
    set capturedLocation to ""
    set locationMarker to my findPattern(inputText, "(?<!\\S)@.+$")
    if locationMarker is not "" then
        set capturedLocation to my trimText(text 2 thru -1 of locationMarker)
        set inputText to my removePattern(inputText, locationMarker)
    end if
    set durationMinutes to 60
    set durationMarker to my findPattern(inputText, "(?i)(?<!\\S)[0-9]+[mh](?=\\s|$)")
    if durationMarker is not "" then
        set durationMinutes to text 1 thru -2 of durationMarker as integer
        if durationMarker ends with "h" or durationMarker ends with "H" then set durationMinutes to durationMinutes * 60
        if durationMinutes < 1 then error "Event duration must be positive"
        set inputText to my removePattern(inputText, durationMarker)
    end if
    set timeMarker to my findPattern(inputText, "(?i)(?<!\\S)(?:at\\s+[0-9]{1,2}(?::[0-9]{2})?(?:am|pm)?|[0-9]{1,2}:[0-9]{2}(?:am|pm)?|[0-9]{1,2}(?:am|pm))(?=\\s|$)")
    set dateInfo to my extractDateTime(inputText)
    set capturedStart to parsedDate of dateInfo
    if capturedStart is missing value then set capturedStart to current date
    if timeMarker is "" then set time of capturedStart to 9 * hours
    set capturedTitle to my trimText(cleanedText of dateInfo)
    if capturedTitle is "" then error "Event title cannot be empty"
    return {eventTitle:capturedTitle, eventStart:capturedStart, eventEnd:(capturedStart + durationMinutes * minutes), eventLocation:capturedLocation}
end parseEventInput'''

for bundle, entry in (("GTD-QuickCapture", replacement), ("GTD-EventCapture", event_replacement)):
    embedded = re.sub(r"on run argv\n.*?end run", lambda match, replacement_entry=entry: replacement_entry, source, count=1, flags=re.DOTALL)
    path = ROOT / "workflows/apple" / (bundle + ".workflow/Contents/document.wflow")
    data = plistlib.loads(path.read_bytes())
    parameters = data["actions"][0]["action"]["ActionParameters"]
    if args.check:
        if parameters["source"] != embedded:
            raise SystemExit("Native parser drifted; run mise exec -- python scripts/sync-native-parser.py")
    else:
        parameters["source"] = embedded
        path.write_bytes(plistlib.dumps(data, sort_keys=False))
