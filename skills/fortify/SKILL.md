---
name: fortify
description: >
  Harden designs for real-world use by systematically identifying and designing
  for every condition outside the happy path. Part of the Intent design strategy
  system. Covers state inventories, error recovery, empty states, loading
  patterns, first-run experiences, stress testing, internationalization
  readiness, and latency handling. Trigger on: edge cases, error states, empty
  states, loading states, first-run experience, onboarding, offline mode,
  "what happens when", "what if the user", "stress test this", "what could go
  wrong", "harden this design", "edge case review", "what are the failure
  modes", zero states, timeout handling, or any question about how a design
  behaves outside ideal conditions. The happy path is a fantasy — this skill
  designs for the world your users actually live in.
---

# Fortify — Harden for Real-World Use

## Overview

The happy path is a fantasy. Real users have 47-character last names, 2G connections on the subway, three-year-old phones with cracked screens, browser tabs they haven't closed in six days, and no patience for something that doesn't work the first time they try it.

Every design starts with the ideal scenario: the user has a stable connection, reasonable data, a modern device, and follows the intended flow without deviation. That scenario accounts for maybe 60% of actual usage. The other 40% is where trust is built or destroyed — the empty state that tells the user nothing, the error message that says "Something went wrong" without explaining what or how to fix it, the loading screen that gives no indication anything is happening, the first-run experience that asks for 12 pieces of information before showing any value.

Fortify systematically identifies every condition your users will actually encounter and ensures the design handles each one with the same care you gave the happy path. This isn't about pessimism — it's about respect for the people using what you build.

**When to activate this skill:** Edge case reviews, error state design, empty state design, loading pattern design, first-run experience design, offline mode planning, internationalization readiness checks, stress testing, or any moment someone asks "but what happens when..."

---

## Skill family

Fortify works alongside the full Intent skill system, with especially tight connections to skills that define the paths you stress-test:

- **`/journey`** — Their flows define the happy path; you stress-test everything else. Every flow they design generates a set of questions: what happens when this step fails? What if the user abandons midway and returns? What if data from step 2 isn't available at step 4? Your work feeds back into their flow design as additional states and branches.

- **`/blueprint`** — Their failure mode analysis at the system level feeds your UX-level resilience design. When they identify that a service can timeout, you design what the user sees during that timeout. When they map a dependency that can fail, you design the degraded experience. System-level failure modes become UX-level state designs.

- **`/include`** — Accessibility and fortification overlap significantly. Designing for slow connections, small screens, one-handed use, and situational impairment is both resilience work and inclusive design. Coordinate to avoid duplication — you own the state and edge case methodology; they own the accessibility methodology and assistive tech requirements.

- **`/evaluate`** — Their assessment identifies what's failing in the current experience; you design the fixes. When they flag missing error states, absent loading indicators, or unhelpful empty states, those findings route directly to you. Your output feeds back into their next evaluation cycle.

- **`/specify`** — Your edge case documentation becomes part of their handoff package. Every state you design, every error recovery flow you define, every stress test result — all of it needs to be in the engineering spec. Coordinate on format: specs that list only the happy path are specs that produce broken products.

- **`/articulate`** — Error messages, empty state copy, loading messages, first-run guidance — all of it is content that needs to be clear, helpful, and on-brand. You define what needs to be said; they define how to say it.

- **`/philosopher`** — "What's the most embarrassing way this could fail in public?" "What assumption are we making about our users that would be humiliating if wrong?" The philosopher helps you find the failure modes that nobody's imagined yet — the ones that come from questioning assumptions, not from running checklists.

---

## Core capabilities

### 1. State inventory

Every screen, component, and flow has states beyond "default." Most designs only spec the default state. Fortify enumerates all of them.

**The state catalog:**

**Default** — The happy path with normal data. This is what the mockup shows. It's the starting point, not the finish line. Even the default state has questions: what's "normal" data? How much? In what format? What happens when "normal" changes?

**Empty** — No data yet. First use, zero search results, cleared history, new account with no activity. The empty state is the user's first impression of most features — and most empty states are a blank page with no guidance. Design them: explain what will appear here, how to get started, and what the feature does. Show sample data or a preview of the populated state if possible.

**Loading** — Initial load, refresh, background update, lazy-loading additional content, submitting a form. Each has different UX implications. Initial load needs a skeleton screen or progress indicator. Background refresh should not interrupt the user. Form submission needs immediate feedback that the action was received. Long operations need progress estimation.

**Partial** — Some data loaded, some pending, some failed. This is the most overlooked state and one of the most common in real use. A dashboard where 3 of 5 widgets loaded, 1 is still loading, and 1 failed. A profile where the avatar loaded but the name didn't. Design for the messy middle, not just the clean extremes.

**Error** — Validation errors (user input was wrong), system errors (something broke on the backend), network errors (connection lost), permission errors (user isn't authorized), timeout errors (request took too long). Each requires different messaging and different recovery paths. Generic "Something went wrong" is never acceptable.

**Success** — Action completed. But what specifically happened? A form submitted — what's next? A file uploaded — where did it go? An item deleted — can it be recovered? A payment processed — what's the confirmation? Success states that leave the user asking "now what?" are incomplete.

**Offline** — No connection. What's cached and still usable? What degrades gracefully? What's completely unavailable? How does the user know they're offline? What happens to actions they attempt while offline — are they queued, rejected, or silently lost?

**Disabled** — A button, input, or feature is unavailable. Why? When does it become enabled? The user needs to understand what's preventing the action and what to do about it. A disabled button with no explanation is a dead end.

**Overflow** — Too much data. 10,000 items in a list that was designed for 50. A username that's 200 characters. 500 unread notifications. A table with 40 columns. Design for the extremes — pagination, truncation, progressive disclosure, virtualized lists.

**For each state, answer three questions:** What does the user see? What can the user do? How does the user recover or progress?

**Example: State inventory for a file upload component**

| State | What the user sees | What they can do | Recovery/progress |
|---|---|---|---|
| Default | Drop zone with "Drag files or click to browse" | Drag files or click to open file picker | — |
| Loading | File name, progress bar at 43%, cancel button | Cancel the upload | Cancel returns to default |
| Partial | 2 of 3 files uploaded, 1 still in progress | Cancel remaining, remove completed, add more | Cancel or wait |
| Success | 3 files listed with checkmarks, "Done" button | Remove individual files, add more, proceed | Click "Done" to continue |
| Error | File name in red, "File too large (max 25 MB)", retry icon | Retry, remove, or choose a different file | Retry or remove and continue with other files |
| Disabled | Grayed drop zone, "Upload limit reached (10 files)" | Nothing — must remove existing files first | Tooltip explains: "Remove a file to upload more" |
| Offline | Last uploaded files visible, banner "Uploads paused — no connection" | View already-uploaded files, queue new files | Queued uploads resume automatically when connection returns |

### 2. Error recovery design

When something goes wrong — and it will — the user's ability to recover determines whether they retry or abandon.

**Recovery patterns:**

**Inline recovery.** Fix it right here, right now. Validation errors should appear next to the field that caused them, with specific guidance on what to fix. Don't clear the form. Don't scroll to the top. Don't make the user find the problem — point directly at it.

**Retry logic.** Automatic retry for transient failures (network blip, timeout) with exponential backoff. Manual retry button for persistent failures ("Connection lost. Tap to retry."). Never make the user start over when a retry could work. Show what you're doing: "Retrying... attempt 2 of 3."

**Graceful degradation.** Partial functionality is better than no functionality. If the recommendation engine is down, show popular items instead. If real-time data fails, show cached data with a timestamp. If a non-critical feature fails, hide it rather than erroring the whole page.

**Undo and redo.** Time-based undo (Gmail's "Undo send" with countdown). Action-based undo (Ctrl+Z for content editing). Explicit undo buttons for destructive actions (delete, archive, move). Every destructive action should be reversible, or at minimum require confirmation.

**Draft preservation.** Never lose user work. Auto-save form progress. Preserve draft state across sessions. If the browser crashes, the page reloads, or the session times out, the user's work should still be there. This is non-negotiable for any input that takes more than 30 seconds to produce.

**Error recovery anti-patterns to eliminate:** Generic error messages with no recovery action. Error states that require a full page reload. Silent failures where the user doesn't know anything went wrong. Error states that clear the user's input. Error messages in technical language ("Error 500: Internal Server Error"). Errors that blame the user ("Invalid input" without explaining what's invalid or why).

### 3. First-run experience design

The first time a user encounters your product or feature is the most fragile moment. They have the least context, the least investment, and the lowest tolerance for friction.

**Patterns that work:**

**Progressive onboarding.** Learn by doing, not by reading. Introduce features in context as the user encounters them. First task should deliver value immediately. Reveal complexity gradually — show the simple version first, then surface advanced features as the user demonstrates readiness.

**Value-first.** Show what the product does before asking for setup. Let the user see a populated dashboard, a sample project, or a preview of the outcome before requiring account creation, profile completion, or configuration. The user should understand the value proposition from experience, not from marketing copy.

**Just-in-time guidance.** Explain features when they're relevant, not all at once. A tooltip that appears when the user first hovers over a feature is better than a 5-slide tour that explains everything before the user has context to understand any of it.

**Sample data.** Show what "full" looks like. A project management tool with sample projects. A dashboard with sample data. An inbox with sample messages. This gives the user a mental model of the populated state and shows them what they're working toward.

**Anti-patterns to eliminate:** Feature dump walkthroughs (5-slide tours that nobody reads and everyone skips). Mandatory profile completion before showing any value. Empty dashboards with no guidance ("You have no projects. Create one to get started." — but what's a project? what should I put in it?). Forced tutorials that can't be skipped. Tooltips that block the interface and must be dismissed one by one.

### 4. Stress testing prompts

Systematic questions designed to break your design. Run these against every screen, component, and flow.

**Content stress:**
- What if the title is 3 characters? 300 characters? Contains only emoji?
- What if the name is "O" or "Wolfeschlegelsteinhausenbergerdorff"?
- What if the content is in Arabic (RTL)? In Japanese (no word breaks)? A mix of scripts?
- What if it contains a URL, an email address, or HTML markup?
- What if it's empty — completely blank?

**Volume stress:**
- What if there are 0 items? 1? 3? 50? 10,000?
- What if the list is updating in real-time — items appearing and disappearing?
- What if every notification badge shows "999+"?
- What if all optional fields are filled and all sections are expanded?

**Time stress:**
- What if the API responds in 200ms? 5 seconds? 30 seconds? Never?
- What if the user leaves mid-flow and returns tomorrow? Next month?
- What if the session expires during a multi-step process?
- What if two actions are triggered simultaneously?

**Network stress:**
- What if the connection drops mid-action? Mid-upload? Mid-payment?
- What if the user is on 2G? On airplane mode? On hotel Wi-Fi that requires a portal login?
- What if the connection is intermittent — up for 10 seconds, down for 5?

**Device stress:**
- What if the screen is 320px wide? 3840px wide?
- What if the user zooms to 200%? 400%?
- What if they're using a screen reader? Voice control? Switch access?
- What if the device is 5 years old and slow?

**User behavior stress:**
- What if they double-click instead of single-click?
- What if they use the browser back button mid-flow?
- What if they open the same flow in two tabs?
- What if they paste instead of type? Drag instead of click?
- What if they walk away mid-task and the screen locks?
- What if they share a link to a state that requires authentication?

### 5. Internationalization readiness

Not localization — that's `/localize`. This is technical and design readiness for eventual localization. Building these considerations in from the start is dramatically cheaper than retrofitting.

**Text expansion and contraction.** English is one of the most compact languages. German text runs roughly 30% longer. Finnish can run 40% longer. Some UI strings double in length. Conversely, Japanese and Chinese can be more compact. Design layouts that accommodate at least 40% text expansion without breaking. Use flexible containers, not fixed widths for text.

**RTL layout implications.** Right-to-left languages (Arabic, Hebrew, Farsi, Urdu) require more than text mirroring. Navigation flows flip. Progress indicators reverse. But some elements should not flip: media playback controls (play/pause), phone number fields, timelines, graphs with directional axes. Slash-separated paths (/folder/subfolder) don't reverse. Understand what flips and what doesn't.

**Date, time, number, and currency formats.** MM/DD/YYYY vs. DD/MM/YYYY vs. YYYY-MM-DD. 12-hour vs. 24-hour time. Comma as decimal separator vs. period. Currency symbol before vs. after the number. These are not cosmetic — getting them wrong causes real errors (is 03/04/2025 March 4th or April 3rd?).

**Character set support.** CJK characters (Chinese, Japanese, Korean) have different line-breaking rules, no spaces between words, and vertical text options. Arabic and Devanagari have complex ligatures and contextual shaping. Emoji are variable-width and can be multi-codepoint. Test your design with real text in these scripts, not with lorem ipsum.

**Cultural assumptions in icons.** A mailbox looks different in every country. A trash can is not universal. A floppy disk means nothing to users born after 2000. A thumbs-up is offensive in some cultures. Review icons for cultural assumptions and test with target audiences.

**String concatenation anti-patterns.** "Hello " + name + ", you have " + count + " items" breaks in most languages. Word order changes. Pluralization rules vary wildly (English has 2 forms, Arabic has 6, some languages have context-dependent forms). Use proper internationalization frameworks with ICU message format or equivalent. Never build sentences by concatenating strings.

### 6. Timeout and latency handling

Users need to know three things during any wait: Is it working? How long will it take? Can I do something else in the meantime?

**Patterns:**

**Skeleton screens.** Show the structure of the page before content loads. Users perceive skeleton screens as faster than spinners, even at the same load time. Use them for initial page loads and major content areas. Match the skeleton to the actual layout — generic skeletons don't help.

**Optimistic UI.** Show success before server confirmation for low-risk actions. Toggling a favorite, sending a chat message, reordering a list — show the result immediately and reconcile with the server in the background. If the server rejects the action, roll back with a clear explanation. Reserve optimistic UI for actions where rollback is graceful; never use it for payments, deletions, or irreversible operations.

**Progress indicators.** Determinate progress bars for operations with known duration (file upload, multi-step process). Indeterminate spinners or progress bars for operations with unknown duration. Always prefer determinate over indeterminate — even a rough estimate helps. Show percentage, time remaining, or items processed when possible.

**Background refresh.** Update content without interrupting the user. Show an unobtrusive indicator that new content is available ("3 new items — tap to load") rather than yanking the scroll position or inserting content above the viewport. Stale-while-revalidate: show cached data immediately, refresh behind the scenes, and update the UI smoothly when fresh data arrives.

**Timeout handling.** If an operation takes longer than expected, tell the user. Graduated messaging: 0-3 seconds = no message needed for simple actions. 3-10 seconds = show a progress indicator. 10-30 seconds = add context ("This is taking longer than usual..."). 30+ seconds = offer alternatives ("You can wait or we'll email you when it's ready."). Never leave the user staring at a spinner indefinitely with no information.

---

## Output format

Adapt to scope. A single-component edge case review needs a state inventory. A full-product fortification needs everything.

```
## State Inventory
[Matrix: Screen/Component x State (default, empty, loading, partial,
error, success, offline, disabled, overflow)]
[For each non-default state: what the user sees, what they can do,
how they recover]

## Edge Case Catalog
[Organized by stress category: content, volume, time, network,
device, user behavior]
[Each edge case: scenario, current behavior, recommended behavior,
priority]

## Stress Test Results
[Results of running stress testing prompts against the design]
[Pass / Fail / Untested for each scenario]

## First-Run Experience Assessment
[Current first-run flow analysis]
[Recommendations for progressive onboarding, value-first approach,
sample data]

## Resilience Recommendations
[Prioritized list of improvements]
[P0: Missing states that cause user confusion or data loss]
[P1: Degraded states that significantly harm the experience]
[P2: Missing polish that reduces trust or perceived quality]
[P3: Nice-to-have improvements for edge case handling]
```

---

## Voice and approach

**Be paranoid on the user's behalf.** Your job is to imagine everything that can go wrong and ensure the design handles it. You're the person in the room who says "but what if..." — not to be difficult, but because real users will encounter every scenario you can imagine and several you can't.

**Prioritize ruthlessly.** Not every edge case is equally likely or equally damaging. A payment flow that silently fails is catastrophically worse than a profile page that truncates a long name. Focus your energy where the impact is highest: core task flows, data-loss scenarios, and states that leave users stuck with no recovery path.

**Be specific about what "handle it" means.** "Handle the error state" is not a recommendation. "Show an inline error message below the email field that says 'This email is already registered — sign in instead?' with a link to the sign-in page" is a recommendation. Define the state, the message, and the recovery action.

**Respect the user's time and context.** Every state you design should help the user make progress or understand why they can't. Empty states should guide. Error states should suggest next steps. Loading states should set expectations. No state should be a dead end.

---

## Scope boundaries

**You own:** Edge cases, error states, loading states, empty states, success states, partial states, offline states, overflow states, disabled states. First-run experience design. Stress testing methodology. Error recovery patterns. Timeout and latency handling. Internationalization readiness (technical design, not translation). State inventory documentation.

**You don't own:** System-level failure modes and architecture — that's `/blueprint`. They identify what can fail at the system level; you design what the user experiences when it does. Accessibility methodology and assistive tech requirements — that's `/include`. You share territory on real-world conditions, but they own the WCAG framework and screen reader experience. Flow design — that's `/journey`. You stress-test their flows, not design them from scratch. Copy writing — that's `/articulate`. You define what needs to be communicated in each state; they write the words. Localization execution — that's `/localize`. You ensure the design is technically ready for localization; they handle the actual adaptation.
