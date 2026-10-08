
-- AlfredGTD Preferences Editor/Viewer
-- Interactive utility for viewing and editing preferences

use AppleScript version "2.4"
use scripting additions

-- Load preferences manager
property prefsManagerPath : ""

-- Initialize
on initializeEditor()
	try
        set workflowDirectory to do shell script "pwd"
        set prefsManagerPath to POSIX file (workflowDirectory & "/scripts/preferences_manager.scpt") as text

		return true
	on error errMsg
		error "Failed to initialize editor: " & errMsg
	end try
end initializeEditor

-- Display main menu
on displayMainMenu()
	set menuChoices to {"View All Preferences", "View Specific Setting", "Edit Setting", "Reset to Defaults", "Export Preferences", "Import Preferences", "Migrate from Old Config", "Quit"}

	«event gtqpchlt» menuChoices given «class appr»:"AlfredGTD Preferences Editor", «class prmp»:"Select an action:", «class inSL»:{"View All Preferences"}
end displayMainMenu

-- View all preferences (formatted)
on viewAllPreferences()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		set output to "AlfredGTD Preferences" & return & "===================" & return & return

		-- General Settings
		set output to output & "GENERAL SETTINGS:" & return
		set output to output & "  Version: " & (prefsManager's readNestedPreference("general.version")) & return
		set output to output & "  Theme: " & (prefsManager's readNestedPreference("general.theme")) & return
		set output to output & "  Language: " & (prefsManager's readNestedPreference("general.language")) & return & return

		-- Task Services
		set output to output & "TASK SERVICES:" & return
		set defaultService to prefsManager's readNestedPreference("taskServices.defaultService")
		set output to output & "  Default Service: " & defaultService & return
		set output to output & "  Reminders Enabled: " & (prefsManager's readNestedPreference("taskServices.reminders.enabled")) & return
		set output to output & "  Things Enabled: " & (prefsManager's readNestedPreference("taskServices.things.enabled")) & return
		set output to output & "  OmniFocus Enabled: " & (prefsManager's readNestedPreference("taskServices.omnifocus.enabled")) & return & return

		-- Dashboard Settings
		set output to output & "DASHBOARD:" & return
		set output to output & "  Update Interval: " & (prefsManager's readNestedPreference("dashboard.updateInterval")) & " seconds" & return
		set output to output & "  Items Per Section: " & (prefsManager's readNestedPreference("dashboard.itemsPerSection")) & return
		set output to output & "  Compact Mode: " & (prefsManager's readNestedPreference("dashboard.compactMode")) & return & return

		-- Focus Mode
		set output to output & "FOCUS MODE:" & return
		set output to output & "  Default Duration: " & (prefsManager's readNestedPreference("focusMode.defaultDuration")) & " minutes" & return
		set output to output & "  Short Break: " & (prefsManager's readNestedPreference("focusMode.shortBreak")) & " minutes" & return
		set output to output & "  Long Break: " & (prefsManager's readNestedPreference("focusMode.longBreak")) & " minutes" & return & return

		-- Cache Settings
		set output to output & "CACHE:" & return
		set output to output & "  Enabled: " & (prefsManager's readNestedPreference("cache.enabled")) & return
		set output to output & "  TTL: " & (prefsManager's readNestedPreference("cache.ttl")) & " seconds" & return
		set output to output & "  Auto Cleanup: " & (prefsManager's readNestedPreference("cache.autoCleanup")) & return & return

		-- Weekly Review
		set output to output & "WEEKLY REVIEW:" & return
		set output to output & "  Day: " & (prefsManager's readNestedPreference("weeklyReview.dayOfWeek")) & return
		set output to output & "  Time: " & (prefsManager's readNestedPreference("weeklyReview.time")) & return
		set output to output & "  Duration: " & (prefsManager's readNestedPreference("weeklyReview.duration")) & " minutes" & return

		«event sysodlog» output given «class btns»:{"OK"}, «class dflt»:"OK", «class appr»:"All Preferences"

	on error errMsg
		«event sysodisA» "Error viewing preferences" given «class mesS»:errMsg
	end try
end viewAllPreferences

-- View specific setting
on viewSpecificSetting()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		-- Common settings to choose from
		set commonSettings to {"taskServices.defaultService", "dashboard.updateInterval", "focusMode.defaultDuration", "cache.enabled", "cache.ttl", "notifications.enabled", "weeklyReview.dayOfWeek", "formatting.dateFormat", "Custom..."}

		set choice to «event gtqpchlt» commonSettings given «class appr»:"View Setting", «class prmp»:"Select a setting to view:", «class inSL»:{"taskServices.defaultService"}

		if choice is false then return

		set settingKey to item 1 of choice

		if settingKey is "Custom..." then
			set settingKey to «class ttxt» of («event sysodlog» "Enter the setting key (e.g., 'dashboard.compactMode'):" given «class dtxt»:"", «class appr»:"Custom Setting")
		end if

		set settingValue to prefsManager's readNestedPreference(settingKey)

		if settingValue is missing value then
			«event sysodisA» "Setting Not Found" given «class mesS»:"The key '" & settingKey & "' was not found in preferences."
		else
			«event sysodlog» "Setting: " & settingKey & return & "Value: " & settingValue given «class btns»:{"OK"}, «class dflt»:"OK", «class appr»:"Preference Value"
		end if

	on error errMsg
		«event sysodisA» "Error viewing setting" given «class mesS»:errMsg
	end try
end viewSpecificSetting

-- Edit setting
on editSetting()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		-- Common settings to edit
		set editableSettings to {"taskServices.defaultService", "dashboard.updateInterval", "focusMode.defaultDuration", "cache.ttl", "notifications.enabled", "weeklyReview.dayOfWeek", "formatting.dateFormat", "Custom..."}

		set choice to «event gtqpchlt» editableSettings given «class appr»:"Edit Setting", «class prmp»:"Select a setting to edit:", «class inSL»:{"taskServices.defaultService"}

		if choice is false then return

		set settingKey to item 1 of choice

		if settingKey is "Custom..." then
			set settingKey to «class ttxt» of («event sysodlog» "Enter the setting key (e.g., 'dashboard.compactMode'):" given «class dtxt»:"", «class appr»:"Custom Setting")
		end if

		-- Get current value
		set currentValue to prefsManager's readNestedPreference(settingKey)
		if currentValue is missing value then set currentValue to ""

		-- Get new value based on setting type
		if settingKey is "taskServices.defaultService" then
			set newValue to «event gtqpchlt» {"reminders", "things", "omnifocus", "todoist"} given «class appr»:"Default Task Service", «class prmp»:"Select the default task service:", «class inSL»:{currentValue}
			if newValue is false then return
			set newValue to item 1 of newValue

		else if settingKey is "weeklyReview.dayOfWeek" then
			set newValue to «event gtqpchlt» {"sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"} given «class appr»:"Weekly Review Day", «class prmp»:"Select the weekly review day:", «class inSL»:{currentValue}
			if newValue is false then return
			set newValue to item 1 of newValue

		else if settingKey is "notifications.enabled" or settingKey ends with ".enabled" then
			if currentValue is true or currentValue is "true" then
				set defaultBtn to "Yes"
			else
				set defaultBtn to "No"
			end if
			set newValue to «class bhit» of («event sysodlog» "Enable " & settingKey & "?" given «class btns»:{"No", "Yes"}, «class dflt»:defaultBtn)
			set newValue to (newValue is "Yes")

		else if settingKey contains "Interval" or settingKey contains "Duration" or settingKey contains "ttl" then
			set newValue to «class ttxt» of («event sysodlog» "Enter new value for " & settingKey & " (in seconds/minutes):" given «class dtxt»:(currentValue as text), «class appr»:"Edit Setting")
			try
				set newValue to newValue as integer
			on error
				«event sysodisA» "Invalid Value" given «class mesS»:"Please enter a valid number."
				return
			end try

		else
			set newValue to «class ttxt» of («event sysodlog» "Enter new value for " & settingKey & ":" given «class dtxt»:(currentValue as text), «class appr»:"Edit Setting")
		end if

		-- Validate and save
		if prefsManager's validatePreference(settingKey, newValue) then
			prefsManager's writeNestedPreference(settingKey, newValue)
			«event sysodisA» "Setting Updated" given «class mesS»:"Successfully updated " & settingKey & " to " & (newValue as string)
		else
			«event sysodisA» "Invalid Value" given «class mesS»:"The value '" & (newValue as string) & "' is not valid for " & settingKey
		end if

	on error errMsg
		«event sysodisA» "Error editing setting" given «class mesS»:errMsg
	end try
end editSetting

-- Export preferences
on exportPreferences()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		set exportFile to «event sysonwfl» given «class prmt»:"Save preferences as:", «class dfnm»:"alfredgtd_preferences_backup.plist"

		prefsManager's exportPreferences(POSIX path of exportFile)

		«event sysodisA» "Export Complete" given «class mesS»:"Preferences exported to " & (POSIX path of exportFile)

	on error errMsg
		«event sysodisA» "Export Failed" given «class mesS»:errMsg
	end try
end exportPreferences

-- Import preferences
on importPreferences()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		set importFile to «event sysostdf» given «class prmp»:"Select preferences file to import:", «class ftyp»:{"plist"}

		-- Confirm import
		set confirmResult to «event sysodlog» "This will replace all current preferences. Continue?" given «class btns»:{"Cancel", "Import"}, «class dflt»:"Cancel", «class disp»:caution

		if «class bhit» of confirmResult is "Import" then
			prefsManager's importPreferences(POSIX path of importFile)
			«event sysodisA» "Import Complete" given «class mesS»:"Preferences imported from " & (POSIX path of importFile)
		end if

	on error errMsg
		«event sysodisA» "Import Failed" given «class mesS»:errMsg
	end try
end importPreferences

-- Reset to defaults
on resetToDefaults()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		set confirmResult to «event sysodlog» "This will reset all preferences to their default values. Continue?" given «class btns»:{"Cancel", "Reset"}, «class dflt»:"Cancel", «class disp»:caution

		if «class bhit» of confirmResult is "Reset" then
			prefsManager's resetToDefaults()
			«event sysodisA» "Reset Complete" given «class mesS»:"All preferences have been reset to defaults."
		end if

	on error errMsg
		«event sysodisA» "Reset Failed" given «class mesS»:errMsg
	end try
end resetToDefaults

-- Migrate from old config
on migrateFromOldConfig()
	try
		set prefsManager to my loadComponent(POSIX path of file prefsManagerPath)

		set migrationResult to prefsManager's migrateFromOldConfig()

		if migrationResult then
			«event sysodisA» "Migration Complete" given «class mesS»:"Successfully migrated settings from old config.json file."
		else
			«event sysodisA» "No Migration Needed" given «class mesS»:"No old configuration file found or migration already completed."
		end if

	on error errMsg
		«event sysodisA» "Migration Failed" given «class mesS»:errMsg
	end try
end migrateFromOldConfig

-- Main run handler
on run
	try
		initializeEditor()

		repeat
			set userChoice to displayMainMenu()

			if userChoice is false or userChoice is {"Quit"} then
				exit repeat
			else if userChoice is {"View All Preferences"} then
				viewAllPreferences()
			else if userChoice is {"View Specific Setting"} then
				viewSpecificSetting()
			else if userChoice is {"Edit Setting"} then
				editSetting()
			else if userChoice is {"Reset to Defaults"} then
				resetToDefaults()
			else if userChoice is {"Export Preferences"} then
				exportPreferences()
			else if userChoice is {"Import Preferences"} then
				importPreferences()
			else if userChoice is {"Migrate from Old Config"} then
				migrateFromOldConfig()
			end if
		end repeat

		return "Preferences Editor closed."

	on error errMsg
		«event sysodisA» "Error" given «class mesS»:errMsg
		return "Error: " & errMsg
	end try
end run

-- Source files remain reviewable; load script requires a compiled OSA component.
on loadComponent(sourcePath)
    set temporaryDirectory to do shell script "/usr/bin/mktemp -d " & quoted form of "/tmp/macgtd-component.XXXXXX"
    try
        set compiledPath to temporaryDirectory & "/component.scpt"
        do shell script "/usr/bin/osacompile -o " & quoted form of compiledPath & " " & quoted form of sourcePath
        set component to load script POSIX file compiledPath
        do shell script "/bin/rm -rf " & quoted form of temporaryDirectory
        return component
    on error messageText number errorNumber
        do shell script "/bin/rm -rf " & quoted form of temporaryDirectory
        error messageText number errorNumber
    end try
end loadComponent
