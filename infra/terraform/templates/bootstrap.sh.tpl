#!/bin/bash
set -euo pipefail

exec > /var/log/macgtd-bootstrap.log 2>&1
echo "=== MacGTD E2E Runner Bootstrap ==="
date

GITHUB_TOKEN="${github_token}"
GITHUB_REPO="${github_repo}"
RUNNER_NAME="${runner_name}"
RUNNER_LABELS="${runner_labels}"

# --- System Setup ---
echo ">>> Setting up system..."
sudo systemsetup -setremotelogin on
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart \
  -activate -configure -access -on -restart -agent -privs -all

# --- Install Homebrew ---
echo ">>> Installing Homebrew..."
if ! command -v brew &>/dev/null; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Preserve command substitution for the future login shell, not bootstrap.
  # shellcheck disable=SC2016
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ec2-user/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# --- Install Alfred ---
echo ">>> Installing Alfred..."
brew install mise
brew install --cask alfred
sleep 5

# Configure Accessibility and Automation through System Settings in the logged-in
# test account. Editing TCC.db bypasses neither OS protections nor GUI provisioning.

# --- Install GitHub Actions Runner ---
echo ">>> Installing GitHub Actions runner..."
cd /Users/ec2-user
mkdir -p actions-runner && cd actions-runner

RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | grep tag_name | cut -d'"' -f4 | sed 's/v//')
curl -o actions-runner.tar.gz -L "https://github.com/actions/runner/releases/download/v$${RUNNER_VERSION}/actions-runner-osx-arm64-$${RUNNER_VERSION}.tar.gz"
tar xzf actions-runner.tar.gz
rm actions-runner.tar.gz

# Configure runner
./config.sh --url "https://github.com/$${GITHUB_REPO}" \
  --token "$${GITHUB_TOKEN}" \
  --name "$${RUNNER_NAME}" \
  --labels "$${RUNNER_LABELS}" \
  --unattended \
  --replace

# Install as launchd service
# Desktop automation must run in ec2-user's logged-in GUI session.
# Register normally; start ./run.sh as ec2-user after provisioning GUI permissions.
echo "Runner configured. Log in as ec2-user and start /Users/ec2-user/actions-runner/run.sh"

echo ">>> GitHub Actions runner installed and started"

# --- Launch Alfred ---
echo ">>> Launching Alfred..."
sudo -u ec2-user open -a "Alfred 5" || sudo -u ec2-user open -a "Alfred" || true
sleep 5

echo "=== Bootstrap complete ==="
date
