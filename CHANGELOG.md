# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

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
