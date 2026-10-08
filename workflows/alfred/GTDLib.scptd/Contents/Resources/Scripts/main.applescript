-- GTDLib native task API. Every public handler has a concrete implementation.
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
property name : "GTDLib"
property version : "2.1.0"
property id : "com.alfredgtd.GTDLib"
property taskService : "reminders"
property runtimeScriptsPath : ""

on _initialize()
    if taskService is not "reminders" then error "GTDLib currently supports the native Reminders service only"
    return true
end _initialize
on _sanitizeString(inputString)
    if inputString is missing value then error "Task title cannot be empty"
    set valueString to current application's NSString's stringWithString:inputString
    set valueString to valueString's stringByTrimmingCharactersInSet:(current application's NSCharacterSet's whitespaceAndNewlineCharacterSet())
    if valueString's |length|() is 0 then error "Task title cannot be empty"
    -- Punctuation is data. Preserve quotes and Unicode instead of 'sanitizing' titles.
    return valueString as text
end _sanitizeString
on mappedPriority(priorityLevel)
    if priorityLevel is missing value or priorityLevel is 0 then return 0
    if priorityLevel is 1 then return 1
    if priorityLevel is 2 then return 5
    if priorityLevel is 3 then return 9
    error "Task priority must be 0, 1, 2, or 3"
end mappedPriority
on createTask:taskTitle withContext:contextName priority:priorityLevel dueDate:taskDueDate
    my _initialize()
    set taskTitle to my _sanitizeString(taskTitle)
    set mappedLevel to my mappedPriority(priorityLevel)
    if taskDueDate is not missing value and class of taskDueDate is not date then error "Due date must be an AppleScript date"
    set targetName to "Inbox"
    if contextName is not missing value and contextName is not "" then set targetName to contextName
    tell application "Reminders"
        if not (exists list targetName) then make new list with properties {name:targetName}
        set r to make new reminder at end of reminders of list targetName with properties {name:taskTitle, priority:mappedLevel}
        try
            if taskDueDate is not missing value then set due date of r to taskDueDate
            return {id:id of r, title:name of r, context:contextName, priority:priorityLevel, dueDate:taskDueDate, createdDate:creation date of r}
        on error messageText number errorNumber
            delete r
            error messageText number errorNumber
        end try
    end tell
end createTask:withContext:priority:dueDate:
on getDashboardData()
    my _initialize()
    set startOfDay to current date
    set time of startOfDay to 0
    set endOfDay to startOfDay + days
    set nowDate to current date
    set inboxCount to 0
    set todayCount to 0
    set overdueCount to 0
    set nextActionsCount to 0
    set projectsCount to 0
    set contexts to {}
    tell application "Reminders"
        repeat with aList in lists
            set listName to name of aList
            set pendingTasks to reminders of aList whose completed is false
            if listName is "Inbox" then set inboxCount to count of pendingTasks
            if listName starts with "@" then
                set end of contexts to listName
            else if listName is not "Inbox" and listName is not "Reference" then
                set projectsCount to projectsCount + 1
            end if
            set nextActionsCount to nextActionsCount + (count of pendingTasks)
            repeat with r in pendingTasks
                set taskDueDate to due date of r
                if taskDueDate is not missing value then
                    if taskDueDate ≥ startOfDay and taskDueDate < endOfDay then set todayCount to todayCount + 1
                    if taskDueDate < nowDate then set overdueCount to overdueCount + 1
                end if
            end repeat
        end repeat
    end tell
    return {inboxCount:inboxCount, todayCount:todayCount, overdueCount:overdueCount, nextActionsCount:nextActionsCount, projectsCount:projectsCount, contexts:contexts}
end getDashboardData
on startFocusSession:contextName duration:durationMinutes
    if durationMinutes < 1 or durationMinutes > 180 then error "Duration must be 1–180 minutes"
    set scriptsPath to runtimeScriptsPath
    if scriptsPath is "" then
        set configuredPath to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_SCRIPT_DIR"
        if configuredPath is not missing value then set scriptsPath to configuredPath as text
    end if
    if scriptsPath is "" then error "Set MACGTD_SCRIPT_DIR or runtimeScriptsPath to the installed MacGTD workflow's scripts directory"
    set controller to my loadComponent(scriptsPath & "/focus_mode.scpt")
    set scriptsOverride of controller to scriptsPath
    controller's startFocus(contextName, durationMinutes)
    set values to controller's readState()
    return my sessionInfo(values, contextName, durationMinutes)
end startFocusSession:duration:
on sessionInfo(values, contextName, durationMinutes)
    set startDate to (current application's NSDate's dateWithTimeIntervalSince1970:((values's objectForKey:"startTime") as real)) as date
    set endDate to (current application's NSDate's dateWithTimeIntervalSince1970:((values's objectForKey:"endTime") as real)) as date
    return {sessionId:((values's objectForKey:"sessionId") as text), context:contextName, startTime:startDate, endTime:endDate, duration:durationMinutes}
end sessionInfo
on processInbox()
    tell application "Reminders"
        if not (exists list "Inbox") then make new list with properties {name:"Inbox"}
        set pendingCount to count of (reminders in list "Inbox" whose completed is false)
        activate
        show list "Inbox"
        return pendingCount
    end tell
end processInbox
on addNote:noteText toTask:taskIdentifier toProject:projectName
    set noteText to my _sanitizeString(noteText)
    if taskIdentifier is not missing value and projectName is not missing value then error "Specify a task or a project, not both"
    tell application "Reminders"
        if taskIdentifier is not missing value then
            set matches to {}
            repeat with aList in lists
                set matches to matches & (reminders of aList whose id is taskIdentifier)
            end repeat
            if count of matches is not 1 then error "Task ID must identify exactly one reminder"
            set r to item 1 of matches
            set previousBody to body of r
            if previousBody is missing value then set previousBody to ""
            if previousBody is not "" then set previousBody to previousBody & return
            set body of r to previousBody & noteText
        else
            set targetName to "Reference"
            if projectName is not missing value then set targetName to my _sanitizeString(projectName)
            if not (exists list targetName) then make new list with properties {name:targetName}
            make new reminder at end of reminders of list targetName with properties {name:noteText, body:noteText}
        end if
    end tell
    return true
end addNote:toTask:toProject:

-- Terminology events delegate to the same decision handlers as direct library calls.
on «event GTDDdash»
    return my getDashboardData()
end «event GTDDdash»
on «event GTDPinbx»
    return my processInbox()
end «event GTDPinbx»
on «event GTDCtask» taskTitle given «class ctxt»:contextName : missing value, «class prio»:priorityLevel : 0, «class dued»:taskDueDate : missing value
    return my createTask:taskTitle withContext:contextName priority:priorityLevel dueDate:taskDueDate
end «event GTDCtask»
on «event GTDFfocs» contextName given «class dura»:durationMinutes
    return my startFocusSession:contextName duration:durationMinutes
end «event GTDFfocs»
on «event GTDAnote» noteText given «class task»:taskIdentifier : missing value, «class proj»:projectName : missing value
    return my addNote:noteText toTask:taskIdentifier toProject:projectName
end «event GTDAnote»

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
