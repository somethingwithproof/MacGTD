# Notion capture

`Notion-GTD-QuickCapture.workflow` creates pages with `Notion-Version: 2026-03-11` and an explicit `data_source_id` parent.

## Setup

Create a Notion connection and share the GTD database with it. In the database's **Manage data sources** menu, copy the intended data source ID. From the repository root:

```bash
./workflows/notion/setup-notion.sh
open workflows/notion/Notion-GTD-QuickCapture.workflow
```

The helper stores credentials under Keychain service `MacGTD-Notion`, accounts `api-token` and `data-source-id`. Managed invocations can use `MACGTD_NOTION_TOKEN` and `MACGTD_NOTION_DATA_SOURCE_ID`.

The selected source needs these properties:

| Property | Type | Values used |
| --- | --- | --- |
| `Name` | Title | Captured task title |
| `Status` | Select | `Inbox` |
| `Priority` | Select | `High`, `Medium`, `Low` |
| `Due` | Date | Calendar date or explicit timestamp |

`Status` must be a select property for this schema; a Notion status property has a different API shape. Context/project markers are retained in paragraph blocks. For live tests, the connection needs read, insert, and update access so tests can create, verify, and trash their pages.

## Existing installations

A stored `database-id` remains supported when discovery returns exactly one data source. Both hyphenated UUIDs and 32-character IDs copied from old database URLs are accepted. When a database contains multiple sources, capture fails with guidance instead of selecting one silently. Run setup again with an explicit data source ID.

Date-only markers remain `YYYY-MM-DD`; an explicit time is sent as a UTC ISO timestamp. This preserves the intended calendar date across time zones.

## Testing

Hosted E2E exercises the real dialog through a TLS fixture and checks current version headers, data-source parents, title/priority/date fields, legacy discovery, and ambiguous-source rejection. The separate live suite verifies actual page persistence and uses `in_trash: true` for owned-record cleanup. Live verification requires dedicated secrets and has not yet been established.

See [shared setup](../api/README.md), [E2E configuration](../../tests/e2e/README.md), and [Notion's migration guide](https://developers.notion.com/guides/get-started/upgrade-guide-2025-09-03).
