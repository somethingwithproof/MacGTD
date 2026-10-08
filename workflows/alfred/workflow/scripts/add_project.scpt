use scripting additions
on run argv
    if (count of argv) is not 1 or item 1 of argv is "" then error "Project name cannot be empty"
    set projectName to item 1 of argv
    tell application "Reminders"
        if not (exists list projectName) then make new list with properties {name:projectName}
        return id of list projectName
    end tell
end run
