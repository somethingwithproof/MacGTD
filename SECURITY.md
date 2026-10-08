# Security policy

## Reporting an issue

Report vulnerabilities through a [private GitHub security advisory](https://github.com/somethingwithproof/MacGTD/security/advisories/new). Include the affected workflow or script, the revision, reproduction steps using synthetic data, and the potential impact. Do not include API tokens, personal tasks, or Keychain exports. Avoid public issues for undisclosed vulnerabilities.

Current development targets `main`. Tagged release packages can predate fixes and API migrations; reproduce against current source when possible and identify the exact version in a report. This project does not promise a fixed response deadline.

## Execution and permission boundaries

MacGTD runs AppleScript, Automator Services, shell helpers, and Alfred actions under the logged-in user's account. macOS Automation permissions govern app access; UI tests also require Accessibility permission. These scripts are not isolated from all user files by an application sandbox.

Native workflows create and inspect Reminders and Calendar records. Things and OmniFocus adapters invoke installed apps. Alfred actions pass user text as arguments rather than interpolating it into shell programs. Focus state and JSONL analytics are stored under `~/.gtd`; preferences are stored in `~/Library/Preferences/com.alfredgtd.plist`. These files can contain task titles, contexts, and identifiers.

The underlying apps may sync data through their own accounts. MacGTD's capture API adapters transmit task/note text and the supported metadata to the selected provider.

## API credentials and transport

| Provider | API origin | Authorization |
| --- | --- | --- |
| Todoist | `https://api.todoist.com` | Personal API token |
| Notion | `https://api.notion.com` | Authorized connection token and shared data source |
| Microsoft To Do | `https://graph.microsoft.com` | Delegated OAuth access token with `Tasks.ReadWrite` |
| Google Keep | `https://keep.googleapis.com` | Authorized Workspace OAuth access token with the Keep scope |

Setup helpers store credentials in macOS Keychain. Managed invocations can use the environment variables documented in the [API guide](workflows/api/README.md). Do not put credential values in repository files, documentation, issue reports, or logs.

Production requests enforce HTTPS, require certificate verification, and use connection and overall timeouts. Authorization headers reach curl through stdin using an `NSTask` pipe; tokens are not placed in curl or shell process arguments. Setup and live-test Keychain writes also use stdin. JSON payloads use explicit keys and serialization. The adapter rejects unconfirmed creation and redacts its configured token from reported transport failures.

Notion data-source discovery fails on ambiguous databases. Microsoft list IDs are encoded as individual URL path components. Live-test readback uses fixed provider origins and rejects redirects. Microsoft/Google OAuth token renewal remains the caller's responsibility; MacGTD does not store refresh tokens or implement OAuth login.

## Test accounts and artifacts

Default CI uses disposable GitHub-hosted Macs and synthetic fixtures. Hosted permission provisioning refuses to run outside those jobs. Tests use isolated Services and uniquely named records, with cleanup by owned identifiers.

Live vendor tests require dedicated accounts and targets, explicit confirmation, and every required secret. Missing configuration fails before mutation. Tokens are stored in uniquely named transient Keychain entries for Automator Runner and removed afterward. Vendor cleanup follows readback that verifies the unique test title; Notion uses `in_trash: true`.

Desktop logs, command output, and failure screenshots can contain test task text. GitHub retains reports and tested build artifacts for 14 days. Run local GUI tests in a dedicated account without personal tasks or events; never run the hosted TCC provisioning script on a personal Mac. See the [E2E guide](tests/e2e/README.md).
