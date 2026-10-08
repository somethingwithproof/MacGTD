# E2E Tests

Project overview and status: [MacGTD](../../README.md).

Validation and desktop E2E use `tests/run.py` with the Python version pinned in `.mise.toml`. Native tests run shipped Automator bundles, operate their real dialogs, and read the resulting Reminders and Calendar records. A notification or successful process exit alone does not establish successful capture.

## GitHub Actions

- Pull requests, pushes to `main`, and manual CI runs: validation on `macos-15` and `macos-26`, then native E2E on `macos-15-intel`.
- Nightly: native E2E at 10:23 UTC.
- Manual `e2e.yml` runs: the `automator` suite, on the selected branch.

Every job uses a disposable GitHub-hosted Mac. `scripts/prepare-hosted-macos.py` grants the test processes access to the ephemeral desktop, Reminders, and Calendar using the runner image's TCC database mechanism. The script refuses to run outside a GitHub-hosted macOS job. It verifies Accessibility and Reminders access, removes only an empty image-provided Inbox, and ensures a writable calendar exists.

Tests use unique fixtures and clean up by identifier. Each subprocess has a deadline; the E2E job has a 30-minute deadline. Missing prerequisites, skipped required tests, and assertion failures fail the job. No external credentials are needed. Live Todoist, Notion, Things, OmniFocus, Google, and Microsoft integration tests are deferred.

## Run locally

```bash
mise install
mise exec -- python tests/run.py validation

# Dedicated logged-in test account only:
MACGTD_E2E_DEDICATED=1 mise exec -- python tests/run.py automator
MACGTD_E2E_DEDICATED=1 mise exec -- python tests/run.py alfred

# GitHub-hosted Mac:
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Local desktop tests require an unlocked English macOS GUI session, Accessibility/Automation permissions, Reminders without an existing Inbox, and a writable Calendar. Use a dedicated account with no personal tasks or events. The hosted provisioning script must not be used on a personal Mac.

The optional `alfred` suite additionally requires Alfred 5 with an activated Powerpack and configured preferences. Set `MACGTD_ALFRED_PREFERENCES` for a custom `.alfredpreferences` directory. It installs an isolated package with a unique keyword and invokes the real Alfred UI. The `all` suite includes this licensed prerequisite and is intended for a suitably provisioned local test account.

## Coverage

| Suite | Checks |
| --- | --- |
| Validation | Repository and bundle structure; source compilation; production date/context/project/priority parser; exact package round trip; Alfred action targets and connections; subprocess deadlines and failure reports |
| Components | Typed preferences, reset/import and corrupt-file handling; cross-process focus state and timer ownership; JSONL analytics; quoted Unicode clipboard feedback; API JSON transport using a fixture transport; rendered bootstrap shell |
| Native Automator | Priorities and completion readback; relative and ISO due dates; blank input/cancellation; project/context routing; clipboard empty/Unicode/quotes/truncation; batch blank lines and priorities |
| Weekly review | Five real dialogs and final summary; brain-dump reminders read back |
| Calendar | Persisted event title, date/time, duration and location |
| Menu bar | Inbox count excluding completed tasks; refresh entry |
| Focus | Real launchd timer registration, cross-process status, stop, and job cancellation |
| GTDLib | Native task creation, priority, dashboard count, note persistence; compiled bundle loading |
| Optional Alfred UI | Isolated packaged workflow import, actual keyword invocation and reminder readback |

Every shipped Automator bundle is copied and compiled in an isolated directory. Native tests install uniquely named copies under `~/Library/Services`; they never overwrite an existing service. External bundle validation and fixture transport tests do not establish live provider compatibility. Shortcuts/Siri voice activation and full licensed Alfred UI coverage remain outside the hosted suite.

## Results

`test-results/` contains JUnit XML, command output, Automator logs, and a text summary. GitHub uploads these and build artifacts on success or failure, retains them for 14 days, and writes a job summary. Temporary services, test lists, and uniquely named Calendar events are cleaned up even after assertion failures.
