#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

RUNNER_DIR="$HOME/actions-runner"
REPO="thomasvincent/MacGTD"

info()  { echo -e "${GREEN}>>>${NC} $1"; }
warn()  { echo -e "${YELLOW}>>>${NC} $1"; }
error() { echo -e "${RED}>>>${NC} $1"; }

echo "============================================"
echo "  MacGTD Local E2E Runner Setup"
echo "============================================"
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
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
info "Homebrew installed"

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
read -rp "Enter runner registration token: " RUNNER_TOKEN

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

RUNNER_VERSION=$(curl -s https://api.github.com/repos/actions/runner/releases/latest | grep tag_name | cut -d'"' -f4 | sed 's/v//')
curl -o actions-runner.tar.gz -L "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-osx-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz"
tar xzf actions-runner.tar.gz
rm actions-runner.tar.gz

# Configure
./config.sh --url "https://github.com/$REPO" \
    --token "$RUNNER_TOKEN" \
    --name "macgtd-local-$(hostname -s)" \
    --labels "self-hosted,macOS,${ARCH},e2e,local" \
    --unattended \
    --replace

# --- Grant TCC permissions ---
info "Granting accessibility permissions..."
warn "This requires sudo access."

TCC_DB="/Library/Application Support/com.apple.TCC/TCC.db"

# Grant accessibility to key apps
for client in "com.runningwithcrayons.Alfred" "com.apple.Terminal" "com.googlecode.iterm2"; do
    sudo sqlite3 "$TCC_DB" \
        "INSERT OR REPLACE INTO access (service, client, client_type, auth_value, auth_reason, auth_version, flags) VALUES ('kTCCServiceAccessibility', '$client', 0, 2, 0, 1, 0);" 2>/dev/null || true
done

for client_path in "/usr/bin/osascript" "$RUNNER_DIR/bin/Runner.Worker"; do
    sudo sqlite3 "$TCC_DB" \
        "INSERT OR REPLACE INTO access (service, client, client_type, auth_value, auth_reason, auth_version, flags) VALUES ('kTCCServiceAccessibility', '$client_path', 1, 2, 0, 1, 0);" 2>/dev/null || true
done

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
info "============================================"
info "  Setup Complete!"
info "============================================"
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
