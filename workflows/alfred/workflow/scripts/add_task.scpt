use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
on run argv
    if count of argv is not 1 then error "Provide one task description"
    set taskInput to item 1 of argv
    set scriptsPath to (do shell script "pwd") & "/scripts"
    set manager to my loadComponent(scriptsPath & "/preferences_manager.scpt")
    set taskApp to manager's readPreference("taskApp")
    set parser to my loadComponent(scriptsPath & "/natural_language_task.scpt")
    set taskData to parser's parseTaskInput(taskInput)
    if taskText of taskData is "" then error "Task title cannot be empty"
    if taskApp is "reminders" then return parser's createSmartTask(taskData)
    if taskApp is "todoist" then
        set adapter to my loadComponent(scriptsPath & "/api_todoist.scpt")
        return adapter's createdIdentifier(adapter's captureTask(taskInput))
    end if
    if taskApp is "things" then
        set components to current application's NSURLComponents's componentsWithString:"things:///add"
        set queryItems to current application's NSMutableArray's array()
        queryItems's addObject:(current application's NSURLQueryItem's queryItemWithName:"title" value:(taskText of taskData))
        queryItems's addObject:(current application's NSURLQueryItem's queryItemWithName:"list" value:"Inbox")
        if context of taskData is not "" then queryItems's addObject:(current application's NSURLQueryItem's queryItemWithName:"tags" value:(text 2 thru -1 of (context of taskData)))
        components's setQueryItems:queryItems
        open location (components's |URL|()'s absoluteString() as text)
        return "Task sent to Things"
    end if
    if taskApp is "omnifocus" then
        set bridgeSource to "on run argv\n tell application \"OmniFocus\" to tell default document\n set r to make new inbox task with properties {name:(item 1 of argv), flagged:(item 2 of argv)}\n if item 3 of argv is not missing value then set due date of r to item 3 of argv\n return id of r\n end tell\nend run"
        return run script bridgeSource with parameters {taskText of taskData, (priority of taskData is 1), dueDate of taskData}
    end if
    error "Unsupported task service"
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
