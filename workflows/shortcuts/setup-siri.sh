#!/bin/bash
set -euo pipefail

echo "============================================"
echo "  MacGTD — Siri Voice Capture Setup"
echo "============================================"
echo ""

# Check macOS version
SW_VERS=$(sw_vers -productVersion)
MAJOR_VERSION=$(echo "${SW_VERS}" | cut -d. -f1)

if [[ "${MAJOR_VERSION}" -lt 12 ]]; then
    echo "Error: Siri Shortcuts require macOS 12 (Monterey) or later."
    echo "Your version: macOS ${SW_VERS}"
    exit 1
fi

echo "This guide will help you set up Siri voice capture for GTD."
echo ""
echo "Step 1: Create the shortcuts"
echo "  Open Shortcuts.app and create these shortcuts:"
echo ""
echo "  a) GTD Quick Capture (text input)"
echo "  b) GTD Voice Capture (dictation input)"
echo "  c) GTD Clipboard Capture (clipboard input)"
echo ""
echo "  See: workflows/shortcuts/README.md for step-by-step instructions."
echo ""
echo "Step 2: Add Siri triggers"
echo "  For each shortcut:"
echo "  1. Click the ... (settings) icon on the shortcut"
echo "  2. Under Details, click 'Add to Siri'"
echo "  3. Record your trigger phrase"
echo ""
echo "  Suggested phrases:"
echo "    - 'Capture task'     → GTD Quick Capture"
echo "    - 'Dictate task'     → GTD Voice Capture"
echo "    - 'Capture clipboard' → GTD Clipboard Capture"
echo ""
echo "Step 3: Test it"
echo "  Say 'Hey Siri, capture task' and follow the prompts."
echo ""
echo "Step 4: (Optional) Add keyboard shortcuts"
echo "  System Settings > Keyboard > Keyboard Shortcuts > Services"
echo ""

# Check if Siri is enabled
if defaults read com.apple.assistant.support "Assistant Enabled" 2>/dev/null | grep -q "1"; then
    echo "Siri status: ENABLED"
else
    echo "Siri status: May not be enabled"
    echo "  Enable Siri in System Settings > Siri & Spotlight"
fi
