# Second Brain — n8n Workflow Templates

Automation workflows for the Second Brain system. Import these into n8n to automate task capture, daily reviews, GitHub sync, and morning briefings.

## Prerequisites

Before importing, you need:

- **n8n instance** (self-hosted or cloud) — https://n8n.io
- **Notion Integration** — Create at https://www.notion.so/my-integrations
- **Anthropic API Key** — Get from https://console.anthropic.com
- **GitHub Personal Access Token** — Settings > Developer Settings > Personal Access Tokens
- **Google OAuth2 Credentials** — For Tasks and Calendar access
- **ntfy.sh topic** (optional) — For push notifications, or swap for Slack/Discord

## Notion Database Setup

These workflows expect the following Notion databases:

### Tasks Database
Properties needed:
- `Name` (title)
- `Status` (select): Inbox, Today, In Progress, Backlog, Done
- `Priority` (select): Critical, High, Medium, Low
- `Project` (select): your project names
- `Context` (select): @computer, @phone, @errands, @home, @office, @anywhere
- `Tags` (multi-select)
- `Due Date` (date)
- `Estimated Minutes` (number)
- `Source` (select): Voice Capture, Manual, GitHub
- `Original Text` (rich text)
- `Completed Date` (date)
- `Day Rank` (number) — used by morning briefing

### Daily Reviews Database
Properties needed:
- `Name` (title)
- `Date` (date)
- `Type` (select): Auto-Generated, Morning Briefing

### Projects Database
Properties needed:
- `Name` (title)
- `Status` (select): Backlog, In Progress, Done
- `Type` (select): Feature, Bug, Task, Documentation
- `Source` (select): GitHub, Manual
- `GitHub Number` (number)
- `GitHub URL` (url)
- `Assignee` (rich text)
- `Labels` (multi-select)

## Workflows

### 01 — Voice Capture to Notion
**File:** `01-voice-capture-to-notion.json`
**Schedule:** Every 5 minutes
**Flow:** Google Tasks → Claude AI (parse) → Notion Tasks → Clear Google Task

Captures voice-dictated tasks from Google Assistant, uses Claude to extract structured metadata (project, priority, tags, due date, context, time estimate), and creates enriched task entries in Notion.

**Setup:**
1. Import the workflow JSON into n8n
2. Replace `REPLACE_WITH_GOOGLE_TASKS_CREDENTIAL_ID` with your Google Tasks OAuth2 credential
3. Replace `REPLACE_WITH_ANTHROPIC_API_KEY` with your Claude API key
4. Replace `REPLACE_WITH_NOTION_CREDENTIAL_ID` with your Notion credential
5. Replace `REPLACE_WITH_NOTION_TASKS_DATABASE_ID` with your Tasks database ID
6. Activate the workflow

### 02 — Daily Review Generator
**File:** `02-daily-review-generator.json`
**Schedule:** Daily at 8:00 PM
**Flow:** Notion (completed + in-progress tasks) → Claude AI (narrative) → Notion Daily Review → Push Notification

Automatically generates an end-of-day review summarizing completed tasks, noting patterns, and suggesting carry-forward priorities. Saves to Notion and sends a notification.

**Setup:**
1. Import the workflow JSON into n8n
2. Replace all `REPLACE_WITH_*` placeholders with your credentials
3. Replace `REPLACE_WITH_NOTION_DAILY_REVIEWS_DATABASE_ID` with your Daily Reviews database ID
4. Replace `REPLACE_WITH_YOUR_NTFY_TOPIC` with your ntfy.sh topic (or swap node for Slack/email)
5. Adjust the cron time if needed (default: 8 PM server time)
6. Activate the workflow

### 03 — GitHub-Notion Sync
**File:** `03-github-notion-sync.json`
**Schedule:** Every hour
**Flow:** GitHub Issues (tdill1/second-brain) ↔ Notion Projects Database

Syncs GitHub issues bidirectionally with Notion. Creates new Notion pages for new issues, updates existing pages when issue status/title/labels change. Maps GitHub states to Notion statuses.

**Setup:**
1. Import the workflow JSON into n8n
2. Replace `REPLACE_WITH_GITHUB_CREDENTIAL_ID` with your GitHub credential
3. Replace `REPLACE_WITH_NOTION_PROJECTS_DATABASE_ID` with your Projects database ID
4. Replace Notion credential placeholders
5. If your repo is different from `tdill1/second-brain`, update the GitHub node
6. Activate the workflow

### 04 — Morning Briefing
**File:** `04-morning-briefing.json`
**Schedule:** Daily at 6:00 AM
**Flow:** Notion Tasks + Google Calendar → Claude AI (prioritize) → Update Notion Priorities → Notification + Notion Page

Generates a morning briefing by analyzing today's tasks, high-priority backlog, due/overdue items, and calendar events. Claude suggests optimal task ordering, time blocks, and flags potential issues. Updates task priorities in Notion automatically.

**Setup:**
1. Import the workflow JSON into n8n
2. Replace all credential and database ID placeholders
3. Replace `REPLACE_WITH_GOOGLE_OAUTH_TOKEN` — ideally swap the HTTP Request node for the native Google Calendar node with OAuth2
4. Replace ntfy topic or swap for your preferred notification method
5. Adjust the 6 AM cron for your timezone
6. Activate the workflow

## How to Import

1. Open your n8n instance
2. Go to **Workflows** → **Add Workflow** (or use the import option)
3. Click the **⋮** menu → **Import from File**
4. Select the `.json` file
5. The workflow will load with all nodes and connections
6. Update all placeholder credentials and IDs (search for `REPLACE_WITH_`)
7. Test with **Execute Workflow** before activating the schedule

## Placeholder Reference

Search for these strings and replace them:

| Placeholder | Where to Get It |
|---|---|
| `REPLACE_WITH_NOTION_CREDENTIAL_ID` | n8n Credentials → Notion API |
| `REPLACE_WITH_NOTION_TASKS_DATABASE_ID` | Notion → Tasks DB → Share → Copy Link → extract ID |
| `REPLACE_WITH_NOTION_DAILY_REVIEWS_DATABASE_ID` | Same process for Daily Reviews DB |
| `REPLACE_WITH_NOTION_PROJECTS_DATABASE_ID` | Same process for Projects DB |
| `REPLACE_WITH_ANTHROPIC_API_KEY` | https://console.anthropic.com/settings/keys |
| `REPLACE_WITH_GOOGLE_TASKS_CREDENTIAL_ID` | n8n Credentials → Google Tasks OAuth2 |
| `REPLACE_WITH_GOOGLE_OAUTH_TOKEN` | n8n Credentials → Google Calendar OAuth2 |
| `REPLACE_WITH_GITHUB_CREDENTIAL_ID` | n8n Credentials → GitHub API (PAT) |
| `REPLACE_WITH_YOUR_NTFY_TOPIC` | Your ntfy.sh topic name |

## Tips

- **Test first**: Always run workflows manually before activating schedules
- **Error handling**: Consider adding error handler workflows for production use
- **Timezone**: n8n cron uses server timezone — adjust if your server is in UTC
- **Rate limits**: The 5-min polling and hourly sync are conservative; adjust as needed
- **Costs**: Claude API calls are ~$0.003-0.01 per workflow run (using Sonnet)
- **Logs**: Check n8n execution logs if workflows fail — usually credential or property name mismatches
