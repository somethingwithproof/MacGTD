-- Notes are captured as reminders with a body in a separate Reference list.
use scripting additions
on run argv
    if (count of argv) is not 1 or item 1 of argv is "" then error "Note content cannot be empty"
    set noteText to item 1 of argv
    tell application "Reminders"
        if not (exists list "Reference") then make new list with properties {name:"Reference"}
        set r to make new reminder at end of reminders of list "Reference" with properties {name:noteText, body:noteText}
        return id of r
    end tell
end run
