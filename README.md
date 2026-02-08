# MacGTD

macOS automation for [Getting Things Done](https://gettingthingsdone.com/) — quick-capture workflows for 8 platforms with natural language parsing, priority/due dates, contexts, and projects.

## Workflows

### Capture Targets

| Platform | Tool | Capture Target | Setup |
|----------|------|---------------|-------|
| **Apple Reminders** | Automator | Reminders app | None |
| **Microsoft To Do** | Automator | To Do (native + web) | None |
| **Google Keep** | Automator | Keep (browser) | None |
| **Todoist** | Automator | Todoist (API) | `./workflows/todoist/setup-todoist.sh` |
| **Things 3** | Automator | Things (URL scheme) | None |
| **OmniFocus** | Automator | OmniFocus (AppleScript + URL) | None |
| **Notion** | Automator | Notion database (API) | `./workflows/notion/setup-notion.sh` |
| **Alfred** | Alfred Workflow | Multi-app routing | Alfred 4+ with Powerpack |

### Capture Modes

| Mode | Description | Workflow |
|------|-------------|---------|
| **Quick Capture** | Dialog prompt for task text | `GTD-QuickCapture.workflow` |
| **Clipboard Capture** | Captures from clipboard (no dialog) | `GTD-ClipboardCapture.workflow` |
| **Batch Capture** | Multi-line input, one task per line | `GTD-BatchCapture.workflow` |
| **Event Capture** | Calendar event with natural language | `GTD-EventCapture.workflow` |
| **Weekly Review** | 5-step guided GTD review | `GTD-WeeklyReview.workflow` |
| **Siri Voice** | Voice-activated capture | Shortcuts.app |

## Task Syntax

All workflows support inline markers:

```
Buy groceries @errands +shopping !1 due:tomorrow
```

| Marker | Meaning | Example |
|--------|---------|---------|
| `!1` `!2` `!3` | Priority (high/medium/low) | `Fix bug !1` |
| `due:today` | Due today | `Report due:today` |
| `due:tomorrow` | Due tomorrow | `Call dentist due:tomorrow` |
| `due:YYYY-MM-DD` | Due on specific date | `Submit due:2026-03-15` |
| `@context` | Context/tag/label | `Buy milk @errands` |
| `+project` | Project/list assignment | `Design mockup +website` |

## Installation

### Automator Workflows

1. Clone this repo or download the workflow you need from `workflows/`
2. Double-click the `.workflow` file to install it in Automator
3. Assign a keyboard shortcut: **System Settings > Keyboard > Keyboard Shortcuts > Services**

| Workflow | File |
|----------|------|
| Apple Reminders | `workflows/apple/GTD-QuickCapture.workflow` |
| Clipboard Capture | `workflows/apple/GTD-ClipboardCapture.workflow` |
| Batch Capture | `workflows/apple/GTD-BatchCapture.workflow` |
| Calendar Events | `workflows/apple/GTD-EventCapture.workflow` |
| Weekly Review | `workflows/apple/GTD-WeeklyReview.workflow` |
| Microsoft To Do | `workflows/microsoft/MS-GTD-QuickCapture.workflow` |
| Google Keep | `workflows/google/Google-GTD-QuickCapture.workflow` |
| Todoist | `workflows/todoist/Todoist-GTD-QuickCapture.workflow` |
| Things 3 | `workflows/things/Things-GTD-QuickCapture.workflow` |
| OmniFocus | `workflows/omnifocus/OmniFocus-GTD-QuickCapture.workflow` |
| Notion | `workflows/notion/Notion-GTD-QuickCapture.workflow` |

### API-Based Workflows (Todoist, Notion)

These require a one-time setup to store API credentials in macOS Keychain:

```bash
./workflows/todoist/setup-todoist.sh    # Todoist API token
./workflows/notion/setup-notion.sh      # Notion API token + database ID
```

### Alfred Workflow

1. Requires [Alfred 4+](https://www.alfredapp.com/) with Powerpack
2. Double-click `dist/MacGTD.alfredworkflow` (from [releases](https://github.com/thomasvincent/MacGTD/releases))
3. Or copy `workflows/alfred/workflow/` contents into a new Alfred workflow

**Alfred keywords:** `task`, `clip`, `gtd focus`

### Shortcuts.app / Siri

For macOS 12+, use Shortcuts.app with optional Siri voice activation:

```bash
./workflows/shortcuts/install-shortcut.sh   # Quick capture shortcut
./workflows/shortcuts/setup-siri.sh         # Siri voice trigger setup
```

### Menu Bar

Shows inbox count and provides quick capture access via [SwiftBar](https://github.com/swiftbar/SwiftBar):

```bash
brew install swiftbar
ln -s "$(pwd)/workflows/menubar/gtd-menubar.sh" \
  ~/Library/Application\ Support/SwiftBar/Plugins/gtd-menubar.5m.sh
```

## Requirements

- macOS 10.14 or later (macOS 12+ for Shortcuts/Siri)
- Target app must be installed (Reminders, Things, OmniFocus, etc.)
- Alfred 4+ with Powerpack (for Alfred workflow)
- SwiftBar or xbar (for menu bar, optional)

## Project Structure

```
MacGTD/
├── workflows/
│   ├── apple/          # Automator → Apple Reminders (5 workflows)
│   ├── microsoft/      # Automator → Microsoft To Do
│   ├── google/         # Automator → Google Keep
│   ├── todoist/        # Automator → Todoist (API)
│   ├── things/         # Automator → Things 3 (URL scheme)
│   ├── omnifocus/      # Automator → OmniFocus
│   ├── notion/         # Automator → Notion (API)
│   ├── alfred/         # Alfred workflow + GTDLib
│   ├── shortcuts/      # Shortcuts.app + Siri
│   └── menubar/        # SwiftBar/xbar plugin
├── tests/
│   ├── validate_repo.sh
│   ├── test_applescript_syntax.sh
│   ├── test_automator_loading.sh
│   ├── test_natural_language_parser.sh
│   ├── test_reminders_integration.sh
│   └── e2e/            # Self-hosted runner E2E tests
├── infra/
│   ├── terraform/      # EC2 Mac dedicated host
│   └── local/          # Local Mac Mini runner setup
├── scripts/
│   └── package-alfred.sh
└── .github/
    └── workflows/
        ├── ci.yml      # Automated tests (every push)
        └── e2e.yml     # E2E tests (self-hosted, manual)
```

## Development

### Running Tests

```bash
./tests/validate_repo.sh              # Repo structure (44 checks)
./tests/test_applescript_syntax.sh     # AppleScript compilation
./tests/test_automator_loading.sh      # Bundle validation
./tests/test_natural_language_parser.sh # NLP unit tests
./tests/test_reminders_integration.sh  # Reminders API tests
```

### E2E Testing

Requires a self-hosted runner (EC2 Mac or local Mac Mini):

```bash
# EC2 Mac
cd infra/terraform && terraform apply

# Local Mac Mini
./infra/local/setup-local-runner.sh

# Trigger E2E
gh workflow run e2e.yml -f test_suite=all
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
