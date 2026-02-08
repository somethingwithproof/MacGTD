#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASSED=0
FAILED=0

section() {
    echo -e "\n${YELLOW}$1${NC}"
}

pass() {
    echo -e "  ${GREEN}✓${NC} $1"
    PASSED=$((PASSED + 1))
}

fail() {
    echo -e "  ${RED}✗${NC} $1"
    FAILED=$((FAILED + 1))
}

# Create test wrapper that extracts parsing logic without creating tasks
cat > /tmp/test_parser.applescript << 'APPLESCRIPT'
use AppleScript version "2.4"
use scripting additions
use framework "Foundation"

property contextPattern : "@[a-zA-Z0-9-_]+"
property projectPattern : "\\+[a-zA-Z0-9-_]+"
property priorityPattern : "![1-3]"

on run argv
    if (count of argv) = 0 then
        error "No task text provided"
    end if
    
    set taskInput to item 1 of argv as text
    set parsedTask to my parseTaskInput(taskInput)
    
    -- Return JSON-like output for validation
    set output to "{"
    set output to output & "\"taskText\":\"" & (taskText of parsedTask) & "\","
    set output to output & "\"context\":\"" & (context of parsedTask) & "\","
    set output to output & "\"project\":\"" & (project of parsedTask) & "\","
    set output to output & "\"priority\":" & (priority of parsedTask)
    set output to output & "}"
    
    return output
end run

on parseTaskInput(inputText)
    set taskData to {originalText:inputText, taskText:"", context:"", project:"", dueDate:missing value, priority:0, notes:""}
    
    -- Extract context (@context)
    set contextMatch to my findPattern(inputText, contextPattern)
    if contextMatch is not "" then
        set context of taskData to contextMatch
        set inputText to my removePattern(inputText, contextMatch)
    end if
    
    -- Extract project (+project)
    set projectMatch to my findPattern(inputText, projectPattern)
    if projectMatch is not "" then
        set project of taskData to text 2 through -1 of projectMatch
        set inputText to my removePattern(inputText, projectMatch)
    end if
    
    -- Extract priority (!1, !2, !3)
    set priorityMatch to my findPattern(inputText, priorityPattern)
    if priorityMatch is not "" then
        set priority of taskData to text 2 of priorityMatch as integer
        set inputText to my removePattern(inputText, priorityMatch)
    end if
    
    set taskText of taskData to my trimText(inputText)
    
    return taskData
end parseTaskInput

on findPattern(theText, thePattern)
    try
        set theString to current application's NSString's stringWithString:theText
        set theRegEx to current application's NSRegularExpression's regularExpressionWithPattern:thePattern options:0 |error|:(missing value)
        set theResult to theRegEx's firstMatchInString:theString options:0 range:{0, theString's |length|()}
        if theResult is not missing value then
            return (theString's substringWithRange:(theResult's range())) as text
        end if
    end try
    return ""
end findPattern

on removePattern(theText, patternText)
    set AppleScript's text item delimiters to patternText
    set textParts to text items of theText
    set AppleScript's text item delimiters to " "
    set cleanedText to textParts as text
    set AppleScript's text item delimiters to ""
    return cleanedText
end removePattern

on trimText(theText)
    set theString to current application's NSString's stringWithString:theText
    return (theString's stringByTrimmingCharactersInSet:(current application's NSCharacterSet's whitespaceAndNewlineCharacterSet())) as text
end trimText
APPLESCRIPT

section "Natural Language Parser Unit Tests"

# Test 1: Parse context
result=$(osascript /tmp/test_parser.applescript "Buy milk @home" 2>&1)
if [[ "$result" == *'"context":"@home"'* ]] && [[ "$result" == *'"taskText":"Buy milk"'* ]]; then
    pass "Context parsing (@home)"
else
    fail "Context parsing - got: $result"
fi

# Test 2: Parse project
result=$(osascript /tmp/test_parser.applescript "Review code +website" 2>&1)
if [[ "$result" == *'"project":"website"'* ]] && [[ "$result" == *'"taskText":"Review code"'* ]]; then
    pass "Project parsing (+website)"
else
    fail "Project parsing - got: $result"
fi

# Test 3: Parse priority
result=$(osascript /tmp/test_parser.applescript "Fix bug !1" 2>&1)
if [[ "$result" == *'"priority":1'* ]] && [[ "$result" == *'"taskText":"Fix bug"'* ]]; then
    pass "Priority parsing (!1)"
else
    fail "Priority parsing - got: $result"
fi

# Test 4: Parse combined
result=$(osascript /tmp/test_parser.applescript "Call dentist @errands +health !2" 2>&1)
if [[ "$result" == *'"context":"@errands"'* ]] && \
   [[ "$result" == *'"project":"health"'* ]] && \
   [[ "$result" == *'"priority":2'* ]] && \
   [[ "$result" == *'"taskText":"Call dentist"'* ]]; then
    pass "Combined parsing (@errands +health !2)"
else
    fail "Combined parsing - got: $result"
fi

# Test 5: Plain text (no metadata)
result=$(osascript /tmp/test_parser.applescript "Just a simple task" 2>&1)
if [[ "$result" == *'"taskText":"Just a simple task"'* ]] && \
   [[ "$result" == *'"context":""'* ]] && \
   [[ "$result" == *'"priority":0'* ]]; then
    pass "Plain text parsing"
else
    fail "Plain text parsing - got: $result"
fi

# Cleanup
rm -f /tmp/test_parser.applescript

# Summary
TOTAL=$((PASSED + FAILED))
echo -e "\n${YELLOW}Parser Tests: ${PASSED}/${TOTAL} passed${NC}"

if [[ "$FAILED" -gt 0 ]]; then
    echo -e "${RED}${FAILED} test(s) failed${NC}"
    exit 1
fi
