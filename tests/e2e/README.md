# End-to-end testing

Tests use the Python version pinned in `.mise.toml`, real shipped AppleScript, bounded subprocesses, and JUnit reports. Missing prerequisites and required skipped tests fail the selected suite.

## Suites and evidence

| Suite | Execution | Evidence |
| --- | --- | --- |
| `validation` | Hosted macOS 15 and 26, or local Mac | Source compilation, bundle/action structure, shared parser/adapter drift, preferences, focus state, packaging, and real HTTPS API contract checks against a fixture |
| `automator` | Disposable hosted macOS 15 Intel | Native dialogs with Reminders/Calendar persistence, weekly review, menu counts, GTDLib, packaged Alfred native actions, launchd expiry/cancellation, plus all four provider fixture E2E paths |
| `providers` | Dedicated macOS GUI account | Todoist, Notion, Microsoft, and Google production capture dialogs through verified TLS to a local persistence fixture |
| `live` | Manual hosted Mac with dedicated provider secrets | Actual production dialogs, real vendor record readback, and owned-record cleanup for all four API providers |
| `alfred` | Dedicated local account with Alfred 5 + Powerpack | Isolated workflow import and real Alfred keyword invocation with Reminders readback |
| `desktop-integrations` | Dedicated local account with licensed Things 3, OmniFocus 4, and Alfred 5 + Powerpack | Real app capture/readback and Alfred UI |
| `all` | Fully configured dedicated local Mac | Native, provider fixture, live API, licensed app, and Alfred UI E2E suites; every prerequisite is mandatory |

The fixture exercises real `/usr/bin/curl` HTTPS with a locally trusted certificate. Only a temporary copy of a workflow's transport executable and synthetic configuration are substituted. The production parser, payload construction, current API paths/versions, confirmation checks, and error handlers run unchanged. It verifies captured title, priority, dates, metadata, returned IDs, and persisted records. Authentication, rate-limit, invalid-confirmation, blank/cancel, legacy Notion discovery, and ambiguous-source cases are covered.

**Fixture success is not evidence of live vendor compatibility.** Live cloud and licensed-app runs require accounts and applications that are not present on an ordinary hosted runner. Shortcuts/Siri voice activation remains outside automated coverage.

## GitHub Actions

- PRs, pushes to `main`, and manual CI: validation on `macos-15` and `macos-26`, then `automator` on `macos-15-intel`.
- Nightly at 10:23 UTC and manual `e2e.yml`: the same native + provider fixture suite.
- Manual `live-e2e.yml`: all four actual vendor integrations, on `macos-15-intel`, with secrets from the `provider-e2e` environment or repository.

Hosted desktop provisioning refuses to run outside disposable GitHub-hosted macOS jobs. It verifies Accessibility and Reminders permissions, removes only an empty image-provided Inbox, and ensures a writable calendar exists. Fixtures use unique IDs, temporary Services, and bounded deadlines. No personal Services are overwritten.

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
gh workflow run live-e2e.yml --ref main -f dedicated_test_accounts=true
```

### Live account configuration

Configure these secret names; never put credential values into source, documentation, or test output:

| Provider | Required secrets |
| --- | --- |
| Todoist | `MACGTD_TODOIST_TOKEN`, `MACGTD_TODOIST_PROJECT_ID` |
| Notion | `MACGTD_NOTION_TOKEN`, `MACGTD_NOTION_DATA_SOURCE_ID` |
| Microsoft | `MACGTD_MICROSOFT_TOKEN`, `MACGTD_MICROSOFT_LIST_ID` |
| Google | `MACGTD_GOOGLE_TOKEN` |

Targets must belong to dedicated test accounts. Notion requires the documented GTD property schema. Microsoft needs delegated `Tasks.ReadWrite`; Google requires authorized Workspace Keep access. OAuth tokens must be current and renewed through your OAuth client. See [API setup and migration](../../workflows/api/README.md).

Preflight requires every account and explicit confirmation before GUI/network mutation. It does not silently skip unconfigured providers. Each workflow returns its created ID; live tests retrieve that record, verify its unique test title and fields, then delete it (or set Notion `in_trash: true`). Credentials are placed in uniquely named transient Keychain entries for Automator Runner and removed afterward. No live passing result is claimed until an actual configured run succeeds.

## Local execution

```bash
mise install
mise exec -- python tests/run.py validation

# Dedicated logged-in test account only:
MACGTD_E2E_DEDICATED=1 mise exec -- python tests/run.py automator
MACGTD_E2E_DEDICATED=1 mise exec -- python tests/run.py providers
MACGTD_E2E_DEDICATED=1 mise exec -- python tests/run.py desktop-integrations

# Set the live provider variables from a secure runtime source first:
MACGTD_E2E_DEDICATED=1 MACGTD_LIVE_TEST_ACCOUNTS=1 mise exec -- python tests/run.py live
```

Local GUI suites require an unlocked English desktop, Accessibility/Automation permissions, Reminders without an existing Inbox, and a writable Calendar. Use an account without personal tasks/events. Do not use the hosted TCC provisioning script on a personal Mac. Licensed app suites also require logged-in, activated apps and their Automation permissions. The Alfred suite supports a custom `MACGTD_ALFRED_PREFERENCES` directory and installs an isolated workflow with a unique keyword.

## Results

`test-results/` contains JUnit XML, command logs, Automator logs, text summaries, and screenshots on desktop failure. CI uploads reports and tested build artifacts for 14 days on success or failure. The manual live workflow uploads reports without shipping credentials or Keychain contents. Missing preflight credentials produce a failed job before tests start.
