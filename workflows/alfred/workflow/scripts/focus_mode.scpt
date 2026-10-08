-- Focus sessions persist across osascript invocations. launchd owns each timer.
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
property stateOverride : ""
property timerEnabled : true -- Library-test dependency injection; CLI always uses launchd.

on stateDirectory()
    if stateOverride is not "" then return stateOverride
    set overridePath to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_STATE_DIR"
    if overridePath is not missing value then return overridePath as text
    return (current application's NSHomeDirectory() as text) & "/.gtd"
end stateDirectory
on ensureDirectory()
    set directoryPath to my stateDirectory()
    if not (current application's NSFileManager's defaultManager()'s createDirectoryAtPath:directoryPath withIntermediateDirectories:true attributes:{NSFilePosixPermissions:448} |error|:(missing value)) then error "Cannot create focus state directory"
    return directoryPath
end ensureDirectory
on scriptDirectory()
    set overridePath to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_SCRIPT_DIR"
    if overridePath is not missing value then return overridePath as text
    return (do shell script "pwd") & "/scripts"
end scriptDirectory
on nowSeconds()
    return current application's NSDate's |date|()'s timeIntervalSince1970() as integer
end nowSeconds
on encodeJSON(values)
    set dataObject to current application's NSJSONSerialization's dataWithJSONObject:values options:0 |error|:(missing value)
    if dataObject is missing value then error "Cannot serialize focus state"
    return dataObject
end encodeJSON
on readState()
    set filePath to my stateDirectory() & "/focus-session.json"
    if not (current application's NSFileManager's defaultManager()'s fileExistsAtPath:filePath) then return missing value
    set dataObject to current application's NSData's dataWithContentsOfFile:filePath
    set values to current application's NSJSONSerialization's JSONObjectWithData:dataObject options:1 |error|:(missing value)
    if values is missing value then error "Invalid focus session; state retained for inspection"
    if not (values's isKindOfClass:(current application's NSDictionary)) then error "Invalid focus session"
    repeat with keyName in {"sessionId", "context", "task", "taskId", "listId", "startTime", "endTime", "duration", "timerScheduled", "jobLabel"}
        if values's objectForKey:(keyName as text) is missing value then error "Incomplete focus session"
    end repeat
    return values
end readState
on writeState(values)
    set filePath to my ensureDirectory() & "/focus-session.json"
    if not ((my encodeJSON(values))'s writeToFile:filePath options:1 |error|:(missing value)) then error "Cannot atomically save focus state"
end writeState
on takeLock()
    set directoryPath to my ensureDirectory()
    do shell script "/bin/mkdir " & quoted form of (directoryPath & "/focus.lock")
end takeLock
on releaseLock()
    do shell script "/bin/rmdir " & quoted form of (my stateDirectory() & "/focus.lock")
end releaseLock
on domainName()
    return "gui/" & (do shell script "/usr/bin/id -u")
end domainName
on scheduleTimer(values)
    set labelText to (values's objectForKey:"jobLabel") as text
    set filePath to my stateDirectory() & "/" & labelText & ".plist"
    set arguments to {"/usr/bin/osascript", my scriptDirectory() & "/focus_timer.scpt", my scriptDirectory() & "/focus_mode.scpt", my stateDirectory(), (values's objectForKey:"sessionId") as text}
    set job to current application's NSDictionary's dictionaryWithDictionary:{Label:labelText, ProgramArguments:arguments, StartInterval:(((values's objectForKey:"duration") as integer) * 60), RunAtLoad:false, ProcessType:"Background"}
    if not (job's writeToFile:filePath atomically:true) then error "Cannot write focus timer job"
    try
        do shell script "/bin/launchctl bootstrap " & quoted form of my domainName() & " " & quoted form of filePath
    on error messageText number errorNumber
        current application's NSFileManager's defaultManager()'s removeItemAtPath:filePath |error|:(missing value)
        error messageText number errorNumber
    end try
end scheduleTimer
on cancelTimer(values)
    set labelText to (values's objectForKey:"jobLabel") as text
    set pattern to current application's NSRegularExpression's regularExpressionWithPattern:"^com\\.macgtd\\.focus\\.[a-f0-9-]+$" options:0 |error|:(missing value)
    set labelString to current application's NSString's stringWithString:labelText
    if (pattern's numberOfMatchesInString:labelString options:0 range:{0, labelString's |length|()}) is not 1 then error "Invalid timer ownership label"
    current application's NSFileManager's defaultManager()'s removeItemAtPath:(my stateDirectory() & "/" & labelText & ".plist") |error|:(missing value)
    if (values's objectForKey:"timerScheduled") as boolean then
        set serviceName to my domainName() & "/" & labelText
        set quotedService to quoted form of serviceName
        do shell script "if /bin/launchctl print " & quotedService & " >/dev/null 2>&1; then /bin/launchctl bootout " & quotedService & "; fi"
    end if
end cancelTimer
on logFocusEvent(eventType, values)
    set entry to current application's NSMutableDictionary's dictionaryWithDictionary:values
    entry's setObject:eventType forKey:"event"
    entry's setObject:(my nowSeconds()) forKey:"timestamp"
    set jsonData to my encodeJSON(entry)
    set lineText to ((current application's NSString's alloc()'s initWithData:jsonData encoding:(current application's NSUTF8StringEncoding)) as text) & linefeed
    set filePath to my ensureDirectory() & "/focus_log.jsonl"
    set manager to current application's NSFileManager's defaultManager()
    if not (manager's fileExistsAtPath:filePath) then
        manager's createFileAtPath:filePath |contents|:(current application's NSData's data()) attributes:{NSFilePosixPermissions:384}
    end if
    set handle to current application's NSFileHandle's fileHandleForWritingAtPath:filePath
    if handle is missing value then error "Cannot open focus log"
    handle's seekToEndOfFile()
    handle's writeData:((current application's NSString's stringWithString:lineText)'s dataUsingEncoding:(current application's NSUTF8StringEncoding))
    handle's closeFile()
end logFocusEvent
on startFocusWithTask(contextName, taskTitle, taskIdentifier, listIdentifier, durationMinutes)
    if durationMinutes < 1 or durationMinutes > 180 or class of durationMinutes is not integer then error "Duration must be 1–180 minutes"
    if contextName does not start with "@" or taskTitle is "" then error "Provide a context and task"
    my takeLock()
    set phase to "read existing state"
    try
        if my readState() is not missing value then error "A focus session already exists; stop it before starting another"
        set phase to "construct session identity"
        set sessionId to ((current application's NSUUID's |UUID|()'s UUIDString())'s lowercaseString()) as text
        set startSeconds to my nowSeconds()
        set phase to "construct session state"
        set values to current application's NSMutableDictionary's dictionaryWithDictionary:{sessionId:(sessionId as text), context:(contextName as text), task:(taskTitle as text), taskId:(taskIdentifier as text), listId:(listIdentifier as text), startTime:startSeconds, endTime:(startSeconds + durationMinutes * 60), duration:(durationMinutes as integer), timerScheduled:(timerEnabled as boolean), jobLabel:("com.macgtd.focus." & sessionId)}
        set phase to "save session state"
        my writeState(values)
        try
            set phase to "schedule timer"
            if timerEnabled then my scheduleTimer(values)
            set phase to "write session log"
            my logFocusEvent("start", values)
        on error messageText number errorNumber
            my cancelTimer(values)
            current application's NSFileManager's defaultManager()'s removeItemAtPath:(my stateDirectory() & "/focus-session.json") |error|:(missing value)
            error messageText number errorNumber
        end try
        my releaseLock()
        return values
    on error messageText number errorNumber
        my releaseLock()
        error "Focus " & phase & ": " & messageText number errorNumber
    end try
end startFocusWithTask
on stopFocus()
    my takeLock()
    try
        set values to my readState()
        if values is missing value then
            my releaseLock()
            return "No active focus session"
        end if
        my cancelTimer(values)
        values's setObject:((my nowSeconds()) - ((values's objectForKey:"startTime") as integer)) forKey:"actualSeconds"
        my logFocusEvent("complete", values)
        if not (current application's NSFileManager's defaultManager()'s removeItemAtPath:(my stateDirectory() & "/focus-session.json") |error|:(missing value)) then error "Cannot clear completed focus session"
        my releaseLock()
        return "Focus session stopped"
    on error messageText number errorNumber
        my releaseLock()
        error messageText number errorNumber
    end try
end stopFocus
on finishTimer(sessionId)
    my takeLock()
    try
        set values to my readState()
        if values is missing value then
            my releaseLock()
            return "Timer no longer owns a session"
        end if
        if ((values's objectForKey:"sessionId") as text) is not sessionId then
            my releaseLock()
            return "Stale timer ignored"
        end if
        if my nowSeconds() < ((values's objectForKey:"endTime") as integer) then
            my releaseLock()
            return "Session is still running"
        end if
        values's setObject:((my nowSeconds()) - ((values's objectForKey:"startTime") as integer)) forKey:"actualSeconds"
        my logFocusEvent("complete", values)
        if not (current application's NSFileManager's defaultManager()'s removeItemAtPath:(my stateDirectory() & "/focus-session.json") |error|:(missing value)) then error "Cannot clear completed focus session"
    on error messageText number errorNumber
        my releaseLock()
        error messageText number errorNumber
    end try
    my releaseLock()
    display notification "Focus session complete" with title "MacGTD Focus"
    -- Cancelling our own launchd job can terminate this invocation; state is committed first.
    my cancelTimer(values)
    return "Focus session complete"
end finishTimer

on getFocusStatus()
    set values to my readState()
    if values is missing value then return "No active focus session"
    set remaining to ((values's objectForKey:"endTime") as integer) - (my nowSeconds())
    if remaining < 0 then set remaining to 0
    return "Focus Mode Active" & return & "Task: " & ((values's objectForKey:"task") as text) & return & "Context: " & ((values's objectForKey:"context") as text) & return & "Seconds remaining: " & remaining
end getFocusStatus
on startFocus(contextName, durationMinutes)
    set candidates to my getTasksForContext(contextName)
    if count of candidates is 0 then error "No incomplete tasks found for context " & contextName
    set selectedTask to item 1 of candidates
    if count of candidates > 1 then
        set names to {}
        tell application "Reminders"
            repeat with r in candidates
                set end of names to name of r
            end repeat
        end tell
        set selection to choose from list names with prompt "Select a focus task" with title "MacGTD Focus"
        if selection is false then error "Focus cancelled" number -128
        repeat with i from 1 to count of names
            if item i of names is item 1 of selection then
                set selectedTask to item i of candidates
                exit repeat
            end if
        end repeat
    end if
    tell application "Reminders"
        set taskTitle to name of selectedTask
        set taskIdentifier to id of selectedTask
        set listIdentifier to id of container of selectedTask
    end tell
    set values to my startFocusWithTask(contextName, taskTitle, taskIdentifier, listIdentifier, durationMinutes)
    return "Focus session started: " & ((values's objectForKey:"sessionId") as text)
end startFocus
on getTasksForContext(contextName)
    tell application "Reminders"
        if exists list contextName then return reminders of list contextName whose completed is false
        set shortName to text 2 thru -1 of contextName
        if exists list shortName then return reminders of list shortName whose completed is false
        set resultTasks to {}
        repeat with aList in lists
            repeat with r in (reminders of aList whose completed is false)
                if body of r is not missing value then
                    if body of r contains ("Context: " & contextName) then set end of resultTasks to r
                end if
            end repeat
        end repeat
        return resultTasks
    end tell
end getTasksForContext
on run argv
    if count of argv is 0 then error "Usage: focus @context [minutes], status, or stop"
    set operation to item 1 of argv
    if operation is "status" then return my getFocusStatus()
    if operation is "stop" then return my stopFocus()
    if operation starts with "@" then
        set durationMinutes to 25
        if count of argv is 2 then set durationMinutes to item 2 of argv as integer
        return my startFocus(operation, durationMinutes)
    end if
    error "Unknown focus command"
end run
