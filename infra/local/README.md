# Local Mac Mini Runner Setup

Set up a local Mac Mini as a GitHub Actions self-hosted runner for E2E testing.

## Quick Start

```bash
./setup-local-runner.sh
```

## Prerequisites

- macOS 13 (Ventura) or later
- Alfred 5 with Powerpack license
- Admin (sudo) access for TCC permissions
- GitHub account with repo access

## What it does

1. Installs Alfred (if not present)
2. Downloads and configures GitHub Actions runner
3. Grants accessibility permissions for AppleScript automation
4. Creates a launchd service for auto-start on login

## Management

```bash
# Check runner status
gh api repos/thomasvincent/MacGTD/actions/runners

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
- Check labels match the workflow: `self-hosted, macOS, e2e`
- Verify runner is online: `gh api repos/thomasvincent/MacGTD/actions/runners`

### TCC permission errors
- Re-run the TCC commands with sudo
- Check System Settings > Privacy & Security > Accessibility

### Alfred not responding to automation
- Ensure Alfred is running and Powerpack is activated
- Check Alfred > Preferences > Advanced > "Allow external triggers"
