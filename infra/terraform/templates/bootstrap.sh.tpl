#!/bin/bash
set -euo pipefail

exec > /var/log/macgtd-bootstrap.log 2>&1
echo "=== MacGTD E2E Runner Bootstrap ==="
date

GITHUB_TOKEN="${github_token}"
GITHUB_REPO="${github_repo}"
RUNNER_NAME="${runner_name}"
RUNNER_LABELS="${runner_labels}"
export GITHUB_TOKEN GITHUB_REPO RUNNER_NAME RUNNER_LABELS

# System setup stays in the privileged initialization context.
systemsetup -setremotelogin on
/System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart \
  -activate -configure -access -on -restart -agent -privs -all

# Package installation and runner configuration belong to the desktop account.
# Preserve only registration inputs; sudo sets the user's identity and home.
sudo -H -u ec2-user --preserve-env=GITHUB_TOKEN,GITHUB_REPO,RUNNER_NAME,RUNNER_LABELS \
  /bin/bash -s <<'USER_SETUP'
set -euo pipefail
cd /Users/ec2-user

if [[ ! -x /opt/homebrew/bin/brew && ! -x /usr/local/bin/brew ]]; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl --proto '=https' --proto-redir '=https' --tlsv1.2 -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
BREW_EXECUTABLE=/opt/homebrew/bin/brew
if [[ ! -x "$BREW_EXECUTABLE" ]]; then BREW_EXECUTABLE=/usr/local/bin/brew; fi
eval "$("$BREW_EXECUTABLE" shellenv)"
# Expand shellenv at future login rather than during bootstrap.
# shellcheck disable=SC2016
printf 'eval "$(%s shellenv)"\n' "$BREW_EXECUTABLE" >> .zprofile
brew install mise
brew install --cask alfred

mkdir -p actions-runner
cd actions-runner
RUNNER_VERSION=$(curl --proto '=https' --proto-redir '=https' --tlsv1.2 -fsS https://api.github.com/repos/actions/runner/releases/latest | grep tag_name | cut -d'"' -f4 | sed 's/v//')
curl --proto '=https' --proto-redir '=https' --tlsv1.2 -fSLo actions-runner.tar.gz "https://github.com/actions/runner/releases/download/v$${RUNNER_VERSION}/actions-runner-osx-arm64-$${RUNNER_VERSION}.tar.gz"
tar xzf actions-runner.tar.gz
rm actions-runner.tar.gz
./config.sh --url "https://github.com/$${GITHUB_REPO}" \
    --token "$${GITHUB_TOKEN}" --name "$${RUNNER_NAME}" \
    --labels "$${RUNNER_LABELS}" --unattended --replace
USER_SETUP
unset GITHUB_TOKEN

echo "Runner installed and configured. Log in as ec2-user, grant Accessibility and Automation permissions in System Settings, and activate Alfred Powerpack for licensed UI tests."
echo "Start /Users/ec2-user/actions-runner/run.sh from that logged-in GUI session."
echo "=== Bootstrap complete ==="
date
