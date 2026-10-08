use AppleScript version "2.4"
use scripting additions

on assertEqual(actual, expected, labelText)
    if actual is not expected then error labelText & ": expected " & expected & ", got " & actual
end assertEqual

on run argv
    set parser to load script POSIX file (item 1 of argv)
    set cases to {{"Buy milk @home", "Buy milk", "@home", "", 0}, ¬
        {"Review code +website", "Review code", "", "website", 0}, ¬
        {"Fix bug !1", "Fix bug", "", "", 1}, ¬
        {"Fix bug !2", "Fix bug", "", "", 2}, ¬
        {"Fix bug !3", "Fix bug", "", "", 3}, ¬
        {"Just a simple task", "Just a simple task", "", "", 0}, ¬
        {"  Hej världen  ", "Hej världen", "", "", 0}, ¬
        {"", "", "", "", 0}}
    repeat with c in cases
        set parsed to parser's parseTaskInput(item 1 of c)
        my assertEqual(taskText of parsed, item 2 of c, "task text")
        my assertEqual(context of parsed, item 3 of c, "context")
        my assertEqual(project of parsed, item 4 of c, "project")
        my assertEqual(priority of parsed, item 5 of c, "priority")
    end repeat
    set parsed to parser's parseTaskInput("Call dentist @errands +health !2")
    my assertEqual(context of parsed, "@errands", "combined context")
    my assertEqual(project of parsed, "health", "combined project")
    my assertEqual(priority of parsed, 2, "combined priority")
    my assertEqual(parser's parseTime("2:30pm"), 14 * hours + 30 * minutes, "time parsing")
    repeat with relativeDay in {"today", "tomorrow", "next week"}
        set parsed to parser's parseTaskInput("Plan " & relativeDay)
        if dueDate of parsed is missing value then error "Missing due date for " & relativeDay
        my assertEqual(taskText of parsed, "Plan", "date removed from task")
        set expectedDate to current date
        set time of expectedDate to 0
        if relativeDay as text is "tomorrow" then set expectedDate to expectedDate + days
        if relativeDay as text is "next week" then set expectedDate to expectedDate + 7 * days
        my assertEqual(dueDate of parsed, expectedDate, "relative due date")
    end repeat
    set parsed to parser's parseTaskInput("Buy 2 books tomorrow")
    my assertEqual(taskText of parsed, "Buy 2 books", "quantities preserved")
    my assertEqual(time of dueDate of parsed, 0, "quantity is not a time")
    set parsed to parser's parseTaskInput("Meeting tomorrow at 2pm")
    my assertEqual(taskText of parsed, "Meeting", "entire time expression removed")
    my assertEqual(time of dueDate of parsed, 14 * hours, "explicit time")
    set parsed to parser's parseTaskInput("Report due:today")
    my assertEqual(taskText of parsed, "Report", "due prefix removed")
    set parsed to parser's parseTaskInput("Review tomorrowland")
    my assertEqual(taskText of parsed, "Review tomorrowland", "date word boundaries")
    if dueDate of parsed is not missing value then error "Substring became a date"
    set parsed to parser's parseTaskInput("Task due:2030-05-20")
    my assertEqual(taskText of parsed, "Task", "ISO marker removed")
    my assertEqual(year of dueDate of parsed, 2030, "ISO year")
    my assertEqual(month of dueDate of parsed as integer, 5, "ISO month")
    my assertEqual(day of dueDate of parsed, 20, "ISO day")
    if parser's parseTime("25:00") is not missing value then error "Invalid hour accepted"
    if parser's parseTime("12:60") is not missing value then error "Invalid minute accepted"
    my assertEqual(parser's reminderPriority(2), 5, "medium reminder priority")
    my assertEqual(parser's reminderPriority(3), 9, "low reminder priority")
    set rejected to false
    try
        parser's parseTaskInput("Task due:2030-02-30")
    on error
        set rejected to true
    end try
    if not rejected then error "Impossible date accepted"
    return "Production parser checks passed"
end run
