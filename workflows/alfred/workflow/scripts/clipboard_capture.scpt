use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
on feedback(messageText, detailText, validResult)
    set itemData to current application's NSDictionary's dictionaryWithDictionary:{title:messageText, subtitle:detailText, valid:validResult}
    set payload to current application's NSDictionary's dictionaryWithObject:(current application's NSArray's arrayWithObject:itemData) forKey:"items"
    set jsonData to current application's NSJSONSerialization's dataWithJSONObject:payload options:0 |error|:(missing value)
    if jsonData is missing value then error "Cannot serialize clipboard response"
    return ((current application's NSString's alloc()'s initWithData:jsonData encoding:(current application's NSUTF8StringEncoding))) as text
end feedback
on run argv
    set taskText to the clipboard as text
    if taskText is "" then return my feedback("Clipboard is empty", "Copy text first", false)
    tell application "Reminders"
        if not (exists list "Inbox") then make new list with properties {name:"Inbox"}
        make new reminder at end of reminders of list "Inbox" with properties {name:taskText}
    end tell
    set displayText to taskText
    if length of displayText > 100 then set displayText to text 1 thru 100 of displayText & "..."
    return my feedback("Captured from clipboard", displayText, true)
end run
