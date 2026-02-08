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

section "AppleScript Syntax Validation"

# Find all .scpt files and validate with osacompile
while IFS= read -r script; do
    if osacompile -o /dev/null "$script" 2>/dev/null; then
        pass "$(basename "$script") - valid syntax"
    else
        fail "$(basename "$script") - syntax error"
        osacompile -o /dev/null "$script" 2>&1 | sed 's/^/    /'
    fi
done < <(find workflows/alfred -name "*.scpt" -type f)

section "Automator Workflow Validation"

# Extract and compile embedded AppleScripts from .workflow bundles
for workflow in workflows/*/*.workflow; do
    wflow_file="$workflow/Contents/document.wflow"
    if [[ -f "$wflow_file" ]]; then
        # Extract AppleScript source using PlistBuddy or plutil
        if plutil -extract 'actions.0.action.ActionParameters.source' raw "$wflow_file" > /tmp/extracted.applescript 2>/dev/null; then
            if osacompile -o /dev/null /tmp/extracted.applescript 2>/dev/null; then
                pass "$(basename "$workflow") - embedded script valid"
            else
                fail "$(basename "$workflow") - embedded script has syntax errors"
                osacompile -o /dev/null /tmp/extracted.applescript 2>&1 | sed 's/^/    /'
            fi
            rm -f /tmp/extracted.applescript
        else
            fail "$(basename "$workflow") - could not extract embedded script"
        fi
    fi
done

# Summary
TOTAL=$((PASSED + FAILED))
echo -e "\n${YELLOW}Syntax Validation: ${PASSED}/${TOTAL} passed${NC}"

if [[ "$FAILED" -gt 0 ]]; then
    echo -e "${RED}${FAILED} script(s) failed${NC}"
    exit 1
fi
