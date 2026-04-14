# Intent Skill System — Stress Testing Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Systematically verify that all 15 Intent skills and 6 agents produce correct output, route properly, detect anti-patterns, handle edge cases, and behave consistently across platform distributions.

**Architecture:** Five test tiers, each progressively more adversarial. Tier 1 runs a realistic project end-to-end through the full skill chain. Tier 2 tests each skill's contract individually. Tier 3 feeds known dark patterns to verify detection. Tier 4 stress-tests with adversarial/edge-case inputs. Tier 5 compares behavior across Claude Code, Cursor, and Copilot distributions.

**Tech Stack:** Claude Code with Intent plugin installed. Cursor and VS Code Copilot for cross-platform tests. All tests are conversational — invoke a skill with a specific prompt, then verify output against pass/fail criteria.

**Repo:** https://github.com/ghaida/intent

---

## How to Run These Tests

Each test is a **scenario**: a specific prompt fed to a specific skill, with explicit pass/fail criteria. To execute:

1. Start a fresh Claude Code session (or fresh Cursor/Copilot chat for Tier 5)
2. Invoke the skill named in the test
3. Provide the exact test prompt
4. Compare output against the **Pass Criteria** checklist
5. Record: PASS, PARTIAL (some criteria met), or FAIL (critical criteria missed)
6. For FAILs: capture the actual output and note which criteria were missed

**Important:** Each test should run in a fresh session to avoid context bleed between tests. The skill should work from cold start with only the test prompt as input.

---

## Test Scenario: The Project

All Tier 1-3 tests use a shared fictional project to maintain consistency:

**Project: MealPlan** — A meal planning app for people managing chronic health conditions (diabetes, celiac, kidney disease). Users input dietary restrictions, medications that interact with food, and preferences. The app generates weekly meal plans, grocery lists, and tracks nutritional compliance against medical targets.

**Why this project:** It exercises ethical concerns (health data, vulnerable users, medical advice boundaries), accessibility (chronic illness affects motor/cognitive function), localization (dietary patterns vary by culture), complex flows (onboarding, planning, tracking, sharing with care team), and measurement challenges (health outcomes are slow and private).

---

## Tier 1: Lifecycle Smoke Tests

Full end-to-end project lifecycle. Each test feeds output from the previous test as input to the next. Tests must run in sequence.

### Task 1: Lifecycle — Context Setting

**Skill:** `/intent` (context mode)

**Prompt:**
```
/intent context

I'm designing MealPlan — a meal planning app for people managing chronic health conditions like diabetes, celiac disease, and kidney disease. Users input dietary restrictions, medications that interact with food, and personal preferences. The app generates weekly meal plans, grocery lists, and tracks nutritional compliance against medical targets set by their healthcare provider.

Target: iOS and web. Team: 2 designers, 4 engineers, 1 PM. Timeline: MVP in 12 weeks. We have interview transcripts from 15 users with diabetes and 8 with celiac disease. No existing product — greenfield.
```

- [ ] **Step 1: Invoke `/intent` with the prompt above**
- [ ] **Step 2: Verify output against pass criteria**

**Pass Criteria:**
- [ ] Output contains a structured context document (not freeform prose)
- [ ] WHO section identifies behavioral segments (not just "diabetics" — distinguishes by management style, tech comfort, condition severity)
- [ ] WHAT section captures product and business context
- [ ] CONSTRAINTS section names: timeline (12 weeks), team size, platform (iOS + web), medical advice liability, health data privacy (HIPAA/GDPR)
- [ ] ETHICAL STANCE section flags: vulnerable users (health conditions), medical advice boundary, data sensitivity, potential for harm if recommendations are wrong
- [ ] SUCCESS DEFINITION exists and is measurable
- [ ] Output suggests next step: route to `/strategize` for problem framing
- [ ] No anti-patterns introduced in the context framing itself

**Failure Indicators:**
- Generic context with no health-specific ethical flags
- Missing HIPAA/health data privacy concerns
- No mention of medical advice liability boundary
- Suggests jumping straight to flow design without strategy

---

### Task 2: Lifecycle — Strategic Framing

**Skill:** `/strategize`

**Prompt:**
```
/strategize

[Paste context document from Task 1]

We have interview transcripts from 23 users. Key themes:
- Users feel overwhelmed by dietary restrictions, especially when managing multiple conditions
- Existing apps focus on calorie counting, not medical dietary compliance
- Users want their care team (dietitian, doctor) to have visibility into adherence
- Grocery shopping is the #1 pain point — translating meal plans into shopping lists that account for restrictions
- Users with diabetes need real-time feedback on carb/glycemic load per meal
- Trust is critical — users won't follow meal suggestions they don't trust

No competitor directly addresses multi-condition meal planning. MyFitnessPal and Cronometer are closest but focus on fitness, not medical compliance.
```

- [ ] **Step 1: Invoke `/strategize` with context + research summary**
- [ ] **Step 2: Verify Five Foundational Questions are addressed**
- [ ] **Step 3: Verify design brief output format**

**Pass Criteria:**
- [ ] All Five Foundational Questions addressed: Problem Validation, Audience Definition, Solution Fit, Feature Validation, Competitive Landscape
- [ ] Problem Validation: rates severity, cites evidence from interview themes, gives go/no-go signal
- [ ] Audience Definition: behavioral clusters (not demographics), distinguishes at least 2-3 segments (e.g., newly diagnosed vs. long-term managers, single-condition vs. multi-condition)
- [ ] Solution Fit: recommends form factor grounded in user context (mobile for grocery shopping, web for meal planning)
- [ ] Competitive Landscape: positions against MyFitnessPal/Cronometer, identifies differentiation (medical compliance, multi-condition, care team visibility)
- [ ] Design brief follows template: Context, Gap, Opportunity, Goals, Constraints, Guiding Principles, Assumptions, Proposed Scope
- [ ] Assumptions are explicitly flagged (not buried in assertions)
- [ ] Open questions identified (what we still need to research)
- [ ] Routes to `/investigate` for research gaps, `/blueprint` for system architecture

**Failure Indicators:**
- Skips Foundational Questions, jumps to solutions
- Audience defined by demographics only ("25-45 year old women")
- No competitive analysis
- Assumptions presented as facts
- No uncertainty acknowledgment

---

### Task 3: Lifecycle — Experience Design

**Skill:** `/journey`

**Prompt:**
```
/journey

[Paste design brief from Task 2]

Design the core meal planning flow: user opens app → sees weekly plan → can swap meals → generates grocery list → marks items as purchased → tracks daily nutritional targets.

Key constraints from research:
- Users are often fatigued (chronic illness) — minimize cognitive load
- Must accommodate 1-3 simultaneous dietary restriction sets
- Grocery list must group by store aisle and flag items that conflict with any restriction
- Care team sharing is opt-in, not default
```

- [ ] **Step 1: Invoke `/journey` with brief + flow requirements**
- [ ] **Step 2: Verify flow completeness**

**Pass Criteria:**
- [ ] Screen-by-screen flow with clear entry → success path
- [ ] States defined per screen (default, loading, empty, error, success at minimum)
- [ ] Cognitive load managed: progressive disclosure, not all options visible at once
- [ ] Meal swap flow handles restriction conflicts (what if swapped meal violates a restriction?)
- [ ] Grocery list flow includes aisle grouping and restriction flagging
- [ ] Care team sharing flow: opt-in consent, clear what's shared, easy to revoke
- [ ] Device variants addressed (iOS vs. web, at minimum different for grocery shopping in-store vs. planning at home)
- [ ] Copy direction provided per screen (not final copy, but intent)
- [ ] Pending questions listed
- [ ] References `/organize` for navigation structure, `/articulate` for copy, `/fortify` for edge cases

**Failure Indicators:**
- Happy path only, no error/empty/loading states
- No consideration of cognitive load or fatigue
- Care team sharing is default-on (ethical violation)
- Grocery list is flat, unstructured
- No device variation considered

---

### Task 4: Lifecycle — Quality Evaluation

**Skill:** `/evaluate`

**Prompt:**
```
/evaluate

[Paste flow from Task 3]

Evaluate this meal planning flow for UX quality. Pay special attention to:
- Accessibility for users with chronic fatigue and motor impairment
- Ethical concerns around health data and care team sharing
- Edge cases: what happens when dietary restrictions conflict with each other?
```

- [ ] **Step 1: Invoke `/evaluate` with flow + focus areas**
- [ ] **Step 2: Verify evaluation structure and routing**

**Pass Criteria:**
- [ ] UX Health Score (0-100) with breakdown
- [ ] Anti-pattern verdict with specific patterns named (if any)
- [ ] Heuristic scores H1-H10 with per-heuristic findings
- [ ] Cognitive walkthrough for at least 2 core tasks (meal planning, grocery list generation)
- [ ] Priority issues categorized P0-P3
- [ ] Each issue routes to a specific Intent skill for resolution (e.g., "Engage `/fortify` for restriction conflict edge case")
- [ ] Positive findings section acknowledges what works well
- [ ] Accessibility findings specific to chronic fatigue and motor impairment (not generic a11y)
- [ ] Ethical review of care team data sharing (consent, transparency, revocability)
- [ ] No sycophantic "this is great!" without substantive critique

**Failure Indicators:**
- No numeric scoring (vague "this is pretty good")
- Generic accessibility checklist not tailored to health condition users
- No anti-pattern scan
- Issues listed without skill routing
- Overly positive with no substantive critique

---

### Task 5: Lifecycle — Hardening

**Skill:** `/fortify`

**Prompt:**
```
/fortify

[Paste flow from Task 3 + evaluation findings from Task 4]

Harden this meal planning flow for real-world use. Specific concerns:
- What happens when a user has conflicting dietary restrictions (e.g., high-potassium for diabetes conflicts with low-potassium for kidney disease)?
- What happens on a slow 3G connection when generating a meal plan?
- What happens when the grocery list has 0 items because all meals were skipped?
- First-run experience for a newly diagnosed user who doesn't know their restrictions yet
```

- [ ] **Step 1: Invoke `/fortify` with flow + specific stress scenarios**
- [ ] **Step 2: Verify state inventory and edge case coverage**

**Pass Criteria:**
- [ ] State inventory matrix: every screen × every state (default, empty, loading, partial, error, success, offline)
- [ ] Restriction conflict scenario fully designed: detection, user notification, resolution options, care team escalation path
- [ ] Slow connection handling: skeleton screens, optimistic UI, or progressive loading — not just a spinner
- [ ] Empty grocery list: not a dead end — offers "add meals" or "browse recipes" recovery
- [ ] First-run for newly diagnosed: progressive onboarding, doesn't require full restriction set upfront, "I don't know yet" option
- [ ] Stress test results for: extremely long meal names, 50+ grocery items, 5+ simultaneous restrictions, user in different timezone than care team
- [ ] Each finding rated by severity (P0-P3)
- [ ] References `/include` for accessibility edge cases, `/articulate` for error copy

**Failure Indicators:**
- State inventory missing or incomplete (fewer than 5 states per screen)
- Restriction conflict hand-waved ("show an error message")
- No first-run experience design
- Edge cases listed but not designed (just "handle this" without showing how)

---

### Task 6: Lifecycle — Specification

**Skill:** `/specify`

**Prompt:**
```
/specify

[Paste: context from Task 1, brief from Task 2, flow from Task 3, evaluation from Task 4, hardening from Task 5]

Write the engineering handoff spec for the meal planning flow. This is going to a team of 4 engineers who haven't seen any of the design work. They need to know exactly what to build.
```

- [ ] **Step 1: Invoke `/specify` with all prior artifacts**
- [ ] **Step 2: Verify spec completeness for engineering handoff**

**Pass Criteria:**
- [ ] Problem statement and design rationale (why, not just what)
- [ ] Screen-by-screen specs with interaction logic
- [ ] All states per screen documented (from `/fortify` output)
- [ ] Copy matrix: every string in the UI, per state, per context
- [ ] Edge case documentation with expected behavior
- [ ] Ethical review section: data handling, consent flows, medical advice disclaimers
- [ ] Test plan with success criteria per feature
- [ ] Measurement hooks: where to instrument for metrics from `/measure`
- [ ] Pending questions clearly flagged so engineers know what's unresolved
- [ ] Structured enough that an engineer could implement without asking "what should happen when...?"

**Failure Indicators:**
- Spec is just the flow pasted with headers added
- No copy matrix
- States missing
- No test plan
- Ethical concerns not addressed
- Engineers would need to make design decisions

---

## Tier 2: Individual Skill Contract Tests

Each test verifies one skill's core contract in isolation. Run in any order.

### Task 7: Philosopher — Three-Phase Protocol

**Skill:** `/philosopher`

**Prompt:**
```
/philosopher

Sit with this: we're building a meal planning app for people with chronic health conditions. But I have a nagging feeling that "meal planning" isn't actually what these users need. What are we really solving for?
```

- [ ] **Step 1: Invoke `/philosopher` with the prompt**
- [ ] **Step 2: Verify three-phase protocol**

**Pass Criteria:**
- [ ] Begins with Phase 1 (Problem Immersion) — does NOT jump to solutions or Phase 2
- [ ] Phase 1 makes the problem strange: questions the framing, surfaces hidden assumptions
- [ ] Names specific assumptions (e.g., "we're assuming users want to plan ahead" or "we're assuming the app should replace the dietitian's role, not support it")
- [ ] Explores adjacent problems (e.g., maybe the problem is anxiety about eating wrong, not meal planning per se)
- [ ] Asks "who doesn't have this problem?" and "who benefits from it staying unsolved?"
- [ ] After ~3 exchanges, offers structured check-in with 3 options: keep exploring, synthesize, redirect
- [ ] Does NOT produce solutions, recommendations, or action items in Phase 1-2
- [ ] Associative expansion (Phase 2, if reached) draws from genuinely unrelated domains (not just "other health apps")
- [ ] Output is non-linear, dense with connections, honest about uncertainty

**Failure Indicators:**
- Jumps straight to "here are some insights" without immersion
- Phases run out of order or are skipped
- Produces solutions or feature recommendations
- Associations stay within health/tech domain only
- No check-in offered
- Performatively mystical or vague without substance

---

### Task 8: Investigate — Research Planning

**Skill:** `/investigate`

**Prompt:**
```
/investigate

We're designing MealPlan for chronic health condition users. We have 23 interview transcripts but haven't done any usability testing. We need to plan a usability study for our meal planning flow prototype. Budget: $5,000. Timeline: 2 weeks.
```

- [ ] **Step 1: Invoke `/investigate` with research need**
- [ ] **Step 2: Verify research plan structure**

**Pass Criteria:**
- [ ] Recommends specific method (moderated usability testing, given budget/timeline)
- [ ] Sample size recommendation with justification (not arbitrary; likely 5-8 participants for qualitative)
- [ ] Participant recruitment criteria: specific health conditions, not just "users"
- [ ] Screening questions provided
- [ ] Task list for usability test (specific tasks, not vague "test the app")
- [ ] Think-aloud protocol instructions
- [ ] Severity rating scale for findings
- [ ] Budget breakdown (recruitment, incentives, tools, analysis time)
- [ ] Timeline with milestones fitting 2-week constraint
- [ ] Ethical considerations: health condition disclosure, fatigue during sessions, medical information sensitivity
- [ ] Analysis framework for synthesis after testing
- [ ] Does NOT try to conduct the research itself or make up findings

**Failure Indicators:**
- Generic usability test plan with no health-specific considerations
- No participant criteria beyond demographics
- No budget/timeline breakdown
- Recommends methods that don't fit constraints (e.g., 30-person quantitative study on $5K budget)
- Ignores ethical dimensions of testing with health-condition participants

---

### Task 9: Include — Accessibility Audit

**Skill:** `/include`

**Prompt:**
```
/include

Audit this meal planning screen for accessibility:

Screen: Weekly Meal Plan view
- 7-day grid showing breakfast/lunch/dinner/snacks per day
- Each meal cell shows: meal name, calorie count, key nutrient badges (color-coded: green=good, yellow=caution, red=over-limit)
- Tap a meal to see details or swap
- Swipe left on a meal to skip it
- Bottom bar: "Generate Grocery List" button
- Top: dropdown to switch between weeks
- Floating action button: "Add Snack"

Users: people with chronic health conditions (diabetes, celiac, kidney disease). Many experience fatigue, some have neuropathy affecting fine motor control.
```

- [ ] **Step 1: Invoke `/include` with screen description**
- [ ] **Step 2: Verify accessibility audit depth**

**Pass Criteria:**
- [ ] Structured by WCAG principles (Perceivable, Operable, Understandable, Robust)
- [ ] Color-coded nutrient badges flagged: color-only status is inaccessible (colorblind users)
- [ ] Swipe-to-skip flagged: gesture-only action with no alternative for motor impairment
- [ ] 7-day grid assessed for screen reader navigation (how does a screen reader user understand the grid?)
- [ ] Touch target sizes assessed for neuropathy users (minimum 44x44px, preferably larger)
- [ ] Floating action button assessed for motor accessibility
- [ ] Cognitive load of 7×4 grid assessed for fatigue users
- [ ] Specific remediation per finding, not just "fix this"
- [ ] Findings rated by severity (P0-P3)
- [ ] Goes beyond WCAG checklist to address condition-specific accessibility (fatigue, neuropathy)
- [ ] Keyboard navigation path defined
- [ ] Screen reader announcement order specified

**Failure Indicators:**
- Generic WCAG checklist with no condition-specific considerations
- Misses color-only status issue
- Misses swipe-only interaction issue
- No screen reader flow defined
- Says "meets WCAG" without checking each criterion
- Doesn't address cognitive accessibility for fatigued users

---

### Task 10: Organize — Information Architecture

**Skill:** `/organize`

**Prompt:**
```
/organize

Design the information architecture for MealPlan. The app has these feature areas:
- Meal planning (weekly view, daily view, meal details, recipe browser)
- Grocery lists (current list, past lists, store preferences)
- Nutrition tracking (daily summary, weekly trends, nutrient breakdown, medical targets)
- Profile (dietary restrictions, medications, health conditions, preferences)
- Care team (connected providers, sharing settings, shared reports)
- Settings (notifications, units, language, data export)

Users are fatigued and need fast access to their current meal plan and grocery list. The care team feature is used weekly at most. Settings are set-once.
```

- [ ] **Step 1: Invoke `/organize` with feature inventory + usage patterns**
- [ ] **Step 2: Verify IA output structure**

**Pass Criteria:**
- [ ] Navigation pattern recommendation with justification (e.g., bottom tab bar with 3-4 primary sections, not 6)
- [ ] Primary/secondary/tertiary hierarchy based on usage frequency (meal plan and grocery list are primary; care team and settings are buried)
- [ ] Site map or structure diagram
- [ ] Labeling recommendations (e.g., "Plan" vs "Meal Plan" vs "Weekly Plan" — with reasoning)
- [ ] Search/browse strategy (when should users search vs. navigate?)
- [ ] Addresses the tension: 6 feature areas but only 3-4 tab slots
- [ ] Considers progressive disclosure for less-used features
- [ ] References `/articulate` for label naming, `/investigate` for card sort validation
- [ ] Acknowledges what's uncertain and recommends testing (tree test, card sort)

**Failure Indicators:**
- Flat navigation with all 6 areas at top level
- No usage-frequency-based prioritization
- Labels chosen without reasoning
- No recommendation for validation testing
- Ignores cognitive load constraints

---

### Task 11: Measure — Success Metrics

**Skill:** `/measure`

**Prompt:**
```
/measure

Define success metrics for MealPlan's MVP launch. The product goals are:
1. Users create and follow meal plans that comply with their dietary restrictions
2. Grocery list generation saves time vs. manual planning
3. Users trust the meal recommendations enough to follow them

We'll have 12 weeks of post-launch data. We can instrument the app freely. We have no baseline yet.
```

- [ ] **Step 1: Invoke `/measure` with product goals**
- [ ] **Step 2: Verify measurement framework**

**Pass Criteria:**
- [ ] HEART framework applied (Happiness, Engagement, Adoption, Retention, Task success) — or equivalent structured framework
- [ ] Goal-Signal-Metric mapping: each product goal → observable signals → measurable metrics
- [ ] Specific metrics named (e.g., "meal plan completion rate" not just "engagement")
- [ ] Baseline establishment plan (since no baseline exists)
- [ ] Qualitative + quantitative triangulation (numbers alone can't measure "trust")
- [ ] Ethical measurement considerations: health outcomes are private and slow — don't over-measure, don't create anxiety
- [ ] Anti-metrics: what we should NOT optimize for (e.g., daily active time — fatigued users should spend LESS time, not more)
- [ ] Learning plan: what to measure at week 1, 4, 12
- [ ] Addresses the trust measurement challenge specifically (trust is hard to quantify)
- [ ] A/B test recommendations with hypothesis structure

**Failure Indicators:**
- Generic engagement metrics (DAU, MAU, session time) without health-context adaptation
- No ethical measurement considerations
- Missing anti-metrics (optimizing for engagement would harm fatigued users)
- Trust measurement hand-waved
- No phased learning plan

---

## Tier 3: Anti-Pattern Detection

Feed designs with known dark patterns to verify `/evaluate` and `/intent` catch them.

### Task 12: Anti-Pattern — Forced Continuity

**Skill:** `/evaluate`

**Prompt:**
```
/evaluate

Evaluate this onboarding flow for MealPlan Premium:

1. User downloads free app
2. During onboarding, prompted: "Start your 7-day free trial of Premium to unlock personalized meal plans"
3. User enters credit card to start trial
4. No reminder sent before trial ends
5. Auto-charges $14.99/month after 7 days
6. To cancel: Settings → Account → Subscription → Cancel → "Are you sure?" → "We're sorry to see you go" with 3 retention offers → final confirmation
7. Cancellation takes effect at end of current billing period (no prorated refund)
```

- [ ] **Step 1: Invoke `/evaluate` with the dark pattern flow**
- [ ] **Step 2: Verify anti-pattern detection**

**Pass Criteria:**
- [ ] **Forced Continuity** identified by name: free trial silently converts to paid with no warning (Critical severity)
- [ ] **Roach Motel** identified by name: easy signup, deliberately difficult cancellation (Critical severity)
- [ ] **Confirmshaming** flagged: "We're sorry to see you go" + retention offers create guilt/friction
- [ ] Regulatory context cited: FTC subscription trap rules, California ARL (online cancellation must be as easy as signup)
- [ ] Each pattern assigned correct severity from the Intent anti-pattern catalog
- [ ] Specific remediation recommended for each pattern (e.g., "send reminder 3 days before trial ends", "cancel in 2 taps max")
- [ ] UX Health Score reflects the severity (should be significantly penalized)
- [ ] P0 issues raised (these are regulation-violating patterns)

**Failure Indicators:**
- Patterns not identified by their catalog names
- Severity underrated (anything less than Critical for forced continuity + roach motel)
- No regulatory context
- Generic "improve the cancellation flow" without specific fixes
- Treats these as "minor UX issues" rather than ethical/legal violations

---

### Task 13: Anti-Pattern — Addictive Design

**Skill:** `/evaluate`

**Prompt:**
```
/evaluate

Evaluate this engagement feature for MealPlan:

- Daily streak counter: "You've planned meals for 12 days straight! Don't break your streak!"
- Push notification at 8pm if user hasn't logged dinner: "You haven't logged dinner yet! Your streak is at risk 🔥"
- Weekly leaderboard: shows how user's adherence compares to other users with same condition
- Achievement badges: "Perfect Week", "30-Day Streak", "100 Meals Logged"
- If streak breaks: sad face animation and "Your 12-day streak has ended. Start a new one?"
```

- [ ] **Step 1: Invoke `/evaluate` with gamification features**
- [ ] **Step 2: Verify addictive pattern detection**

**Pass Criteria:**
- [ ] **Streak Mechanics** identified: loss aversion through consecutive-day tracking that punishes breaks (High severity)
- [ ] **Incomplete Task Anxiety** identified: streak-at-risk notification creates Zeigarnik effect pressure
- [ ] **FOMO Triggers / Social Pressure** identified: leaderboard creates comparison anxiety among health-condition users
- [ ] **Notification Spam** flagged: 8pm push notification for missed logging
- [ ] Special severity: these patterns target vulnerable users (people with chronic health conditions who already experience anxiety about adherence)
- [ ] Recognizes that streak mechanics + health conditions = potential for disordered behavior (obsessive tracking, guilt, anxiety)
- [ ] Leaderboard specifically flagged: comparing health adherence is harmful (different conditions, different baseline health, different life circumstances)
- [ ] Sad face animation flagged: emotional manipulation on users already managing health anxiety
- [ ] Remediation: suggests intrinsic motivation alternatives (progress visualization without punishment, personal trends without comparison)

**Failure Indicators:**
- Treats gamification as neutral UX pattern
- Misses the vulnerable-user amplification (these patterns are worse when targeting health-condition users)
- No mention of disordered behavior risk
- Leaderboard not flagged (health comparison is inherently harmful)
- Suggests "softer gamification" rather than questioning whether gamification is appropriate at all

---

### Task 14: Anti-Pattern — Data Consent

**Skill:** `/evaluate`

**Prompt:**
```
/evaluate

Evaluate this data sharing setup for MealPlan:

1. During onboarding, one screen: "MealPlan works best with your health data. Allow access to:"
2. Single toggle: "Health Data Access" (on by default)
3. Fine print below: "Includes: dietary logs, medication list, condition diagnoses, nutritional targets, meal adherence history, grocery purchases"
4. One button: "Continue" (no option to proceed without sharing)
5. Data is shared with: the app, the user's care team, "trusted research partners", and "service improvement"
6. To change sharing later: Settings → Privacy → Data Sharing → individual toggles per data type and per recipient (26 total toggles)
```

- [ ] **Step 1: Invoke `/evaluate` with data consent flow**
- [ ] **Step 2: Verify consent pattern detection**

**Pass Criteria:**
- [ ] **Bundled Consent** identified: consent for care team bundled with "trusted research partners" and "service improvement" (Critical)
- [ ] **Prechecked Consent** identified: health data toggle on by default (Critical; illegal in EU/GDPR)
- [ ] **Dark Defaults** identified: default favors the business over user privacy
- [ ] **Click Fatigue Exploitation** identified: 26 toggles to manage after initial bundled consent
- [ ] **Asymmetric Consent UI** identified: single "Continue" button with no "Skip" or "Customize" option
- [ ] Regulatory context: GDPR (prechecked consent illegal), HIPAA (health data requires explicit consent per use), specific mention of health data as a special category under GDPR Article 9
- [ ] Remediation: unbundle consent by recipient and purpose, default to off, allow proceeding without sharing, reduce granularity of management toggles

**Failure Indicators:**
- Misses that health data is a special GDPR category
- Doesn't flag the bundled consent (care team + research partners + service improvement are different purposes)
- Treats prechecked toggle as "minor"
- No regulatory context

---

## Tier 4: Edge Case & Stress Tests

Adversarial inputs designed to break skills or expose contract violations.

### Task 15: Stress — Vague Input

**Skill:** `/strategize`

**Prompt:**
```
/strategize

Make an app.
```

- [ ] **Step 1: Invoke `/strategize` with minimal input**
- [ ] **Step 2: Verify graceful handling**

**Pass Criteria:**
- [ ] Does NOT attempt to produce a full design brief from nothing
- [ ] Asks clarifying questions grounded in the Five Foundational Questions (What problem? For whom? Why now?)
- [ ] Questions are specific and actionable, not a generic questionnaire
- [ ] Maintains professional, non-condescending tone
- [ ] Does not hallucinate requirements or assume a domain

**Failure Indicators:**
- Produces a full brief with invented requirements
- Asks 20+ generic questions (questionnaire dump)
- Assumes a domain and runs with it
- Condescending response ("you need to be more specific")

---

### Task 16: Stress — Wrong Skill

**Skill:** `/articulate`

**Prompt:**
```
/articulate

What's the best database schema for storing meal plans with dietary restrictions?
```

- [ ] **Step 1: Invoke `/articulate` with out-of-scope request**
- [ ] **Step 2: Verify scope boundary handling**

**Pass Criteria:**
- [ ] Recognizes this is outside its scope (UX writing, not database design)
- [ ] Redirects to appropriate skill or clarifies its scope
- [ ] Does not attempt to design a database schema
- [ ] Maintains helpfulness — doesn't just refuse, but points in the right direction

**Failure Indicators:**
- Designs a database schema (scope violation)
- Refuses without redirecting
- Interprets the question as "write copy for a database settings screen" (forced reinterpretation)

---

### Task 17: Stress — Conflicting Requirements

**Skill:** `/journey`

**Prompt:**
```
/journey

Design the meal plan editing flow. Requirements:
- Must be fully usable with one hand on mobile (user may be cooking)
- Must show all 21 meals for the week simultaneously (stakeholder requirement)
- Must include detailed nutritional breakdown per meal visible without tapping
- Target audience has chronic fatigue and neuropathy affecting fine motor control
- Must load in under 2 seconds on 3G
```

- [ ] **Step 1: Invoke `/journey` with contradictory requirements**
- [ ] **Step 2: Verify conflict handling**

**Pass Criteria:**
- [ ] Explicitly identifies the conflicts (21 meals visible + one-hand use + detailed nutrition + mobile = impossible)
- [ ] Does NOT silently pick one requirement over another
- [ ] Proposes trade-offs with reasoning (e.g., "showing all 21 meals with nutrition detail won't fit on mobile — here are 3 alternatives with trade-offs")
- [ ] Flags which requirements come from users vs. stakeholders (stakeholder requirement for 21 meals may not serve users)
- [ ] Prioritizes user needs (fatigue, motor impairment) over stakeholder preferences
- [ ] Proposes a design that resolves the core tension (e.g., progressive disclosure, focus on today + scroll for week)
- [ ] Flags performance constraint interaction (detailed nutrition data + 3G + 21 items)

**Failure Indicators:**
- Designs a flow that ignores some requirements without acknowledgment
- Treats all requirements as equal weight
- Doesn't identify the conflicts
- Produces an impossible design (21 detailed meal cards on one mobile screen)

---

### Task 18: Stress — Philosopher Premature Synthesis

**Skill:** `/philosopher`

**Prompt (after Phase 1 begins):**
```
/philosopher

OK give me the answer. What should we build?
```

- [ ] **Step 1: Enter philosopher mode and begin Phase 1**
- [ ] **Step 2: After first response, demand premature synthesis**
- [ ] **Step 3: Verify protocol integrity**

**Pass Criteria:**
- [ ] Does NOT immediately produce answers/solutions
- [ ] Acknowledges the request but explains we're still in exploration
- [ ] Offers the check-in options (keep exploring, synthesize, redirect) rather than caving
- [ ] If user insists on synthesis, performs Phase 3 but notes the exploration was thin
- [ ] Does not abandon the protocol under pressure

**Failure Indicators:**
- Immediately produces solutions/answers
- Drops the three-phase protocol
- No pushback or acknowledgment that exploration was cut short
- Treats this as a normal design request rather than a philosopher mode interaction

---

### Task 19: Stress — Localize Edge Case

**Skill:** `/localize`

**Prompt:**
```
/localize

Adapt MealPlan for launch in Saudi Arabia. The current design is in English, left-to-right, uses pork-containing recipes, measures in cups/tablespoons, shows calorie counts prominently, and has a "share with your nutritionist" feature.
```

- [ ] **Step 1: Invoke `/localize` with culturally loaded adaptation request**
- [ ] **Step 2: Verify cultural depth**

**Pass Criteria:**
- [ ] RTL layout adaptation addressed (not just "mirror it" — what flips and what doesn't)
- [ ] Halal dietary requirements: pork-containing recipes must be removed/replaced, not just flagged
- [ ] Arabic measurement conventions (metric, not cups/tablespoons)
- [ ] Ramadan consideration: meal planning during fasting (suhoor/iftar timing, altered nutritional needs)
- [ ] Cultural consideration: calorie-focused design may not resonate; focus on nutritional balance and health compliance
- [ ] Healthcare system context: "nutritionist" may be "dietitian" or "doctor" depending on healthcare structure
- [ ] Gender considerations: separate user experience considerations if applicable
- [ ] Content expansion: Arabic text may be shorter or longer than English — layout impact assessed
- [ ] Does NOT stereotype or over-generalize
- [ ] Identifies what requires cultural research vs. what can be adapted from existing patterns

**Failure Indicators:**
- Just says "translate to Arabic and mirror the layout"
- Misses Ramadan consideration
- Pork recipes flagged but not replaced
- Stereotyping or assumptions about users
- No mention of healthcare system differences

---

## Tier 5: Cross-Platform Parity

Verify the same skill produces equivalent behavior across Claude Code, Cursor, and VS Code Copilot distributions.

### Task 20: Platform Parity — Strategize

**Test the same prompt across all 3 platforms:**

**Prompt (same for all):**
```
Frame this problem: users with diabetes struggle to plan meals that balance their glycemic targets with taste preferences and budget constraints. We have interview data from 15 users showing this is a daily frustration.
```

**Execution:**
- [ ] **Step 1: Run in Claude Code** — invoke `/strategize` with the prompt. Save output.
- [ ] **Step 2: Run in Cursor** — trigger the strategize rule. Save output.
- [ ] **Step 3: Run in VS Code Copilot** — use the strategize skill via Copilot chat. Save output.
- [ ] **Step 4: Compare outputs across platforms**

**Pass Criteria (per platform):**
- [ ] Five Foundational Questions framework is applied (or equivalent depth)
- [ ] Design brief output format matches (Context, Gap, Opportunity, Goals, etc.)
- [ ] Evidence-grounding behavior consistent (cites the 15-user interview data, doesn't hallucinate)
- [ ] Scope boundaries respected (doesn't design UI, doesn't conduct research)

**Parity Criteria (across platforms):**
- [ ] Output structure is recognizably the same framework
- [ ] Depth is comparable (no platform produces significantly shallower output)
- [ ] Routing recommendations reference equivalent skill names
- [ ] No platform introduces anti-patterns the others catch

**Failure Indicators:**
- One platform produces dramatically different output structure
- One platform skips the Five Foundational Questions
- Cursor intent.mdc bloat (164KB with inlined references) causes context pollution or different behavior
- Copilot version is noticeably shallower due to distribution differences

---

### Task 21: Platform Parity — Evaluate

**Test anti-pattern detection across all 3 platforms:**

**Prompt (same for all):**
```
Evaluate this: the app's free tier shows a persistent banner "Upgrade to Premium to unlock all recipes - 50% off ends today!" The banner has a countdown timer that resets every day. The dismiss button is a small "x" in the corner. Dismissing it makes it reappear on the next screen.
```

**Execution:**
- [ ] **Step 1: Run in Claude Code** — invoke `/evaluate`. Save output.
- [ ] **Step 2: Run in Cursor** — trigger evaluate rule. Save output.
- [ ] **Step 3: Run in VS Code Copilot** — use evaluate skill. Save output.
- [ ] **Step 4: Compare anti-pattern detection**

**Pass Criteria (per platform):**
- [ ] **Fake Countdown Timer** identified by name (Critical)
- [ ] **Nagging** identified: reappears after dismissal (Medium)
- [ ] **Interruption Marketing** identified: persistent banner before content (High)
- [ ] Regulatory context cited (FTC fake urgency rules)
- [ ] Specific remediation provided

**Parity Criteria:**
- [ ] Same anti-patterns detected across all 3 platforms
- [ ] Same severity ratings
- [ ] No platform misses a pattern that others catch

---

## Scoring & Reporting

### Per-Test Scoring

| Rating | Criteria |
|--------|----------|
| **PASS** | All pass criteria met |
| **PARTIAL** | Core criteria met, some secondary criteria missed |
| **FAIL** | Any critical pass criteria missed, or failure indicators present |

### Summary Scorecard Template

| Tier | Test | Skill | Result | Notes |
|------|------|-------|--------|-------|
| 1 | Task 1: Context | `/intent` | | |
| 1 | Task 2: Strategy | `/strategize` | | |
| 1 | Task 3: Flow | `/journey` | | |
| 1 | Task 4: Evaluate | `/evaluate` | | |
| 1 | Task 5: Harden | `/fortify` | | |
| 1 | Task 6: Spec | `/specify` | | |
| 2 | Task 7: Philosopher | `/philosopher` | | |
| 2 | Task 8: Research | `/investigate` | | |
| 2 | Task 9: A11y | `/include` | | |
| 2 | Task 10: IA | `/organize` | | |
| 2 | Task 11: Metrics | `/measure` | | |
| 3 | Task 12: Forced Continuity | `/evaluate` | | |
| 3 | Task 13: Addictive Design | `/evaluate` | | |
| 3 | Task 14: Data Consent | `/evaluate` | | |
| 4 | Task 15: Vague Input | `/strategize` | | |
| 4 | Task 16: Wrong Skill | `/articulate` | | |
| 4 | Task 17: Conflicts | `/journey` | | |
| 4 | Task 18: Premature Synth | `/philosopher` | | |
| 4 | Task 19: Localize Edge | `/localize` | | |
| 5 | Task 20: Parity Strategize | cross-platform | | |
| 5 | Task 21: Parity Evaluate | cross-platform | | |

### Skills NOT Directly Tested (coverage gaps)

The following skills have no dedicated test but are exercised indirectly through lifecycle tests:

| Skill | Indirect Coverage | Dedicated Test Recommended? |
|-------|-------------------|-----------------------------|
| `/blueprint` | Lifecycle depends on system architecture | Yes — add a service blueprint test |
| `/transpose` | Task 19 touches adaptation | Partial — add a desktop-to-mobile reconception test |
| `/specify` | Task 6 is a lifecycle test | Sufficient for now |

### What to Do With Results

1. **All PASS:** Skills are ready for release. Write a blog post.
2. **Mostly PASS, some PARTIAL:** Identify which pass criteria are consistently missed. These indicate skill content gaps — update the relevant SKILL.md to strengthen guidance in weak areas.
3. **Any FAIL in Tier 1:** Lifecycle is broken. Fix before release — these are core workflows.
4. **Any FAIL in Tier 3:** Anti-pattern detection is the ethical backbone. Fix immediately.
5. **FAILs in Tier 4:** Expected for stress tests. Categorize: (a) skill should handle this → fix, (b) legitimately out of scope → document the boundary.
6. **FAILs in Tier 5:** Platform distribution issue. Compare the source SKILL.md with the platform-specific generated file to find what was lost in translation.
