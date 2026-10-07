# GTDLib Script Bundle

Project overview and status: [MacGTD](../../../README.md).

This bundle contains a compiled AppleScript and a scripting dictionary for task creation, dashboard data, and focus-session operations.

## Contents and interface

- [Info.plist](Contents/Info.plist) identifies the script bundle.
- [GTDLib.sdef](Contents/Resources/GTDLib.sdef) declares the scripting terminology.
- [main.scpt](Contents/Resources/Scripts/main.scpt) contains the compiled implementation.

Inspect the actual implementation from macOS with:

```bash
osadecompile workflows/alfred/GTDLib.scptd/Contents/Resources/Scripts/main.scpt
```

The decompiled script includes task creation, dashboard, focus-session, input-validation, logging, and notification handlers. It also references helper/service behavior whose availability must be verified before treating the bundle as a complete working library. Dictionary entries alone do not establish implemented handlers.

## Integration limits

The previous guide referred to a root `install-gtdlib.sh` that is absent from this checkout. Installation and application-backend behavior need verification against the surrounding Alfred workflow and the user's macOS environment. No claim of complete backend compatibility, security certification, or measured caching performance is made here.
