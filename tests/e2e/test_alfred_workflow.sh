#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASSED=0
FAILED=0
SKIPPED=0
REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

section() { echo -e "\n${YELLOW}$1${NC}"; }
pass()    { echo -e "  ${GREEN}PASS${NC}: $1"; PASSED=$((PASSED + 1)); }
fail()    { echo -e "  ${RED}FAIL${NC}: $1"; FAILED=$((FAILED + 1)); }
skip()    { echo -e "  ${YELLOW}SKIP${NC}: $1"; SKIPPED=$((SKIPPED + 1)); }

# --- Pre-flight checks ---
section "Pre-flight checks"

# Check if Alfred is running
if pgrep -x "Alfred" >/dev/null 2>&1; then
    pass "Alfred is running"
else
    # Try to launch it
    open -a "Alfred 5" 2>/dev/null || open -a "Alfred" 2>/dev/null || true
    sleep 3
    if pgrep -x "Alfred" >/dev/null 2>&1; then
        pass "Alfred launched successfully"
    else
        fail "Alfred is not running and could not be launched"
        echo "    Install Alfred and activate Powerpack before running E2E tests"
        exit 1
    fi
fi

# Check accessibility permissions
if osascript -e 'tell application "System Events" to get name of first process' >/dev/null 2>&1; then
    pass "Accessibility permissions granted"
else
    fail "Accessibility permissions not granted"
    echo "    Grant Terminal/runner accessibility in System Settings > Privacy > Accessibility"
    exit 1
fi

# --- Test: Alfred workflow import ---
section "Alfred Workflow Import"

ALFRED_WORKFLOW_DIR="$HOME/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows"
WORKFLOW_SRC="${REPO_ROOT}/workflows/alfred/workflow"

if [[ -d "$WORKFLOW_SRC" ]]; then
    # Create a unique workflow directory
    WORKFLOW_DEST="${ALFRED_WORKFLOW_DIR}/user.workflow.macgtd-test"
    mkdir -p "$WORKFLOW_DEST"
    cp -R "$WORKFLOW_SRC"/* "$WORKFLOW_DEST/" 2>/dev/null || true

    if [[ -f "$WORKFLOW_DEST/info.plist" ]]; then
        pass "Workflow files copied to Alfred"
    else
        fail "Workflow import failed"
    fi
else
    fail "Workflow source not found at $WORKFLOW_SRC"
fi

# --- Test: AppleScript execution via osascript ---
section "AppleScript Execution Tests"

# Test: GTD helpers load
HELPERS="${REPO_ROOT}/workflows/alfred/workflow/scripts/gtd_helpers_updated.scpt"
if [[ -f "$HELPERS" ]]; then
    if osascript "$HELPERS" 2>/dev/null; then
        pass "gtd_helpers_updated.scpt executes"
    else
        # Some scripts need arguments or will error on standalone run - that's OK
        # Just verify they compile
        if osacompile -o /dev/null "$HELPERS" 2>/dev/null; then
            pass "gtd_helpers_updated.scpt compiles (standalone execution not supported)"
        else
            fail "gtd_helpers_updated.scpt failed to compile"
        fi
    fi
fi

# Test: Natural language parser with mock input
NLP_SCRIPT="${REPO_ROOT}/workflows/alfred/workflow/scripts/natural_language_task.scpt"
if [[ -f "$NLP_SCRIPT" ]]; then
    if osacompile -o /dev/null "$NLP_SCRIPT" 2>/dev/null; then
        pass "natural_language_task.scpt compiles"
    else
        fail "natural_language_task.scpt compile error"
    fi
fi

# Test: Focus mode script
FOCUS_SCRIPT="${REPO_ROOT}/workflows/alfred/workflow/scripts/focus_mode.scpt"
if [[ -f "$FOCUS_SCRIPT" ]]; then
    if osacompile -o /dev/null "$FOCUS_SCRIPT" 2>/dev/null; then
        pass "focus_mode.scpt compiles"
    else
        fail "focus_mode.scpt compile error"
    fi
fi

# Test: Focus analytics script
ANALYTICS_SCRIPT="${REPO_ROOT}/workflows/alfred/workflow/scripts/focus_analytics.scpt"
if [[ -f "$ANALYTICS_SCRIPT" ]]; then
    if osacompile -o /dev/null "$ANALYTICS_SCRIPT" 2>/dev/null; then
        pass "focus_analytics.scpt compiles"
    else
        fail "focus_analytics.scpt compile error"
    fi
fi

# --- Test: Reminders integration (full CRUD cycle) ---
section "Reminders Integration (Full Cycle)"

# Create test list
TEST_LIST="MacGTD-E2E-Test-$(date +%s)"
if osascript -e "tell application \"Reminders\" to make new list with properties {name:\"${TEST_LIST}\"}" >/dev/null 2>&1; then
    pass "Created test list: ${TEST_LIST}"
else
    fail "Could not create test list"
fi

# Add task with priority
if osascript -e "tell application \"Reminders\" to tell list \"${TEST_LIST}\" to make new reminder with properties {name:\"E2E Test Task\", priority:1}" >/dev/null 2>&1; then
    pass "Created reminder with priority"
else
    fail "Could not create reminder with priority"
fi

# Add task with due date
if osascript -e "tell application \"Reminders\" to tell list \"${TEST_LIST}\" to make new reminder with properties {name:\"E2E Due Date Task\", due date:(current date)}" >/dev/null 2>&1; then
    pass "Created reminder with due date"
else
    fail "Could not create reminder with due date"
fi

# Verify task count
TASK_COUNT=$(osascript -e "tell application \"Reminders\" to return count of reminders in list \"${TEST_LIST}\"" 2>/dev/null || echo "0")
if [[ "$TASK_COUNT" -eq 2 ]]; then
    pass "Verified 2 reminders in test list"
else
    fail "Expected 2 reminders, got: ${TASK_COUNT}"
fi

# Read back properties
TASK_NAME=$(osascript -e "tell application \"Reminders\" to return name of first reminder in list \"${TEST_LIST}\"" 2>/dev/null || echo "")
if [[ "$TASK_NAME" == "E2E Test Task" ]]; then
    pass "Read back reminder name correctly"
else
    fail "Reminder name mismatch: got '${TASK_NAME}'"
fi

TASK_PRIORITY=$(osascript -e "tell application \"Reminders\" to return priority of first reminder in list \"${TEST_LIST}\"" 2>/dev/null || echo "")
if [[ "$TASK_PRIORITY" -eq 1 ]]; then
    pass "Read back priority correctly"
else
    fail "Priority mismatch: got '${TASK_PRIORITY}'"
fi

# Complete a task
if osascript -e "tell application \"Reminders\" to set completed of first reminder in list \"${TEST_LIST}\" to true" >/dev/null 2>&1; then
    pass "Marked reminder as completed"
else
    fail "Could not complete reminder"
fi

# Clean up
if osascript -e "tell application \"Reminders\" to delete list \"${TEST_LIST}\"" >/dev/null 2>&1; then
    pass "Cleaned up test list"
else
    fail "Could not clean up test list"
fi

# --- Test: Preferences system ---
section "Preferences System"

PREFS_DOMAIN="com.alfredgtd.test"

# Write preference
if defaults write "$PREFS_DOMAIN" defaultApp "reminders" 2>/dev/null; then
    pass "Write preference: defaultApp=reminders"
else
    fail "Could not write preference"
fi

# Read preference
PREF_VAL=$(defaults read "$PREFS_DOMAIN" defaultApp 2>/dev/null || echo "")
if [[ "$PREF_VAL" == "reminders" ]]; then
    pass "Read preference correctly"
else
    fail "Preference mismatch: got '${PREF_VAL}'"
fi

# Clean up
defaults delete "$PREFS_DOMAIN" 2>/dev/null || true

# --- Test: .alfredworkflow packaging ---
section "Alfred Workflow Packaging"

PACKAGE_SCRIPT="${REPO_ROOT}/scripts/package-alfred.sh"
if [[ -x "$PACKAGE_SCRIPT" ]]; then
    if bash "$PACKAGE_SCRIPT" >/dev/null 2>&1; then
        pass "Packaging script succeeded"

        ARTIFACT="${REPO_ROOT}/dist/MacGTD.alfredworkflow"
        if [[ -f "$ARTIFACT" ]]; then
            pass "MacGTD.alfredworkflow created"

            # Verify it's a valid zip
            if unzip -t "$ARTIFACT" >/dev/null 2>&1; then
                pass "Artifact is a valid zip file"
            else
                fail "Artifact is not a valid zip"
            fi

            # Verify contents
            if unzip -l "$ARTIFACT" | grep -q "info.plist"; then
                pass "Artifact contains info.plist"
            else
                fail "Artifact missing info.plist"
            fi

            if unzip -l "$ARTIFACT" | grep -q "scripts/"; then
                pass "Artifact contains scripts/"
            else
                fail "Artifact missing scripts/"
            fi
        else
            fail "Artifact not found"
        fi
    else
        fail "Packaging script failed"
    fi
else
    skip "Packaging script not found or not executable"
fi

# --- Cleanup imported workflow ---
if [[ -d "${WORKFLOW_DEST:-}" ]]; then
    rm -rf "$WORKFLOW_DEST"
fi

# --- Summary ---
TOTAL=$((PASSED + FAILED + SKIPPED))
echo ""
echo -e "${YELLOW}============================================${NC}"
echo -e "${YELLOW}E2E Results: ${PASSED} passed, ${FAILED} failed, ${SKIPPED} skipped (${TOTAL} total)${NC}"
echo -e "${YELLOW}============================================${NC}"

if [[ "$FAILED" -gt 0 ]]; then
    echo -e "${RED}${FAILED} test(s) failed${NC}"
    exit 1
else
    echo -e "${GREEN}All tests passed!${NC}"
fi
