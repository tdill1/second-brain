# GitHub Project Setup Guide

_Your PAT token has push/pull access but not Issues write permissions. Run the commands below to set up labels, milestones, and issues — or update your token to include "Issues: Read and write" permission._

## Option 1: Update Your Token (Recommended)

Go to https://github.com/settings/tokens and edit your fine-grained token to add:
- **Issues: Read and write**
- **Projects: Read and write** (optional, for GitHub Projects boards)

Then I can set these up for you automatically.

## Option 2: Run These Commands Locally

### Step 1: Create Labels

```bash
REPO="tdill1/second-brain"

# Phase labels
gh label create "phase-1-foundation" --repo $REPO --color "0E8A16" --description "Phase 1: Foundation & Cleanup"
gh label create "phase-2-notion" --repo $REPO --color "1D76DB" --description "Phase 2: Notion Integration"
gh label create "phase-3-n8n" --repo $REPO --color "D93F0B" --description "Phase 3: n8n Automation"
gh label create "phase-4-habits" --repo $REPO --color "FBCA04" --description "Phase 4: Habits & Optimization"

# Project labels
gh label create "project:booster-club" --repo $REPO --color "C5DEF5" --description "Booster Club project"
gh label create "project:purpose-project" --repo $REPO --color "C5DEF5" --description "The Purpose Project"
gh label create "project:tridimension" --repo $REPO --color "C5DEF5" --description "TriDimension GHL SaaS"
gh label create "project:car-rental" --repo $REPO --color "C5DEF5" --description "Car Rental Business"
gh label create "project:abstractwishes" --repo $REPO --color "C5DEF5" --description "abstractwishes brand"
gh label create "project:dei-thesis" --repo $REPO --color "C5DEF5" --description "DEI Thesis"
gh label create "project:truesentiments" --repo $REPO --color "C5DEF5" --description "TrueSentiments"

# Type labels
gh label create "type:setup" --repo $REPO --color "BFD4F2" --description "Infrastructure/setup task"
gh label create "type:content" --repo $REPO --color "D4C5F9" --description "Content creation task"
gh label create "type:automation" --repo $REPO --color "F9D0C4" --description "Automation workflow task"

# Priority labels
gh label create "priority:high" --repo $REPO --color "B60205" --description "High priority"
gh label create "priority:medium" --repo $REPO --color "FF9F1C" --description "Medium priority"
gh label create "priority:low" --repo $REPO --color "0075CA" --description "Low priority"
```

### Step 2: Create Milestones

```bash
gh api repos/$REPO/milestones -f title="Phase 1: Foundation & Cleanup" -f description="Clean up repo, flesh out projects, establish ops" -f due_on="2026-04-19T23:59:59Z"
gh api repos/$REPO/milestones -f title="Phase 2: Notion Integration" -f description="Set up Notion databases and API access" -f due_on="2026-04-26T23:59:59Z"
gh api repos/$REPO/milestones -f title="Phase 3: n8n Automation" -f description="Deploy n8n and activate core workflows" -f due_on="2026-05-10T23:59:59Z"
gh api repos/$REPO/milestones -f title="Phase 4: Habits & Optimization" -f description="Build habits and optimize the system" -f due_on="2026-06-07T23:59:59Z"
```

### Step 3: Create Issues

```bash
# Phase 1 Issues
gh issue create --repo $REPO --title "Audit and update all project READMEs" --label "phase-1-foundation,type:content,priority:high" --body "Review each project folder. Ensure README has: status, description, priorities, workstreams, next actions, definition of done. ✅ Done by Hermes Agent on 2026-04-12."
gh issue create --repo $REPO --title "Create project roadmap" --label "phase-1-foundation,type:content,priority:high" --body "Create ops/project-roadmap.md with phases, timeline, success criteria. ✅ Done by Hermes Agent on 2026-04-12."
gh issue create --repo $REPO --title "Set up weekly review template and process" --label "phase-1-foundation,type:content,priority:medium" --body "Create reusable weekly review template. Set up ops/reviews/ folder. ✅ Done by Hermes Agent on 2026-04-12."
gh issue create --repo $REPO --title "Populate areas/ with life area notes" --label "phase-1-foundation,type:content,priority:medium" --body "Create notes for: health, finance, family, career, learning. Each should have current state, standards to maintain, and key metrics."
gh issue create --repo $REPO --title "Process inbox/ and establish capture habit" --label "phase-1-foundation,priority:medium" --body "Start using inbox/ for quick capture. Process items within 24 hours into PARA folders."

# Phase 2 Issues
gh issue create --repo $REPO --title "Create Notion workspace with PARA databases" --label "phase-2-notion,type:setup,priority:high" --body "Follow ops/notion-setup-guide.md to create all 7 databases with proper schemas, relations, and views."
gh issue create --repo $REPO --title "Set up Notion API integration" --label "phase-2-notion,type:setup,priority:high" --body "Create Notion integration, get API key, share databases, test connectivity. See ops/notion-setup-guide.md Section 7."
gh issue create --repo $REPO --title "Create Notion dashboard views" --label "phase-2-notion,type:setup,priority:medium" --body "Build dashboard page with linked views: Active Projects board, Today's Tasks, This Week calendar, Recent Journal entries."
gh issue create --repo $REPO --title "Migrate existing project data to Notion" --label "phase-2-notion,type:content,priority:medium" --body "Create project entries in Notion for all 7 active projects. Create initial tasks from each project's next actions."

# Phase 3 Issues
gh issue create --repo $REPO --title "Deploy n8n instance" --label "phase-3-n8n,type:setup,priority:high" --body "Set up n8n (self-hosted on VPS or n8n cloud). Configure base credentials for Notion API, GitHub, Google, Claude API."
gh issue create --repo $REPO --title "Import and configure voice capture workflow" --label "phase-3-n8n,type:automation,priority:high" --body "Import ops/n8n-workflows/01-voice-capture-to-notion.json. Configure Google Tasks + Notion + Claude credentials. Test end-to-end."
gh issue create --repo $REPO --title "Import and configure daily review workflow" --label "phase-3-n8n,type:automation,priority:high" --body "Import ops/n8n-workflows/02-daily-review-generator.json. Configure and test. Verify daily recap generation."
gh issue create --repo $REPO --title "Import and configure GitHub-Notion sync" --label "phase-3-n8n,type:automation,priority:medium" --body "Import ops/n8n-workflows/03-github-notion-sync.json. Configure and test bidirectional sync."
gh issue create --repo $REPO --title "Import and configure morning briefing" --label "phase-3-n8n,type:automation,priority:medium" --body "Import ops/n8n-workflows/04-morning-briefing.json. Configure and test morning priority notifications."
gh issue create --repo $REPO --title "Set up error notification workflow" --label "phase-3-n8n,type:automation,priority:medium" --body "Create a catch-all n8n workflow that notifies you when any other workflow fails."
```

## Recommended GitHub Projects Board

Create a GitHub Projects board (V2) with these columns:
- **Backlog** — All future work
- **This Week** — Committed for current week
- **In Progress** — Actively being worked on
- **Review** — Done, needs verification
- **Done** — Completed and verified

Add all issues to the board. Use phase milestones to filter views.
