# Google Keep capture

`Google-GTD-QuickCapture.workflow` creates notes through Google Keep API v1. It replaces the undocumented `#create/` browser shortcut.

## Account requirements

The Keep API is intended for authorized enterprise/Workspace use. Obtain eligible Workspace API access and an OAuth token with the `https://www.googleapis.com/auth/keep` scope. Administrator authorization may be required. This workflow is not a consumer Gmail capture API; Google Keep itself remains available through its web and mobile apps.

From the repository root:

```bash
./workflows/google/setup-google.sh
open workflows/google/Google-GTD-QuickCapture.workflow
```

The helper stores the token under Keychain service `MacGTD-Google`, account `api-token`. Managed invocations can use `MACGTD_GOOGLE_TOKEN`. Renew expired OAuth access tokens through your OAuth client; MacGTD does not implement login or refresh-token storage.

## Note mapping

Capture calls `POST https://keep.googleapis.com/v1/notes`. The parsed title becomes the note title. Priority, due date, context, and project markers are retained in note body text, because Keep notes do not expose the same task fields as Reminders or Todoist. Date-only values remain calendar dates; explicit times become UTC ISO timestamps.

Capture requires a confirmed note resource identifier. A successful browser launch is no longer reported as successful persistence.

## Testing

Hosted E2E operates the production dialog against a local TLS fixture and checks the note title, body metadata, and returned resource name. The manual live suite requires a dedicated authorized Workspace account and token, reads the real note, and deletes only its owned test record. Live verification has not yet been established.

See [API configuration](../api/README.md), [E2E configuration](../../tests/e2e/README.md), [Keep API authorization](https://developers.google.com/workspace/keep/api/guides), and [note creation](https://developers.google.com/workspace/keep/api/reference/rest/v1/notes/create).
