# GHL Account Audit & Simplified Test Campaign Launch Plan
## TriDimension Group LLC — April 14, 2026

---

## AUDIT SUMMARY

### What's Working ✅
- **Location set up:** TriDimension Group LLC, Chula Vista, CA
- **Pipeline live:** "TriDimension Prospects" with 7 stages, 10 opportunities loaded ($12,970 value)
- **Contacts:** 19 total (10 prospects + 9 existing)
- **Calendar:** "Introduction Call" active (Mon-Fri, 11am-1pm & 4pm-10pm) — 30-min slots, max 5/day
- **Website live:** tridimensiongroup.com — clean, professional GHL-hosted site
- **"Never Miss" funnel started:** 3 pages (Home, Pricing, Contact) on domain
- **Blog:** "Digital Automation" blog structure exists
- **Lead capture funnel:** "TriDimension SaaS Lead Capture" exists (no domain attached)
- **Email template:** "SaaS Welcome Email" folder exists
- **Missed Call Text-Back workflow:** Recipe exists (draft)
- **Forms:** 14 forms available (mostly prebuilt templates)
- **Social links:** Facebook, LinkedIn, YouTube in footer

### Critical Gaps 🚨

1. **NO EMAIL SERVICE CONFIGURED**
   - `defaultEmailService: NOT SET`
   - You CANNOT send emails from GHL until this is set up
   - This blocks the entire follow-up sequence
   - **FIX:** Go to Settings > Email Services > Connect Mailgun (GHL's default) or your own SMTP

2. **NO PHONE NUMBER / A2P**
   - No phone numbers detected on the account
   - Can't send SMS or do missed-call text-back without a number
   - **FIX:** Settings > Phone Numbers > Buy a number, then register for A2P

3. **SAAS MODE NOT ACTIVATED**
   - `saasMode: not_activated`
   - This means you're on a regular sub-account, not Agency Pro with SaaS
   - Fine for now (you're selling done-for-you setups, not SaaS subscriptions)
   - Upgrade later when you have 5+ clients

4. **NO CURRENCY SET**
   - Payments/invoicing won't work without this
   - **FIX:** Settings > Business Info > Set to USD

5. **ALL 3 WORKFLOWS IN DRAFT**
   - "Auto Missed Call Text-Back" — draft since Dec 2025
   - Two unnamed workflows — draft since Feb 2026
   - None are active
   - **FIX:** Publish the missed call text-back once phone number is set up

6. **SOCIAL PROFILES NOT CONNECTED IN GHL**
   - 0/11 connected (even though links exist in the website footer)
   - The social links in the footer go to real pages but GHL's social planner can't post
   - **FIX:** Settings > Social Planner > Connect Facebook, LinkedIn, YouTube

7. **PROSPECT CONTACTS HAVE NO EMAIL ADDRESSES**
   - All 10 prospects have phone only — no email
   - Can't run email sequences without email addresses
   - **FIX:** Research and add emails (see below)

8. **"NEVER MISS" FUNNEL ROUTING BROKEN**
   - The /automation-advantage/home-1397 URL redirects to /home (main site)
   - Prospects going to the funnel see the generic marketing page, NOT the automation offer
   - **FIX:** Check funnel URL settings in the page builder

9. **NO CHAT WIDGET ACTIVE**
   - `isChatWidgetLive: false` on all funnels
   - You're selling chat widgets to clients but don't have one on your own site
   - **FIX:** Enable the GHL webchat widget on tridimensiongroup.com

10. **FAKE TESTIMONIALS ON MAIN SITE**
    - "Maria L., Café Owner" and "James R., Boutique Owner" are placeholder testimonials
    - This will destroy trust if a prospect Googles them
    - **FIX:** Remove testimonials until you have real ones, or replace with general value statements

---

## SIMPLIFIED TEST CAMPAIGN — LAUNCH IN 48 HOURS

### The Goal
Get your first demo call booked within 7 days using only what's available RIGHT NOW, with minimal setup.

### Phase 0: Fix the Blockers (Tonight — 30 min)

| Task | Time | How |
|------|------|-----|
| Set up email service | 10 min | Settings > Email Services > Connect Mailgun (GHL provides this for free on LC Email) |
| Set currency to USD | 1 min | Settings > Business Info > Currency > USD |
| Buy a phone number | 5 min | Settings > Phone Numbers > Buy Number > Select a Poway/619 area code |
| Start A2P registration | 10 min | Settings > Phone Numbers > Trust Center > Register Brand + Campaign |
| Enable webchat widget | 5 min | Sites > tridimensiongroup.com > Settings > Chat Widget > Enable |

### Phase 1: Fix the Funnel (Tomorrow — 1 hour)

**Option A (Recommended): Repurpose the existing "Never Miss" funnel**
The 3-page structure is perfect. Just fix the content:

Page 1 — Landing (/automation-advantage):
- Use the landing page copy from 03-landing-page-copy.md
- Hero: "Stop Losing Customers to Missed Calls"
- CTA: "Book Your Free 10-Min Walkthrough" → links to Introduction Call calendar
- Remove generic marketing language, make it specific to the automation setup offer

Page 2 — Pricing (/pricing):
- Core $997 / Premium $1,497
- Feature comparison
- CTA: "Book Your Walkthrough"

Page 3 — Contact (/contact):
- Embed the "Introduction Call" calendar directly
- Add phone number and email

**Fix the URL routing** — make sure /automation-advantage loads the funnel, not the main site.

**Remove fake testimonials** — replace with "Results from our automation setups" section using real metrics (even projected ones like "Businesses using missed-call text-back recover an average of 15-30% of lost leads").

### Phase 2: Simplified Outreach (Start Immediately — No Email Service Needed)

Since email setup takes a bit, start with what works RIGHT NOW:

**PHONE CALLS (Today/Tonight)**
1. Call all 6 Tier-1 prospects after 5pm (Secret Shopper test)
2. Log results in GHL — move opportunities to "Secret Shopper Called" stage
3. Follow up tomorrow morning with the Secret Shopper script

**MANUAL SMS via GHL Conversations (Once phone number is active)**
Send individually through the GHL conversation inbox:
```
Hey [Name], Tony here. I called [Business Name] yesterday and got your voicemail — no callback, no text. I build systems that fix that automatically. 72 hours, your missed calls turn into booked jobs. Want to see how it works? Takes 10 min. 🤙
```

**DIRECT OUTREACH (No GHL needed)**
- Find prospect Instagram/Facebook pages and DM them using scripts from 01-outreach-scripts.md
- Post in local Facebook business groups
- Ask Booster Club parents for warm intros

### Phase 3: Activate the Workflow (Once Email + Phone Are Set Up)

1. Publish the follow-up workflow from 06-follow-up-workflow.md
2. I'll enroll all 10 prospects via API
3. The 7-touch sequence runs on autopilot

### Phase 4: Find Prospect Emails (This Week)

The 10 prospects need email addresses for the sequence to work. Here's how to find them:

1. **Check their websites** — most have a contact page with email
2. **Google "[Business Name] email"**
3. **Use Hunter.io** (free tier: 25 lookups/month) — hunter.io/search
4. **Check their Google Business Profile** — sometimes has email
5. **Call and ask** — "Hey, I'm trying to send some info over — what's the best email?"

Once you have emails, I can update the contacts via API instantly.

---

## PRIORITY ACTIONS — RANKED

| Priority | Action | Impact | Effort |
|----------|--------|--------|--------|
| 🔴 1 | Set up email service (Mailgun/LC Email) | Unlocks all email outreach | 10 min |
| 🔴 2 | Buy phone number + start A2P | Unlocks SMS + missed call text-back | 15 min |
| 🔴 3 | Call Tier-1 prospects tonight (Secret Shopper) | Could book a demo THIS WEEK | 30 min |
| 🟡 4 | Fix "Never Miss" funnel content + URL routing | Gives you a link to send prospects | 1 hour |
| 🟡 5 | Enable webchat on tridimensiongroup.com | Practices what you preach | 5 min |
| 🟡 6 | Remove fake testimonials | Prevents trust damage | 5 min |
| 🟡 7 | Set currency to USD | Enables payments | 1 min |
| 🟢 8 | Research + add prospect email addresses | Enables email sequences | 30 min |
| 🟢 9 | Publish follow-up workflow | Automates the nurture sequence | 30 min |
| 🟢 10 | Connect social profiles in GHL | Enables social planner | 10 min |
| 🟢 11 | Publish Missed Call Text-Back workflow | Demo your own product | 5 min |

---

## WHAT I CAN DO VIA API RIGHT NOW

Once you complete the blockers above, tell me and I can:
- ✅ Enroll all prospects into the workflow
- ✅ Update contacts with email addresses as you find them
- ✅ Move opportunities between pipeline stages
- ✅ Send individual messages through conversations
- ✅ Add new prospects as you find them
- ✅ Track and report on pipeline metrics

---

## 7-DAY LAUNCH TIMELINE

| Day | Action |
|-----|--------|
| **Today (Mon)** | Fix blockers (email, phone, currency). Call Tier-1 prospects after 5pm. |
| **Tue** | Follow up with Secret Shopper script. Fix funnel content. DM prospects on social. |
| **Wed** | Research prospect emails. Send first cold emails manually if email service is live. |
| **Thu** | Publish workflow. I enroll prospects. Post in local FB groups. |
| **Fri** | Follow-up calls to anyone who hasn't responded. Warm referral asks. |
| **Sat-Sun** | Let automated sequence work. Call any warm leads that engage. |
| **Next Mon** | Review pipeline. Add 10 more prospects. Iterate. |

**Target: 1-2 demo calls booked by Friday. First client closed within 2 weeks.**
