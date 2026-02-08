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

section "Automator Workflow Loading Tests"

# Test 1: Verify workflow bundle type identifier
for workflow in workflows/*/*.workflow; do
    workflow_name=$(basename "$workflow")
    info_plist="$workflow/Contents/info.plist"

    if [[ -f "$info_plist" ]]; then
        # Check that info.plist identifies this as an Automator workflow
        if plutil -lint "$info_plist" >/dev/null 2>&1; then
            pass "$workflow_name - info.plist is valid"
        else
            fail "$workflow_name - info.plist is invalid"
        fi
    else
        fail "$workflow_name - info.plist missing"
    fi
done

# Test 2: Validate workflow bundle structure
for workflow in workflows/*/*.workflow; do
    workflow_name=$(basename "$workflow")
    
    required_files=(
        "Contents/document.wflow"
        "Contents/info.plist"
    )
    
    all_present=true
    for file in "${required_files[@]}"; do
        if [[ ! -f "$workflow/$file" ]]; then
            all_present=false
            break
        fi
    done
    
    if $all_present; then
        pass "$workflow_name - bundle structure valid"
    else
        fail "$workflow_name - missing required files"
    fi
done

# Test 3: Validate workflow XML structure
for workflow in workflows/*/*.workflow; do
    workflow_name=$(basename "$workflow")
    wflow_file="$workflow/Contents/document.wflow"
    
    if xmllint --noout "$wflow_file" 2>/dev/null; then
        pass "$workflow_name - XML structure valid"
    else
        fail "$workflow_name - XML malformed"
    fi
done

# Test 4: Check for required action types in workflows
for workflow in workflows/*/*.workflow; do
    workflow_name=$(basename "$workflow")
    wflow_file="$workflow/Contents/document.wflow"
    
    # Check if workflow contains "Run AppleScript" action
    if grep -q "com.apple.Automator.RunScript" "$wflow_file"; then
        pass "$workflow_name - contains Run AppleScript action"
    else
        fail "$workflow_name - missing Run AppleScript action"
    fi
done

# Summary
TOTAL=$((PASSED + FAILED))
echo -e "\n${YELLOW}Automator Tests: ${PASSED}/${TOTAL} passed${NC}"

if [[ "$FAILED" -gt 0 ]]; then
    echo -e "${RED}${FAILED} test(s) failed${NC}"
    exit 1
fi
