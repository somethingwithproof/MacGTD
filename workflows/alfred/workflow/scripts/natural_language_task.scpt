-- AlfredGTD: Natural Language Task Parser
-- Intelligently parses task input to extract dates, contexts, projects, and priorities

use AppleScript version "2.4"
use scripting additions
use framework "Foundation"

-- Patterns for parsing
property contextPattern : "@[a-zA-Z0-9-_]+"
property projectPattern : "\\+[a-zA-Z0-9-_]+"
property priorityPattern : "![1-3]"
property dateKeywords : {"today", "tomorrow", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday", "next", "this"}
property timePattern : "[0-9]{1,2}(:[0-9]{2})?(am|pm|AM|PM)?"

on run argv
    if (count of argv) = 0 then
        error "No task text provided"
    end if
    
    set taskInput to item 1 of argv as text
    set parsedTask to my parseTaskInput(taskInput)
    
    -- Create the task with parsed components
    my createSmartTask(parsedTask)
end run

-- Parse natural language input
on parseTaskInput(inputText)
    set taskData to {originalText:inputText, taskText:"", context:"", project:"", dueDate:missing value, ¬
        priority:0, notes:""}
    
    -- Extract context (@context)
    set contextMatch to my findPattern(inputText, contextPattern)
    if contextMatch is not "" then
        set context of taskData to contextMatch
        set inputText to my removePattern(inputText, contextMatch)
    end if
    
    -- Extract project (+project)
    set projectMatch to my findPattern(inputText, projectPattern)
    if projectMatch is not "" then
        set project of taskData to text 2 through -1 of projectMatch -- Remove + prefix
        set inputText to my removePattern(inputText, projectMatch)
    end if
    
    -- Extract priority (!1, !2, !3)
    set priorityMatch to my findPattern(inputText, priorityPattern)
    if priorityMatch is not "" then
        set priority of taskData to text 2 of priorityMatch as integer
        set inputText to my removePattern(inputText, priorityMatch)
    end if
    
    -- Extract date/time
    set dateInfo to my extractDateTime(inputText)
    if parsedDate of dateInfo is not missing value then
        set dueDate of taskData to parsedDate of dateInfo
        set inputText to cleanedText of dateInfo
    end if
    
    -- Clean up remaining text
    set taskText of taskData to my trimText(inputText)
    
    return taskData
end parseTaskInput

-- Extract date and time from text
on extractDateTime(inputText)
    set parsedDate to missing value
    set cleanedText to inputText
    
    -- Check for relative dates
    if inputText contains "today" then
        set parsedDate to current date
        set time of parsedDate to 0 -- Start of day
        set cleanedText to my removePattern(inputText, "today")
        
    else if inputText contains "tomorrow" then
        set parsedDate to (current date) + (1 * days)
        set time of parsedDate to 0
        set cleanedText to my removePattern(inputText, "tomorrow")
        
    else if inputText contains "next week" then
        set parsedDate to (current date) + (7 * days)
        set time of parsedDate to 0
        set cleanedText to my removePattern(inputText, "next week")
    end if
    
    -- Extract time if present
    set timeMatch to my findPattern(cleanedText, timePattern)
    if timeMatch is not "" and parsedDate is not missing value then
        set parsedTime to my parseTime(timeMatch)
        if parsedTime is not missing value then
            set time of parsedDate to parsedTime
            set cleanedText to my removePattern(cleanedText, timeMatch)
        end if
    end if
    
    -- Look for "next [weekday]" pattern
    repeat with dayName in {"monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"}
        if cleanedText contains ("next " & dayName) then
            set parsedDate to my getNextWeekday(dayName)
            set cleanedText to my removePattern(cleanedText, "next " & dayName)
            exit repeat
        end if
    end repeat
    
    -- Look for "at [time]" pattern
    if cleanedText contains " at " then
        set atPosition to offset of " at " in cleanedText
        set timeText to text (atPosition + 4) through -1 of cleanedText
        set possibleTime to my findPattern(timeText, timePattern)
        if possibleTime is not "" then
            if parsedDate is missing value then
                set parsedDate to current date
            end if
            set time of parsedDate to my parseTime(possibleTime)
            set cleanedText to text 1 through (atPosition - 1) of cleanedText
        end if
    end if
    
    return {parsedDate:parsedDate, cleanedText:cleanedText}
end extractDateTime

-- Parse time string (e.g., "2pm", "14:30", "2:30PM")
on parseTime(timeStr)
    try
        set colonOffset to offset of ":" in timeStr
        if colonOffset > 0 then
            set hourStr to text 1 through (colonOffset - 1) of timeStr
            set minuteStr to text (colonOffset + 1) through -1 of timeStr
            -- Remove AM/PM from minute string
            if minuteStr ends with "am" or minuteStr ends with "AM" then
                set minuteStr to text 1 through -3 of minuteStr
                set isPM to false
            else if minuteStr ends with "pm" or minuteStr ends with "PM" then
                set minuteStr to text 1 through -3 of minuteStr
                set isPM to true
            else
                set isPM to (hourStr as integer) < 8 -- Assume PM for times < 8
            end if
            set theHour to hourStr as integer
            set theMinute to minuteStr as integer
        else
            -- No colon, just hour
            set hourStr to timeStr
            if hourStr ends with "am" or hourStr ends with "AM" then
                set hourStr to text 1 through -3 of hourStr
                set isPM to false
            else if hourStr ends with "pm" or hourStr ends with "PM" then
                set hourStr to text 1 through -3 of hourStr
                set isPM to true
            else
                set isPM to (hourStr as integer) < 8
            end if
            set theHour to hourStr as integer
            set theMinute to 0
        end if
        
        -- Convert to 24-hour if needed
        if isPM and theHour < 12 then
            set theHour to theHour + 12
        else if not isPM and theHour = 12 then
            set theHour to 0
        end if
        
        return (theHour * hours) + (theMinute * minutes)
    on error
        return missing value
    end try
end parseTime

-- Get next occurrence of a weekday
on getNextWeekday(dayName)
    set targetDay to 1 -- Default to Monday
    
    if dayName is "sunday" then set targetDay to 1
    if dayName is "monday" then set targetDay to 2
    if dayName is "tuesday" then set targetDay to 3
    if dayName is "wednesday" then set targetDay to 4
    if dayName is "thursday" then set targetDay to 5
    if dayName is "friday" then set targetDay to 6
    if dayName is "saturday" then set targetDay to 7
    
    set today to current date
    set todayWeekday to weekday of today as integer
    set daysUntilTarget to targetDay - todayWeekday
    
    if daysUntilTarget ≤ 0 then
        set daysUntilTarget to daysUntilTarget + 7
    end if
    
    set targetDate to today + (daysUntilTarget * days)
    set time of targetDate to 0
    
    return targetDate
end getNextWeekday

-- Create task with parsed components
on createSmartTask(taskData)
    tell application "Reminders"
        -- Find or create appropriate list
        set targetList to my getTargetList(taskData)
        
        -- Create the reminder
        tell targetList
            set newReminder to make new reminder with properties {name:(taskText of taskData)}
            
            -- Set due date if parsed
            if dueDate of taskData is not missing value then
                set due date of newReminder to (dueDate of taskData)
            end if
            
            -- Set priority
            if priority of taskData > 0 then
                set priority of newReminder to (priority of taskData)
            end if
            
            -- Add notes if context/project were specified
            set noteText to ""
            if context of taskData is not "" then
                set noteText to noteText & "Context: " & (context of taskData) & return
            end if
            if project of taskData is not "" then
                set noteText to noteText & "Project: " & (project of taskData) & return
            end if
            if noteText is not "" then
                set body of newReminder to noteText
            end if
        end tell
        
        -- Show confirmation
        set confirmText to "Task created: " & (taskText of taskData)
        if dueDate of taskData is not missing value then
            set confirmText to confirmText & " (due " & (dueDate of taskData as string) & ")"
        end if
        display notification confirmText with title "Smart Task Added"
    end tell
end createSmartTask

-- Determine target list based on context/project
on getTargetList(taskData)
    tell application "Reminders"
        -- If context specified, try to find matching list
        if context of taskData is not "" then
            try
                return list (context of taskData)
            end try
        end if
        
        -- If project specified, try to find matching list
        if project of taskData is not "" then
            try
                return list ("Project: " & (project of taskData))
            end try
        end if
        
        -- Default to Inbox
        try
            return list "Inbox"
        on error
            -- If no Inbox, use default list
            return default list
        end try
    end tell
end getTargetList

-- Utility: Find pattern in text
on findPattern(theText, thePattern)
    try
        set theString to current application's NSString's stringWithString:theText
        set theRegEx to current application's NSRegularExpression's regularExpressionWithPattern:thePattern options:0 |error|:(missing value)
        set theResult to theRegEx's firstMatchInString:theString options:0 range:{0, theString's |length|()}
        if theResult is not missing value then
            return (theString's substringWithRange:(theResult's range())) as text
        end if
    end try
    return ""
end findPattern

-- Utility: Remove pattern from text
on removePattern(theText, patternText)
    set AppleScript's text item delimiters to patternText
    set textParts to text items of theText
    set AppleScript's text item delimiters to " "
    set cleanedText to textParts as text
    set AppleScript's text item delimiters to ""
    return cleanedText
end removePattern

-- Utility: Trim whitespace
on trimText(theText)
    set theString to current application's NSString's stringWithString:theText
    return (theString's stringByTrimmingCharactersInSet:(current application's NSCharacterSet's whitespaceAndNewlineCharacterSet())) as text
end trimText