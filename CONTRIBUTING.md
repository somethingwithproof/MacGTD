# Contributing to MacGTD

## Development setup

Fork the repository, clone your fork, and branch from `main`. Install mise, actionlint, and ShellCheck on a Mac, then select the pinned runtime:

```bash
brew install mise actionlint shellcheck
mise install
mise exec -- python tests/run.py validation
```

Validation compiles the production AppleScript, checks bundles and packaged action targets, tests parser and adapter contracts, and writes reports under `test-results/`. Current CI validates on macOS 15 and 26 and runs native desktop E2E on a hosted macOS 15 Intel runner. See [testing and prerequisites](tests/e2e/README.md).

## Editing shared sources

Quick Capture, Calendar capture, API workflows, and Alfred share production sources. Edit the canonical parser or adapter, then regenerate the standalone copies:

```bash
mise exec -- python scripts/sync-native-parser.py
mise exec -- python scripts/sync-provider-workflows.py
mise exec -- python tests/run.py validation
```

- Parser: `workflows/alfred/workflow/scripts/natural_language_task.scpt`.
- API adapter: `workflows/api/provider-capture.applescript`.
- Library: `workflows/alfred/GTDLib.scptd/Contents/Resources/Scripts/main.applescript`.
- Alfred actions: `workflows/alfred/workflow/scripts/`.

Do not edit generated API copies independently. Validation checks source drift in Automator bundles and the generated Alfred Todoist adapter. Preserve the distinction between a calendar due date and an explicit due time. Construct payloads with explicit JSON keys; native AppleScript record terminology can lose keys when converted to Foundation dictionaries.

Automator bundles contain `Contents/document.wflow` (XML plist action definitions) and `Contents/info.plist` (bundle metadata). Preserve their structure when editing. Most Alfred `.scpt` files are editable text despite their extension; the library also ships a compiled `main.scpt`.

## Packaging and checks

```bash
actionlint
find scripts tests workflows infra -name '*.sh' -print0 | xargs -0 shellcheck
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
git diff --check
```

Build outputs are written under `dist/`. Package validation compares contents with current source and rejects missing or stale files. Keep setup examples, API versions, and documentation synchronized with the implementation.

## E2E scope

The default hosted `automator` suite includes native Reminders/Calendar readback and all four API capture dialogs through a local HTTPS fixture. It does not require external credentials or licensed apps.

Use the manual `live` suite for real vendor accounts and `desktop-integrations` for licensed Things, OmniFocus, and Alfred. Existing `all` behavior includes native, fixture, and Alfred UI tests; `all --live` explicitly adds real vendors and licensed desktop integrations. Required prerequisites fail rather than skip. Shortcuts/Siri voice activation is not automated.

Use dedicated test accounts, synthetic task text, and unique identifiers. Never add real credentials to tests or documentation. Preserve input as data, keep authorization out of process arguments, retain HTTPS verification, bound every request/process, and avoid deleting records unless ownership is established. Review [SECURITY.md](SECURITY.md) before changing credential or transport behavior.

## Branches, commits, and pull requests

Use descriptive branches such as `feature/123-task-capture`, `fix/456-date-parsing`, or `docs/789-api-setup`. Follow [Conventional Commits](https://www.conventionalcommits.org/) and sign off commits for DCO:

```bash
git commit -s -m "fix(notion): preserve date-only due fields"
```

Fill out the PR template and reference a tracking issue when one exists. Explain the resulting behavior, compatibility changes, and the checks actually run. Distinguish fixture coverage from verified live-provider evidence. PRs are normally squash-merged after review and passing checks. Record user-visible changes in [CHANGELOG.md](CHANGELOG.md).

## Code of conduct

Be respectful. Help maintainers and users understand the change through clear examples and reproducible evidence.
