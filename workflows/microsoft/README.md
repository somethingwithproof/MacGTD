# Microsoft To Do capture

`MS-GTD-QuickCapture.workflow` creates tasks through the stable Microsoft Graph v1.0 API. It replaces the unverified browser `quickAdd` path and simulated keystrokes.

## Authorization and setup

Obtain a delegated Microsoft Graph OAuth access token with `Tasks.ReadWrite`. Task creation supports delegated work/school or personal Microsoft accounts; application-only permissions are not supported for this operation. Select a destination list ID from `GET /v1.0/me/todo/lists`.

From the repository root:

```bash
./workflows/microsoft/setup-microsoft.sh
open workflows/microsoft/MS-GTD-QuickCapture.workflow
```

The helper stores the token and list ID in Keychain service `MacGTD-Microsoft`, accounts `api-token` and `list-id`. Managed invocations can use `MACGTD_MICROSOFT_TOKEN` and `MACGTD_MICROSOFT_LIST_ID`.

MacGTD does not implement OAuth sign-in or refresh-token storage. Renew expired access tokens through your OAuth client and update the Keychain entry or managed environment. An expired token fails capture; opening a browser does not count as successful task creation.

## Field mapping

- Capture uses `POST /v1.0/me/todo/lists/{list-id}/tasks`; opaque list IDs are encoded as one path component.
- `!1`, `!2`, and `!3` map to high, normal, and low importance.
- Due dates use Graph's `dueDateTime` object. Date-only input retains the calendar date at midnight UTC; explicitly timed input is converted to UTC.
- Context/project markers become task body text. A configured list ID determines the destination.

## Testing

Hosted E2E runs the real dialog against a verified local TLS fixture and reads back the persisted task fields. The manual live suite uses a dedicated account/list, verifies the actual Graph task, and deletes the owned record. Live verification remains pending dedicated credentials.

See [API setup](../api/README.md), [live E2E configuration](../../tests/e2e/README.md), and [Microsoft's create-task contract](https://learn.microsoft.com/en-us/graph/api/todotasklist-post-tasks?view=graph-rest-1.0).
