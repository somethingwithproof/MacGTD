-- Shared production adapter. scripts/sync-provider-workflows.py embeds this source
-- and the production task parser into every standalone API capture bundle.
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
property providerName : "notion"
property captureTitle : "Notion GTD Quick Capture"
property keychainService : "MacGTD-Notion"
property tokenEnvironment : "MACGTD_NOTION_TOKEN"
property targetEnvironment : "MACGTD_NOTION_DATA_SOURCE_ID"
property targetAccount : "data-source-id"
property curlExecutable : "/usr/bin/curl"
property notionApiVersion : "2026-03-11"

on run {input, parameters}
    display dialog "Enter task (!1/!2/!3 priority, due:date, @context):" default answer "" with title captureTitle
    set inputText to text returned of result
    if my trimText(inputText) is "" then return input
    set createdRecord to my captureTask(inputText)
    display notification "Captured: " & (taskText of (my parseTaskInput(inputText))) with title captureTitle
    return my createdIdentifier(createdRecord)
end run

on createdIdentifier(createdRecord)
    set identifierKey to "id"
    if providerName is "google" then set identifierKey to "name"
    return (createdRecord's objectForKey:identifierKey) as text
end createdIdentifier

on captureTask(inputText)
    set taskData to my parseTaskInput(inputText)
    if taskText of taskData is "" then error "Task title cannot be empty"
    set apiToken to my configuration(tokenEnvironment, "api-token")
    if apiToken is "" then error "Configure " & providerName & " credentials in Keychain or " & tokenEnvironment
    try
        set targetID to my configuration(targetEnvironment, targetAccount)
        if providerName is "notion" then set targetID to my resolveDataSource(apiToken, targetID)
        if providerName is "microsoft" and targetID is "" then error "Configure a Microsoft To Do list ID"
        set payload to my buildPayload(taskData, targetID)
        set responseText to my requestPayload(apiToken, my serializeJSON(payload), targetID)
        if not my confirmedResponse(responseText) then error providerName & " did not confirm creation"
        return my parseJSON(responseText)
    on error messageText
        error (my failureMessage(messageText, apiToken))
    end try
end captureTask

on configuration(environmentName, accountName)
    if environmentName is not "" then
        set valueObject to (current application's NSProcessInfo's processInfo()'s environment())'s objectForKey:environmentName
        if valueObject is not missing value then return valueObject as text
    end if
    if accountName is "" then return ""
    return my getKeychainValue(keychainService, accountName)
end configuration

on getKeychainValue(serviceName, accountName)
    try
        return do shell script "/usr/bin/security find-generic-password -s " & quoted form of serviceName & " -a " & quoted form of accountName & " -w 2>/dev/null"
    on error
        return ""
    end try
end getKeychainValue

on resolveDataSource(apiToken, selectedID)
    if selectedID is not "" then return my validUUID(selectedID)
    -- Existing database-id installations migrate without silently selecting a source.
    set databaseID to my configuration("MACGTD_NOTION_DATABASE_ID", "database-id")
    if databaseID is "" then error "Configure a Notion data source ID"
    set databaseID to my validUUID(databaseID)
    set responseObject to my parseJSON(my requestAPI(apiToken, "GET", "https://api.notion.com/v1/databases/" & databaseID, ""))
    if (responseObject's objectForKey:"object") as text is not "database" then error "Notion database discovery failed"
    set sources to responseObject's objectForKey:"data_sources"
    if sources is missing value then error "Notion did not return data sources"
    if not (sources's isKindOfClass:(current application's NSArray)) then error "Invalid Notion data sources"
    if sources's |count|() is not 1 then error "Notion database must have exactly one source; configure data-source-id explicitly for multiple sources"
    set sourceObject to sources's objectAtIndex:0
    if not (sourceObject's isKindOfClass:(current application's NSDictionary)) then error "Invalid Notion data source"
    return my validUUID((sourceObject's objectForKey:"id") as text)
end resolveDataSource

on validUUID(identifier)
    -- Older setup copied compact IDs from database URLs; retain that migration path.
    if my findPattern(identifier, "^[0-9A-Fa-f]{32}$") is not "" then
        set identifier to text 1 thru 8 of identifier & "-" & text 9 thru 12 of identifier & "-" & text 13 thru 16 of identifier & "-" & text 17 thru 20 of identifier & "-" & text 21 thru 32 of identifier
    end if
    set parsedUUID to current application's NSUUID's alloc()'s initWithUUIDString:identifier
    if parsedUUID is missing value then error "Notion IDs must be UUIDs; use Copy data source ID in Notion"
    return parsedUUID's UUIDString() as text
end validUUID

on buildPayload(taskData, targetID)
    set capturedText to taskText of taskData
    set dueValue to dueDate of taskData
    set priorityValue to priority of taskData
    set contextValue to context of taskData
    set projectValue to project of taskData
    if providerName is "todoist" then
        set payload to current application's NSMutableDictionary's dictionaryWithDictionary:(my jsonObject({"content", "priority"}, {capturedText, my todoistPriority(priorityValue)}))
        if targetID is not "" then payload's setObject:targetID forKey:"project_id"
        if dueValue is not missing value then
            if hasDueTime of taskData then
                payload's setObject:(my isoDateTime(dueValue)) forKey:"due_datetime"
            else
                payload's setObject:(my isoDate(dueValue)) forKey:"due_date"
            end if
        end if
        set labels to current application's NSMutableArray's array()
        if contextValue is not "" then labels's addObject:(text 2 thru -1 of contextValue)
        if projectValue is not "" then labels's addObject:projectValue
        if labels's |count|() > 0 then payload's setObject:labels forKey:"labels"
        return payload
    end if
    if providerName is "notion" then
        set textObject to my jsonObject({"content"}, {capturedText})
        set richText to my jsonObject({"type", "text"}, {"text", textObject})
        set titleObject to my jsonObject({"title"}, {{richText}})
        set propertiesObject to current application's NSMutableDictionary's dictionary()
        propertiesObject's setObject:titleObject forKey:"Name"
        propertiesObject's setObject:(my jsonObject({"select"}, {my jsonObject({"name"}, {"Inbox"})})) forKey:"Status"
        if priorityValue > 0 then
            set priorityLabel to item priorityValue of {"High", "Medium", "Low"}
            propertiesObject's setObject:(my jsonObject({"select"}, {my jsonObject({"name"}, {priorityLabel})})) forKey:"Priority"
        end if
        if dueValue is not missing value then propertiesObject's setObject:(my jsonObject({"date"}, {my jsonObject({"start"}, {my dueText(taskData)})})) forKey:"Due"
        set parentObject to my jsonObject({"type", "data_source_id"}, {"data_source_id", targetID})
        set payload to current application's NSMutableDictionary's dictionaryWithDictionary:(my jsonObject({"parent", "properties"}, {parentObject, propertiesObject}))
        set metadataText to my metadata(taskData)
        if metadataText is not "" then
            set metadataRichText to my jsonObject({"type", "text"}, {"text", my jsonObject({"content"}, {metadataText})})
            set paragraphObject to my jsonObject({"rich_text"}, {{metadataRichText}})
            set blockObject to my jsonObject({"object", "type", "paragraph"}, {"block", "paragraph", paragraphObject})
            payload's setObject:{blockObject} forKey:"children"
        end if
        return payload
    end if
    if providerName is "microsoft" then
        set importanceValue to "normal"
        if priorityValue is 1 then set importanceValue to "high"
        if priorityValue is 3 then set importanceValue to "low"
        set payload to current application's NSMutableDictionary's dictionaryWithDictionary:(my jsonObject({"title", "importance", "status"}, {capturedText, importanceValue, "notStarted"}))
        if dueValue is not missing value then
            set dateValue to my isoDateTime(dueValue)
            if not hasDueTime of taskData then set dateValue to (my isoDate(dueValue)) & "T00:00:00Z"
            payload's setObject:(my jsonObject({"dateTime", "timeZone"}, {text 1 thru -2 of dateValue, "UTC"})) forKey:"dueDateTime"
        end if
        set metadataText to my metadata(taskData)
        if metadataText is not "" then payload's setObject:(my jsonObject({"contentType", "content"}, {"text", metadataText})) forKey:"body"
        return payload
    end if
    if providerName is "google" then
        -- Keep is a note service: retain task metadata as text, never invent task fields.
        set noteText to my metadata(taskData)
        if priorityValue > 0 then set noteText to noteText & "Priority: " & priorityValue & linefeed
        if dueValue is not missing value then set noteText to noteText & "Due: " & (my dueText(taskData)) & linefeed
        if noteText is "" then set noteText to capturedText
        set textObject to my jsonObject({"text"}, {noteText})
        return my jsonObject({"title", "body"}, {capturedText, my jsonObject({"text"}, {textObject})})
    end if
    error "Unsupported API provider"
end buildPayload

on jsonObject(keys, values)
    return current application's NSDictionary's dictionaryWithObjects:values forKeys:keys
end jsonObject

on metadata(taskData)
    set resultText to ""
    if context of taskData is not "" then set resultText to "Context: " & context of taskData & linefeed
    if project of taskData is not "" then set resultText to resultText & "Project: " & project of taskData & linefeed
    return resultText
end metadata

on todoistPriority(priorityValue)
    if priorityValue is 0 then return 1
    return 5 - priorityValue
end todoistPriority

on dueText(taskData)
    if hasDueTime of taskData then return my isoDateTime(dueDate of taskData)
    return my isoDate(dueDate of taskData)
end dueText

on isoDate(dateValue)
    -- Read calendar components directly so a date-only marker never shifts in UTC.
    return (year of dateValue as text) & "-" & text -2 thru -1 of ("0" & (month of dateValue as integer)) & "-" & text -2 thru -1 of ("0" & day of dateValue)
end isoDate

on isoDateTime(dateValue)
    set formatter to current application's NSDateFormatter's alloc()'s init()
    formatter's setLocale:(current application's NSLocale's localeWithLocaleIdentifier:"en_US_POSIX")
    formatter's setTimeZone:(current application's NSTimeZone's timeZoneForSecondsFromGMT:0)
    formatter's setDateFormat:"yyyy-MM-dd'T'HH:mm:ss'Z'"
    return (formatter's stringFromDate:dateValue) as text
end isoDateTime

on captureURL(targetID)
    if providerName is "todoist" then return "https://api.todoist.com/api/v1/tasks"
    if providerName is "notion" then return "https://api.notion.com/v1/pages"
    if providerName is "google" then return "https://keep.googleapis.com/v1/notes"
    if providerName is "microsoft" then
        if targetID is "" then error "Configure a Microsoft To Do list ID"
        if targetID is "." or targetID is ".." then error "Invalid Microsoft To Do list ID"
        set allowedCharacters to current application's NSCharacterSet's characterSetWithCharactersInString:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~"
        set encodedTarget to (current application's NSString's stringWithString:targetID)'s stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters
        set component to current application's NSURLComponents's componentsWithString:"https://graph.microsoft.com"
        component's setPercentEncodedPath:("/v1.0/me/todo/lists/" & (encodedTarget as text) & "/tasks")
        return component's |URL|()'s absoluteString() as text
    end if
    error "Unsupported API provider"
end captureURL

on requestPayload(apiToken, jsonBody, targetID)
    return my requestAPI(apiToken, "POST", my captureURL(targetID), jsonBody)
end requestPayload

on requestAPI(apiToken, methodName, requestURL, jsonBody)
    if apiToken contains return or apiToken contains linefeed then error "Invalid credential characters"
    set argumentValues to current application's NSMutableArray's arrayWithArray:{"--fail-with-body", "--silent", "--show-error", "--proto", "=https", "--proto-redir", "=https", "--tlsv1.2", "--connect-timeout", "10", "--max-time", "30", "-X", methodName, requestURL, "-H", "@-", "-H", "Content-Type: application/json"}
    if providerName is "notion" then
        argumentValues's addObject:"-H"
        argumentValues's addObject:("Notion-Version: " & notionApiVersion)
    end if
    if methodName is "POST" then
        argumentValues's addObject:"--data-binary"
        argumentValues's addObject:jsonBody
    end if
    set curlTask to current application's NSTask's alloc()'s init()
    curlTask's setLaunchPath:curlExecutable
    curlTask's setArguments:argumentValues
    set inputPipe to current application's NSPipe's pipe()
    set outputPipe to current application's NSPipe's pipe()
    curlTask's setStandardInput:inputPipe
    curlTask's setStandardOutput:outputPipe
    -- One drained pipe prevents stdout/stderr backpressure deadlocks.
    curlTask's setStandardError:outputPipe
    if not (curlTask's launchAndReturnError:(missing value)) then error "Could not launch capture transport"
    set authorizationHeader to current application's NSString's stringWithString:("Authorization: Bearer " & apiToken & linefeed)
    (inputPipe's fileHandleForWriting())'s writeData:(authorizationHeader's dataUsingEncoding:(current application's NSUTF8StringEncoding))
    (inputPipe's fileHandleForWriting())'s closeFile()
    set responseData to (outputPipe's fileHandleForReading())'s readDataToEndOfFile()
    curlTask's waitUntilExit()
    set responseText to (current application's NSString's alloc()'s initWithData:responseData encoding:(current application's NSUTF8StringEncoding))
    if responseText is missing value then error "Provider response is not UTF-8 text"
    if curlTask's terminationStatus() is not 0 then error "Transport failed (" & (curlTask's terminationStatus() as text) & "): " & (responseText as text)
    return responseText as text
end requestAPI

on serializeJSON(values)
    set dataObject to current application's NSJSONSerialization's dataWithJSONObject:values options:0 |error|:(missing value)
    if dataObject is missing value then error "Cannot serialize capture payload"
    return ((current application's NSString's alloc()'s initWithData:dataObject encoding:(current application's NSUTF8StringEncoding))) as text
end serializeJSON

on parseJSON(responseText)
    set dataObject to (current application's NSString's stringWithString:responseText)'s dataUsingEncoding:(current application's NSUTF8StringEncoding)
    set responseObject to current application's NSJSONSerialization's JSONObjectWithData:dataObject options:0 |error|:(missing value)
    if responseObject is missing value then error "Provider returned invalid JSON"
    if not (responseObject's isKindOfClass:(current application's NSDictionary)) then error "Provider returned an invalid response object"
    return responseObject
end parseJSON

on confirmedResponse(responseText)
    try
        set responseObject to my parseJSON(responseText)
        if (responseObject's objectForKey:"error") is not missing value then return false
        if providerName is "google" then
            set recordName to responseObject's objectForKey:"name"
            if recordName is missing value then return false
            if not (recordName's isKindOfClass:(current application's NSString)) then return false
            set titleObject to responseObject's objectForKey:"title"
            if titleObject is missing value then return false
            if not (titleObject's isKindOfClass:(current application's NSString)) then return false
            set bodyObject to responseObject's objectForKey:"body"
            if bodyObject is missing value then return false
            if not (bodyObject's isKindOfClass:(current application's NSDictionary)) then return false
            return (recordName as text) starts with "notes/" and (length of (recordName as text)) > 6
        end if
        set identifier to responseObject's objectForKey:"id"
        if identifier is missing value then return false
        if not (identifier's isKindOfClass:(current application's NSString)) then return false
        if (identifier as text) is "" then return false
        if providerName is "notion" then
            if (responseObject's objectForKey:"object") as text is not "page" then return false
            set propertiesObject to responseObject's objectForKey:"properties"
            if propertiesObject is missing value then return false
            return (propertiesObject's isKindOfClass:(current application's NSDictionary)) as boolean
        end if
        set titleKey to "content"
        if providerName is "microsoft" then set titleKey to "title"
        set titleObject to responseObject's objectForKey:titleKey
        if titleObject is missing value then return false
        return (titleObject's isKindOfClass:(current application's NSString)) as boolean
    on error
        return false
    end try
end confirmedResponse

on failureMessage(messageText, apiToken)
    set safeMessage to current application's NSString's stringWithString:messageText
    if apiToken is not "" then set safeMessage to safeMessage's stringByReplacingOccurrencesOfString:apiToken withString:"[redacted]"
    return "Capture API request failed: " & (safeMessage as text)
end failureMessage
