-- Compatibility helpers use the same parser and preferences contracts as capture.
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
on scriptsPath()
    set configured to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_SCRIPT_DIR"
    if configured is not missing value then return configured as text
    return (do shell script "pwd") & "/scripts"
end scriptsPath
on parseDate(dateString)
    set parser to my loadComponent(my scriptsPath() & "/natural_language_task.scpt")
    set parsed to parser's extractDateTime(dateString)
    if parsedDate of parsed is missing value then error "Unsupported date"
    return parsedDate of parsed
end parseDate
on extractMetadata(taskText)
    set parser to my loadComponent(my scriptsPath() & "/natural_language_task.scpt")
    set parsed to parser's parseTaskInput(taskText)
    if taskText of parsed is "" then error "Task title cannot be empty"
    return {taskText:taskText of parsed, |date|:dueDate of parsed, context:context of parsed, project:project of parsed}
end extractMetadata
on validateContextName(contextName)
    if contextName is "" or length of contextName > 50 then return false
    set valueString to current application's NSString's stringWithString:contextName
    set expression to current application's NSRegularExpression's regularExpressionWithPattern:"^@?[A-Za-z0-9_-]+$" options:0 |error|:(missing value)
    return (expression's numberOfMatchesInString:valueString options:0 range:{0, valueString's |length|()}) is 1
end validateContextName
on validateProjectName(projectName)
    return my validateContextName(projectName)
end validateProjectName
on trimText(theText)
    if theText is missing value then return ""
    return ((current application's NSString's stringWithString:theText)'s stringByTrimmingCharactersInSet:(current application's NSCharacterSet's whitespaceAndNewlineCharacterSet())) as text
end trimText
on splitText(theText, theDelimiter)
    return ((current application's NSString's stringWithString:theText)'s componentsSeparatedByString:theDelimiter) as list
end splitText
on replaceText(theText, searchText, replacementText)
    return ((current application's NSString's stringWithString:theText)'s stringByReplacingOccurrencesOfString:searchText withString:replacementText) as text
end replaceText
on loadConfig()
    set manager to my loadComponent(my scriptsPath() & "/preferences_manager.scpt")
    return {taskApp:manager's readPreference("taskApp"), noteApp:manager's readPreference("noteApp"), projectApp:manager's readPreference("projectApp")}
end loadConfig
on saveConfig(configRecord)
    set manager to my loadComponent(my scriptsPath() & "/preferences_manager.scpt")
    manager's writePreference("taskApp", taskApp of configRecord)
    manager's writePreference("noteApp", noteApp of configRecord)
    manager's writePreference("projectApp", projectApp of configRecord)
    return true
end saveConfig

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
