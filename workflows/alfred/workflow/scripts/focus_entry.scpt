-- Alfred supplies one query string; split only command syntax, never task titles.
use scripting additions
on run argv
    if count of argv is not 1 then error "Provide a focus command"
    set oldDelimiters to AppleScript's text item delimiters
    set AppleScript's text item delimiters to space
    set tokens to text items of (item 1 of argv)
    set AppleScript's text item delimiters to oldDelimiters
    set argumentsText to ""
    repeat with tokenValue in tokens
        if tokenValue as text is not "" then set argumentsText to argumentsText & " " & quoted form of (tokenValue as text)
    end repeat
    return do shell script "/usr/bin/osascript " & quoted form of ((do shell script "pwd") & "/scripts/focus_mode.scpt") & argumentsText
end run
