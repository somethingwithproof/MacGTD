-- Typed preferences with atomic updates; no shell-based plist editing.
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
property preferencesVersion : "2.1.0"
property preferencesPath : ""

on getPreferencesPath()
    if preferencesPath is not "" then return preferencesPath
    set overridePath to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_PREFERENCES_PATH"
    if overridePath is not missing value then return overridePath as text
    return (current application's NSHomeDirectory() as text) & "/Library/Preferences/com.alfredgtd.plist"
end getPreferencesPath

on defaultPreferences()
    return current application's NSMutableDictionary's dictionaryWithDictionary:{taskApp:"reminders", noteApp:"reminders", projectApp:"reminders", general:{version:preferencesVersion, theme:"system", language:"en"}, taskServices:{defaultService:"reminders", reminders:{enabled:true}, things:{enabled:false}, omnifocus:{enabled:false}}, dashboard:{updateInterval:60, itemsPerSection:10, compactMode:false}, focusMode:{defaultDuration:25, shortBreak:5, longBreak:15}, cache:{enabled:true, ttl:300}, notifications:{enabled:true}, weeklyReview:{dayOfWeek:"friday", |time|:"16:00", duration:30}, formatting:{dateFormat:"yyyy-MM-dd"}}
end defaultPreferences

on decodePlist(filePath)
    set dataObject to current application's NSData's dataWithContentsOfFile:filePath
    if dataObject is missing value then error "Preferences file is unreadable"
    set values to current application's NSPropertyListSerialization's propertyListWithData:dataObject options:1 format:(missing value) |error|:(missing value)
    if values is missing value then error "Invalid preferences plist"
    if not (values's isKindOfClass:(current application's NSDictionary)) then error "Preferences must be a dictionary"
    return values
end decodePlist

on writeValues(values, filePath)
    if not (values's isKindOfClass:(current application's NSDictionary)) then error "Preferences must be a dictionary"
    set parentPath to (current application's NSString's stringWithString:filePath)'s stringByDeletingLastPathComponent()
    set manager to current application's NSFileManager's defaultManager()
    if not (manager's createDirectoryAtPath:parentPath withIntermediateDirectories:true attributes:(missing value) |error|:(missing value)) then error "Cannot create preferences directory"
    if not (values's writeToFile:filePath atomically:true) then error "Cannot save preferences"
    return true
end writeValues

on mergeDefaults(values, defaultsObject)
    repeat with keyName in (defaultsObject's allKeys() as list)
        set existingValue to values's objectForKey:keyName
        set defaultValue to defaultsObject's objectForKey:keyName
        if existingValue is missing value then
            values's setObject:defaultValue forKey:keyName
        else if (defaultValue's isKindOfClass:(current application's NSDictionary)) and (existingValue's isKindOfClass:(current application's NSDictionary)) then
            my mergeDefaults(existingValue, defaultValue)
        end if
    end repeat
    return values
end mergeDefaults

on initializePreferences()
    set filePath to my getPreferencesPath()
    if (current application's NSFileManager's defaultManager()'s fileExistsAtPath:filePath) then
        set values to my decodePlist(filePath)
        my mergeDefaults(values, my defaultPreferences())
    else
        set values to my defaultPreferences()
    end if
    return my writeValues(values, filePath)
end initializePreferences

on components(keyPath)
    if keyPath is "" then error "Preference key cannot be empty"
    set oldDelimiters to AppleScript's text item delimiters
    set AppleScript's text item delimiters to "."
    set parts to text items of keyPath
    set AppleScript's text item delimiters to oldDelimiters
    repeat with part in parts
        if part as text is "" then error "Empty preference key component"
    end repeat
    return parts
end components

on readNestedPreference(keyPath)
    my initializePreferences()
    set cursor to my decodePlist(my getPreferencesPath())
    repeat with keyName in my components(keyPath)
        if not (cursor's isKindOfClass:(current application's NSDictionary)) then error "Preference path crosses a scalar value"
        set cursor to cursor's objectForKey:(keyName as text)
        if cursor is missing value then return missing value
    end repeat
    if cursor's isKindOfClass:(current application's NSString) then return cursor as text
    if cursor's isKindOfClass:(current application's NSNumber) then
        if (cursor's objCType() as text) is "c" then return cursor as boolean
        if (cursor's objCType() as text) is in {"f", "d"} then return cursor as real
        return cursor as integer
    end if
    if cursor's isKindOfClass:(current application's NSArray) then return cursor as list
    return cursor
end readNestedPreference

on writeNestedPreference(keyPath, newValue)
    if not my validatePreference(keyPath, newValue) then error "Invalid preference value: " & keyPath
    my initializePreferences()
    set values to my decodePlist(my getPreferencesPath())
    set cursor to values
    set parts to my components(keyPath)
    repeat with i from 1 to (count of parts) - 1
        set keyName to item i of parts
        set nextObject to cursor's objectForKey:keyName
        if nextObject is missing value then
            set nextObject to current application's NSMutableDictionary's dictionary()
            cursor's setObject:nextObject forKey:keyName
        end if
        if not (nextObject's isKindOfClass:(current application's NSDictionary)) then error "Preference path crosses a scalar value"
        set cursor to nextObject
    end repeat
    cursor's setObject:newValue forKey:(item -1 of parts)
    -- Keep the old flat taskApp preference compatible with the editor's nested key.
    if keyPath is "taskServices.defaultService" then values's setObject:newValue forKey:"taskApp"
    if keyPath is "taskApp" then (values's objectForKey:"taskServices")'s setObject:newValue forKey:"defaultService"
    return my writeValues(values, my getPreferencesPath())
end writeNestedPreference

on readPreference(keyPath)
    return my readNestedPreference(keyPath)
end readPreference
on writePreference(keyPath, newValue)
    return my writeNestedPreference(keyPath, newValue)
end writePreference
on getAllPreferences()
    my initializePreferences()
    return my decodePlist(my getPreferencesPath())
end getAllPreferences
on resetToDefaults()
    -- Prepare and serialize defaults before atomically replacing existing settings.
    return my writeValues(my defaultPreferences(), my getPreferencesPath())
end resetToDefaults

on validatePreference(keyPath, newValue)
    if keyPath is "taskApp" or keyPath is "taskServices.defaultService" then return newValue is in {"reminders", "things", "omnifocus", "todoist"}
    if keyPath ends with ".enabled" or keyPath ends with "Mode" then return class of newValue is boolean
    if keyPath is "cache.ttl" then return class of newValue is integer and newValue ≥ 60 and newValue ≤ 3600
    if keyPath is "focusMode.defaultDuration" then return class of newValue is integer and newValue ≥ 1 and newValue ≤ 180
    if keyPath is "focusMode.shortBreak" or keyPath is "focusMode.longBreak" or keyPath is "dashboard.updateInterval" or keyPath is "dashboard.itemsPerSection" or keyPath is "weeklyReview.duration" then return class of newValue is integer and newValue > 0
    if keyPath is "weeklyReview.dayOfWeek" then return newValue is in {"sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"}
    return class of newValue is in {text, integer, real, boolean, list}
end validatePreference

on exportPreferences(exportPath)
    return my writeValues(my getAllPreferences(), exportPath)
end exportPreferences
on validateImported(values, prefix)
    repeat with keyName in (values's allKeys() as list)
        set keyPath to keyName as text
        if prefix is not "" then set keyPath to prefix & "." & keyPath
        set v to values's objectForKey:keyName
        if v's isKindOfClass:(current application's NSDictionary) then
            my validateImported(v, keyPath)
        else
            if v's isKindOfClass:(current application's NSString) then
                set v to v as text
            else if v's isKindOfClass:(current application's NSNumber) then
                if (v's objCType() as text) is "c" then
                    set v to v as boolean
                else
                    set v to v as integer
                end if
            else if v's isKindOfClass:(current application's NSArray) then
                set v to v as list
            else
                error "Unsupported preference type"
            end if
            if not my validatePreference(keyPath, v) then error "Invalid imported preference: " & keyPath
        end if
    end repeat
end validateImported
on importPreferences(importPath)
    set values to my decodePlist(importPath)
    my validateImported(values, "")
    my mergeDefaults(values, my defaultPreferences())
    -- Preserve old settings until the imported document has been fully validated.
    set filePath to my getPreferencesPath()
    if current application's NSFileManager's defaultManager()'s fileExistsAtPath:filePath then my writeValues(my decodePlist(filePath), filePath & ".backup")
    return my writeValues(values, filePath)
end importPreferences
on migrateFromOldConfig()
    set legacyPath to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_LEGACY_CONFIG_PATH"
    if legacyPath is missing value then set legacyPath to (do shell script "pwd") & "/scripts/config.json"
    if not (current application's NSFileManager's defaultManager()'s fileExistsAtPath:legacyPath) then return false
    set rawData to current application's NSData's dataWithContentsOfFile:legacyPath
    set legacy to current application's NSJSONSerialization's JSONObjectWithData:rawData options:0 |error|:(missing value)
    if legacy is missing value then error "Invalid legacy JSON configuration"
    if not (legacy's isKindOfClass:(current application's NSDictionary)) then error "Legacy configuration must be a dictionary"
    set values to my getAllPreferences()
    set serviceName to legacy's objectForKey:"task_app"
    if serviceName is not missing value then
        if not my validatePreference("taskApp", serviceName as text) then error "Invalid legacy task service"
        values's setObject:serviceName forKey:"taskApp"
        (values's objectForKey:"taskServices")'s setObject:serviceName forKey:"defaultService"
    end if
    set enabledValue to legacy's objectForKey:"notifications_enabled"
    if enabledValue is not missing value then
        if (enabledValue's objCType() as text) is not "c" then error "Legacy notifications flag must be boolean"
        (values's objectForKey:"notifications")'s setObject:enabledValue forKey:"enabled"
    end if
    set reviewDay to legacy's objectForKey:"weekly_review_day"
    if reviewDay is not missing value then
        if not my validatePreference("weeklyReview.dayOfWeek", reviewDay as text) then error "Invalid legacy review day"
        (values's objectForKey:"weeklyReview")'s setObject:reviewDay forKey:"dayOfWeek"
    end if
    return my writeValues(values, my getPreferencesPath())
end migrateFromOldConfig

on run argv
    if count of argv is 0 then return my getPreferencesPath()
    set operation to item 1 of argv
    if operation is "init" then return my initializePreferences()
    if operation is "migrate" then return my migrateFromOldConfig()
    if operation is "reset" then return my resetToDefaults()
    if operation is "read" and count of argv is 2 then return my readNestedPreference(item 2 of argv)
    if operation is "write" and count of argv is 3 then
        set newValue to item 3 of argv
        if newValue is "true" then
            set newValue to true
        else if newValue is "false" then
            set newValue to false
        else
            try
                set newValue to newValue as integer
            end try
        end if
        return my writeNestedPreference(item 2 of argv, newValue)
    end if
    if operation is "export" and count of argv is 2 then return my exportPreferences(item 2 of argv)
    if operation is "import" and count of argv is 2 then return my importPreferences(item 2 of argv)
    error "Unknown preferences command"
end run
