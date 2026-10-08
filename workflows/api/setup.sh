#!/bin/bash
set -euo pipefail
provider=${1:?Usage: setup.sh notion|todoist|microsoft|google}
target_account=""
case "$provider" in
    notion)
        service="MacGTD-Notion"
        echo "Create a Notion connection and share the target database with it."
        echo "Use Manage data sources > Copy data source ID (not the database URL ID)."
        target_account="data-source-id"
        ;;
    todoist)
        service="MacGTD-Todoist"
        echo "Get a Todoist API token from Settings > Integrations > Developer."
        echo "Capture uses the unified API: https://api.todoist.com/api/v1/tasks"
        ;;
    microsoft)
        service="MacGTD-Microsoft"
        echo "Supply a Microsoft Graph delegated OAuth access token with Tasks.ReadWrite."
        echo "Choose a list ID from GET https://graph.microsoft.com/v1.0/me/todo/lists"
        target_account="list-id"
        ;;
    google)
        service="MacGTD-Google"
        echo "Supply an authorized Workspace OAuth access token for Google Keep."
        echo "Required scope: https://www.googleapis.com/auth/keep"
        echo "Keep API access requires an eligible Workspace account and administrator authorization."
        ;;
    *) echo "Unknown provider" >&2; exit 1 ;;
esac
read -rsp "API/OAuth token: " capture_token
printf '\n'
[[ -n "$capture_token" ]] || { echo "A token is required" >&2; exit 1; }
if [[ "$capture_token" == *$'\n'* || "$capture_token" == *$'\r'* ]]; then
    echo "Token must not contain newlines" >&2
    exit 1
fi
capture_target=""
if [[ -n "$target_account" ]]; then
    read -rp "$target_account: " capture_target
    [[ -n "$capture_target" ]] || { echo "A target ID is required" >&2; exit 1; }
fi
escape_security_value() {
    local value="$1"
    value=${value//\\/\\\\}
    value=${value//\"/\\\"}
    builtin printf '%s' "$value"
}
# security's interactive parser reads the secret from stdin, not process argv.
escaped_token=$(escape_security_value "$capture_token")
builtin printf 'add-generic-password -s "%s" -a "api-token" -w "%s" -U\n' \
    "$service" "$escaped_token" | security -i
stored_token=$(security find-generic-password -s "$service" -a "api-token" -w)
[[ "$stored_token" == "$capture_token" ]] || { echo "Keychain write verification failed" >&2; exit 1; }
if [[ -n "$target_account" ]]; then
    security add-generic-password -s "$service" -a "$target_account" -w "$capture_target" -U
fi
unset capture_token capture_target escaped_token stored_token
echo "Configuration stored in macOS Keychain. See workflows/api/README.md."
