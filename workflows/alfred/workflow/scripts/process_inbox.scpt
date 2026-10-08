-- Open the inbox for human triage; do not complete or move tasks automatically.
use scripting additions
on run argv
    tell application "Reminders"
        if not (exists list "Inbox") then make new list with properties {name:"Inbox"}
        set pendingCount to count of (reminders in list "Inbox" whose completed is false)
        activate
        show list "Inbox"
        return pendingCount
    end tell
end run
