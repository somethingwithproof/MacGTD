use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
on run argv
    if count of argv is not 3 then error "Timer requires controller, state directory, and session ID"
    set statePath to item 2 of argv
    set controller to my loadComponent(item 1 of argv)
    -- An explicit property avoids depending on the launchd job's environment.
    -- Pass the state path through a controller property rather than executable text.
    set stateOverride of controller to statePath
    return controller's finishTimer(item 3 of argv)
end run

-- Source files remain reviewable; load script requires a compiled OSA component.
on loadComponent(sourcePath)
    set temporaryDirectory to do shell script "/usr/bin/mktemp -d " & quoted form of "/tmp/macgtd-component.XXXXXX"
    try
        set compiledPath to temporaryDirectory & "/component.scpt"
        do shell script "/usr/bin/osacompile -o " & quoted form of compiledPath & " " & quoted form of sourcePath
        -- A plain AppleScript loader avoids macOS 15's nested ASObjC load coercion bug.
        set loaderSource to "on run argv\n return load script POSIX file (item 1 of argv)\nend run"
        set component to run script loaderSource with parameters {compiledPath}
        do shell script "/bin/rm -rf " & quoted form of temporaryDirectory
        return component
    on error messageText number errorNumber
        do shell script "/bin/rm -rf " & quoted form of temporaryDirectory
        error messageText number errorNumber
    end try
end loadComponent
