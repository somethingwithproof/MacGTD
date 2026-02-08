#!/bin/bash
set -euo pipefail

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

PASSED=0
FAILED=0
REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

pass() {
    echo -e "  ${GREEN}PASS${NC}: $1"
    PASSED=$((PASSED + 1))
}

fail() {
    echo -e "  ${RED}FAIL${NC}: $1"
    FAILED=$((FAILED + 1))
}

section() {
    echo -e "\n${YELLOW}$1${NC}"
}

# --- Structure checks ---
section "Repository structure"

for f in README.md LICENSE CHANGELOG.md CONTRIBUTING.md SECURITY.md CODEOWNERS; do
    if [[ -f "${REPO_ROOT}/${f}" ]]; then
        pass "${f} exists"
    else
        fail "${f} missing"
    fi
done

for d in workflows/apple workflows/microsoft workflows/google workflows/alfred workflows/shortcuts; do
    if [[ -d "${REPO_ROOT}/${d}" ]]; then
        pass "${d}/ exists"
    else
        fail "${d}/ missing"
    fi
done

# --- Automator workflow checks ---
section "Automator workflows"

check_automator_workflow() {
    local platform="$1"
    local wf="$2"
    local wf_path="${REPO_ROOT}/workflows/${platform}/${wf}"

    if [[ -d "${wf_path}" ]]; then
        pass "${platform}: ${wf} bundle exists"
    else
        fail "${platform}: ${wf} bundle missing"
        return
    fi

    for bundle_file in Contents/document.wflow Contents/info.plist; do
        if [[ -f "${wf_path}/${bundle_file}" ]]; then
            pass "${platform}: ${bundle_file} exists"
        else
            fail "${platform}: ${bundle_file} missing"
        fi
    done

    local wflow="${wf_path}/Contents/document.wflow"
    if [[ -f "${wflow}" ]]; then
        if xmllint --noout "${wflow}" 2>/dev/null; then
            pass "${platform}: document.wflow is valid XML"
        else
            fail "${platform}: document.wflow XML validation failed"
        fi
    fi
}

check_automator_workflow "apple" "GTD-QuickCapture.workflow"
check_automator_workflow "microsoft" "MS-GTD-QuickCapture.workflow"
check_automator_workflow "google" "Google-GTD-QuickCapture.workflow"

# --- Alfred workflow checks ---
section "Alfred workflow"

ALFRED_DIR="${REPO_ROOT}/workflows/alfred"

if [[ -f "${ALFRED_DIR}/workflow/info.plist" ]]; then
    pass "Alfred info.plist exists"
else
    fail "Alfred info.plist missing"
fi

if [[ -d "${ALFRED_DIR}/GTDLib.scptd" ]]; then
    pass "GTDLib.scptd exists"
else
    fail "GTDLib.scptd missing"
fi

SCRIPT_COUNT=$(find "${ALFRED_DIR}/workflow/scripts" -name "*.scpt" 2>/dev/null | wc -l | tr -d ' ')
if [[ "${SCRIPT_COUNT}" -ge 1 ]]; then
    pass "Alfred scripts present (${SCRIPT_COUNT} files)"
else
    fail "No Alfred scripts found"
fi

# --- Shortcuts checks ---
section "Shortcuts integration"

if [[ -d "${REPO_ROOT}/workflows/shortcuts" ]]; then
    pass "shortcuts/ directory exists"
else
    fail "shortcuts/ directory missing"
fi

if [[ -f "${REPO_ROOT}/workflows/shortcuts/install-shortcut.sh" ]]; then
    pass "install-shortcut.sh exists"
else
    fail "install-shortcut.sh missing"
fi

if [[ -x "${REPO_ROOT}/workflows/shortcuts/install-shortcut.sh" ]]; then
    pass "install-shortcut.sh is executable"
else
    fail "install-shortcut.sh not executable"
fi

# --- CI checks ---
section "CI and templates"

if [[ -f "${REPO_ROOT}/.github/workflows/ci.yml" ]]; then
    pass "CI workflow exists"
else
    fail "CI workflow missing"
fi

TEMPLATE_COUNT=$(find "${REPO_ROOT}/.github/ISSUE_TEMPLATE" -name "*.yml" 2>/dev/null | wc -l | tr -d ' ')
if [[ "${TEMPLATE_COUNT}" -ge 2 ]]; then
    pass "Issue templates present (${TEMPLATE_COUNT} files)"
else
    fail "Issue templates missing or insufficient"
fi

if [[ -f "${REPO_ROOT}/.github/PULL_REQUEST_TEMPLATE.md" ]]; then
    pass "PR template exists"
else
    fail "PR template missing"
fi

# --- Summary ---
TOTAL=$((PASSED + FAILED))
echo -e "\n${YELLOW}Results: ${PASSED}/${TOTAL} passed${NC}"

if [[ "${FAILED}" -gt 0 ]]; then
    echo -e "${RED}${FAILED} check(s) failed${NC}"
    exit 1
else
    echo -e "${GREEN}All checks passed${NC}"
    exit 0
fi
