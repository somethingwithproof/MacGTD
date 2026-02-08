#!/bin/bash
set -euo pipefail

# Install GTD Quick Capture shortcut via macOS Shortcuts app
# Requires macOS 12 (Monterey) or later

echo "MacGTD - Shortcuts.app Quick Capture Installer"
echo "================================================"
echo ""

# Check macOS version
SW_VERS=$(sw_vers -productVersion)
MAJOR_VERSION=$(echo "${SW_VERS}" | cut -d. -f1)

if [[ "${MAJOR_VERSION}" -lt 12 ]]; then
    echo "Error: Shortcuts.app requires macOS 12 (Monterey) or later."
    echo "Your version: macOS ${SW_VERS}"
    echo ""
    echo "Use the Automator workflows instead:"
    echo "  workflows/apple/GTD-QuickCapture.workflow"
    exit 1
fi

echo "This will create a 'GTD Quick Capture' shortcut that:"
echo "  - Prompts for task text"
echo "  - Supports !1/!2/!3 priority markers"
echo "  - Supports due:today / due:tomorrow dates"
echo "  - Adds tasks to Apple Reminders (Inbox list)"
echo ""
echo "After installation, assign a keyboard shortcut in:"
echo "  System Settings > Keyboard > Keyboard Shortcuts > Services"
echo ""

read -rp "Install shortcut? [y/N] " REPLY
if [[ ! "${REPLY}" =~ ^[Yy]$ ]]; then
    echo "Installation cancelled."
    exit 0
fi

# Use shortcuts CLI to import if available, otherwise guide manual setup
if command -v shortcuts &> /dev/null; then
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    if [[ -f "${SCRIPT_DIR}/GTD-QuickCapture.shortcut" ]]; then
        shortcuts import "${SCRIPT_DIR}/GTD-QuickCapture.shortcut"
        echo ""
        echo "Shortcut installed successfully!"
    else
        echo "Shortcut file not found. Please follow the manual setup below."
        echo ""
        echo "Manual setup instructions:"
        echo "  See: workflows/shortcuts/README.md"
    fi
else
    echo "The 'shortcuts' CLI is not available on this system."
    echo ""
    echo "Manual setup instructions:"
    echo "  See: workflows/shortcuts/README.md"
fi
