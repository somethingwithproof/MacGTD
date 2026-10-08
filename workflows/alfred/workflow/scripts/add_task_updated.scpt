-- Compatibility entry point; the shipped native task path uses the shared parser.
use scripting additions
on run argv
    if (count of argv) is not 1 then error "Provide one task description"
    return do shell script "/usr/bin/osascript " & quoted form of ((do shell script "pwd") & "/scripts/add_task.scpt") & " " & quoted form of (item 1 of argv)
end run
