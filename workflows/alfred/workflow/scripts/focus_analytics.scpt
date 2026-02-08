-- AlfredGTD: Focus Analytics
-- Analyze focus session data and provide insights

use AppleScript version "2.4"
use scripting additions
use framework "Foundation"

property kFocusLogFile : "~/.gtd/focus_log.json"

on run
    try
        set analyticsData to my analyzeFocusData()
        set reportText to my generateReport(analyticsData)
        
        display dialog reportText buttons {"OK", "Export Report"} ¬
            default button "OK" with title "Focus Analytics"
        
        if button returned of result is "Export Report" then
            my exportReport(reportText)
        end if
        
    on error errMsg
        display alert "Analytics Error" message errMsg
    end try
end run

-- Analyze focus log data
on analyzeFocusData()
    set analytics to {totalSessions:0, totalMinutes:0, completedTasks:0, ¬
        contextBreakdown:{}, dailyAverage:0, longestSession:0, ¬
        mostProductiveTime:"", averageSessionLength:0}
    
    -- Read log file
    set logPath to (do shell script "echo " & kFocusLogFile)
    
    try
        set logContent to do shell script "cat " & quoted form of logPath
        -- In a real implementation, parse JSON properly
        -- For now, use simple text parsing
        
        set sessionCount to 0
        set totalTime to 0
        
        -- Count sessions
        set sessionStarts to my countOccurrences(logContent, "\"event\":\"start\"")
        set sessionCompletes to my countOccurrences(logContent, "\"event\":\"complete\"")
        
        set totalSessions of analytics to sessionCompletes
        
        -- Extract durations (simplified parsing)
        set allLines to paragraphs of logContent
        repeat with logLine in allLines
            if logLine contains "\"actualDuration\"" then
                try
                    set durationStart to offset of "\"actualDuration\":\"" in logLine
                    set durationText to text (durationStart + 18) through -1 of logLine
                    set durationEnd to offset of "\"" in durationText
                    set duration to text 1 through (durationEnd - 1) of durationText as integer
                    
                    set totalTime to totalTime + duration
                    if duration > (longestSession of analytics) then
                        set longestSession of analytics to duration
                    end if
                end try
            end if
        end repeat
        
        set totalMinutes of analytics to totalTime
        
        if sessionCompletes > 0 then
            set averageSessionLength of analytics to totalTime div sessionCompletes
        end if
        
    on error
        -- Log file doesn't exist or is empty
    end try
    
    return analytics
end analyzeFocusData

-- Generate analytics report
on generateReport(analytics)
    set report to "📊 FOCUS MODE ANALYTICS" & return & return
    
    -- Summary stats
    set report to report & "📈 Overview:" & return
    set report to report & "  Total Sessions: " & (totalSessions of analytics) & return
    set report to report & "  Total Focus Time: " & my formatMinutes(totalMinutes of analytics) & return
    set report to report & "  Average Session: " & (averageSessionLength of analytics) & " minutes" & return
    set report to report & "  Longest Session: " & (longestSession of analytics) & " minutes" & return & return
    
    -- Productivity insights
    set report to report & "💡 Insights:" & return
    
    if (totalSessions of analytics) = 0 then
        set report to report & "  Start using Focus Mode to see insights!" & return
    else
        -- Pomodoro compliance
        set pomodoroCompliance to 0
        if (averageSessionLength of analytics) > 20 and (averageSessionLength of analytics) < 30 then
            set report to report & "  ✅ Great Pomodoro compliance!" & return
        else if (averageSessionLength of analytics) < 20 then
            set report to report & "  ⚠️  Sessions are shorter than recommended" & return
        else
            set report to report & "  ⚠️  Consider shorter sessions for better focus" & return
        end if
        
        -- Daily usage
        set today to current date
        set daysTracked to 7 -- Assume last 7 days for now
        set dailyAverage to (totalMinutes of analytics) / daysTracked
        
        set report to report & "  Daily Average: " & (round (dailyAverage)) & " minutes" & return
        
        if dailyAverage > 120 then
            set report to report & "  🌟 Excellent focus habits!" & return
        else if dailyAverage > 60 then
            set report to report & "  👍 Good focus consistency" & return
        else
            set report to report & "  💪 Try to increase daily focus time" & return
        end if
    end if
    
    set report to report & return & "🎯 Recommendations:" & return
    
    -- Recommendations based on data
    if (totalSessions of analytics) < 5 then
        set report to report & "  • Use Focus Mode at least once per day" & return
        set report to report & "  • Start with 25-minute sessions" & return
    else
        set report to report & "  • Maintain consistent focus times" & return
        set report to report & "  • Take regular breaks between sessions" & return
    end if
    
    if (longestSession of analytics) > 45 then
        set report to report & "  • Consider breaking long sessions into smaller chunks" & return
    end if
    
    return report
end generateReport

-- Format minutes to hours and minutes
on formatMinutes(totalMinutes)
    if totalMinutes < 60 then
        return totalMinutes & " minutes"
    else
        set hours to totalMinutes div 60
        set minutes to totalMinutes mod 60
        return hours & "h " & minutes & "m"
    end if
end formatMinutes

-- Count occurrences of text
on countOccurrences(sourceText, searchText)
    set oldDelims to AppleScript's text item delimiters
    set AppleScript's text item delimiters to searchText
    set matches to (count text items of sourceText) - 1
    set AppleScript's text item delimiters to oldDelims
    return matches
end countOccurrences

-- Export report to file
on exportReport(reportText)
    set reportFile to choose file name with prompt "Save Focus Analytics Report" ¬
        default name "gtd_focus_report_" & my dateStamp() & ".txt"
    
    try
        set fileRef to open for access reportFile with write permission
        set eof fileRef to 0
        write reportText to fileRef
        close access fileRef
        
        display notification "Report exported successfully" with title "Focus Analytics"
    on error
        try
            close access reportFile
        end try
    end try
end exportReport

-- Generate date stamp
on dateStamp()
    set now to current date
    set dateStr to (year of now as text) & "-"
    set dateStr to dateStr & text -2 through -1 of ("0" & ((month of now) as integer))
    set dateStr to dateStr & "-" & text -2 through -1 of ("0" & (day of now))
    return dateStr
end dateStamp

-- Round number
on round(n)
    return (n + 0.5) div 1
end round