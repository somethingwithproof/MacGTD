-- AlfredGTD: Focus Mode
-- Context-based task filtering with Pomodoro timer and distraction blocking

use AppleScript version "2.4"
use scripting additions
use framework "Foundation"

-- Configuration
property kDefaultDuration : 25 -- minutes
property kShortBreak : 5 -- minutes
property kLongBreak : 15 -- minutes
property kPomodorosBeforeLongBreak : 4
property kFocusLogFile : "~/.gtd/focus_log.json"
property kSoundEnabled : true

-- Global state
property focusActive : false
property startTime : missing value
property endTime : missing value
property currentContext : ""
property currentTask : missing value
property pomodoroCount : 0

on run argv
    try
        -- Parse arguments: context and optional duration
        if (count of argv) = 0 then
            error "Usage: focus @context [duration]" & return & ¬
                "Example: focus @computer 25" & return & ¬
                "Commands: focus stop, focus status"
        end if
        
        set command to item 1 of argv
        
        -- Handle special commands
        if command is "stop" then
            return my stopFocus()
        else if command is "status" then
            return my getFocusStatus()
        else if command starts with "@" then
            -- Start focus session
            set focusContext to command
            set duration to kDefaultDuration
            
            if (count of argv) ≥ 2 then
                try
                    set duration to item 2 of argv as integer
                on error
                    set duration to kDefaultDuration
                end try
            end if
            
            return my startFocus(focusContext, duration)
        else
            error "Context must start with @ (e.g., @computer)"
        end if
        
    on error errMsg
        display notification errMsg with title "Focus Mode Error"
        return errMsg
    end try
end run

-- Start a focus session
on startFocus(contextName, durationMinutes)
    if focusActive then
        return "Focus session already active. Use 'focus stop' to end it."
    end if
    
    -- Get tasks for context
    set contextTasks to my getTasksForContext(contextName)
    
    if (count of contextTasks) = 0 then
        return "No tasks found for context " & contextName
    end if
    
    -- Set up focus session
    set currentContext to contextName
    set startTime to current date
    set endTime to startTime + (durationMinutes * minutes)
    set focusActive to true
    
    -- Show task selection
    set selectedTask to my selectFocusTask(contextTasks)
    if selectedTask is missing value then
        set focusActive to false
        return "Focus cancelled"
    end if
    
    set currentTask to selectedTask
    
    -- Start focus
    my enableFocusEnvironment()
    my startTimer(durationMinutes)
    
    -- Log session start
    my logFocusEvent("start", {context:currentContext, task:name of currentTask, duration:durationMinutes})
    
    -- Show notification
    display notification "Focus on: " & (name of currentTask) & return & ¬
        "Duration: " & durationMinutes & " minutes" ¬
        with title "Focus Mode Started" subtitle currentContext
    
    return "Focus session started for " & durationMinutes & " minutes"
end startFocus

-- Get tasks for a specific context
on getTasksForContext(contextName)
    set tasks to {}
    
    tell application "Reminders"
        -- First try exact list match
        try
            set contextList to list contextName
            set tasks to reminders of contextList whose completed is false
        on error
            -- If no exact match, search all lists for context tag
            repeat with reminderList in lists
                set listTasks to reminders of reminderList whose completed is false
                repeat with task in listTasks
                    if (body of task as text) contains contextName then
                        set end of tasks to task
                    end if
                end repeat
            end repeat
        end try
    end tell
    
    return tasks
end getTasksForContext

-- Select task to focus on
on selectFocusTask(taskList)
    if (count of taskList) = 1 then
        return item 1 of taskList
    end if
    
    -- Build task menu
    set taskNames to {}
    tell application "Reminders"
        repeat with task in taskList
            set taskName to name of task
            try
                set taskDue to due date of task
                if taskDue is not missing value then
                    set dueText to " (due " & (short date string of taskDue) & ")"
                    set taskName to taskName & dueText
                end if
            end try
            set end of taskNames to taskName
        end repeat
    end tell
    
    -- Add option to see all
    set end of taskNames to "📋 Show all tasks in this context"
    
    -- Show selection dialog
    set selectedItem to choose from list taskNames with prompt ¬
        "Select task to focus on:" with title "Focus Mode - " & currentContext
    
    if selectedItem is false then
        return missing value
    end if
    
    set selectedIndex to 1
    repeat with i from 1 to count of taskNames
        if item i of taskNames is (selectedItem as text) then
            set selectedIndex to i
            exit repeat
        end if
    end repeat
    
    if selectedIndex > (count of taskList) then
        -- Show all tasks was selected
        return missing value
    else
        return item selectedIndex of taskList
    end if
end selectFocusTask

-- Enable focus environment
on enableFocusEnvironment()
    -- Hide distracting apps
    my hideDistractingApps()
    
    -- Enable Do Not Disturb
    my enableDoNotDisturb()
    
    -- Optional: Play focus sound
    if kSoundEnabled then
        my playSound("Hero")
    end if
end enableFocusEnvironment

-- Start countdown timer
on startTimer(minutes)
    -- Create a simple timer window or notification
    -- In a full implementation, this could be a floating window
    
    -- Schedule end notification
    set timerCommand to "sleep " & (minutes * 60) & " && osascript -e 'tell application \"System Events\" to display dialog \"Focus session complete!\" buttons {\"OK\"} default button \"OK\" with title \"Focus Mode\"'"
    
    do shell script timerCommand & " > /dev/null 2>&1 &"
end startTimer

-- Stop focus session
on stopFocus()
    if not focusActive then
        return "No active focus session"
    end if
    
    -- Calculate actual duration
    set actualDuration to (current date) - startTime
    set actualMinutes to actualDuration div minutes
    
    -- Restore environment
    my disableFocusEnvironment()
    
    -- Log completion
    my logFocusEvent("complete", {context:currentContext, task:name of currentTask, ¬
        plannedDuration:((endTime - startTime) div minutes), actualDuration:actualMinutes})
    
    -- Ask for task completion
    set taskCompleted to my askTaskCompletion()
    
    -- Show summary
    set summary to "Focus session completed!" & return & return
    set summary to summary & "Duration: " & actualMinutes & " minutes" & return
    set summary to summary & "Task: " & (name of currentTask) & return
    set summary to summary & "Context: " & currentContext
    
    if taskCompleted then
        set summary to summary & return & "✅ Task marked as complete"
    end if
    
    -- Increment pomodoro count
    set pomodoroCount to pomodoroCount + 1
    
    -- Suggest break
    if pomodoroCount mod kPomodorosBeforeLongBreak = 0 then
        set summary to summary & return & return & "Time for a " & kLongBreak & "-minute break!"
    else
        set summary to summary & return & return & "Time for a " & kShortBreak & "-minute break!"
    end if
    
    display dialog summary buttons {"OK", "Start Break Timer"} default button "OK" with title "Focus Mode"
    
    if button returned of result is "Start Break Timer" then
        my startBreak()
    end if
    
    -- Reset state
    set focusActive to false
    set currentTask to missing value
    set currentContext to ""
    
    return summary
end stopFocus

-- Get current focus status
on getFocusStatus()
    if not focusActive then
        return "No active focus session" & return & ¬
            "Pomodoros today: " & pomodoroCount
    end if
    
    set timeRemaining to endTime - (current date)
    set minutesRemaining to timeRemaining div minutes
    set secondsRemaining to timeRemaining mod minutes div 1
    
    set status to "Focus Mode Active" & return & return
    set status to status & "Context: " & currentContext & return
    set status to status & "Task: " & (name of currentTask) & return
    set status to status & "Time remaining: " & minutesRemaining & ":" & ¬
        (text -2 through -1 of ("0" & secondsRemaining)) & return
    set status to status & "Pomodoros today: " & pomodoroCount
    
    return status
end getFocusStatus

-- Hide distracting applications
on hideDistractingApps()
    set distractingApps to {"Safari", "Mail", "Messages", "Slack", "Discord", "Twitter", "Music"}
    
    tell application "System Events"
        repeat with appName in distractingApps
            try
                if exists process appName then
                    set visible of process appName to false
                end if
            end try
        end repeat
    end tell
end hideDistractingApps

-- Enable Do Not Disturb
on enableDoNotDisturb()
    try
        -- Toggle DND using keyboard shortcut (Option+Click notification center)
        -- Note: This is a workaround as there's no direct API
        do shell script "defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true"
        do shell script "killall NotificationCenter"
    end try
end enableDoNotDisturb

-- Disable focus environment
on disableFocusEnvironment()
    -- Disable Do Not Disturb
    try
        do shell script "defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean false"
        do shell script "killall NotificationCenter"
    end try
    
    -- Play completion sound
    if kSoundEnabled then
        my playSound("Glass")
    end if
end disableFocusEnvironment

-- Ask if task was completed
on askTaskCompletion()
    tell application "Reminders"
        set question to "Did you complete this task?" & return & return & ¬
            (name of currentTask)
        
        display dialog question buttons {"Not yet", "Yes, mark complete"} ¬
            default button "Not yet" with title "Task Completion"
        
        if button returned of result is "Yes, mark complete" then
            set completed of currentTask to true
            return true
        end if
    end tell
    
    return false
end askTaskCompletion

-- Start break timer
on startBreak()
    set breakDuration to kShortBreak
    if pomodoroCount mod kPomodorosBeforeLongBreak = 0 then
        set breakDuration to kLongBreak
    end if
    
    display notification "Break for " & breakDuration & " minutes" ¬
        with title "Break Time" subtitle "Step away from the computer!"
    
    -- Simple break timer
    delay (breakDuration * 60)
    
    display dialog "Break time is over!" & return & return & ¬
        "Ready for another focus session?" buttons {"OK", "Start Focus"} ¬
        default button "OK" with title "Break Complete"
    
    if button returned of result is "Start Focus" then
        -- Could restart focus here
    end if
end startBreak

-- Log focus events for analytics
on logFocusEvent(eventType, eventData)
    -- Create log directory if needed
    do shell script "mkdir -p ~/.gtd"
    
    -- Create log entry
    set logEntry to "{"
    set logEntry to logEntry & "\"timestamp\":\"" & (current date) & "\","
    set logEntry to logEntry & "\"event\":\"" & eventType & "\","
    set logEntry to logEntry & "\"data\":" & my recordToJSON(eventData)
    set logEntry to logEntry & "}"
    
    -- Append to log file
    do shell script "echo '" & logEntry & "' >> " & kFocusLogFile
end logFocusEvent

-- Convert record to JSON (simplified)
on recordToJSON(theRecord)
    set json to "{"
    set isFirst to true
    
    -- Handle each property explicitly
    try
        if context of theRecord is not missing value then
            set json to json & "\"context\":\"" & (context of theRecord) & "\""
            set isFirst to false
        end if
    end try
    
    try
        if task of theRecord is not missing value then
            if not isFirst then set json to json & ","
            set json to json & "\"task\":\"" & (task of theRecord) & "\""
            set isFirst to false
        end if
    end try
    
    try
        if duration of theRecord is not missing value then
            if not isFirst then set json to json & ","
            set json to json & "\"duration\":\"" & (duration of theRecord) & "\""
            set isFirst to false
        end if
    end try
    
    try
        if plannedDuration of theRecord is not missing value then
            if not isFirst then set json to json & ","
            set json to json & "\"plannedDuration\":\"" & (plannedDuration of theRecord) & "\""
            set isFirst to false
        end if
    end try
    
    try
        if actualDuration of theRecord is not missing value then
            if not isFirst then set json to json & ","
            set json to json & "\"actualDuration\":\"" & (actualDuration of theRecord) & "\""
        end if
    end try
    
    set json to json & "}"
    return json
end recordToJSON

-- Play system sound
on playSound(soundName)
    try
        do shell script "afplay /System/Library/Sounds/" & soundName & ".aiff &"
    end try
end playSound