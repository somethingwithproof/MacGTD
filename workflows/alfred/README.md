# Alfred GTD Workflow

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

```
workflow/
├── info.plist                      # Alfred workflow definition
├── icons/icon.png                  # Workflow icon
└── scripts/
    ├── add_task_updated.scpt       # Task creation with multi-app routing
    ├── natural_language_task.scpt  # NLP date/context/project parser
    ├── focus_mode.scpt             # Focus session management
    ├── focus_analytics.scpt        # Focus session analytics
    ├── gtd_helpers_updated.scpt    # Shared utility functions
    ├── preferences_editor.scpt     # Preferences UI (compiled)
    └── preferences_manager.scpt    # Preferences storage (compiled)

GTDLib.scptd/                       # Shared AppleScript library
└── Contents/
    ├── Info.plist
    └── Resources/
        ├── GTDLib.sdef
        └── Scripts/main.scpt
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
