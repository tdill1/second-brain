# TriDimension

## Status
Active — Pre-launch setup (targeting first revenue within 60 days)

## Description
TriDimension is a GoHighLevel (GHL) SaaS venture built on the white-label Agency Pro plan, targeting local service businesses (e.g., home services, real estate) with done-for-you automation. The model packages Missed Call Text Back, Google Review Automation, and a Website Chat Widget into niche-specific snapshots sold on a recurring subscription ($197–$397/mo) with a one-time setup fee ($399). The go-to-market strategy uses a "free-to-fee" approach — onboarding 3–5 beta clients for free in exchange for testimonials, then converting to paid.

## Current Priorities
1. **Complete the minimal viable technical setup** — Stripe connected at both Agency and Sub-Account levels, SaaS pricing plans configured, white-label domain live and routing correctly
2. **Build and test the core niche snapshot** — Three automations (Missed Call Text Back, Google Review Request, Web Chat Widget) fully functional and deployable to any new sub-account in one click
3. **Secure 3 free-to-fee beta clients** — Identify target niche, compile a prospect list of 20+ local businesses, execute cold outreach, and onboard the first 3 beta testers within 14 days

## Active Workstreams

### A: Technical Infrastructure & Billing
- Upgrade to Agency Pro plan ($497/mo) and enable SaaS mode
- Connect Stripe at Agency Level (plan creation) and Sub-Account Level (transaction processing)
- Configure two pricing tiers: Starter ($197/mo) and Pro ($397/mo) with $399 setup fee
- White-label the platform domain (e.g., app.tridimension.io) and verify routing
- Test end-to-end: prospect visits sales page → selects plan → pays → sub-account provisioned

### B: Product Development (Snapshot)
- Create a master sub-account for snapshot building
- Build Missed Call Text Back workflow
- Build Google Review Request workflow
- Configure Website Chat Widget
- Package as a deployable snapshot linked to automated onboarding

### C: Client Onboarding Automation
- Build workflow triggered on successful purchase: welcome email, SMS greeting, snapshot load, setup checklist
- Goal: new client achieves first "quick win" within 24 hours with zero manual intervention
- Test the full onboarding sequence with a dummy account before going live

### D: Lead Generation & Sales
- Choose a primary niche (plumbers, roofers, HVAC, or similar local service)
- Use Google Maps to compile a list of 100 local businesses with contact info
- Draft cold call script and SMS templates focused on the cost of missed calls
- Execute the "free-to-fee" pitch: free 30-day access in exchange for video testimonial and 5-star review
- Build a 2-page sales funnel (Sales Page → Order Form → Thank You Page)

## Next 3 Actions
1. **Configure Stripe and SaaS plans** — Log into GHL Agency dashboard, connect Stripe at both levels, create the two pricing tiers with setup fee, and verify sync (see `tridimension/next-actions.md` for detailed steps)
2. **Build the core snapshot** — In a dedicated sub-account, build and test the three core automations (Missed Call Text Back, Google Review Request, Web Chat Widget). Do not build anything else until these three are perfect
3. **Draft the pitch and identify 20 prospects** — Write the "free-to-fee" outreach script, pick a niche, pull 20 local businesses from Google Maps, and begin outreach

## Definition of Done

### Phase 1 — 14 Days
- [ ] White-label domain live and routing
- [ ] Stripe fully integrated; test transaction processed through the 2-page funnel
- [ ] Niche snapshot complete with 3 core automations
- [ ] Automated onboarding workflow tested end-to-end
- [ ] 3 "free-to-fee" beta clients actively using the system

### Phase 2 — 60 Days
- [ ] At least 1 beta client converted to paid
- [ ] 3 additional paying clients acquired at full price
- [ ] 80%+ of onboarded clients achieve a quick win within 7 days
- [ ] Onboarding fully automated — no manual intervention required
- [ ] Recurring monthly revenue established and growing

---

**Detailed plan:** [strategic-action-plan.md](./strategic-action-plan.md)
**Action tracker:** [next-actions.md](./next-actions.md)
