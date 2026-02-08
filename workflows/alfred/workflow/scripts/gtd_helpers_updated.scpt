-- AlfredGTD: Helper Functions with Error Handling
-- Common functions used throughout the workflow
-- Version: 2.0

-- Load error handling utilities
property errorCodesPath : (path to scripts folder as text) & "error_codes.scpt"
property errorCodes : missing value

-- Initialize error codes
on initializeErrorCodes()
	try
		set errorCodes to load script file errorCodesPath
	on error
		-- If we can't load error codes, create a minimal version
		script minimalErrorCodes
			property kGTDInvalidDateErr : -2031
			property kGTDInvalidContextErr : -2021
			property kGTDConfigNotFoundErr : -2051
			
			on logWarning(msg)
				do shell script "logger -s -t AlfredGTD -p user.warning " & quoted form of msg
			end logWarning
			
			on logInfo(msg)
				do shell script "logger -s -t AlfredGTD -p user.info " & quoted form of msg
			end logInfo
		end script
		set errorCodes to minimalErrorCodes
	end try
end initializeErrorCodes

-- Initialize on load
initializeErrorCodes()

-- Parse a date from natural language with error handling
on parseDate(dateString)
	try
		set theDate to current date
		set dateString to dateString as string
		
		-- Log the parsing attempt
		errorCodes's logInfo("Parsing date: " & dateString)
		
		-- Simple date parsing for common formats
		if dateString contains "tomorrow" then
			set theDate to theDate + (1 * days)
		else if dateString contains "next week" then
			set theDate to theDate + (7 * days)
		else if dateString contains "next month" then
			set theDate to theDate + (30 * days)
		else if dateString contains "today" then
			-- Keep today's date
		else if dateString contains "/" then
			-- Try to parse MM/DD/YYYY format
			try
				set theDate to date dateString
			on error
				error "Invalid date format. Use formats like 'tomorrow', 'next week', or MM/DD/YYYY" number errorCodes's kGTDInvalidDateErr
			end try
		else
			-- Unknown format
			errorCodes's logWarning("Unknown date format: " & dateString)
		end if
		
		return theDate
		
	on error errMsg number errNum
		if errNum is 0 then set errNum to errorCodes's kGTDInvalidDateErr
		error errMsg number errNum
	end try
end parseDate

-- Extract any dates or contexts from task text with validation
on extractMetadata(taskText)
	try
		set metadata to {taskText:taskText, |date|:missing value, context:missing value, project:missing value}
		
		-- Validate input
		if taskText is "" or taskText is missing value then
			error "Task text cannot be empty" number errorCodes's kGTDInvalidTaskErr
		end if
		
		-- Look for date patterns like @tomorrow, @nextweek
		if taskText contains "@" then
			set atParts to my splitText(taskText, "@")
			if (count of atParts) > 1 then
				set dateOrContext to item 2 of atParts
				if dateOrContext contains " " then
					set dateOrContext to first word of dateOrContext
				end if
				
				-- Check if it's a date term
				if dateOrContext is in {"today", "tomorrow", "nextweek", "nextmonth"} then
					try
						set metadata's |date| to my parseDate(dateOrContext)
						set metadata's taskText to my replaceText(taskText, "@" & dateOrContext, "")
					on error errMsg number errNum
						errorCodes's logWarning("Failed to parse date '" & dateOrContext & "': " & errMsg)
					end try
				else
					-- Assume it's a context - validate it
					if validateContextName(dateOrContext) then
						set metadata's context to dateOrContext
						set metadata's taskText to my replaceText(taskText, "@" & dateOrContext, "")
					else
						errorCodes's logWarning("Invalid context name: " & dateOrContext)
					end if
				end if
			end if
		end if
		
		-- Look for #project tag
		if taskText contains "#" then
			set hashParts to my splitText(taskText, "#")
			if (count of hashParts) > 1 then
				set projectName to item 2 of hashParts
				if projectName contains " " then
					set projectName to first word of projectName
				end if
				
				-- Validate project name
				if validateProjectName(projectName) then
					set metadata's project to projectName
					set metadata's taskText to my replaceText(taskText, "#" & projectName, "")
				else
					errorCodes's logWarning("Invalid project name: " & projectName)
				end if
			end if
		end if
		
		-- Clean up extra whitespace
		set metadata's taskText to my trimText(metadata's taskText)
		
		return metadata
		
	on error errMsg number errNum
		if errNum is 0 then set errNum to -2099 -- Unknown error
		error errMsg number errNum
	end try
end extractMetadata

-- Validate context name
on validateContextName(contextName)
	try
		-- Context should not be empty
		if contextName is "" then return false
		
		-- Context should not contain special characters
		set invalidChars to {"$", "`", "\\", "\"", "'", ";", "&", "|", ">", "<"}
		repeat with char in invalidChars
			if contextName contains char then
				return false
			end if
		end repeat
		
		-- Context should not be too long
		if length of contextName > 50 then
			return false
		end if
		
		return true
		
	on error
		return false
	end try
end validateContextName

-- Validate project name
on validateProjectName(projectName)
	try
		-- Similar validation as context
		return validateContextName(projectName)
	on error
		return false
	end try
end validateProjectName

-- Trim whitespace from text
on trimText(theText)
	try
		if theText is "" or theText is missing value then
			return ""
		end if
		
		set theText to do shell script "echo " & quoted form of theText & " | sed 's/^[ \\t]*//;s/[ \\t]*$//'"
		return theText
		
	on error errMsg
		errorCodes's logWarning("Failed to trim text: " & errMsg)
		return theText
	end try
end trimText

-- Split text by delimiter
on splitText(theText, theDelimiter)
	try
		set oldDelimiters to AppleScript's text item delimiters
		set AppleScript's text item delimiters to theDelimiter
		set theTextItems to every text item of theText
		set AppleScript's text item delimiters to oldDelimiters
		return theTextItems
		
	on error errMsg
		errorCodes's logWarning("Failed to split text: " & errMsg)
		return {theText}
	end try
end splitText

-- Replace text in a string
on replaceText(theText, searchText, replacementText)
	try
		set oldDelimiters to AppleScript's text item delimiters
		set AppleScript's text item delimiters to searchText
		set theTextItems to every text item of theText
		set AppleScript's text item delimiters to replacementText
		set theText to theTextItems as string
		set AppleScript's text item delimiters to oldDelimiters
		return theText
		
	on error errMsg
		errorCodes's logWarning("Failed to replace text: " & errMsg)
		return theText
	end try
end replaceText

-- Load configuration with error handling
on loadConfig()
	try
		-- Try to load from preferences
		tell application "System Events"
			set prefsPath to (path to preferences folder as text) & "com.alfredgtd.plist"
			if exists property list file prefsPath then
				tell property list file prefsPath
					set taskApp to value of property list item "taskApp"
					set noteApp to value of property list item "noteApp"
					set projectApp to value of property list item "projectApp"
					
					-- Validate app names
					set validTaskApps to {"reminders", "things", "omnifocus", "todoist"}
					set validNoteApps to {"notes", "bear", "obsidian", "notion"}
					set validProjectApps to {"reminders", "things", "omnifocus"}
					
					if taskApp is not in validTaskApps then
						errorCodes's logWarning("Invalid taskApp in config: " & taskApp)
						set taskApp to "reminders"
					end if
					
					if noteApp is not in validNoteApps then
						errorCodes's logWarning("Invalid noteApp in config: " & noteApp)
						set noteApp to "notes"
					end if
					
					if projectApp is not in validProjectApps then
						errorCodes's logWarning("Invalid projectApp in config: " & projectApp)
						set projectApp to "reminders"
					end if
					
					return {taskApp:taskApp, noteApp:noteApp, projectApp:projectApp}
				end tell
			else
				error "Configuration file not found" number errorCodes's kGTDConfigNotFoundErr
			end if
		end tell
		
	on error errMsg number errNum
		-- Return default config
		errorCodes's logWarning("Failed to load config: " & errMsg & ". Using defaults.")
		return {taskApp:"reminders", noteApp:"notes", projectApp:"reminders"}
	end try
end loadConfig

-- Save configuration
on saveConfig(configRecord)
	try
		tell application "System Events"
			set prefsPath to (path to preferences folder as text) & "com.alfredgtd.plist"
			
			-- Create or update the plist
			if not (exists property list file prefsPath) then
				make new property list file with properties {name:prefsPath}
			end if
			
			tell property list file prefsPath
				if exists property list item "taskApp" then
					set value of property list item "taskApp" to configRecord's taskApp
				else
					make new property list item with properties {name:"taskApp", value:configRecord's taskApp}
				end if
				
				if exists property list item "noteApp" then
					set value of property list item "noteApp" to configRecord's noteApp
				else
					make new property list item with properties {name:"noteApp", value:configRecord's noteApp}
				end if
				
				if exists property list item "projectApp" then
					set value of property list item "projectApp" to configRecord's projectApp
				else
					make new property list item with properties {name:"projectApp", value:configRecord's projectApp}
				end if
			end tell
		end tell
		
		errorCodes's logInfo("Configuration saved successfully")
		return true
		
	on error errMsg
		errorCodes's logWarning("Failed to save config: " & errMsg)
		return false
	end try
end saveConfig