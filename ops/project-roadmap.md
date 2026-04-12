# Second Brain Project Roadmap

_Created: 2026-04-12_
_Last updated: 2026-04-12_

## Vision

Transform this GitHub-based PARA system into a fully operational Second Brain with:
- Automated capture workflows (voice, notes, web)
- AI-powered processing and categorization
- Notion as the interactive dashboard layer
- n8n as the automation engine
- GitHub as the source of truth and version-controlled knowledge base

---

## Phase 1: Foundation & Cleanup (Week of April 13)

**Goal:** Get the existing repo into a clean, honest state that reflects reality.

- [x] Audit all projects — identify truly active vs placeholder
- [x] Flesh out skeleton project READMEs with real descriptions and priorities
- [x] Create project roadmap (this file)
- [x] Set up GitHub Issues, Labels, and Milestones for tracking
- [x] Create weekly review template
- [x] Update ops/ documentation

**Success criteria:** Every project folder has a meaningful README with status, description, priorities, and next actions. Dashboard accurately reflects reality.

---

## Phase 2: Notion Integration (Week of April 20)

**Goal:** Set up Notion as the interactive dashboard layer on top of the GitHub knowledge base.

- [ ] Create Notion workspace with PARA-aligned databases
- [ ] Set up Tasks database (Status, Priority, Due Date, Project, Tags)
- [ ] Set up Projects database (linked to Tasks)
- [ ] Set up Journal database
- [ ] Set up Meeting Notes database
- [ ] Set up Weekly Reviews database
- [ ] Create dashboard views (Active Projects, Today's Tasks, Weekly Review)
- [ ] Test Notion API access for automation

**Success criteria:** Notion workspace mirrors GitHub project structure. Can create/query items via API.

---

## Phase 3: n8n Automation Layer (Week of April 27)

**Goal:** Deploy n8n and activate core automation workflows.

### 3a: Infrastructure
- [ ] Deploy n8n instance (self-hosted or cloud)
- [ ] Configure API credentials (Notion, GitHub, Google, Claude/AI)
- [ ] Set up error notification workflow

### 3b: Core Workflows (Priority Order)
1. [ ] **Voice Capture → Notion Tasks** — Google Tasks polling → AI enrichment → Notion
2. [ ] **Daily Review Generator** — Summarize completed tasks, journal entries → Notion page + notification
3. [ ] **GitHub ↔ Notion Sync** — Keep project status in sync between systems
4. [ ] **Morning Briefing** — Pull today's calendar + priorities → notification

### 3c: Extended Workflows (Month 2)
5. [ ] **Weekly Review Automation** — Aggregate weekly data → AI analysis → briefing
6. [ ] **ReMarkable Journal Sync** — OCR + AI processing → Notion journal entries
7. [ ] **Meeting Notes Pipeline** — Google Drive watch → AI extraction → Notion
8. [ ] **Project Alignment Engine** — Orphan detection, momentum tracking

**Success criteria:** At least workflows 1-3 running reliably. Voice capture to Notion working end-to-end.

---

## Phase 4: Habits & Optimization (Month 2-3)

**Goal:** Build the human habits that make the system work.

- [ ] Establish daily capture habit (inbox processing)
- [ ] Weekly review every Sunday evening
- [ ] Monthly system audit (review workflow reliability, API costs)
- [ ] Populate areas/ with life area notes (health, finance, family, career, learning)
- [ ] Build personal knowledge base in resources/

**Success criteria:** Weekly reviews happening consistently. Inbox processed within 24 hours.

---

## Phase 5: Advanced Features (Month 3+)

- [ ] Habit tracking integration
- [ ] Email inbox zero workflow
- [ ] Financial tracking
- [ ] Energy/focus optimization (task completion time analysis)
- [ ] Spaced repetition for learning materials
- [ ] Client communication tracking

---

## Project Priority Stack

Based on current state and momentum, recommended focus order:

| Priority | Project | Status | Rationale |
|----------|---------|--------|-----------|
| 1 | Booster Club | Active — most developed | Has governance, meetings, membership. Clear next steps. |
| 2 | The Purpose Project | Concept/Discovery | Strong vision. Needs 7-day sprint to validate. |
| 3 | TriDimension (GHL SaaS) | Active | Full strategic plan exists. Ready for execution. |
| 4 | Car Rental Business | Active | Revenue-generating. Needs documentation. |
| 5 | abstractwishes | Active | Brand building. Define scope and goals. |
| 6 | DEI Thesis | Active | Academic. Set timeline or pause. |
| 7 | TrueSentiments | Unclear | Research exists but no clear direction. Decide: activate or archive. |

---

## Estimated Costs

| Item | Monthly Cost |
|------|-------------|
| Notion Personal Pro | $10 |
| n8n (self-hosted VPS) | $12 |
| Claude API | $20-40 |
| Google Cloud Vision (OCR) | $0-5 |
| **Total** | **$42-67/month** |

---

## Key Metrics to Track

- Tasks captured per week
- Task completion rate
- Projects with activity in last 7 days
- Weekly review completion streak
- Inbox items pending > 48 hours (target: 0)
