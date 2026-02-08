# GTDLib Script Library

GTDLib is a professional AppleScript library for Getting Things Done (GTD) task management, following Apple's best practices for script library development.

## Features

- **Task Management**: Create and manage tasks with contexts, priorities, and due dates
- **Dashboard View**: Get comprehensive GTD statistics and overview
- **Focus Mode**: Start focused work sessions with specific contexts
- **Multiple Backend Support**: Works with Reminders, Things, and OmniFocus
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Security**: Input sanitization and secure coding practices
- **Caching**: Performance optimization with intelligent caching
- **Notifications**: System notifications for task events
- **Logging**: Structured logging for debugging and analytics

## Installation

Run the installation script from the project root:

```bash
./install-gtdlib.sh
```

This will install GTDLib to `~/Library/Script Libraries/GTDLib.scptd`

## Usage

### In AppleScript

```applescript
use GTDLib : script "GTDLib"

-- Create a task
tell GTDLib
    create task "Review project proposal" with context "@office" priority 1 due date (current date) + 2 * days
end tell

-- Get dashboard data
tell GTDLib
    set dashboardInfo to get dashboard
    -- Returns: {inbox count:5, today count:3, overdue count:1, ...}
end tell

-- Start focus session
tell GTDLib
    start focus session "@deep-work" duration 90
end tell
```

### Available Commands

#### create task
Creates a new task with optional parameters.

```applescript
create task "Task title" ¬
    with context "@context" ¬
    priority 2 ¬
    due date (current date) + 1 * days
```

Parameters:
- `direct parameter` (required): Task title
- `with context` (optional): Context like "@home", "@work", etc.
- `priority` (optional): 1=high, 2=medium, 3=low
- `due date` (optional): Due date as AppleScript date

#### get dashboard
Returns current GTD statistics.

```applescript
set stats to get dashboard
-- Returns: {inbox count:x, today count:y, overdue count:z, ...}
```

#### start focus session
Starts a focus mode session for a specific context.

```applescript
start focus session "@context" duration 60
```

Parameters:
- `direct parameter` (required): Context to focus on
- `duration` (required): Duration in minutes (1-180)

## Configuration

GTDLib stores preferences in `~/Library/Preferences/com.alfredgtd.plist`

You can configure:
- Default task service (reminders, things, omnifocus)
- Default context for new tasks
- Cache expiration times
- Notification preferences

## Error Handling

GTDLib uses standard OSStatus error codes:
- `-2001`: Invalid input
- `-2002`: Application not found
- `-2003`: Permission denied
- `-2004`: Network unavailable
- `-2005`: Data corruption

## Development

### Building from Source

1. Edit `examples/improved_architecture/GTDLib.applescript`
2. Compile with: `osacompile -o GTDLib.scptd/Contents/Resources/Scripts/main.scpt examples/improved_architecture/GTDLib.applescript`
3. Run `./install-gtdlib.sh` to install

### Testing

```applescript
-- Test basic functionality
use GTDLib : script "GTDLib"
tell GTDLib
    log version
    create task "Test task" with context "@test"
end tell
```

### Debugging

Enable verbose logging:
```bash
# View logs
log show --predicate 'subsystem == "com.alfredgtd.GTDLib"' --info
```

## Architecture

GTDLib follows Apple's recommended script library structure:

```
GTDLib.scptd/
├── Contents/
│   ├── Info.plist              # Bundle metadata
│   └── Resources/
│       ├── GTDLib.sdef         # Terminology definitions
│       └── Scripts/
│           └── main.scpt       # Compiled script
```

## License

Copyright © 2024 AlfredGTD Contributors. All rights reserved.

## Support

For issues and feature requests, please visit the [AlfredGTD GitHub repository](https://github.com/alfredgtd/alfredgtd).