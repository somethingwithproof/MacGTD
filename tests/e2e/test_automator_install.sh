#!/bin/bash
set -euo pipefail

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASSED=0
FAILED=0
REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

section() { echo -e "\n${YELLOW}$1${NC}"; }
pass()    { echo -e "  ${GREEN}PASS${NC}: $1"; PASSED=$((PASSED + 1)); }
fail()    { echo -e "  ${RED}FAIL${NC}: $1"; FAILED=$((FAILED + 1)); }

section "Automator Workflow Installation Tests"

# Test each workflow can be opened by Automator
for platform in apple microsoft google; do
    workflow_dir="${REPO_ROOT}/workflows/${platform}"
    workflow=$(find "$workflow_dir" -name "*.workflow" -maxdepth 1 -type d 2>/dev/null | head -1)

    if [[ -z "$workflow" ]]; then
        fail "${platform}: No workflow found"
        continue
    fi

    workflow_name=$(basename "$workflow")

    # Test: Copy to user's Services directory
    SERVICES_DIR="$HOME/Library/Services"
    mkdir -p "$SERVICES_DIR"

    if cp -R "$workflow" "$SERVICES_DIR/" 2>/dev/null; then
        pass "${platform}: ${workflow_name} installed to Services"
    else
        fail "${platform}: Could not install ${workflow_name}"
        continue
    fi

    # Test: Verify it appears in Services
    INSTALLED="${SERVICES_DIR}/${workflow_name}"
    if [[ -d "$INSTALLED" ]]; then
        pass "${platform}: ${workflow_name} present in Services"
    else
        fail "${platform}: ${workflow_name} not found in Services"
    fi

    # Test: Validate installed copy XML
    WFLOW="${INSTALLED}/Contents/document.wflow"
    if xmllint --noout "$WFLOW" 2>/dev/null; then
        pass "${platform}: installed workflow XML valid"
    else
        fail "${platform}: installed workflow XML invalid"
    fi

    # Test: Extract and compile embedded AppleScript
    if plutil -extract 'actions.0.action.ActionParameters.source' raw "$WFLOW" > /tmp/e2e_test_script.applescript 2>/dev/null; then
        if osacompile -o /dev/null /tmp/e2e_test_script.applescript 2>/dev/null; then
            pass "${platform}: embedded AppleScript compiles after install"
        else
            fail "${platform}: embedded AppleScript compile error after install"
        fi
        rm -f /tmp/e2e_test_script.applescript
    else
        fail "${platform}: could not extract AppleScript from installed workflow"
    fi

    # Cleanup - remove from Services
    rm -rf "$INSTALLED"
done

# Summary
TOTAL=$((PASSED + FAILED))
echo ""
echo -e "${YELLOW}Installation Tests: ${PASSED}/${TOTAL} passed${NC}"

if [[ "$FAILED" -gt 0 ]]; then
    echo -e "${RED}${FAILED} test(s) failed${NC}"
    exit 1
fi
