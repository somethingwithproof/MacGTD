# Shortcuts.app Integration

A modern alternative to Automator workflows, using Apple's Shortcuts app (macOS 12+).

## Automatic Installation

```bash
./workflows/shortcuts/install-shortcut.sh
```

## Manual Setup — Quick Capture Shortcut

1. Open **Shortcuts.app**
2. Click **+** to create a new shortcut
3. Name it **GTD Quick Capture**
4. Add these actions:

### Actions

1. **Ask for Input** (Text)
   - Question: "Enter task (!1/!2/!3 priority, due:today/tomorrow, @context, +project):"

2. **If** (Provided Input has any value)

3. **Add New Reminder**
   - Title: Provided Input
   - List: Inbox

4. **Show Notification**
   - Title: "GTD Quick Capture"
   - Body: "Task added: [Provided Input]"

5. **Otherwise**

6. **Show Notification**
   - Title: "GTD Quick Capture"
   - Body: "No text entered."

7. **End If**

## Siri Voice Capture

### Setup

1. Create the **GTD Quick Capture** shortcut above
2. Open the shortcut's settings (click the ... icon)
3. Under **Details**, tap **Add to Siri**
4. Record your trigger phrase, e.g.:
   - "Capture task"
   - "Quick capture"
   - "Add to inbox"
5. Tap **Done**

### Alternative: Dictation Shortcut

Create a second shortcut named **GTD Voice Capture**:

1. **Dictate Text**
   - Stop Listening: After Short Pause

2. **Add New Reminder**
   - Title: Dictated Text
   - List: Inbox

3. **Show Notification**
   - Title: "GTD Voice Capture"
   - Body: "Captured: [Dictated Text]"

Add to Siri with trigger: "Voice capture" or "Dictate task"

### Hands-Free Workflow

For a completely hands-free experience:
1. Say "Hey Siri, capture task"
2. Siri prompts you for input
3. Speak your task
4. Task is added to Reminders
5. Siri confirms

### Shortcut Actions Reference

| Action | Shortcut Name | Siri Phrase |
|--------|--------------|-------------|
| Text capture | GTD Quick Capture | "Capture task" |
| Voice capture | GTD Voice Capture | "Dictate task" |
| Clipboard capture | GTD Clipboard Capture | "Capture clipboard" |

## Clipboard Capture Shortcut

Create a shortcut named **GTD Clipboard Capture**:

1. **Get Clipboard**

2. **If** (Clipboard has any value)

3. **Add New Reminder**
   - Title: Clipboard
   - List: Inbox

4. **Show Notification**
   - Title: "GTD Clipboard Capture"
   - Body: "Captured: [Clipboard]"

5. **Otherwise**

6. **Show Notification**
   - Body: "Clipboard is empty"

7. **End If**

## Keyboard Shortcut

After creating any shortcut:

1. Open **System Settings**
2. Go to **Keyboard > Keyboard Shortcuts > Services**
3. Find your shortcut under **General**
4. Assign a keyboard shortcut (e.g., Ctrl+Option+Space)

## Requirements

- macOS 12 (Monterey) or later
- Apple Reminders app
- Siri enabled (for voice capture)
