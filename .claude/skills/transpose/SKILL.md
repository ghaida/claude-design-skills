---
name: transpose
description: >
  Rethinks experiences for different platforms and contexts — not just
  resizing, but reconceiving. Part of the Intent design strategy system.
  When an experience moves from desktop to mobile, web to TV, consumer app
  to kiosk, or visual interface to voice, the interaction model, information
  priority, and user context all change. Trigger when: adapting a design
  for a new platform, planning multi-device experiences, auditing
  cross-platform consistency, designing for TV/kiosk/voice/embedded,
  or when someone says "make it work on mobile" and you need to push back
  on "just shrink it." Also trigger for cross-device journey continuity,
  platform convention audits, or context-specific priority mapping.
version: 1.1.0
user-invocable: true
---

# Transpose — Adapt Across Contexts

## Overview

Responsive design is a layout concern. Transposition is a UX concern.

When an experience moves from desktop to mobile, from web to TV, from consumer app to kiosk, from visual interface to voice — the interaction model, information priority, and user context all change. A dashboard that works beautifully on a 27-inch monitor doesn't become a mobile experience by reflowing into a single column. A checkout flow designed for keyboard and mouse doesn't become a TV experience by adding focus states.

Transposition means rethinking the experience for each context, not shrinking it to fit. It asks: what would this experience look like if it were designed for this context first? What would we add? What would we never have included? What interaction patterns are native to this platform, and which are we forcing from somewhere else?

**When to activate this skill:** Moving a product to a new platform, planning multi-device strategy, auditing cross-platform UX, designing for non-standard contexts (TV, kiosk, voice, embedded), or anytime someone says "just make it responsive" and the problem is bigger than layout.

---

## Skill family

Transpose works alongside the full Intent skill system:

- **`/journey`**: Your flows need to work across the contexts transpose identifies. A checkout flow on desktop is not the same journey on mobile or voice — journey designs the sequence, transpose ensures it fits the context.
- **`/organize`**: Navigation structure may fundamentally change per context. Sidebar navigation on desktop might become bottom tabs on mobile, a hub-and-spoke on TV, or a flat menu on a kiosk. Organize provides the IA; transpose adapts it.
- **`/include`**: Cross-context design IS inclusive design. Designing for the constraints of a small screen, a noisy environment, one-handed use, or a 10-foot viewing distance is designing for real human situations. Include ensures accessibility; transpose ensures contextual fit.
- **`/fortify`**: Different contexts have different failure modes. Mobile loses connectivity. TV remotes run out of batteries. Kiosks get touched by greasy fingers. Fortify maps the failure modes; transpose maps the contexts where they occur.
- **`/blueprint`**: System architecture must support multi-context delivery. APIs need to serve different data shapes. State sync needs infrastructure. Blueprint maps the system; transpose defines what each context needs from it.
- **`/philosopher`**: A cross-cutting cognitive mode for sitting with transposition problems before jumping to solutions. Invoke when: you're tempted to copy-paste interaction patterns across platforms, something feels forced, or you need the question: "What if this experience was born on mobile? What would we never have added?"

---

## Core capabilities

### 1. Context analysis framework

For every source-to-target transposition, systematically analyze what changes. This is not a checklist to glance at — it's a forcing function that makes you confront the real differences between contexts.

**Input method:**
- Desktop: mouse + keyboard, precise targeting, hover states, right-click, keyboard shortcuts, drag-and-drop
- Mobile: touch, imprecise targeting (minimum 44px), gestures (swipe, pinch, long-press), no hover, virtual keyboard covers half the screen
- TV: D-pad remote, focus-based navigation, no direct pointing, limited text input, voice remote on some devices
- Voice: no pointing, no visual feedback loop, conversational turn-taking, confirmation through re-prompting
- Kiosk: touch-only (no hover, no keyboard unless on-screen), large targets, often gloved or wet hands
- Embedded/widget: constrained input matching host app, possibly no dedicated input at all

**Attention model:**
- Desktop: focused, multi-window, long sessions, user is "at work" (even for personal tasks)
- Mobile: fragmented, interruption-prone, multitasking, micro-sessions interspersed with life
- TV: lean-back, passive, shared screen, low cognitive effort tolerance
- Kiosk: goal-directed, time-pressured, public environment, zero learning curve expected
- Embedded: ambient, secondary to primary task, glanceable

**Screen real estate:**
Constraints AND opportunities. Small screens force focus — that's a feature, not a bug. Large screens enable overview and comparison — but also invite clutter. Analyze what each size makes possible, not just what it takes away.

**Connectivity:**
- Desktop/web: generally reliable broadband, but not always
- Mobile: spotty, variable speed, metered data in many markets
- TV: usually reliable home Wi-Fi, but smart TVs have weak processors
- Kiosk: dedicated connection, but outages happen in retail/public environments
- Embedded/IoT: intermittent, low-bandwidth, offline-first is often the right default

**Environment:**
- Office, commute, couch, retail floor, hospital room, kitchen, car, factory floor
- Noise level, lighting, privacy, social context, physical posture
- These shape every interaction decision

**Session length:**
- Desktop: 10-60+ minute sessions, complex multi-step workflows are viable
- Mobile: 30 seconds to 5 minutes typical, must support micro-tasks
- TV: 30-120 minutes but low engagement depth per interaction
- Kiosk: 1-3 minutes maximum, single-purpose
- Embedded: seconds at a time, momentary glances

For each transposition project, fill out this framework explicitly. Do not skip dimensions because they seem obvious.

### 2. Platform-specific UX conventions

These are genuine behavioral differences that users have internalized, not arbitrary guidelines to cargo-cult. Violate them only when you have a specific reason.

**iOS:**
- System gestures: swipe-back from left edge, pull-down to dismiss sheets, swipe-up for home
- Bottom-anchored navigation (tab bar), not hamburger menus
- SF Symbols for consistent iconography
- Haptic feedback for meaningful interactions (not decoration)
- Dynamic Type: your layout must accommodate user-chosen text sizes
- System sheets and action sheets for contextual actions
- Pull-to-refresh is expected in list views

**Android:**
- Material You design language and dynamic color
- System back button/gesture — your app must handle it correctly, including predictive back
- Top app bar with contextual actions
- FAB (floating action button) for primary creation actions
- System navigation bar (gesture or 3-button) — respect the safe area
- Bottom sheets for secondary content, not full-screen modals for simple choices

**Web:**
- URL-driven navigation — every meaningful state should have a URL
- Multi-tab behavior — users will open things in new tabs, your app must handle it
- Keyboard shortcuts for power users
- Hover states provide information density that touch platforms lack
- Right-click context menus have expectations
- Bookmark and share expectations — og:tags, clean URLs, page titles
- Browser back button must work predictably

**TV (10-foot UI):**
- D-pad navigation: everything must be reachable with up/down/left/right
- Focus states are the primary interaction feedback — make them unmistakable
- Overscan safe zones: keep critical content within the inner 90% of the screen
- Limited text input: avoid it, or provide voice input / QR code phone pairing
- Lean-back posture: large text (minimum 24px equivalent at viewing distance), high contrast, minimal reading
- Audio context matters: the TV has speakers, use sound design

**Kiosk:**
- Touch-only, no hover — everything clickable must look clickable
- Attract mode: screen content when nobody is using it, inviting first interaction
- Session timeout: auto-reset after inactivity, with warning
- Accessibility overlay: physical accessibility button or gesture for screen reader, high contrast
- Rugged conditions: bright ambient light (high contrast needed), dirty screens (large targets), public noise (visual-first feedback)

**Embedded/widget:**
- Minimal footprint: you're a guest in someone else's context
- Match host context: visual style, interaction patterns, density
- Deep link in and out: users arrive with context, let them leave with context
- No onboarding: the widget must be self-explanatory at first glance

**Voice:**
- No persistent visual feedback: every state must be communicated through speech
- Conversational turn-taking: prompt, listen, confirm, act
- Confirmation patterns: repeat back critical actions before executing ("You want to transfer $500 to checking. Is that right?")
- Error recovery through re-prompting, not error messages
- Progressive disclosure through conversation ("Would you like to hear more options?")

### 3. Content priority shifting

What's primary changes by context. This is the core of transposition — not just hiding content on smaller screens, but rethinking what matters most.

**Desktop — overview + detail:**
- Show overview and detail simultaneously (master-detail, multi-column)
- Complex workflows with many steps visible at once
- Comparison views, data tables, dashboards with multiple widgets
- Power user features visible alongside simple paths

**Mobile — action + essential info:**
- Primary action and essential information only on first view
- Sequential disclosure: one thing at a time, drill deeper on demand
- One-thumb reachability: critical actions in the bottom 60% of the screen
- Progressive loading: show something useful immediately, enhance as data arrives

**TV — browse + select:**
- Visual-heavy: large imagery, minimal text, let the content sell itself
- Category browsing, not search-first (text input is painful)
- Audio context: use voiceover, sound design, ambient audio
- Shared viewing: content must make sense to multiple people on the couch

**Kiosk — task + nothing else:**
- Single-purpose: what is the ONE thing this kiosk does?
- Large touch targets, clear progress indicators, obvious "start over" escape hatch
- Timeout recovery: save state briefly, but reset cleanly

Document priority shifts explicitly for each screen and feature. Create a priority matrix: what's primary, secondary, hidden, and removed per context.

### 4. Cross-device journey continuity

Users switch devices mid-task. This isn't an edge case — it's the normal flow for many tasks. Design for it explicitly.

**State preservation:**
- Draft saved on mobile, resume on desktop (and vice versa)
- Shopping cart, form progress, reading position, playback position
- What state needs to sync in real-time vs. on next session start?

**Handoff patterns:**
- QR codes: scan on phone to continue on phone what you started on desktop/TV/kiosk
- Magic links: "continue on your phone" via SMS/email with deep link to exact state
- Cloud sync: transparent background sync so the user never thinks about it
- Clipboard continuity: iOS/macOS universal clipboard, but don't depend on platform-specific features alone

**Context-appropriate notifications:**
- "You left something in your cart" — on which device? At what time? In what tone?
- Don't notify on the device they just left. Notify on the device they're likely using now.
- Notification content should match the device context (short on watch, actionable on phone, ignorable on desktop)

**Session continuity:**
- Re-authentication friction: minimize it across devices. Biometric on phone, magic link on desktop, persistent session on TV.
- Don't make users start over because they switched devices.

### 5. Progressive disclosure per context

The same information architecture may need fundamentally different disclosure strategies per context. This is not about responsive breakpoints — it's about cognitive load management per context.

**Mobile: show less, reveal on interaction.**
Cards that expand, drawers that slide up, tabs that switch content. The user chooses what to see more of. Default to the minimum viable view.

**Desktop: show more, group by function.**
Sidebars, panels, toolbars, multi-column layouts. The user scans and selects. More information is visible simultaneously, reducing the need for navigation.

**TV: show categories, drill into detail.**
Large tiles representing categories or content. Select to enter, back to return. Flat and wide, not deep and narrow.

**Kiosk: show the task, nothing else.**
Strip away everything that isn't the current step. No settings, no account management, no exploration. Just the task.

**Voice: reveal through conversation.**
"Here are your three options. Would you like to hear more about any of them?" Progressive disclosure happens through dialogue turns, not visual hierarchy.

Map disclosure strategy per context for every major feature. Don't assume what works on desktop will work anywhere else with minor modifications.

---

## Output format

### Context analysis matrix
For each platform/context, document: input method, attention model, screen real estate, connectivity, environment, session length, and their UX implications.

### Platform-specific adaptation specs
Per platform: which conventions apply, which native patterns to adopt, which source patterns to replace (and with what), which features to add/remove/transform.

### Priority mapping per context
For each major screen/feature: what's primary, secondary, on-demand, and removed — per context. Explicitly document what gets cut and why.

### Cross-device journey map
For multi-device experiences: where users switch, what state transfers, what handoff mechanisms exist, and where continuity breaks.

---

## Voice and approach

Never say "just make it responsive." Transposition requires rethinking, not reflowing. The question is never "how do we fit this on a smaller screen?" The question is "what would this experience look like if it were designed for this context first?"

Be specific about platform conventions. Don't say "follow platform guidelines" — say which guideline, which pattern, and why it matters for this specific design. Challenge assumptions about which features "must" exist on every platform. Sometimes the right transposition is to remove a feature entirely from a context where it doesn't serve users.

Respect the intelligence of each context. Mobile isn't desktop's lesser sibling. Voice isn't a screen without visuals. Each context has strengths that the others lack.

---

## Scope boundaries

### This skill owns:
- Cross-platform UX strategy and context analysis
- Platform-specific interaction model recommendations
- Content priority mapping across contexts
- Cross-device journey continuity design
- Progressive disclosure strategy per context

### This skill does NOT own:
- Responsive CSS and layout implementation (engineering + visual design)
- Flow design within a context (`/journey`)
- Platform-specific visual design (visual design)
- Navigation structure decisions (`/organize`)
- System architecture for multi-context delivery (`/blueprint`)
- Accessibility compliance per platform (`/include`)
