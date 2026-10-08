# Alfred GTD Workflow

Project overview and status: [MacGTD](../../README.md).

An Alfred workflow for GTD quick capture with natural language parsing.

## Features

- **Quick Capture**: `task Buy milk tomorrow @errands +groceries !1`
- **Natural Language Dates**: "today", "tomorrow", "next monday", "friday at 3pm"
- **Contexts**: `@home`, `@work`, `@errands`
- **Projects**: `+projectname`
- **Priorities**: `!1` (high), `!2` (medium), `!3` (low)
- **Multi-App**: Routes to Reminders, Todoist, Things, or OmniFocus
- **Focus Mode**: Time-boxed work sessions with analytics

## Files

```text
workflow/
├── info.plist                      # Alfred workflow definition
├── icons/icon.png                  # Workflow icon
└── scripts/
    ├── add_task.scpt               # Task creation and routing
    ├── add_note.scpt               # Reference reminder with note body
    ├── add_project.scpt            # Create a Reminders list
    ├── process_inbox.scpt          # Open Inbox for human review
    ├── clipboard_capture.scpt      # Clipboard capture and JSON feedback
    ├── add_task_updated.scpt       # Compatibility entry point
    ├── natural_language_task.scpt  # NLP date/context/project parser
    ├── focus_mode.scpt             # Focus session management
    ├── focus_analytics.scpt        # Focus session analytics
    ├── gtd_helpers_updated.scpt    # Shared utility functions
    ├── preferences_editor.scpt     # Preferences UI source
    └── preferences_manager.scpt    # Typed, atomic preferences storage

GTDLib.scptd/                       # Shared AppleScript library
└── Contents/
    ├── Info.plist
    └── Resources/
        ├── GTDLib.sdef
        └── Scripts/main.applescript + main.scpt
```

## Configuration

Preferences are stored in `~/Library/Preferences/com.alfredgtd.plist`. Configure your preferred task app:

- `reminders` (default)
- `todoist`
- `things`
- `omnifocus`

## Requirements

- Alfred 4+ with Powerpack
- macOS 10.14+
- The target GTD app must be installed

## Focus sessions and testing

`gtd focus @context 25` starts a timed session for a task in the selected context list. `gtd focus status` and `gtd focus stop` work across processes. Session state is stored under `~/.gtd`; each timer has a session-owned launchd job that is cancelled on stop. Analytics report recorded session durations from JSONL logs. Focus sessions do not change system notification settings.

The workflow also exposes clipboard capture, analytics, and preferences keywords. Notes are stored as Reminders in the Reference list. Inbox processing opens the list for human review; it does not automatically complete or move tasks.

Run `mise exec -- python tests/run.py validation` for compilation, parser, component, action-graph, and package checks. GitHub-hosted native tests verify Reminders, the shared library, and focus timer ownership. Real Alfred keyword invocation requires the separate local Powerpack suite described in [E2E testing](../../tests/e2e/README.md). Live external integrations are deferred.
