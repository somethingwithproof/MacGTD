# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**MacGTD is a collection of macOS workflows for capturing tasks, organizing reminders, and running timed focus sessions with the apps you already use.**

Built around [Getting Things Done](https://gettingthingsdone.com/), it brings dialog, clipboard, and batch capture to Apple Reminders; event capture to Calendar; and task, note, project, and focus commands to Alfred. AppleScript and Automator keep the native workflows close to macOS. Additional capture adapters are included for Todoist, Notion, Things, OmniFocus, Microsoft To Do, and Google Keep; live integration testing for those providers is deferred.

## What you can do

- **Capture without switching apps.** Use an Automator Service, an Alfred keyword, or the clipboard to add a task. Batch capture creates one reminder per nonblank line.
- **Turn text into structured tasks.** Parse relative and ISO dates, times, priorities, contexts, and projects using the production AppleScript parser shared by native quick capture and Calendar capture.
- **Capture events and review your inbox.** Create Calendar events with a time, duration, and location; run a five-step weekly review with a brain dump into Reminders.
- **Work in timed focus sessions.** Start, inspect, and stop sessions across processes. Session-owned launchd timers handle expiry and cancellation; JSONL logs provide duration analytics.
- **Use Alfred for more than tasks.** Create Reminders lists for projects, save reference notes, open the inbox for review, capture clipboard text, and edit typed preferences.
- **See your inbox from the menu bar.** The optional SwiftBar/xbar plugin displays incomplete inbox counts and links to capture workflows.

Native behavior is checked on real GitHub-hosted Macs: tests operate Automator dialogs, then read back Reminders and Calendar records. See [testing and compatibility](#testing-and-compatibility) for the scope of that evidence.

## Quick start: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Open the workflow in Automator and run it to try capture. To make it available as a Service, install the bundle under `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Assign a shortcut in **System Settings → Keyboard → Keyboard Shortcuts → Services**. Allow Automation access to Reminders when macOS asks. Enter:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

The native workflow creates a high-priority reminder due tomorrow, routes it to the `shopping` list, and records the context. Without a project or context marker, quick capture uses `Inbox`.

## Capture syntax

The native task parser and Alfred task capture recognize these markers. Provider adapters have their own field and routing support.

| Input | Meaning | Example |
| --- | --- | --- |
| `!1`, `!2`, `!3` | High, medium, or low priority | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relative due date | `Call dentist tomorrow` |
| Weekday or `next weekday` | Weekday due date | `Send report next monday` |
| `due:YYYY-MM-DD` | Explicit due date | `Renew membership due:2027-03-15` |
| Time alongside a date | Due time | `Call Alex tomorrow at 3pm` |
| `@context` | Context marker | `Buy milk @errands` |
| `+project` | Project/list routing | `Draft outline +website` |

`due:today` and `due:tomorrow` are also accepted. Use letters, numbers, underscores, or hyphens in context and project markers. Native quick capture gives project routing precedence over context routing.

Calendar capture uses `@` for the event location and accepts a duration in minutes or hours:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Without an explicit time or duration, Calendar capture uses 9:00 AM and one hour, in the first writable calendar.

## Choose a workflow

### Native Apple workflows

| Workflow | Behavior | Bundle |
| --- | --- | --- |
| Quick capture | Parse task text and create a reminder | [GTD-QuickCapture](workflows/apple/GTD-QuickCapture.workflow) |
| Clipboard capture | Create a reminder from clipboard text | [GTD-ClipboardCapture](workflows/apple/GTD-ClipboardCapture.workflow) |
| Batch capture | Create reminders from multiple lines | [GTD-BatchCapture](workflows/apple/GTD-BatchCapture.workflow) |
| Event capture | Create a Calendar event | [GTD-EventCapture](workflows/apple/GTD-EventCapture.workflow) |
| Weekly review | Guided review and reminder brain dump | [GTD-WeeklyReview](workflows/apple/GTD-WeeklyReview.workflow) |

Open a bundle in Automator to try it, or install it under `~/Library/Services` for keyboard access. Reminders and Calendar need the appropriate macOS Automation permissions.

### Alfred

Requires Alfred with Powerpack. Build the package from current source:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

You can also download the package from [releases](https://github.com/somethingwithproof/MacGTD/releases). Release packages reflect their tagged source; features added to `main` after a release require a source build.

| Keyword | Action |
| --- | --- |
| `task` | Capture a task with date, context, project, and priority parsing |
| `note` | Store a reference note in Reminders |
| `project` | Create a Reminders list |
| `gtd process` | Open Inbox for human review |
| `clip` | Capture clipboard text |
| `gtd focus` | Start a focus session, inspect status, or stop |
| `gtd analytics` | Inspect recorded focus durations |
| `gtd preferences` | Edit workflow preferences |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Preferences live in `~/Library/Preferences/com.alfredgtd.plist`; focus state and logs live under `~/.gtd`. Preferences have built-in defaults, type checks, validated imports, and atomic writes. Focus sessions do not change system notification settings. Inbox processing opens the list for review; it does not automatically move or complete tasks.

See the [Alfred guide](workflows/alfred/README.md) and [GTDLib library documentation](workflows/alfred/GTDLib.scptd/README.md).

### External capture adapters

These workflows are included and their bundles are validated, but live provider compatibility is not established by hosted E2E tests.

| Target | Mechanism | Setup / source |
| --- | --- | --- |
| Todoist | API capture | [Workflow and Keychain setup](workflows/todoist/) |
| Notion | Database API capture | [Workflow and Keychain setup](workflows/notion/) |
| Things 3 | URL scheme | [Workflow](workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [Workflow](workflows/omnifocus/) |
| Microsoft To Do | Native / browser capture | [Workflow](workflows/microsoft/) |
| Google Keep | Browser capture | [Workflow](workflows/google/) |

Todoist and Notion require one-time credential setup:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
```

Their payloads use JSON serialization, bounded HTTPS requests, and response confirmation. Error messages retain failure details while redacting the configured API token. See [SECURITY.md](SECURITY.md) for reporting security issues.

### Menu bar and Shortcuts

The [menu bar guide](workflows/menubar/README.md) covers the optional SwiftBar/xbar plugin. Install the Apple Services first, then configure the plugin directory in your menu bar app and link `workflows/menubar/gtd-menubar.sh` into it.

The [Shortcuts guide](workflows/shortcuts/README.md) provides manual setup for text, clipboard, and Siri capture on macOS 12+. Shortcuts and Siri voice activation are outside the hosted test suite.

## Architecture

Automator bundles embed AppleScript so they can run as native Services. Alfred packages the action scripts and passes user input as arguments. GTDLib exposes shared native Reminders operations from editable AppleScript source and a compiled script bundle.

- **One production parser:** `scripts/sync-native-parser.py` embeds the shared parser in Quick Capture and Event Capture; validation detects source drift.
- **Persistent focus state:** separate invocations share session state, with owned launchd jobs and bounded elapsed-time accounting.
- **Reproducible packages:** packaging builds a fresh archive, and tests compare its contents with source. The library has a separate compilation script.
- **Observable tests:** JUnit reports, command logs, and tested build artifacts are retained for 14 days in GitHub Actions.

| Directory | Responsibility |
| --- | --- |
| [`workflows/`](workflows/) | Native bundles, provider adapters, Alfred, Shortcuts, and menu bar scripts |
| [`scripts/`](scripts/) | Packaging, library compilation, parser synchronization, and hosted test provisioning |
| [`tests/`](tests/) | Validation, component checks, and native desktop E2E |
| [`.github/workflows/`](.github/workflows/) | CI, nightly/manual E2E, and repository maintenance |
| [`infra/`](infra/) | Optional local and EC2 Mac runner setup; hosted CI does not require it |

## Testing and compatibility

| Scope | Environment | What is checked |
| --- | --- | --- |
| Validation | GitHub-hosted macOS 15 and 26 | AppleScript compilation, bundles, production parser, action targets, preferences, focus state, fixture API transport, and package round trips |
| Native desktop E2E | GitHub-hosted `macos-15-intel` | Real Automator dialogs; persisted Reminders and Calendar data; weekly review; menu counts; compiled GTDLib; packaged Alfred native actions; real launchd timer expiry and cancellation |
| Optional Alfred UI | Dedicated local account, Alfred 5 + Powerpack | Workflow import, keyword invocation, and reminder readback through the licensed UI |

The [verified implementation run](https://github.com/somethingwithproof/MacGTD/actions/runs/37818077714) passed **22 validation tests on each validation platform and 15 native desktop E2E tests**, with no failures, errors, or skips. Validation also runs repository structure checks. Current status is shown by the badges above.

Pull requests and pushes to `main` run validation followed by native E2E. The E2E workflow also runs nightly and on manual dispatch. It uses disposable GitHub-hosted Macs, isolated fixtures, and bounded subprocesses; no self-hosted runner or external account credentials are needed.

Earlier macOS versions are not validated by current CI. Live external integrations, Shortcuts/Siri, and the licensed Alfred UI are outside hosted coverage. Native action tests exercise packaged Alfred scripts directly; they do not establish full Alfred UI compatibility. See [test setup, prerequisites, and coverage](tests/e2e/README.md).

## Development

Install [mise](https://mise.jdx.dev/) and use the Python version pinned in `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validation writes reports under `test-results/`; build scripts write to `dist/`. To run the hosted desktop suite on `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Local desktop E2E requires a dedicated logged-in test account and the permissions described in the [E2E guide](tests/e2e/README.md). The hosted permission-provisioning script is restricted to disposable GitHub-hosted jobs.

Use [Conventional Commits](https://www.conventionalcommits.org/) and follow [CONTRIBUTING.md](CONTRIBUTING.md). Recent changes are recorded in [CHANGELOG.md](CHANGELOG.md).

## Project history and license

MacGTD consolidates the former MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, and AlfredGTD repositories. It is licensed under the [MIT License](LICENSE).
