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

cleanup() {
    # Clean up test list if it exists
    osascript -e 'tell application "Reminders" to if exists list "CI-Test-List" then delete list "CI-Test-List"' 2>/dev/null || true
}

trap cleanup EXIT

section "Reminders API Integration Tests (Headless)"

# Test 1: Can we launch Reminders and access scripting bridge?
if osascript -e 'tell application "Reminders" to return name of default list' >/dev/null 2>&1; then
    pass "Reminders scripting bridge accessible"
else
    fail "Reminders scripting bridge not accessible"
    echo "    This may fail in CI if EventKit permissions not granted"
fi

# Test 2: Create temporary test list
if osascript -e 'tell application "Reminders" to make new list with properties {name:"CI-Test-List"}' >/dev/null 2>&1; then
    pass "Can create Reminders list"
else
    fail "Cannot create Reminders list"
fi

# Test 3: Add reminder to test list
if osascript -e 'tell application "Reminders" to tell list "CI-Test-List" to make new reminder with properties {name:"Test Task"}' >/dev/null 2>&1; then
    pass "Can create reminder"
else
    fail "Cannot create reminder"
fi

# Test 4: Set due date
if osascript -e 'tell application "Reminders" to tell list "CI-Test-List" to set due date of first reminder to (current date)' >/dev/null 2>&1; then
    pass "Can set due date"
else
    fail "Cannot set due date"
fi

# Test 5: Set priority
if osascript -e 'tell application "Reminders" to tell list "CI-Test-List" to set priority of first reminder to 1' >/dev/null 2>&1; then
    pass "Can set priority"
else
    fail "Cannot set priority"
fi

# Test 6: Read reminder properties
REMINDER_NAME=$(osascript -e 'tell application "Reminders" to tell list "CI-Test-List" to return name of first reminder' 2>/dev/null || echo "")
if [[ "$REMINDER_NAME" == "Test Task" ]]; then
    pass "Can read reminder properties"
else
    fail "Cannot read reminder properties (got: '$REMINDER_NAME')"
fi

# Summary
TOTAL=$((PASSED + FAILED))
echo -e "\n${YELLOW}Integration Tests: ${PASSED}/${TOTAL} passed${NC}"

if [[ "$FAILED" -gt 0 ]]; then
    echo -e "${RED}${FAILED} test(s) failed${NC}"
    exit 1
fi
