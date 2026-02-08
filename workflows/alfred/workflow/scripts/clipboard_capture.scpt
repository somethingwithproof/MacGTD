-- Clipboard Capture for Alfred
-- Keyword: clip

on run argv
	set taskText to (the clipboard as text)

	if taskText is "" then
		return "{\"items\":[{\"title\":\"Clipboard is empty\",\"subtitle\":\"Copy text first\",\"valid\":false}]}"
	end if

	-- Truncate for display
	if length of taskText > 100 then
		set displayText to text 1 thru 100 of taskText & "..."
	else
		set displayText to taskText
	end if

	-- Add to Reminders
	tell application "Reminders"
		launch
		try
			set inboxList to list "Inbox"
		on error
			set inboxList to first list
		end try
		tell inboxList
			make new reminder with properties {name:taskText}
		end tell
	end tell

	return "{\"items\":[{\"title\":\"Captured from clipboard\",\"subtitle\":\"" & displayText & "\",\"valid\":true}]}"
end run
