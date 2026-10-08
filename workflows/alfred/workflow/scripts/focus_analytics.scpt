-- Read structured JSON Lines; malformed entries fail rather than changing totals silently.
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"
on logPath()
    set overridePath to current application's NSProcessInfo's processInfo()'s environment()'s objectForKey:"MACGTD_STATE_DIR"
    if overridePath is missing value then set overridePath to (current application's NSHomeDirectory() as text) & "/.gtd"
    return (overridePath as text) & "/focus_log.jsonl"
end logPath
on analyzeFocusData()
    set filePath to my logPath()
    set totalSessions to 0
    set totalSeconds to 0
    set longestSeconds to 0
    set completedIds to {}
    if current application's NSFileManager's defaultManager()'s fileExistsAtPath:filePath then
        set logContents to current application's NSString's stringWithContentsOfFile:filePath encoding:(current application's NSUTF8StringEncoding) |error|:(missing value)
        if logContents is missing value then error "Focus log is unreadable"
        repeat with lineText in ((logContents's componentsSeparatedByString:linefeed) as list)
            if lineText as text is not "" then
                set dataObject to (current application's NSString's stringWithString:(lineText as text))'s dataUsingEncoding:(current application's NSUTF8StringEncoding)
                set entry to current application's NSJSONSerialization's JSONObjectWithData:dataObject options:0 |error|:(missing value)
                if entry is missing value then error "Invalid focus log entry"
                if ((entry's objectForKey:"event") as text) is "complete" then
                    set sessionId to (entry's objectForKey:"sessionId") as text
                    if sessionId is in completedIds then error "Duplicate completed focus session"
                    set end of completedIds to sessionId
                    set elapsed to entry's objectForKey:"actualSeconds"
                    if elapsed is missing value then error "Completed session has no duration"
                    set elapsed to elapsed as integer
                    if elapsed < 0 then error "Negative focus duration"
                    set totalSessions to totalSessions + 1
                    set totalSeconds to totalSeconds + elapsed
                    if elapsed > longestSeconds then set longestSeconds to elapsed
                end if
            end if
        end repeat
    end if
    set averageMinutes to 0
    if totalSessions > 0 then set averageMinutes to totalSeconds / (60 * totalSessions)
    return {totalSessions:totalSessions, totalMinutes:((round (totalSeconds / 6)) / 10), averageSessionLength:((round (averageMinutes * 10)) / 10), longestSession:((round (longestSeconds / 6)) / 10)}
end analyzeFocusData
on generateReport(values)
    return "Focus sessions: " & totalSessions of values & return & "Total minutes: " & totalMinutes of values & return & "Average minutes: " & averageSessionLength of values & return & "Longest session: " & longestSession of values
end generateReport
on run argv
    set reportText to my generateReport(my analyzeFocusData())
    if count of argv is 1 and item 1 of argv is "report" then return reportText
    display dialog reportText buttons {"OK"} default button "OK" with title "MacGTD Focus Analytics"
    return reportText
end run
