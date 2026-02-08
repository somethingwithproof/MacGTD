# Contributing to MacGTD

## Getting Started

1. Fork the repository
2. Clone your fork
3. Create a branch from `main`

## Branch Naming

Use the pattern `type/issue-number-short-description`:

```
feature/12-due-date-support
fix/34-xml-validation-error
chore/56-update-ci
```

## Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): short description

Optional body.

Closes #123
```

**Types:** `feat`, `fix`, `docs`, `chore`, `test`, `refactor`

**Scopes:** `apple`, `microsoft`, `google`, `alfred`, `ci`, `repo`

### Examples

```
feat(alfred): add Todoist integration
fix(apple): handle empty input in quick capture
docs(repo): update installation instructions
chore(ci): pin xmllint version
```

## Pull Requests

1. Reference the issue: `Closes #123`
2. Fill out the PR template
3. Ensure CI passes
4. PRs are squash-merged to keep history clean

## Testing

Run the validation suite before submitting:

```bash
./tests/validate_repo.sh
```

## Workflow Development

### Automator Workflows

Automator `.workflow` bundles contain:
- `Contents/document.wflow` — the workflow definition (XML plist)
- `Contents/info.plist` — bundle metadata

Edit in Automator.app, then commit the updated bundle.

### Alfred Workflow

Alfred scripts are in `workflows/alfred/workflow/scripts/`. AppleScript files can be:
- `.scpt` (text) — editable in any text editor
- `.scpt` (compiled) — edit in Script Editor.app

## Code of Conduct

Be respectful. We're all here to make task management less painful.
