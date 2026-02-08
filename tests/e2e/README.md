# E2E Tests

End-to-end tests that require a real macOS environment with GUI session, Alfred, and accessibility permissions.

## Requirements

- macOS 13+ with GUI session
- Alfred 5 with Powerpack
- Accessibility permissions for Terminal/runner
- Apple Reminders app

## Running Locally

```bash
# Run all E2E tests
./tests/e2e/test_alfred_workflow.sh
./tests/e2e/test_automator_install.sh

# Or via CI (requires self-hosted runner)
gh workflow run e2e-alfred.yml
```

## What's Tested

### test_alfred_workflow.sh
- Alfred is running and accessible
- Workflow import to Alfred
- All AppleScript files compile and execute
- Full Reminders CRUD cycle (create list, add tasks with priority/due date, verify, complete, cleanup)
- Preferences system read/write
- .alfredworkflow packaging and artifact validation

### test_automator_install.sh
- Workflow installation to ~/Library/Services
- Installed workflow XML validation
- Embedded AppleScript compilation post-install

## CI

These tests run on self-hosted runners only, triggered manually via `workflow_dispatch`:
- EC2 Mac dedicated host
- Local Mac Mini

See `infra/` for runner setup instructions.
