#!/bin/bash
# MacGTD Menu Bar Helper
# Designed for use with SwiftBar, xbar, or BitBar
# Install: brew install swiftbar
# Then symlink this script to the SwiftBar plugins directory

set -euo pipefail

# Get inbox count
INBOX_COUNT=$(osascript -e 'tell application "Reminders" to return count of (reminders in list "Inbox" whose completed is false)' 2>/dev/null || echo "?")

# Get overdue count
OVERDUE_COUNT=$(osascript -e 'tell application "Reminders" to return count of (reminders whose completed is false and due date < (current date))' 2>/dev/null || echo "0")

# Menu bar title
if [[ "$OVERDUE_COUNT" != "0" && "$OVERDUE_COUNT" != "?" ]]; then
    echo "📥 ${INBOX_COUNT} ⚠️ ${OVERDUE_COUNT}"
else
    echo "📥 ${INBOX_COUNT}"
fi

echo "---"
echo "GTD Quick Capture | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-QuickCapture.workflow\"' terminal=false"
echo "GTD Clipboard Capture | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-ClipboardCapture.workflow\"' terminal=false"
echo "GTD Batch Capture | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-BatchCapture.workflow\"' terminal=false"
echo "---"
echo "Inbox: ${INBOX_COUNT} tasks"
echo "Overdue: ${OVERDUE_COUNT} tasks"
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
    [[ -n "$line" ]] && echo "$line"
done

echo "---"
echo "Open Reminders | bash='open' param1='-a' param2='Reminders' terminal=false"
echo "Weekly Review | bash='osascript' param1='-e' param2='tell application \"Automator\" to open POSIX file \"/Users/$USER/Library/Services/GTD-WeeklyReview.workflow\"' terminal=false"
echo "---"
echo "Refresh | refresh=true"
