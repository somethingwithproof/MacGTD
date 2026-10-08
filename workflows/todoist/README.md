# Todoist capture

`Todoist-GTD-QuickCapture.workflow` creates tasks through the unified Todoist API v1. Alfred's Todoist route uses the same generated adapter; an external Todoist CLI is not required.

## Setup and use

From the repository root:

```bash
./workflows/todoist/setup-todoist.sh
open workflows/todoist/Todoist-GTD-QuickCapture.workflow
```

The setup helper stores the token in macOS Keychain under service `MacGTD-Todoist`, account `api-token`. The optional `project-id` account selects a destination project. Managed invocations can use `MACGTD_TODOIST_TOKEN` and `MACGTD_TODOIST_PROJECT_ID`.

```text
Prepare slides !1 due:tomorrow @work +presentation
```

The title excludes parsed markers. `!1/!2/!3` map to API priorities `4/3/2`; no marker maps to `1`. `@context` and `+project` become labels. The configured project ID determines the destination; a project marker does not look up a Todoist project by name. Date-only inputs use `due_date`; explicit times use UTC `due_datetime`.

## API migration and testing

Capture uses `POST https://api.todoist.com/api/v1/tasks`. Setup no longer references the retired REST v2 API. Existing `MacGTD-Todoist` token entries remain usable.

Hosted E2E verifies real dialogs and persisted task fields through a local TLS fixture, including the packaged Alfred action. The manual live suite additionally needs a dedicated Todoist project and token, retrieves the actual task, verifies fields, and removes the owned test task. Live verification remains pending configured test credentials.

See [shared API configuration](../api/README.md), [test prerequisites](../../tests/e2e/README.md), and the [official API contract](https://developer.todoist.com/api/v1/).
