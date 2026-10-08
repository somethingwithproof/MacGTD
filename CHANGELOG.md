# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### API modernization

- Notion capture uses API version 2026-03-11 and explicit data source parents, with unambiguous migration from existing database IDs.
- Microsoft To Do capture uses Microsoft Graph v1.0 with delegated OAuth authorization; Google Keep capture uses Workspace Keep API v1. Undocumented browser capture shortcuts are replaced by confirmed API creation.
- Alfred Todoist capture uses the shared unified API v1 adapter instead of an external CLI; setup no longer references retired REST v2 endpoints.
- API workflows embed a shared adapter and production task parser, with explicit JSON keys, bounded HTTPS transport, and redacted errors.
- Hosted native E2E now exercises all four API dialogs against a local TLS fixture and verifies persistence and failure behavior. Separate live vendor and licensed desktop suites fail on missing prerequisites; live account verification remains pending dedicated credentials.

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
