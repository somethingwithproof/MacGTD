# Shortcuts.app Integration

A modern alternative to Automator workflows, using Apple's Shortcuts app (macOS 12+).

## Automatic Installation

```bash
./workflows/shortcuts/install-shortcut.sh
```

## Manual Setup

If automatic installation doesn't work, create the shortcut manually:

1. Open **Shortcuts.app**
2. Click **+** to create a new shortcut
3. Name it **GTD Quick Capture**
4. Add these actions in order:

### Actions

1. **Ask for Input** (Text)
   - Question: "Enter task (!1/!2/!3 for priority, due:today/tomorrow for date):"

2. **If** (Provided Input has any value)

3. **Add New Reminder**
   - Title: Provided Input
   - List: Inbox
   - (Priority and due date must be set manually or via a more complex shortcut)

4. **Show Notification**
   - Title: "GTD Quick Capture"
   - Body: "Task added: [Provided Input]"

5. **Otherwise** (empty input)

6. **Show Notification**
   - Title: "GTD Quick Capture"
   - Body: "No text entered."

7. **End If**

### Keyboard Shortcut

After creating the shortcut:

1. Open **System Settings**
2. Go to **Keyboard > Keyboard Shortcuts > Services**
3. Find your shortcut under **General**
4. Assign a keyboard shortcut (e.g., Ctrl+Option+Space)

## Requirements

- macOS 12 (Monterey) or later
- Apple Reminders app
