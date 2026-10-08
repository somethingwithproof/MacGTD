# GTDLib Script Bundle

Project overview and status: [MacGTD](../../../README.md).

GTDLib provides native Reminders task creation, dashboard counts, notes, inbox review, and access to the companion focus controller. Its scripting dictionary and compiled implementation expose the same public operations.

## Build and interface

The editable source is [main.applescript](Contents/Resources/Scripts/main.applescript). The bundle also includes a compiled `main.scpt`, `Info.plist`, and `GTDLib.sdef`.

```bash
./scripts/build-gtdlib.sh
# Output: dist/GTDLib.scptd
```

Load the compiled bundle with AppleScript `load script`, then call `createTask:withContext:priority:dueDate:`, `getDashboardData()`, `addNote:toTask:toProject:`, `processInbox()`, or `startFocusSession:duration:`. Priorities 1, 2, and 3 map to Reminders priorities 1, 5, and 9. Task creation returns a record with the reminder identifier. Dashboard counts come directly from Reminders; inbox review opens the list for the user and returns its pending count.

## Requirements and limits

Reminders must be configured and Automation permission granted. The library supports native Reminders; unsupported service selection raises an error. Focus operations require the companion Alfred scripts, selected with `MACGTD_SCRIPT_DIR` or their installed default path. No external backend, caching performance, or security certification is implied by the scripting dictionary.

Hosted validation checks source compilation and shipped bundle loading. Native E2E verifies task creation, priority, dashboard count, and note persistence against Reminders.
