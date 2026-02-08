# Menu Bar Integration

A status bar plugin showing your GTD inbox count and providing quick access to capture workflows.

## Setup

### Using SwiftBar (recommended)

1. Install SwiftBar: `brew install swiftbar`
2. Set your plugins directory when SwiftBar first launches
3. Symlink or copy this script:
   ```bash
   ln -s "$(pwd)/workflows/menubar/gtd-menubar.sh" ~/Library/Application\ Support/SwiftBar/Plugins/gtd-menubar.5m.sh
   ```
   The `5m` in the filename means it refreshes every 5 minutes.

### Using xbar

1. Install xbar: `brew install xbar`
2. Copy the script to xbar's plugin directory with a refresh interval suffix

## Features

- Shows inbox count in menu bar
- Shows overdue task count (with warning indicator)
- Quick access to all capture workflows
- Lists all Reminders lists with task counts
- One-click to open Reminders or start Weekly Review
- Auto-refreshes every 5 minutes
