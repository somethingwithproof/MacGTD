#!/bin/bash
# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

# MacGTD Menu Bar Helper
# Designed for use with SwiftBar, xbar, or BitBar
# Install: brew install swiftbar
# Then symlink this script to the SwiftBar plugins directory

set -euo pipefail

SOURCE_PATH="$0"
while [[ -L "$SOURCE_PATH" ]]; do
    LINK_DIR="$(cd -P "$(dirname "$SOURCE_PATH")" && pwd)"
    SOURCE_PATH="$(readlink "$SOURCE_PATH")"
    [[ "$SOURCE_PATH" != /* ]] && SOURCE_PATH="${LINK_DIR}/${SOURCE_PATH}"
done
SCRIPT_DIR="$(cd -P "$(dirname "$SOURCE_PATH")" && pwd)"
I18N_HELPER="${SCRIPT_DIR}/../../scripts/i18n.py"

msg() {
    local key="$1"
    local fallback="$2"
    shift 2
    if [[ -f "$I18N_HELPER" ]] && command -v python3 >/dev/null 2>&1; then
        python3 "$I18N_HELPER" "$key" "$@" 2>/dev/null || printf '%s\n' "$fallback"
    else
        printf '%s\n' "$fallback"
    fi
}

# Get inbox count
INBOX_COUNT=$(osascript -e 'tell application "Reminders" to return count of (reminders in list "Inbox" whose completed is false)' 2>/dev/null || echo "?")

# Get overdue count
OVERDUE_COUNT=$(osascript -e 'tell application "Reminders" to return count of (reminders whose completed is false and due date < (current date))' 2>/dev/null || echo "0")

LABEL_QUICK=$(msg "menubar.quick_capture" "GTD Quick Capture")
LABEL_CLIP=$(msg "menubar.clipboard_capture" "GTD Clipboard Capture")
LABEL_BATCH=$(msg "menubar.batch_capture" "GTD Batch Capture")
LABEL_INBOX=$(msg "menubar.inbox_tasks" "Inbox: ${INBOX_COUNT} tasks" "count=${INBOX_COUNT}")
LABEL_OVERDUE=$(msg "menubar.overdue_tasks" "Overdue: ${OVERDUE_COUNT} tasks" "count=${OVERDUE_COUNT}")
LABEL_OPEN=$(msg "menubar.open_reminders" "Open Reminders")
LABEL_WEEKLY=$(msg "menubar.weekly_review" "Weekly Review")
LABEL_REFRESH=$(msg "menubar.refresh" "Refresh")

# Menu bar title
if [[ "$OVERDUE_COUNT" != "0" && "$OVERDUE_COUNT" != "?" ]]; then
    echo "📥 ${INBOX_COUNT} ⚠️ ${OVERDUE_COUNT}"
else
    echo "📥 ${INBOX_COUNT}"
fi

echo "---"
echo "${LABEL_QUICK} | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-QuickCapture.workflow\"' terminal=false"
echo "${LABEL_CLIP} | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-ClipboardCapture.workflow\"' terminal=false"
echo "${LABEL_BATCH} | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-BatchCapture.workflow\"' terminal=false"
echo "---"
echo "${LABEL_INBOX}"
echo "${LABEL_OVERDUE}"
echo "---"

# List all reminders lists with counts
osascript -e '
tell application "Reminders"
    set output to ""
    repeat with aList in every list
        set listName to name of aList
        set listCount to count of (reminders in aList whose completed is false)
        if listCount > 0 then
            set output to output & listName & ": " & listCount & "\n"
        end if
    end repeat
    return output
end tell
' 2>/dev/null | while IFS= read -r line; do
    if [[ -n "$line" ]]; then echo "$line"; fi
done

echo "---"
echo "${LABEL_OPEN} | bash='open' param1='-a' param2='Reminders' terminal=false"
echo "${LABEL_WEEKLY} | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-WeeklyReview.workflow\"' terminal=false"
echo "---"
echo "${LABEL_REFRESH} | refresh=true"
