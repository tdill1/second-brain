# Notion Second Brain Setup Guide — PARA Methodology

**Owner:** Tony
**Last Updated:** 2026-04-12
**Purpose:** Step-by-step guide to build a Notion workspace that serves as the interactive dashboard layer for your GitHub-based Second Brain, organized using the PARA methodology (Projects, Areas, Resources, Archive).

---

## Table of Contents

1. [Workspace Structure Overview](#1-workspace-structure-overview)
2. [Database Schemas](#2-database-schemas)
3. [Database Relations Map](#3-database-relations-map)
4. [Recommended Views](#4-recommended-views)
5. [Dashboard Layout](#5-dashboard-layout)
6. [Template Suggestions](#6-template-suggestions)
7. [Notion API Setup (for n8n Integration)](#7-notion-api-setup-for-n8n-integration)
8. [Build Order Checklist](#8-build-order-checklist)

---

## 1. Workspace Structure Overview

Your Notion workspace mirrors the PARA framework. Everything lives under four top-level pages, plus a **Dashboard** that ties it all together.

```
🧠 Second Brain (root)
├── 📊 Dashboard                  ← Your daily command center
├── 🚀 Projects                   ← Active projects with clear outcomes
│   ├── Booster Club (Basketball)
│   ├── The Purpose Project (Youth Program)
│   ├── TriDimension (GHL SaaS)
│   ├── Car Rental Business
│   ├── abstractwishes (Brand)
│   ├── DEI Thesis
│   └── TrueSentiments
├── 🏠 Areas                      ← Ongoing responsibilities (no end date)
│   ├── Health & Fitness
│   ├── Finances
│   ├── Career / Professional Dev
│   ├── Relationships / Community
│   ├── Spirituality / Purpose
│   └── Learning & Growth
├── 📚 Resources                  ← Reference material, topics of interest
│   ├── Marketing & Growth
│   ├── AI / Automation
│   ├── Youth Development
│   ├── SaaS / Tech
│   ├── DEI Research
│   └── Business Operations
├── 🗄️ Archive                    ← Completed or inactive items
├── 📓 Journal                    ← Daily journal entries (database)
├── 🗒️ Meeting Notes              ← All meeting notes (database)
└── 🔄 Weekly Reviews             ← Weekly reflection entries (database)
```

### Key Principle
- **Projects** = time-bound, have a clear deliverable or outcome
- **Areas** = ongoing, no end date, standards to maintain
- **Resources** = topics you're interested in or learning about
- **Archive** = anything from the above three that becomes inactive

---

## 2. Database Schemas

Build these databases as **full-page databases** first, then embed linked views into your Dashboard and project pages.

### 2.1 Projects Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Project name | "Booster Club — Spring Fundraiser" |
| Status | Select | Current state of the project | `Active`, `Planning`, `On Hold`, `Completed`, `Archived` |
| Priority | Select | Urgency / importance level | `🔴 High`, `🟡 Medium`, `🟢 Low` |
| Area | Relation | Links to the Areas database | → "Community" |
| Owner | Person | Who's responsible | Tony |
| Start Date | Date | When the project kicked off | 2026-03-01 |
| Target Date | Date | Deadline or target completion | 2026-06-15 |
| Progress | Number (percent) | Completion percentage (0–100) | 45 |
| Description | Text | One-liner describing the outcome | "Raise $5K for team uniforms and travel" |
| GitHub Repo | URL | Link to corresponding GitHub repo | https://github.com/tony/booster-club |
| Tags | Multi-select | Cross-cutting labels | `fundraising`, `community`, `basketball` |
| Tasks | Relation | Links to Tasks database | → (linked tasks) |
| Meeting Notes | Relation | Links to Meeting Notes database | → (linked meetings) |
| Next Action | Text | The very next physical action | "Email Coach Davis about venue options" |

### 2.2 Tasks Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Task description (action-oriented) | "Draft sponsorship letter for Booster Club" |
| Status | Select | Task state | `Inbox`, `Next Action`, `In Progress`, `Waiting`, `Done`, `Cancelled` |
| Priority | Select | Urgency / importance | `🔴 High`, `🟡 Medium`, `🟢 Low` |
| Project | Relation | Links to Projects database | → "Booster Club — Spring Fundraiser" |
| Area | Relation | Links to Areas database | → "Community" |
| Assigned To | Person | Who does this | Tony |
| Due Date | Date | When it's due | 2026-04-18 |
| Do Date | Date | When you plan to work on it | 2026-04-15 |
| Energy Level | Select | Required energy to complete | `⚡ High`, `🔋 Medium`, `🪫 Low` |
| Time Estimate | Select | Rough duration | `5 min`, `15 min`, `30 min`, `1 hr`, `2+ hrs` |
| Context | Multi-select | Where/how you can do this | `@computer`, `@phone`, `@errands`, `@home`, `@office`, `@anywhere` |
| Tags | Multi-select | Additional labels | `writing`, `outreach`, `research`, `design` |
| Notes | Text | Additional context or details | "Use the template from last year's drive" |
| Completed Date | Date | When it was finished | 2026-04-17 |
| Source | Select | Where this task came from | `Meeting`, `Journal`, `Email`, `Idea`, `Weekly Review` |

### 2.3 Journal Entries Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Entry title (auto-format: date) | "2026-04-12 — Saturday Reflection" |
| Date | Date | Journal date | 2026-04-12 |
| Mood | Select | How you're feeling | `😤 Frustrated`, `😐 Neutral`, `🙂 Good`, `😊 Great`, `🔥 On Fire` |
| Energy | Select | Energy level today | `⚡ High`, `🔋 Medium`, `🪫 Low` |
| Gratitude | Text | Three things you're grateful for | "Health, my team, clear weather for practice" |
| Wins | Text | What went well today | "Secured venue for fundraiser kickoff" |
| Challenges | Text | What was hard | "Struggled to focus during thesis writing" |
| Lessons | Text | Key takeaway or insight | "Batch similar tasks to maintain focus" |
| Top 3 Priorities | Text | What you intended to accomplish | "1. Finish sponsor letter 2. Thesis outline 3. GHL onboarding flow" |
| Projects Touched | Relation | Which projects you worked on | → "Booster Club", "DEI Thesis" |
| Tags | Multi-select | Themes | `reflection`, `planning`, `breakthrough`, `struggle` |
| Body | Page content | The full journal entry (in the page body, not a property) | (free-form writing) |

### 2.4 Meeting Notes Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Meeting title | "Booster Club — Parent Committee Sync" |
| Date | Date | When the meeting happened | 2026-04-10 |
| Type | Select | Category of meeting | `1:1`, `Team`, `Client`, `Brainstorm`, `Workshop`, `Interview` |
| Project | Relation | Links to Projects database | → "Booster Club — Spring Fundraiser" |
| Area | Relation | Links to Areas database | → "Community" |
| Attendees | Multi-select | Who was there | `Coach Davis`, `Maria L.`, `Tony` |
| Location | Select | Where / how | `Zoom`, `In Person`, `Phone`, `Google Meet` |
| Agenda | Text | What was planned to discuss | "Budget review, venue options, volunteer sign-ups" |
| Key Decisions | Text | Decisions made | "Approved $2K budget for venue deposit" |
| Action Items | Text | Quick capture of follow-ups | "Tony: send invoice. Maria: confirm catering." |
| Tasks Created | Relation | Links to Tasks created from this meeting | → (linked tasks) |
| Tags | Multi-select | Topics | `budget`, `logistics`, `strategy` |
| Follow-Up Date | Date | When to revisit | 2026-04-24 |
| Body | Page content | Full meeting notes (in the page body) | (detailed notes, transcripts, etc.) |

### 2.5 Weekly Reviews Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Review title | "Week 15 Review — Apr 7–13, 2026" |
| Week Number | Number | ISO week number | 15 |
| Date Range | Text | Mon–Sun range | "Apr 7 – Apr 13, 2026" |
| Review Date | Date | When you did the review | 2026-04-13 |
| Overall Rating | Select | How the week went | `⭐⭐⭐⭐⭐`, `⭐⭐⭐⭐`, `⭐⭐⭐`, `⭐⭐`, `⭐` |
| Energy Trend | Select | General energy pattern | `📈 Rising`, `➡️ Steady`, `📉 Declining` |
| Top Wins | Text | 3 biggest wins | "1. Sponsor confirmed 2. Thesis Ch.2 drafted 3. GHL pipeline built" |
| Challenges | Text | What held you back | "Overcommitted on Tue/Wed, no deep work time" |
| Lessons Learned | Text | Key insights | "Block 2-hour deep work windows before noon" |
| Projects Reviewed | Relation | Which projects you reviewed | → (all active projects) |
| Tasks Completed | Number | Count of tasks done this week | 23 |
| Tasks Created | Number | Count of new tasks added | 15 |
| Next Week Priorities | Text | Top 3 focus items for next week | "1. Finalize fundraiser logistics 2. Submit DEI Chapter 3 3. TriDimension beta test" |
| Habit Tracker | Text | Key habits and whether you hit them | "Exercise 5/7, Journal 6/7, Reading 4/7" |
| Tags | Multi-select | Themes for the week | `productive`, `overwhelmed`, `breakthrough` |
| Body | Page content | Full reflection (in the page body) | (detailed weekly narrative) |

### 2.6 Areas Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Area of responsibility | "Health & Fitness" |
| Description | Text | What this area covers | "Physical health, exercise, nutrition, sleep" |
| Status | Select | Current health of this area | `🟢 Thriving`, `🟡 Maintaining`, `🔴 Needs Attention` |
| Standard | Text | What "good" looks like | "Exercise 5x/week, 7+ hrs sleep, meal prep Sundays" |
| Projects | Relation | Active projects in this area | → (linked projects) |
| Tasks | Relation | Tasks related to this area | → (linked tasks) |
| Last Reviewed | Date | When you last assessed this area | 2026-04-06 |
| Notes | Text | Current thoughts / concerns | "Need to get back into morning workouts" |
| Icon | Text | Emoji for quick visual | 💪 |

### 2.7 Resources Database

| Property Name | Property Type | Description | Example Values |
|---|---|---|---|
| Name | Title | Resource topic or title | "GoHighLevel API Documentation" |
| Type | Select | Kind of resource | `Article`, `Book`, `Course`, `Tool`, `Template`, `Video`, `Research Paper`, `Bookmark` |
| Topic | Multi-select | Subject areas | `SaaS`, `automation`, `API` |
| Source | URL | Link to the resource | https://highlevel.com/docs |
| Area | Relation | Related area of responsibility | → "Career / Professional Dev" |
| Project | Relation | Related project (if any) | → "TriDimension" |
| Status | Select | Have you consumed it | `To Review`, `In Progress`, `Reviewed`, `Archived` |
| Rating | Select | How useful was it | `⭐⭐⭐⭐⭐`, `⭐⭐⭐⭐`, `⭐⭐⭐`, `⭐⭐`, `⭐` |
| Key Takeaways | Text | Summary of what you learned | "Use webhooks for real-time pipeline updates" |
| Date Added | Date | When you saved it | 2026-04-12 |
| Tags | Multi-select | Additional labels | `reference`, `how-to`, `inspiration` |

---

## 3. Database Relations Map

This is how all your databases connect to each other. Build these relations after creating all databases.

```
┌─────────────┐       ┌─────────────┐
│   AREAS     │◄──────│  PROJECTS   │
│             │       │             │
│ (ongoing    │       │ (time-bound │
│  standards) │       │  outcomes)  │
└──────┬──────┘       └──┬──────┬──┘
       │                 │      │
       │    ┌────────────┘      │
       │    │                   │
       ▼    ▼                   ▼
┌─────────────┐       ┌─────────────┐
│   TASKS     │       │  MEETING    │
│             │◄──────│  NOTES      │
│ (actions)   │       │             │
└─────────────┘       └─────────────┘
       ▲                    ▲
       │                    │
┌──────┴──────┐       ┌────┴────────┐
│  JOURNAL    │       │  WEEKLY     │
│  ENTRIES    │       │  REVIEWS    │
│             │       │             │
└─────────────┘       └─────────────┘
       │                    │
       │    ┌───────────────┘
       ▼    ▼
┌─────────────┐
│  RESOURCES  │
│             │
│ (reference) │
└─────────────┘
```

### Relation Configuration Table

| From Database | Property Name | To Database | Type | Purpose |
|---|---|---|---|---|
| Projects | Area | Areas | Relation | Categorize projects by life area |
| Projects | Tasks | Tasks | Relation (two-way) | See all tasks for a project |
| Projects | Meeting Notes | Meeting Notes | Relation (two-way) | See all meetings for a project |
| Tasks | Project | Projects | Relation (two-way) | Link task to its parent project |
| Tasks | Area | Areas | Relation | Categorize orphan tasks by area |
| Journal Entries | Projects Touched | Projects | Relation | Track which projects got attention |
| Meeting Notes | Project | Projects | Relation (two-way) | Connect meetings to projects |
| Meeting Notes | Area | Areas | Relation | Categorize meetings by area |
| Meeting Notes | Tasks Created | Tasks | Relation | Link follow-up tasks |
| Weekly Reviews | Projects Reviewed | Projects | Relation | Track reviewed projects |
| Resources | Area | Areas | Relation | Categorize resources by area |
| Resources | Project | Projects | Relation | Connect resources to projects |
| Areas | Projects | Projects | Relation (two-way) | See all projects in an area |
| Areas | Tasks | Tasks | Relation (two-way) | See all tasks in an area |

### Rollups to Add (After Relations)

| Database | Rollup Name | Relation Source | Target Property | Calculation | Purpose |
|---|---|---|---|---|---|
| Projects | Open Tasks | Tasks | Status | Count where ≠ Done | See task backlog per project |
| Projects | Completed Tasks | Tasks | Status | Count where = Done | Track progress |
| Projects | Upcoming Meetings | Meeting Notes | Date | Count where ≥ Today | See scheduled meetings |
| Areas | Active Projects | Projects | Status | Count where = Active | Area workload overview |
| Areas | Open Tasks | Tasks | Status | Count where ≠ Done | Area task load |

---

## 4. Recommended Views

Create these views for each database. Pin the most-used view as default.

### 4.1 Tasks Database Views

| View Name | View Type | Filter | Sort | Group By | Purpose |
|---|---|---|---|---|---|
| 📋 All Tasks | Table | None | Due Date (ascending) | None | Master list |
| 🎯 Next Actions | Table | Status = "Next Action" | Priority (desc), Due Date (asc) | Project | Your daily action list |
| 📊 Kanban | Board | Status ≠ "Cancelled" | Priority (desc) | Status | Visual workflow |
| 📅 Calendar | Calendar | Due Date exists | — | — | See deadlines on a calendar |
| 🔥 Today's Focus | Table | Do Date = Today | Priority (desc) | None | What to work on right now |
| ⏳ Waiting On | Table | Status = "Waiting" | Due Date (asc) | Project | Delegated/blocked items |
| ✅ Done This Week | Table | Completed Date = this week | Completed Date (desc) | Project | Weekly accomplishment view |
| 📦 Inbox | Table | Status = "Inbox" | Date created (desc) | None | Unprocessed captures |

### 4.2 Projects Database Views

| View Name | View Type | Filter | Sort | Group By | Purpose |
|---|---|---|---|---|---|
| 🚀 Active Projects | Table | Status = "Active" | Priority (desc) | Area | Main working view |
| 📊 Project Board | Board | Status ≠ "Archived" | Priority (desc) | Status | Visual pipeline |
| 🗓️ Timeline | Timeline | Start Date + Target Date exist | Target Date (asc) | — | Gantt-style overview |
| 📈 Progress Tracker | Table | Status = "Active" | Progress (desc) | None | See completion percentages |
| 🏠 By Area | Table | Status ≠ "Archived" | Name (asc) | Area | Area-centric view |

### 4.3 Journal Entries Views

| View Name | View Type | Filter | Sort | Group By | Purpose |
|---|---|---|---|---|---|
| 📓 All Entries | Table | None | Date (desc) | None | Full journal |
| 📅 Calendar | Calendar | Date exists | — | — | Visual journal calendar |
| 🔥 Great Days | Table | Mood = "🔥 On Fire" or "😊 Great" | Date (desc) | None | Review peak moments |
| 🏷️ By Tag | Table | None | Date (desc) | Tags | Find themed entries |

### 4.4 Meeting Notes Views

| View Name | View Type | Filter | Sort | Group By | Purpose |
|---|---|---|---|---|---|
| 📋 All Meetings | Table | None | Date (desc) | None | Full list |
| 📅 Calendar | Calendar | Date exists | — | — | Meeting schedule |
| 🚀 By Project | Table | None | Date (desc) | Project | Project-centric meetings |
| 🔄 Follow-Ups Due | Table | Follow-Up Date ≤ Today | Follow-Up Date (asc) | None | Outstanding follow-ups |

### 4.5 Weekly Reviews Views

| View Name | View Type | Filter | Sort | Group By | Purpose |
|---|---|---|---|---|---|
| 📋 All Reviews | Table | None | Review Date (desc) | None | Full history |
| 🗓️ Calendar | Calendar | Review Date exists | — | — | Consistency tracking |
| 📊 Gallery | Gallery | None | Review Date (desc) | None | Visual card layout (preview: Top Wins) |

### 4.6 Resources Views

| View Name | View Type | Filter | Sort | Group By | Purpose |
|---|---|---|---|---|---|
| 📚 All Resources | Table | None | Date Added (desc) | None | Full library |
| 📖 To Review | Table | Status = "To Review" | Date Added (desc) | Topic | Reading queue |
| 🏷️ By Topic | Table | None | Rating (desc) | Topic | Browse by subject |
| 🖼️ Gallery | Gallery | None | Date Added (desc) | None | Visual browsing (preview: Key Takeaways) |

---

## 5. Dashboard Layout

Your Dashboard is a single Notion page with linked database views, callouts, and embeds arranged in columns. Here's the recommended layout:

### Row 1: Header + Quick Capture

```
┌──────────────────────────────────────────────────┐
│  🧠 Second Brain Dashboard                       │
│  "What's the next action?" — David Allen         │
│                                                   │
│  [+ Quick Task]  [+ Journal Entry]  [+ Meeting]  │
│  (Button blocks that create new entries)          │
└──────────────────────────────────────────────────┘
```

### Row 2: Today's Focus (2 columns)

```
┌────────────────────────┬─────────────────────────┐
│  🔥 Today's Focus      │  📓 Today's Journal      │
│                        │                          │
│  Linked view: Tasks    │  Linked view: Journal    │
│  Filter: Do Date =     │  Filter: Date = Today    │
│  Today                 │  (Shows today's entry    │
│  Sort: Priority desc   │   or prompts to create)  │
│                        │                          │
└────────────────────────┴─────────────────────────┘
```

### Row 3: Projects Overview (full width)

```
┌──────────────────────────────────────────────────┐
│  🚀 Active Projects                              │
│                                                   │
│  Linked view: Projects (Board view)               │
│  Filter: Status = "Active"                        │
│  Group: Priority                                  │
│  Show: Name, Progress bar, Open Tasks (rollup),   │
│         Next Action                               │
└──────────────────────────────────────────────────┘
```

### Row 4: Inbox + Waiting (2 columns)

```
┌────────────────────────┬─────────────────────────┐
│  📦 Inbox              │  ⏳ Waiting On           │
│                        │                          │
│  Linked view: Tasks    │  Linked view: Tasks      │
│  Filter: Status =      │  Filter: Status =        │
│  "Inbox"               │  "Waiting"               │
│  (Unprocessed items)   │  (Delegated/blocked)     │
│                        │                          │
└────────────────────────┴─────────────────────────┘
```

### Row 5: Weekly Review + Areas (2 columns)

```
┌────────────────────────┬─────────────────────────┐
│  🔄 Latest Review      │  🏠 Areas Health         │
│                        │                          │
│  Linked view: Weekly   │  Linked view: Areas      │
│  Reviews (Gallery)     │  (Table view)            │
│  Limit: 1              │  Show: Name, Status,     │
│  Sort: Date desc       │  Active Projects count   │
│                        │                          │
└────────────────────────┴─────────────────────────┘
```

### Row 6: Upcoming (full width)

```
┌──────────────────────────────────────────────────┐
│  📅 This Week                                    │
│                                                   │
│  Linked view: Tasks (Calendar view)               │
│  Filter: Due Date = This Week                     │
│  + Meeting Notes calendar overlay                 │
└──────────────────────────────────────────────────┘
```

---

## 6. Template Suggestions

Create these as **database templates** (click the dropdown arrow next to "New" in each database).

### 6.1 Task Templates

**🎯 Standard Task**
- Status: Inbox
- Priority: 🟡 Medium
- Energy Level: 🔋 Medium
- Body: `## Context\n\n## Steps\n- [ ] \n- [ ] \n\n## Done When\n`

**📧 Email Follow-Up**
- Status: Next Action
- Context: @computer
- Time Estimate: 15 min
- Source: Email

**📞 Call/Text Someone**
- Status: Next Action
- Context: @phone
- Time Estimate: 5 min

### 6.2 Journal Entry Template

**📓 Daily Journal**
- Mood: (leave empty — fill in)
- Energy: (leave empty — fill in)
- Body:
```
## Morning Intentions
What are my top 3 priorities today?
1.
2.
3.

## Gratitude
I'm grateful for:
1.
2.
3.

## Evening Reflection
### What went well?

### What was challenging?

### What did I learn?

### What's the one thing I'd do differently?
```

### 6.3 Meeting Notes Template

**🗒️ Standard Meeting**
- Body:
```
## Attendees
-

## Agenda
1.
2.
3.

## Notes

## Key Decisions
-

## Action Items
- [ ] @Tony:
- [ ] @:

## Follow-Up
Next meeting:
```

### 6.4 Weekly Review Template

**🔄 Weekly Review**
- Body:
```
## Step 1: Get Clear (Empty the Inboxes)
- [ ] Process Notion Inbox
- [ ] Process email inbox to zero
- [ ] Process notes/captures from phone
- [ ] Process meeting notes for action items

## Step 2: Get Current (Review Active Work)
### Projects Reviewed
(Link each active project and note its status)

| Project | Status | Next Action | Blockers |
|---|---|---|---|
| Booster Club | | | |
| The Purpose Project | | | |
| TriDimension | | | |
| Car Rental Business | | | |
| abstractwishes | | | |
| DEI Thesis | | | |
| TrueSentiments | | | |

### Tasks Audit
- [ ] Review all "Next Action" tasks — still relevant?
- [ ] Review "Waiting" tasks — follow up needed?
- [ ] Review calendar for upcoming commitments

## Step 3: Get Creative (Look Ahead)
### Top 3 Priorities for Next Week
1.
2.
3.

### Areas Check-In
| Area | Health | One Action |
|---|---|---|
| Health & Fitness | 🟢🟡🔴 | |
| Finances | 🟢🟡🔴 | |
| Career / Professional Dev | 🟢🟡🔴 | |
| Relationships / Community | 🟢🟡🔴 | |
| Spirituality / Purpose | 🟢🟡🔴 | |
| Learning & Growth | 🟢🟡🔴 | |

## Step 4: Reflect
### Top Wins This Week

### Biggest Challenge

### Key Lesson

### Habit Scorecard
- Exercise: _/7
- Journal: _/7
- Reading: _/7
- Deep Work Block: _/5
```

---

## 7. Notion API Setup (for n8n Integration)

This enables your n8n automations to read from and write to your Notion databases.

### Step 1: Create a Notion Integration

1. Go to [https://www.notion.so/my-integrations](https://www.notion.so/my-integrations)
2. Click **"+ New integration"**
3. Configure:
   - **Name:** `Second Brain Automation`
   - **Associated workspace:** Select your workspace
   - **Logo:** (optional — use a brain emoji or icon)
4. Click **Submit**
5. **Copy the Internal Integration Secret** (starts with `ntn_...`)
   - Store this securely — you'll need it in n8n
   - Save it to your `.env` file or secrets manager

### Step 2: Set Integration Capabilities

On the integration settings page, ensure these capabilities are enabled:

| Capability | Setting | Why |
|---|---|---|
| Read content | ✅ Enabled | n8n reads tasks, projects, journal entries |
| Update content | ✅ Enabled | n8n updates task statuses, creates entries |
| Insert content | ✅ Enabled | n8n creates new tasks, journal prompts |
| Read comments | ✅ Optional | If you want to sync comments |
| Read user info | ✅ Optional | For attendee mapping |

### Step 3: Share Databases with the Integration

**This is the step most people forget.** For each database:

1. Open the database full page in Notion
2. Click the **"..."** menu (top right)
3. Click **"Connections"** (or "Add connections")
4. Search for **"Second Brain Automation"**
5. Click to connect

**Do this for ALL 7 databases:**
- [ ] Tasks
- [ ] Projects
- [ ] Journal Entries
- [ ] Meeting Notes
- [ ] Weekly Reviews
- [ ] Areas
- [ ] Resources

### Step 4: Get Database IDs

You'll need each database's unique ID for n8n nodes.

1. Open the database as a full page
2. Look at the URL:
   ```
   https://www.notion.so/yourworkspace/abc123def456...?v=...
                                       ^^^^^^^^^^^^^^^^
                                       This is the Database ID
   ```
3. The Database ID is the 32-character hex string **before** the `?v=` parameter
4. Format it with dashes for API use: `abc123de-f456-7890-abcd-ef1234567890`

Record all database IDs:

| Database | Database ID | Purpose in n8n |
|---|---|---|
| Tasks | `paste-id-here` | Create/update tasks from various triggers |
| Projects | `paste-id-here` | Sync project status, create from GitHub |
| Journal Entries | `paste-id-here` | Auto-create daily entries, mood tracking |
| Meeting Notes | `paste-id-here` | Create from calendar events |
| Weekly Reviews | `paste-id-here` | Auto-generate review templates |
| Areas | `paste-id-here` | Reference data for relations |
| Resources | `paste-id-here` | Auto-save bookmarks, articles |

### Step 5: Configure n8n Notion Credentials

1. In n8n, go to **Credentials** → **Add Credential**
2. Search for **"Notion API"**
3. Select **"Notion API (Internal Integration)"**
4. Paste your Internal Integration Secret
5. Click **Test** to verify connection
6. Save as **"Second Brain — Notion"**

### Step 6: Test the Connection

Create a simple n8n workflow to verify:

1. **Manual Trigger** → **Notion: Get Database** (select Tasks database)
2. Run it — you should see your database schema
3. Then test: **Manual Trigger** → **Notion: Create Page** (create a test task)
4. Verify the task appears in Notion
5. Delete the test task

### Common n8n + Notion Automations to Build

| Automation | Trigger | Action |
|---|---|---|
| Daily Journal Prompt | Cron (7:00 AM) | Create Journal Entry with today's date + template |
| Weekly Review Reminder | Cron (Sunday 10 AM) | Create Weekly Review entry + send Telegram reminder |
| Task from Telegram | Telegram message with /task | Create Task in Inbox |
| Meeting Follow-Up | Calendar event ends | Create Meeting Notes entry pre-filled |
| GitHub → Notion Sync | GitHub webhook | Update Project status/progress in Notion |
| Notion → GitHub Sync | Notion webhook (or polling) | Create GitHub issue from Notion task |
| Daily Standup | Cron (8:00 AM) | Query today's tasks → send Telegram summary |
| Resource Capture | Telegram message with /save | Create Resource entry with URL + tags |

### API Rate Limits to Know

- **3 requests per second** per integration (Notion's rate limit)
- Use delays/throttling in n8n if doing bulk operations
- Notion's search API is eventually consistent (~1 second delay)
- Pagination: max 100 results per query — use n8n's pagination for larger datasets

---

## 8. Build Order Checklist

Follow this exact order to avoid relation errors:

### Phase 1: Create Databases (Day 1)
- [ ] Create **Areas** database with all properties (no relations yet)
- [ ] Add your 6 areas as entries
- [ ] Create **Projects** database with all properties (no relations yet)
- [ ] Add your 7 projects as entries
- [ ] Create **Tasks** database with all properties (no relations yet)
- [ ] Create **Journal Entries** database with all properties (no relations yet)
- [ ] Create **Meeting Notes** database with all properties (no relations yet)
- [ ] Create **Weekly Reviews** database with all properties (no relations yet)
- [ ] Create **Resources** database with all properties (no relations yet)

### Phase 2: Add Relations (Day 1)
- [ ] Projects → Areas (relation)
- [ ] Tasks → Projects (two-way relation)
- [ ] Tasks → Areas (relation)
- [ ] Journal Entries → Projects (relation: "Projects Touched")
- [ ] Meeting Notes → Projects (two-way relation)
- [ ] Meeting Notes → Areas (relation)
- [ ] Meeting Notes → Tasks (relation: "Tasks Created")
- [ ] Weekly Reviews → Projects (relation: "Projects Reviewed")
- [ ] Resources → Areas (relation)
- [ ] Resources → Projects (relation)
- [ ] Areas → Projects (confirm two-way link exists)
- [ ] Areas → Tasks (confirm two-way link exists)

### Phase 3: Add Rollups (Day 1)
- [ ] Projects: "Open Tasks" rollup
- [ ] Projects: "Completed Tasks" rollup
- [ ] Projects: "Upcoming Meetings" rollup
- [ ] Areas: "Active Projects" rollup
- [ ] Areas: "Open Tasks" rollup

### Phase 4: Create Views (Day 2)
- [ ] Tasks: all 8 views (see Section 4.1)
- [ ] Projects: all 5 views (see Section 4.2)
- [ ] Journal Entries: all 4 views (see Section 4.3)
- [ ] Meeting Notes: all 4 views (see Section 4.4)
- [ ] Weekly Reviews: all 3 views (see Section 4.5)
- [ ] Resources: all 4 views (see Section 4.6)

### Phase 5: Create Templates (Day 2)
- [ ] Task templates (Standard, Email Follow-Up, Call)
- [ ] Journal Entry template
- [ ] Meeting Notes template
- [ ] Weekly Review template

### Phase 6: Build Dashboard (Day 2–3)
- [ ] Create Dashboard page
- [ ] Add header + quick capture buttons
- [ ] Add "Today's Focus" linked view
- [ ] Add "Today's Journal" linked view
- [ ] Add "Active Projects" board view
- [ ] Add "Inbox" linked view
- [ ] Add "Waiting On" linked view
- [ ] Add "Latest Review" linked view
- [ ] Add "Areas Health" linked view
- [ ] Add "This Week" calendar view

### Phase 7: API + Automation (Day 3)
- [ ] Create Notion integration
- [ ] Share all databases with integration
- [ ] Record all database IDs
- [ ] Configure n8n credentials
- [ ] Test connection with simple read/write
- [ ] Build first automation (Daily Journal Prompt recommended)

### Phase 8: Seed Data (Day 3–4)
- [ ] Add 5–10 real tasks per project
- [ ] Write your first journal entry
- [ ] Log a recent meeting
- [ ] Complete your first weekly review
- [ ] Add 5–10 resources you already reference

---

## Quick Reference: Your 7 Projects

| Project | Area | Key Tags | GitHub Repo |
|---|---|---|---|
| Booster Club | Community | `basketball`, `fundraising`, `youth` | `/booster-club` |
| The Purpose Project | Community / Spirituality | `youth`, `mentorship`, `program` | `/purpose-project` |
| TriDimension | Career | `SaaS`, `GHL`, `automation` | `/tridimension` |
| Car Rental Business | Finances | `business`, `automotive`, `operations` | `/car-rental` |
| abstractwishes | Career / Creative | `brand`, `creative`, `content` | `/abstractwishes` |
| DEI Thesis | Learning & Growth | `research`, `DEI`, `academic` | `/dei-thesis` |
| TrueSentiments | Career / Creative | `brand`, `sentiment`, `AI` | `/truesentiments` |

---

## Tips for Success

1. **Process your Inbox daily** — tasks sitting in Inbox create anxiety. Clarify, organize, or delete them.
2. **Do your Weekly Review every Sunday** — this is the habit that makes the whole system work.
3. **Use the "Next Action" field on projects** — always know the very next physical action for each project.
4. **Don't over-tag** — start with fewer tags and add more only when you need to find things.
5. **Let n8n handle the boring stuff** — auto-create journal entries, send reminders, sync data.
6. **Archive aggressively** — if it's not active, archive it. You can always bring it back.
7. **Your Dashboard is your home screen** — open Notion → see Dashboard → know what to do.

---

*This guide is part of the Second Brain operations documentation. For the GitHub sync layer, see `github-sync-guide.md`. For n8n automation workflows, see `n8n-workflows.md`.*
