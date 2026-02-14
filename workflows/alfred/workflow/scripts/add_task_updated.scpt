-- AlfredGTD: Add Task Script with Enhanced Error Handling
-- This script adds a new task to your GTD system with proper error handling
-- Version: 2.0

-- Load error handling utilities
property errorCodesPath : (path to scripts folder as text) & "error_codes.scpt"
property errorCodes : missing value

on run argv
	try
		-- Load error codes
		set errorCodes to load script file errorCodesPath
		
		-- Get task text
		set taskText to item 1 of argv
		
		-- Validate input
		if taskText is "" then
			error "No text entered. Task not created." number errorCodes's kGTDInvalidTaskErr
		end if
		
		-- Configuration (this could be moved to a separate config file)
		-- Possible values: "reminders", "todoist", "things", "omnifocus"
		set taskApp to getTaskAppPreference()
		
		-- Route to appropriate handler
		if taskApp is "reminders" then
			addTaskToReminders(taskText)
		else if taskApp is "todoist" then
			addTaskToTodoist(taskText)
		else if taskApp is "things" then
			addTaskToThings(taskText)
		else if taskApp is "omnifocus" then
			addTaskToOmniFocus(taskText)
		else
			-- Default to Reminders if no valid app is selected
			errorCodes's logWarning("Unknown task app '" & taskApp & "', defaulting to Reminders")
			addTaskToReminders(taskText)
		end if
		
		-- Log success
		errorCodes's logInfo("Task created successfully: " & taskText)
		
	on error errMsg number errNum
		-- Handle error with proper logging and user notification
		if errorCodes is not missing value then
			errorCodes's handleError(errMsg, errNum)
		else
			-- Fallback if error codes couldn't be loaded
			display notification "Error: " & errMsg with title "AlfredGTD Error"
			error errMsg number errNum
		end if
	end try
end run

on getTaskAppPreference()
	try
		-- Try to read from preferences
		tell application "System Events"
			set prefsPath to (path to preferences folder as text) & "com.alfredgtd.plist"
			if exists property list file prefsPath then
				tell property list file prefsPath
					return value of property list item "taskApp"
				end tell
			end if
		end tell
	on error
		-- Default if preferences not found
		return "reminders"
	end try
end getTaskAppPreference

on addTaskToReminders(taskText)
	try
		tell application "Reminders"
			-- Check if app is accessible
			try
				get version
			on error
				error "Cannot access Reminders. Please grant automation permission." number errorCodes's kGTDAppPermissionErr
			end try
			
			-- Make sure Reminders is running
			launch
			
			-- Try to find the Inbox list, or use the first list as fallback
			set inboxList to missing value
			try
				set inboxList to list "Inbox"
			on error
				-- Get the first list as a fallback
				set allLists to every list
				if (count of allLists) > 0 then
					set inboxList to first item of allLists
				else
					error "No lists found in Reminders" number errorCodes's kGTDTaskCreationErr
				end if
			end try
			
			-- Create the reminder
			tell inboxList
				set newReminder to make new reminder with properties {name:taskText}
			end tell
			
			-- Notify the user
			display notification "Task added to Reminders: " & taskText with title "AlfredGTD"
			
			return newReminder
		end tell
		
	on error errMsg number errNum
		if errNum is 0 then set errNum to errorCodes's kGTDTaskCreationErr
		error errMsg number errNum
	end try
end addTaskToReminders

on addTaskToTodoist(taskText)
	try
		-- Check if Todoist CLI is installed
		set todoistPath to do shell script "which todoist" without altering line endings
		if todoistPath is "" then
			error "Todoist CLI not found. Please install it first." number errorCodes's kGTDAppNotFoundErr
		end if
		
		-- Add task via CLI
		do shell script "todoist add " & quoted form of taskText
		display notification "Task added to Todoist: " & taskText with title "AlfredGTD"
		
	on error errMsg number errNum
		if errNum is 0 then set errNum to errorCodes's kGTDTaskCreationErr
		error errMsg number errNum
	end try
end addTaskToTodoist

on addTaskToThings(taskText)
	try
		-- Check if Things is installed
		tell application "System Events"
			if not (exists application process "Things3") then
				error "Things is not installed" number errorCodes's kGTDAppNotFoundErr
			end if
		end tell
		
		-- Implementation using Things URL scheme
		set thingsURL to "things:///add?title=" & encodeText(taskText) & "&list=Inbox"
		do shell script "open " & quoted form of thingsURL
		
		-- Give Things a moment to process
		delay 0.5
		
		display notification "Task added to Things: " & taskText with title "AlfredGTD"
		
	on error errMsg number errNum
		if errNum is 0 then set errNum to errorCodes's kGTDTaskCreationErr
		error errMsg number errNum
	end try
end addTaskToThings

on addTaskToOmniFocus(taskText)
	try
		-- Check if OmniFocus is accessible
		tell application "OmniFocus"
			try
				get version
			on error
				error "Cannot access OmniFocus. Please grant automation permission." number errorCodes's kGTDAppPermissionErr
			end try
			
			-- Create task
			tell front document
				set theInbox to inbox
				set theTask to make new inbox task with properties {name:taskText}
			end tell
		end tell
		
		display notification "Task added to OmniFocus: " & taskText with title "AlfredGTD"
		
		return theTask
		
	on error errMsg number errNum
		if errNum is 0 then set errNum to errorCodes's kGTDTaskCreationErr
		error errMsg number errNum
	end try
end addTaskToOmniFocus

-- Helper function to URL encode text
on encodeText(theText)
	set theTextEnc to ""
	repeat with eachChar in characters of theText
		set useChar to eachChar
		set eachCharNum to ASCII number of eachChar
		if eachCharNum = 32 then -- space
			set useChar to "+"
		else if (eachCharNum ≥ 48 and eachCharNum ≤ 57) or ¬
			(eachCharNum ≥ 65 and eachCharNum ≤ 90) or ¬
			(eachCharNum ≥ 97 and eachCharNum ≤ 122) then -- 0-9A-Za-z
			set useChar to eachChar
		else
			set useChar to "%" & my toHex(eachCharNum)
		end if
		set theTextEnc to theTextEnc & useChar
	end repeat
	return theTextEnc
end encodeText

-- Helper function to convert to hex
on toHex(theNum)
	set hexChars to "0123456789ABCDEF"
	set theHex to ""
	repeat with i from 0 to 1
		set theInt to theNum div (16 ^ (1 - i)) mod 16 + 1
		set theHex to theHex & character theInt of hexChars
	end repeat
	return theHex
end toHex