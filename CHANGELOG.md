# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Fixed

- Native capture uses the tested production parser; date markers, token boundaries, priorities, and list routing preserve task text.
- Alfred's referenced task, note, project, and inbox actions are shipped and receive input as arguments.
- Preferences provide built-in defaults, typed nested settings, validated imports, and atomic writes.
- Focus sessions persist across processes with owned launchd timers, cancellation, expiry, and structured analytics logs.
- GTDLib contains an editable source and compiled native implementation for tasks, dashboard counts, notes, and inbox review.
- API workflow payloads use JSON serialization and bounded transport with confirmed responses; live provider tests remain deferred.
- Menu output no longer fails on an empty trailing line; optional runner bootstrap uses valid shell and manual desktop permissions.

### Changed

- CI validates on GitHub-hosted macOS 15 and 26 and runs native desktop E2E on a disposable hosted macOS 15 Intel runner.
- Pull requests, main-branch pushes, scheduled runs, and manual dispatches exercise real Automator dialogs, Reminders, and Calendar with isolated fixtures and retained JUnit/log artifacts.
- Licensed Alfred UI testing remains a separate local suite; hosted tests execute the packaged native actions directly.

## [1.0.0] - 2026-02-08

### Added

- Consolidated all GTD workflows into a single repository
- Apple Reminders quick-capture workflow (from MacGTD-Native)
- Microsoft To Do quick-capture workflow (from MacGTD-Microsoft)
- Google Keep quick-capture workflow (from MacGTD-Google)
- Alfred workflow with natural language parsing (from AlfredGTD)
  - Multi-app support: Reminders, Todoist, Things, OmniFocus
  - Context, project, priority, and date extraction
  - Focus mode with analytics
  - Configurable preferences
- Unified CI pipeline
- Repository validation tests
- Issue templates (feature, bug, task)
- Contributing guide and security policy

### Changed

- Reorganized directory structure under `workflows/` subdirectories

### Deprecated

- Individual repos (MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, AlfredGTD) are now archived
