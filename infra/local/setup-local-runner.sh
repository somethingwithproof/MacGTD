#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
SEPARATOR="============================================"

RUNNER_DIR="$HOME/actions-runner"
REPO="${MACGTD_GITHUB_REPO:-somethingwithproof/MacGTD}"

info() {
    local message="$1"
    echo -e "${GREEN}>>>${NC} ${message}"
    return 0
}

warn() {
    local message="$1"
    echo -e "${YELLOW}>>>${NC} ${message}"
    return 0
}

error() {
    local message="$1"
    echo -e "${RED}>>>${NC} ${message}"
    return 0
}

echo "$SEPARATOR"
echo "  MacGTD Local E2E Runner Setup"
echo "$SEPARATOR"
echo ""

# --- Check prerequisites ---
info "Checking prerequisites..."

# macOS version
SW_VERS=$(sw_vers -productVersion)
MAJOR=$(echo "$SW_VERS" | cut -d. -f1)
if [[ "$MAJOR" -lt 13 ]]; then
    error "macOS 13 (Ventura) or later required. You have: $SW_VERS"
    exit 1
fi
info "macOS $SW_VERS"

# Homebrew
if ! command -v brew &>/dev/null; then
    warn "Homebrew not found. Installing..."
    NONINTERACTIVE=1 /bin/bash -c "$(curl --proto '=https' --tlsv1.2 -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
info "Homebrew installed"
brew install mise

# --- Install Alfred ---
if ! ls /Applications/Alfred*.app &>/dev/null; then
    info "Installing Alfred..."
    brew install --cask alfred
else
    info "Alfred already installed"
fi

# --- Get GitHub runner token ---
echo ""
warn "You need a GitHub Actions runner registration token."
echo "  Generate one at:"
echo "  https://github.com/$REPO/settings/actions/runners/new"
echo ""
echo "  Or run: gh api repos/$REPO/actions/runners/registration-token --jq .token"
echo ""
read -rsp "Enter runner registration token: " RUNNER_TOKEN

if [[ -z "$RUNNER_TOKEN" ]]; then
    error "Token is required"
    exit 1
fi

# --- Install GitHub Actions Runner ---
info "Installing GitHub Actions runner..."

mkdir -p "$RUNNER_DIR" && cd "$RUNNER_DIR"

ARCH=$(uname -m)
if [[ "$ARCH" == "arm64" ]]; then
    RUNNER_ARCH="arm64"
else
    RUNNER_ARCH="x64"
fi

RUNNER_VERSION=$(curl --proto '=https' --tlsv1.2 -s https://api.github.com/repos/actions/runner/releases/latest | grep tag_name | cut -d'"' -f4 | sed 's/v//')
curl --proto '=https' --tlsv1.2 -o actions-runner.tar.gz -L "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-osx-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz"
tar xzf actions-runner.tar.gz
rm actions-runner.tar.gz

# Configure
./config.sh --url "https://github.com/$REPO" \
    --token "$RUNNER_TOKEN" \
    --name "macgtd-local-$(hostname -s)" \
    --labels "self-hosted,macOS,${ARCH},e2e,local" \
    --unattended \
    --replace

# Provision OS permissions interactively for this logged-in account.
warn "Grant Accessibility and Automation permissions in System Settings for the runner."
warn "Do not edit TCC.db: permission failures must be visible, not silently ignored."

# --- Install as launchd service ---
info "Installing launchd service..."

PLIST_PATH="$HOME/Library/LaunchAgents/com.macgtd.actions-runner.plist"

cat > "$PLIST_PATH" << PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.macgtd.actions-runner</string>
    <key>ProgramArguments</key>
    <array>
        <string>${RUNNER_DIR}/run.sh</string>
    </array>
    <key>WorkingDirectory</key>
    <string>${RUNNER_DIR}</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>StandardOutPath</key>
    <string>${RUNNER_DIR}/runner.log</string>
    <key>StandardErrorPath</key>
    <string>${RUNNER_DIR}/runner-error.log</string>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PATH</key>
        <string>/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
    </dict>
</dict>
</plist>
PLIST

launchctl load "$PLIST_PATH"

# --- Verify ---
echo ""
info "$SEPARATOR"
info "  Setup Complete!"
info "$SEPARATOR"
echo ""
echo "  Runner name:  macgtd-local-$(hostname -s)"
echo "  Runner dir:   $RUNNER_DIR"
echo "  Logs:         $RUNNER_DIR/runner.log"
echo "  Launchd:      $PLIST_PATH"
echo ""
echo "  Runner will auto-start on login."
echo ""
echo "  Commands:"
echo "    Start:   launchctl load $PLIST_PATH"
echo "    Stop:    launchctl unload $PLIST_PATH"
echo "    Logs:    tail -f $RUNNER_DIR/runner.log"
echo "    Status:  gh api repos/$REPO/actions/runners --jq '.runners[] | select(.name | contains(\"local\"))'"
echo ""

# --- Verify runner is online ---
sleep 3
if pgrep -f "Runner.Listener" >/dev/null; then
    info "Runner is online and listening for jobs!"
else
    warn "Runner process not detected. Check logs: $RUNNER_DIR/runner.log"
fi
