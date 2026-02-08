#!/bin/bash
set -euo pipefail

echo "MacGTD — Notion API Setup"
echo "========================="
echo ""
echo "1. Create an integration at: https://www.notion.so/my-integrations"
echo "2. Share your GTD database with the integration"
echo "3. Copy the database ID from the database URL"
echo ""
read -rsp "Enter your Notion API token (Internal Integration Token): " TOKEN
echo ""
read -rp "Enter your Notion database ID: " DB_ID

if [[ -z "$TOKEN" || -z "$DB_ID" ]]; then
    echo "Error: Both token and database ID are required."
    exit 1
fi

security add-generic-password -s "MacGTD-Notion" -a "api-token" -w "$TOKEN" -U
security add-generic-password -s "MacGTD-Notion" -a "database-id" -w "$DB_ID" -U

echo ""
echo "Notion credentials stored in macOS Keychain."
echo ""
echo "Required database properties:"
echo "  - Name (title)"
echo "  - Status (select: Inbox, Next, Waiting, Someday)"
echo "  - Priority (select: High, Medium, Low)"
echo "  - Due (date)"
