# GHL Follow-Up Workflow: "TriDimension Prospect Nurture"

## Build This in GHL: Automation > Workflows > Create New Workflow

### Trigger: "Contact Added to Workflow" (manual enrollment via API)

---

## SEQUENCE OVERVIEW (7 touches over 14 days)

```
Day 0 (Immediate)  → Email #1: The Secret Shopper Opener
Day 1 (24hrs)      → SMS #1: Quick follow-up text
Day 3              → Email #2: The Cost of Missed Calls
Day 5              → SMS #2: Social proof nudge
Day 7              → Email #3: Case study / results
Day 10             → Email #4: Limited availability urgency
Day 14             → SMS #3: Final check-in / breakup
```

---

## STEP-BY-STEP BUILD INSTRUCTIONS

### Step 1: Trigger
- Click "Add New Trigger"
- Select: **Contact Added**
- Filter: Tag = `tridimension-prospect`

### Step 2: Wait 0 minutes → Email #1

**Action: Send Email**
- Subject: I called {{contact.company_name}} and nobody texted me back
- From Name: Tony Dill
- Body:

```
Hi {{contact.first_name}},

I'm going to shoot you straight — I called {{contact.company_name}} yesterday evening as a potential customer. Nobody answered, and I didn't get a callback or a text.

I'm not a mystery shopper. I build automated customer capture systems for local businesses. But I wanted you to see the problem firsthand: every time that happens, a potential customer moves on to the next company on Google.

Here's what I install in 72 hours:

• Missed Call Text-Back — caller gets an instant text so you never lose them
• Google Review Automation — 5-star reviews on autopilot after every job
• 24/7 Website Chat — captures leads while you sleep
• One Inbox — all your messages (text, email, Facebook, Google) in one place
• Smart Booking — online scheduling with automatic reminders

I just did this for a local service business and they booked 11 extra appointments in the first two weeks from leads they would have lost.

Want to see how it works? Takes 10 minutes.

Just reply to this email or grab a time here: [INSERT CALENDAR LINK]

— Tony Dill
TriDimension | Automation That Grows Your Business
```

### Step 3: Wait 24 hours → SMS #1

**Action: Send SMS**
```
Hey {{contact.first_name}}, Tony here from TriDimension. I sent you an email yesterday about automating your missed calls and Google reviews. Would a quick 10-min call this week work? I can show you exactly how it works for {{contact.company_name}}. 🤙
```

### Step 4: Wait 2 days → Email #2

**Action: Send Email**
- Subject: The $1,200/month leak at {{contact.company_name}}
- Body:

```
Hi {{contact.first_name}},

Quick math for you:

If {{contact.company_name}} misses just 5 calls per week...
And just 1 of those would have been a paying customer...
At even $300 per job...

That's $1,200/month walking out the door. $14,400/year.

The fix takes 72 hours. I install an automated system that:

✅ Texts missed callers instantly (so they don't call your competitor)
✅ Requests Google reviews after every job (so you rank higher)
✅ Books appointments automatically (no more phone tag)
✅ Puts every message in one inbox on your phone

The entire setup is $997 — it pays for itself in the first week.

Reply "interested" and I'll send you a quick video walkthrough.

— Tony
TriDimension
```

### Step 5: Wait 2 days → SMS #2

**Action: Send SMS**
```
{{contact.first_name}} — just helped a local business owner set up automated missed-call text-back + Google review requests. They got 8 new reviews in the first week. Would something like that help {{contact.company_name}}? Happy to show you how it works. No pressure.
```

### Step 6: Wait 2 days → Email #3

**Action: Send Email**
- Subject: How [Similar Business] booked 11 extra appointments in 2 weeks
- Body:

```
Hi {{contact.first_name}},

Wanted to share a quick result.

I recently set up one of my automation systems for a local service business similar to {{contact.company_name}}. Here's what happened:

Week 1:
→ 6 missed calls caught and converted via auto text-back
→ 8 new Google reviews from automated requests
→ 3 appointments booked through the new website chat

Week 2:
→ 5 more missed-call conversions
→ 11 total new appointments that would have been lost

Total setup time: 3 days.
Total cost: less than one average job.

The system runs 24/7 on autopilot. No extra staff. No extra hours.

If you want the same results for {{contact.company_name}}, I have 2 spots open this month.

Reply "show me" and I'll walk you through it in 10 minutes.

— Tony
TriDimension
```

### Step 7: Wait 3 days → Email #4

**Action: Send Email**
- Subject: Last 2 spots this month
- Body:

```
Hi {{contact.first_name}},

Quick update — I only take on 5 automation setup clients per month (each one takes me 3 days of hands-on build time), and I've got 2 spots left for April.

After that, the next available window is May.

If you've been thinking about fixing the missed calls, getting more Google reviews, or just not losing customers to slow follow-up — now's the time.

Here's everything you get:
• Missed Call Text-Back
• Google Review Automation  
• 24/7 Website Chat
• Unified Inbox
• Smart Appointment Booking
• Full A2P compliance setup

All installed and running in 72 hours. Guaranteed.

$997 for the complete setup. Pays for itself in week one.

Reply to this email or book a call: [INSERT CALENDAR LINK]

— Tony
TriDimension
```

### Step 8: Wait 4 days → SMS #3 (Breakup)

**Action: Send SMS**
```
Hey {{contact.first_name}}, I've reached out a few times about helping {{contact.company_name}} capture more customers automatically. Totally understand if the timing isn't right. If you ever want to revisit, just text me back. Either way, wishing you a great month! — Tony
```

### Step 9: Add Tag

**Action: Add Tag**
- Tag: `nurture-sequence-complete`

---

## AFTER BUILDING THE WORKFLOW

1. Set the workflow status to **Published**
2. Give me the Workflow ID (from the URL when you open it — looks like a UUID)
3. I'll enroll all 10 prospects via the API automatically

---

## IMPORTANT NOTES

- **Replace [INSERT CALENDAR LINK]** with your GHL calendar booking link. You already have an "Introduction Call" calendar set up — use that link.
- **A2P must be registered** before SMS steps will deliver. Start the registration process now if you haven't already.
- **Email domain** — make sure your sending domain/email is configured in GHL Settings > Email Services
- Contacts who reply at any step should be manually moved in the pipeline (New Lead → Demo Scheduled, etc.)
- Consider adding an "If/Else" branch: if contact replies → remove from workflow and notify you

---

## OPTIONAL ENHANCEMENTS (Phase 2)

- Add a voicemail drop on Day 2 (GHL supports this)
- Add a Facebook/Instagram retargeting pixel on the landing page
- Create a "re-engagement" sequence for Closed Lost opportunities (run 30 days later)
- Set up pipeline stage change triggers (e.g., when moved to "Demo Scheduled" → send confirmation email)
