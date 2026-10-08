#!/usr/bin/env python3
"""Embed shared capture adapters and the production parser; --check rejects drift."""
import argparse
from pathlib import Path
import plistlib
import re

ROOT = Path(__file__).resolve().parents[1]
PROVIDERS = {
    "todoist": ("Todoist", "MACGTD_TODOIST_TOKEN", "MACGTD_TODOIST_PROJECT_ID", "project-id"),
    "notion": ("Notion", "MACGTD_NOTION_TOKEN", "MACGTD_NOTION_DATA_SOURCE_ID", "data-source-id"),
    "microsoft": ("Microsoft To Do", "MACGTD_MICROSOFT_TOKEN", "MACGTD_MICROSOFT_LIST_ID", "list-id"),
    "google": ("Google Keep", "MACGTD_GOOGLE_TOKEN", "", ""),
}


def embedded(provider):
    adapter = (ROOT / "workflows/api/provider-capture.applescript").read_text(encoding="utf-8")
    label, token, target, account = PROVIDERS[provider]
    service = {"microsoft": "Microsoft", "google": "Google"}.get(provider, label)
    values = {"providerName": provider, "captureTitle": label + " GTD Quick Capture",
              "keychainService": "MacGTD-" + service, "tokenEnvironment": token,
              "targetEnvironment": target, "targetAccount": account}
    for name, value in values.items():
        adapter, count = re.subn(r'^property ' + name + r' : ".*"$',
                                 lambda _, property_name=name, property_value=value: f'property {property_name} : "{property_value}"',
                                 adapter, flags=re.MULTILINE)
        if count != 1:
            raise ValueError(f"Expected exactly one {name} property")
    parser = (ROOT / "workflows/alfred/workflow/scripts/natural_language_task.scpt").read_text(encoding="utf-8")
    # Keep parsing independent of Reminders dictionaries and creation side effects.
    properties = parser[parser.index("property contextPattern"):parser.index("on run argv")]
    handlers = parser[parser.index("on parseTaskInput"):parser.index("on reminderPriority")]
    utilities = parser[parser.index("on findPattern"):]
    return adapter + "\n" + properties + handlers + utilities


def main():
    args_parser = argparse.ArgumentParser(description=__doc__)
    args_parser.add_argument("--check", action="store_true")
    args = args_parser.parse_args()
    for provider in PROVIDERS:
        path = next((ROOT / "workflows" / provider).glob("*.workflow")) / "Contents/document.wflow"
        data = plistlib.loads(path.read_bytes())
        action = data["actions"][0]["action"]["ActionParameters"]
        source = embedded(provider)
        if args.check:
            if action["source"] != source:
                raise SystemExit("API adapter drifted; run mise exec -- python scripts/sync-provider-workflows.py")
        else:
            action["source"] = source
            path.write_bytes(plistlib.dumps(data, sort_keys=False))
    # Alfred Todoist routing uses the same adapter instead of an unpinned CLI.
    source = embedded("todoist")
    source, count = re.subn(r"on run \{input, parameters\}\n.*?end run", lambda _: '''on run argv
    if count of argv is not 1 then error "Provide one task description"
    return my createdIdentifier(my captureTask(item 1 of argv))
end run''', source, count=1, flags=re.DOTALL)
    if count != 1:
        raise SystemExit("Expected exactly one provider run handler")
    path = ROOT / "workflows/alfred/workflow/scripts/api_todoist.scpt"
    if args.check:
        if not path.exists() or path.read_text(encoding="utf-8") != source:
            raise SystemExit("Alfred Todoist adapter drifted; run scripts/sync-provider-workflows.py")
    else:
        path.write_text(source, encoding="utf-8")


if __name__ == "__main__":
    main()
