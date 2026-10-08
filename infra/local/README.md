# Local Mac Mini Runner Setup

Project overview and status: [MacGTD](../../README.md).

Optional setup for a dedicated local Mac test account. The default GitHub Actions pipeline uses GitHub-hosted macOS runners and does not require this infrastructure. Licensed Alfred UI testing can use this separate account with Powerpack activated.

## Quick Start

```bash
./setup-local-runner.sh
```

## Prerequisites

- macOS 13 (Ventura) or later
- Alfred 5 with Powerpack license
- Accessibility and Automation permissions granted interactively in System Settings
- GitHub account with repo access

## What it does

1. Installs Alfred (if not present)
2. Downloads and configures GitHub Actions runner
3. Prints the required Accessibility and Automation permissions for manual setup
4. Creates a launchd service for auto-start on login

## Management

```bash
# Check runner status
gh api repos/somethingwithproof/MacGTD/actions/runners

# View logs
tail -f ~/actions-runner/runner.log

# Stop runner
launchctl unload ~/Library/LaunchAgents/com.macgtd.actions-runner.plist

# Start runner
launchctl load ~/Library/LaunchAgents/com.macgtd.actions-runner.plist

# Uninstall
launchctl unload ~/Library/LaunchAgents/com.macgtd.actions-runner.plist
rm ~/Library/LaunchAgents/com.macgtd.actions-runner.plist
cd ~/actions-runner && ./config.sh remove
```

## Troubleshooting

### Runner not picking up jobs

- Configure a separate workflow with `self-hosted, macOS, e2e` labels; the default workflows use hosted Macs.
- Verify runner is online: `gh api repos/somethingwithproof/MacGTD/actions/runners`

### TCC permission errors

- Grant permissions to the runner process in the dedicated logged-in account
- Check System Settings > Privacy & Security > Accessibility

### Alfred not responding to automation

- Ensure Alfred is running and Powerpack is activated
- Check Alfred > Preferences > Advanced > "Allow external triggers"
