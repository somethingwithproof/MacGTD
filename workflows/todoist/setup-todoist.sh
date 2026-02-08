#!/bin/bash
set -euo pipefail

echo "MacGTD — Todoist API Setup"
echo "=========================="
echo ""
echo "Get your API token from: https://todoist.com/prefs/integrations"
echo ""
read -rsp "Enter your Todoist API token: " TOKEN
echo ""

if [[ -z "$TOKEN" ]]; then
    echo "Error: No token provided."
    exit 1
fi

security add-generic-password -s "MacGTD-Todoist" -a "api-token" -w "$TOKEN" -U
echo "Token stored in macOS Keychain."
echo ""
echo "To test: curl -s -H 'Authorization: Bearer TOKEN' https://api.todoist.com/rest/v2/projects"
