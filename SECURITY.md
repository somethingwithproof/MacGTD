# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.x     | Yes       |

## Reporting a Vulnerability

If you discover a security issue, please report it responsibly:

1. **Do not** open a public issue
2. Email: Open a [private security advisory](https://github.com/thomasvincent/MacGTD/security/advisories/new)
3. Include steps to reproduce and potential impact

You should receive a response within 72 hours.

## Scope

These workflows interact with:
- macOS Automator (sandboxed)
- Apple Reminders, Microsoft To Do, Google Keep (via AppleScript or URL schemes)
- Alfred (via AppleScript)

No network requests are made except by the Google workflow, which opens a URL in the default browser.
