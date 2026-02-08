# MacGTD

macOS automation for [Getting Things Done](https://gettingthingsdone.com/) — quick-capture workflows for Apple, Microsoft 365, Google Workspace, and Alfred.

## Workflows

| Platform | Tool | Capture Target | Status |
|----------|------|---------------|--------|
| **Apple** | Automator | Apple Reminders | Stable |
| **Microsoft 365** | Automator | Microsoft To Do | Stable |
| **Google Workspace** | Automator | Google Keep | Stable |
| **Alfred** | Alfred Workflow | Reminders / Todoist / Things / OmniFocus | Beta |

## Installation

### Automator Workflows (Apple / Microsoft / Google)

1. Clone this repo or download the workflow you need from `workflows/`
2. Double-click the `.workflow` file to install it in Automator
3. Optionally assign a keyboard shortcut: **System Settings > Keyboard > Keyboard Shortcuts > Services**

| Workflow | File |
|----------|------|
| Apple Reminders | `workflows/apple/GTD-QuickCapture.workflow` |
| Microsoft To Do | `workflows/microsoft/MS-GTD-QuickCapture.workflow` |
| Google Keep | `workflows/google/Google-GTD-QuickCapture.workflow` |

### Alfred Workflow

1. Requires [Alfred 4+](https://www.alfredapp.com/) with Powerpack
2. Copy `workflows/alfred/workflow/` contents into a new Alfred workflow
3. Configure your preferred GTD app in the workflow preferences

#### Alfred Features

- **Quick Capture**: `task [text]` — add tasks with natural language parsing
- **Contexts**: `@home`, `@work`, `@errands`
- **Projects**: `+projectname`
- **Priorities**: `!1`, `!2`, `!3`
- **Dates**: "tomorrow", "next monday", "friday at 3pm"
- **Multi-app**: Routes to Reminders, Todoist, Things, or OmniFocus
- **Focus Mode**: `gtd focus` — time-boxed work sessions with analytics

## Requirements

- macOS 10.14 or later
- For Automator workflows: the target app must be installed
- For Alfred workflow: Alfred 4+ with Powerpack

## Project Structure

```
MacGTD/
├── workflows/
│   ├── apple/          # Automator → Apple Reminders
│   ├── microsoft/      # Automator → Microsoft To Do
│   ├── google/         # Automator → Google Keep
│   └── alfred/         # Alfred workflow + GTDLib
├── tests/
│   └── validate_repo.sh
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── workflows/
│   │   └── ci.yml
│   └── PULL_REQUEST_TEMPLATE.md
├── CHANGELOG.md
├── CONTRIBUTING.md
└── SECURITY.md
```

## Development

### Running Tests

```bash
./tests/validate_repo.sh
```

### Branch Naming

- `feature/123-short-description` — new features
- `fix/456-short-description` — bug fixes
- `chore/789-short-description` — maintenance

### Commit Convention

[Conventional Commits](https://www.conventionalcommits.org/):

```
feat(apple): add due date support to quick capture

Closes #123
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide.

## History

This repo consolidates several previously separate repositories:

- [MacGTD-Native](https://github.com/thomasvincent/MacGTD-Native) (archived)
- [MacGTD-Microsoft](https://github.com/thomasvincent/MacGTD-Microsoft) (archived)
- [MacGTD-Google](https://github.com/thomasvincent/MacGTD-Google) (archived)
- [AlfredGTD](https://github.com/thomasvincent/AlfredGTD) (archived)

## License

[MIT](LICENSE)
