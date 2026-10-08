# API capture adapters

Standalone Automator bundles use the shared [provider adapter](provider-capture.applescript) and the production task parser. Generated copies are checked for drift in validation. Captures serialize explicit JSON keys, enforce HTTPS, use bounded requests with authorization headers sent through stdin, reject unconfirmed creation, and redact the configured token from errors.

| Provider | Current interface | Configuration |
| --- | --- | --- |
| Todoist | Unified API v1, `POST /api/v1/tasks` | API token; optional project ID |
| Notion | `Notion-Version: 2026-03-11`, `POST /v1/pages` with a `data_source_id` parent | Connection token and data source ID |
| Microsoft To Do | Microsoft Graph stable v1.0, `POST /me/todo/lists/{id}/tasks` | Delegated OAuth token with `Tasks.ReadWrite`, list ID |
| Google Keep | Keep API v1, `POST /v1/notes` | Authorized Workspace OAuth token with the `https://www.googleapis.com/auth/keep` scope |

Official contracts: [Todoist API](https://developer.todoist.com/api/v1/), [Notion versioning](https://developers.notion.com/reference/versioning), [Notion data source migration](https://developers.notion.com/guides/get-started/upgrade-guide-2025-09-03), [Microsoft task creation](https://learn.microsoft.com/en-us/graph/api/todotasklist-post-tasks?view=graph-rest-1.0), [Google note creation](https://developers.google.com/workspace/keep/api/reference/rest/v1/notes/create).

## Setup

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

The setup helpers prompt for credentials without echoing them and store them in macOS Keychain. Services are `MacGTD-Todoist`, `MacGTD-Notion`, `MacGTD-Microsoft`, and `MacGTD-Google`, with account `api-token`. Target accounts are `project-id`, `data-source-id`, and `list-id` respectively.

Environment variables can override Keychain configuration for managed invocations:

| Provider | Token variable | Target variable |
| --- | --- | --- |
| Todoist | `MACGTD_TODOIST_TOKEN` | `MACGTD_TODOIST_PROJECT_ID` (optional for ordinary capture) |
| Notion | `MACGTD_NOTION_TOKEN` | `MACGTD_NOTION_DATA_SOURCE_ID` |
| Microsoft | `MACGTD_MICROSOFT_TOKEN` | `MACGTD_MICROSOFT_LIST_ID` |
| Google | `MACGTD_GOOGLE_TOKEN` | None |

Automator Runner may start through launchd and not inherit terminal environment variables. Use Keychain for installed Services. Live E2E places credentials in transient, uniquely named Keychain entries and deletes only those entries afterward.

Microsoft and Google access tokens expire. Obtain and renew them through your OAuth client; MacGTD does not implement OAuth login or refresh-token storage. Microsoft task creation requires delegated user authorization, not application-only permissions. [Google Keep API authorization](https://developers.google.com/workspace/keep/api/guides) is intended for authorized enterprise/Workspace use; this is not a consumer Gmail capture API.

## Migration and field mapping

- **Todoist:** both Automator and Alfred use API v1 directly. The external `todoist` CLI is no longer required. Priorities map `!1/!2/!3` to API priorities `4/3/2`; no marker maps to `1`. A configured project ID controls destination; `@context` and `+project` become labels. Date-only inputs use `due_date`; explicit times use UTC ISO timestamps.
- **Notion:** copy the data source ID from **Manage data sources**. Existing `database-id` Keychain entries still work when discovery returns exactly one source. Multi-source databases require explicit selection and never default to the first source. The source needs `Name` (title), `Status` (select, including Inbox), `Priority` (select, High/Medium/Low), and `Due` (date). Context/project metadata is retained in paragraph blocks.
- **Microsoft:** browser `quickAdd` and simulated keystrokes are replaced by Graph task creation. Configure a list ID and delegated token. Priorities map to high/normal/low; contexts/projects become body text; due dates use Graph's `dateTimeTimeZone` shape in UTC.
- **Google:** the undocumented `#create/` browser path is replaced by Keep note creation. The account must be eligible for the API. Keep is a note service, so priorities, due dates, contexts, and projects are retained as note text rather than unsupported task fields.

Google and Microsoft capture now require API setup. A successful browser launch is no longer reported as a successfully created task or note.

## Testing

```bash
mise exec -- python scripts/sync-provider-workflows.py --check
mise exec -- python tests/run.py validation
# Dedicated logged-in account only:
MACGTD_E2E_DEDICATED=1 mise exec -- python tests/run.py providers
```

Validation compiles adapters and tests real HTTPS transport against a local TLS fixture. Hosted desktop E2E also operates all four production capture dialogs against that fixture, checks persisted fields, verifies returned IDs, and covers blank input, cancellation, actual network timeouts, authentication/rate-limit errors, unconfirmed responses, and Notion data-source ambiguity. Synthetic fixture credentials never reach vendors. These tests establish adapter behavior, not live vendor compatibility.

The manual [live provider workflow](../../.github/workflows/live-e2e.yml) runs all four real vendor paths on a disposable GitHub-hosted Mac. Configure the variables above as GitHub secrets in the `provider-e2e` environment (or repository secrets). A dedicated Todoist project ID is mandatory for live tests. Confirm dedicated test accounts when dispatching. Missing credentials fail preflight; tests never silently skip. Readback verifies uniquely named captured records before cleanup; Notion cleanup uses `in_trash: true` for the current API.

```bash
gh workflow run live-e2e.yml --ref main -f dedicated_test_accounts=true
```

Live runs have not been established until dedicated credentials are configured and an actual run passes. Licensed Things, OmniFocus, and Alfred UI tests use the separate `desktop-integrations` suite on a provisioned dedicated Mac. See [full E2E coverage](../../tests/e2e/README.md).
