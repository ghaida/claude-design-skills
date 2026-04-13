---
name: include
description: >
  Design for everyone by treating accessibility as a first-class design
  discipline, not a compliance checklist. Part of the Intent design strategy
  system. Covers WCAG 2.2 for designers, screen reader experience design,
  keyboard navigation, cognitive accessibility, motor accessibility, inclusive
  design beyond compliance, and accessibility testing methodology. Trigger on:
  accessibility, a11y, WCAG, screen reader, keyboard navigation, color
  contrast, alt text, focus management, touch targets, inclusive design,
  assistive technology, "is this accessible", "check accessibility", "design
  for everyone", "who are we excluding", ADA compliance, Section 508, EAA,
  reduced motion, or any question about whether all users can perceive,
  operate, understand, and benefit from the experience. One billion people
  worldwide have a disability. Everyone experiences situational impairment.
  Designing inclusively makes the experience better for everyone.
version: 1.0.0
user-invocable: true
---

# Include — Design for Everyone

## Overview

Accessibility is not a feature. It's not a phase. It's not something you "add" after the design is "done." It's a design discipline that ensures every person — regardless of ability, device, situation, or context — can use what you build.

One billion people worldwide have a disability. That number alone should end the debate about whether accessibility matters. But accessibility is not just about permanent disability. It's about the full range of human experience: the parent holding a baby in one arm while using their phone with the other. The commuter reading a screen in direct sunlight. The user in a noisy cafe who can't play audio. The person recovering from eye surgery. The aging executive whose eyesight isn't what it was five years ago. The teenager with ADHD trying to focus on a multi-step form.

Everyone experiences situational or temporary impairment. Designing for accessibility makes the experience better for all of these people — not just the ones you're "accommodating." Curb cuts were designed for wheelchair users. They're used by everyone with a stroller, a suitcase, a delivery cart, or a bicycle. Good accessible design works the same way.

This skill treats accessibility as a design quality, not a compliance burden. But it doesn't shy away from legal reality — WCAG conformance is legally required in many jurisdictions (ADA in the US, the European Accessibility Act, Section 508 for government, and similar legislation worldwide). Ignoring accessibility is both a design failure and a legal risk.

**When to activate this skill:** Accessibility audits, inclusive design reviews, WCAG compliance checks, screen reader testing guidance, keyboard navigation design, color contrast evaluation, touch target review, or any moment when the question is "can everyone use this?"

---

## Skill family

Include works alongside the full Intent skill system. Accessibility touches everything — every skill produces work that must be accessible.

- **`/journey`** — Flows must work for keyboard-only users, screen reader users, switch access users, and voice control users — not just mouse and touch. Every flow `/journey` designs should be reviewed for input-method independence. When they design a drag-and-drop interaction, you ensure there's a keyboard alternative. When they design a gesture-based mobile flow, you ensure there's a single-pointer fallback.

- **`/articulate`** — Clear writing IS accessible writing. Plain language, short sentences, meaningful link text ("Read the accessibility report" not "Click here"), descriptive headings, and labels that communicate what an input expects. `/articulate` owns the copy; you advise on what makes it accessible.

- **`/organize`** — Navigation structure must be parseable by assistive technology. Landmarks (header, nav, main, footer), heading hierarchy (H1 through H6 without skipping levels), skip links, and breadcrumbs are information architecture decisions with direct accessibility implications. When `/organize` designs the IA, you ensure it translates to a screen reader experience that makes sense.

- **`/fortify`** — Edge case hardening overlaps with accessibility. Designing for slow connections, small screens, one-handed use, and extreme content is both resilience work and inclusive design. Coordinate to avoid duplication — you own the accessibility methodology; they own the state and stress-testing methodology.

- **`/evaluate`** — Accessibility assessment is part of every UX evaluation. When `/evaluate` runs a heuristic review, accessibility violations surface across multiple heuristics. Your detailed accessibility methodology feeds their assessment framework. Their findings in accessibility categories route to you.

- **`/specify`** — Accessibility requirements must be in every handoff spec. ARIA roles, keyboard interaction patterns, focus management behavior, screen reader announcements — these are not "nice to have" annotations. They're core spec requirements. When `/specify` writes the handoff, you ensure accessibility is not a separate section but woven throughout.

- **`/blueprint`** — System architecture affects accessibility. Notification systems need ARIA live regions. Real-time updates need polite announcements. Infinite scroll needs alternative navigation. When `/blueprint` designs the system, you flag where architecture decisions create or prevent accessibility.

- **`/philosopher`** — "Who are we excluding that we haven't even thought to consider?" The philosopher helps surface the assumptions baked into your definition of "everyone" — the user groups you haven't imagined, the contexts you haven't considered, the ways your inclusive design might still be leaving people out.

---

## Core capabilities

### 1. WCAG 2.2 for designers

The Web Content Accessibility Guidelines provide the shared vocabulary and minimum bar for accessibility. But WCAG is written for conformance testing, not for design decision-making. This section translates the four WCAG principles into practical design guidance.

**Perceivable — Can every user perceive the information?**

Color contrast: 4.5:1 minimum ratio for normal text, 3:1 for large text (18pt+ or 14pt+ bold) and UI components. Check contrast in both light and dark modes. Check against the actual background, not a theoretical one — if text appears over images, the worst-case contrast matters.

Text alternatives: Every meaningful image needs alt text that conveys the same information the image conveys. Decorative images need empty alt attributes (alt="") so screen readers skip them. Complex images (charts, diagrams, infographics) need both a short alt text and a longer description. Icons used as actions need accessible names.

Media: Video needs captions (not auto-generated — those are a starting point, not a finished product). Audio content needs transcripts. Animations need pause controls. Nothing should auto-play with sound.

Color independence: Never convey information by color alone. A red/green status indicator is invisible to the 8% of men with color vision deficiency. Add a shape, icon, label, or pattern. "Required fields are marked in red" fails — "Required fields are marked with an asterisk (*)" works.

Reflow: Content must reflow to fit the viewport at 400% zoom without horizontal scrolling (except for content that requires two-dimensional layout, like data tables). Test by setting the browser to 320px wide — if content is cut off or overlapping, the design fails.

**Operable — Can every user operate the interface?**

Keyboard accessible: Every interactive element must be reachable and operable with keyboard alone. Tab to navigate. Enter or Space to activate. Arrow keys within composite widgets. Escape to dismiss. No action should require a mouse hover, a right-click, or a multi-finger gesture without an alternative.

No keyboard traps: Tab must always move forward (and Shift+Tab backward) through the page. The only acceptable focus trap is inside a modal dialog — and that modal must close with Escape.

Time limits: If a session timeout or timed interaction exists, the user must be able to extend it, turn it off, or be warned at least 20 seconds before it expires. Exception: real-time events (auctions, exams) where the time limit is essential.

No seizure triggers: Nothing should flash more than 3 times per second. This is not optional — it's a medical safety issue. Applies to video content, animated illustrations, and transition effects.

Touch targets: Minimum 24x24 CSS pixels per WCAG 2.2. Recommended 44x44px for primary actions. Minimum 8px spacing between adjacent targets. These minimums are for people with motor impairments, people using their phone one-handed, people with large fingers, and people in moving vehicles.

Skip navigation: A "Skip to main content" link should be the first focusable element on every page. Screen reader and keyboard users should not have to tab through the entire navigation to reach the content.

**Understandable — Can every user understand the content and interface?**

Reading level: Write for your audience. Consumer products should target 8th grade reading level. Professional tools can target higher, but keep instructions and error messages as simple as possible regardless. Use short sentences. Avoid jargon. Define technical terms on first use.

Consistent navigation: Navigation should appear in the same location and same order on every page. Users build mental models of where things are — moving navigation between pages breaks those models for everyone and makes the experience particularly disorienting for users with cognitive disabilities.

Predictable interactions: Clicking a link should navigate. Changing a dropdown should not auto-submit a form. Hovering should not trigger irreversible actions. No unexpected context changes — the user should always feel in control.

Input assistance: Every form input needs a visible label (not just placeholder text — placeholders disappear on focus). Required fields must be indicated before submission. Error messages must identify the field and the problem. Provide examples of expected format ("MM/DD/YYYY") rather than just field names.

**Robust — Will it work with current and future assistive technologies?**

Valid HTML structure: Semantic HTML is the foundation. Use button for buttons, a for links, heading elements for headings, list elements for lists. Semantic HTML communicates structure and purpose to assistive technology without any additional effort.

ARIA used correctly: ARIA (Accessible Rich Internet Applications) is a supplement to HTML semantics, not a replacement. The first rule of ARIA: don't use ARIA if a native HTML element does the same thing. The second rule: wrong ARIA is worse than no ARIA. A div with role="button" that doesn't handle Enter and Space keypresses is worse than a div with no role — it tells the screen reader it's a button but doesn't behave like one.

Testing with real assistive technology: Automated tools catch about 30% of accessibility issues. The remaining 70% — illogical reading order, confusing interaction patterns, missing context, poor focus management — require manual testing with actual assistive technology.

### 2. Screen reader experience design

Screen reader accessibility is not just about adding alt text to images. It's about designing the complete non-visual experience of your interface.

**Reading order.** Does the DOM order match the visual order? CSS flexbox order, absolute positioning, and grid layout can create situations where the visual order and the reading order diverge — a screen reader reads DOM order. If the most important content is visually first but last in the DOM, screen reader users encounter it last.

**Landmarks.** Screen reader users navigate by landmarks: header, nav, main, complementary (sidebar), contentinfo (footer). A page with proper landmarks lets a screen reader user jump directly to the navigation, main content, or footer. A page without landmarks forces them to read linearly from top to bottom. Every page should have exactly one main landmark. Navigation should use nav elements (multiple are fine — label them with aria-label: "Primary navigation," "Footer navigation").

**Heading hierarchy.** Screen reader users navigate by headings more than any other method. H1 for the page title. H2 for major sections. H3 for subsections within those. Never skip levels (H1 to H3 with no H2). Never use heading elements for visual styling — if it looks like a heading but isn't structurally one, use CSS. If it is structurally a heading, use the heading element regardless of how you want it to look.

**Live regions.** Dynamic content that updates without a page reload — notifications, chat messages, form validation messages, auto-updating data, progress indicators — needs aria-live regions. Use aria-live="polite" for updates that can wait until the user is idle (new chat messages, stock prices). Use aria-live="assertive" only for urgent updates that should interrupt the user (error messages, critical alerts). Overusing assertive creates a terrible experience — the screen reader interrupts everything.

**Form labeling.** Every input must have a programmatic label — a label element with a for attribute pointing to the input's ID, or aria-label, or aria-labelledby. Placeholder text is not a label. Groups of related inputs (radio buttons, checkboxes) must be wrapped in fieldset with a legend element that names the group. "Shipping address" as a legend around street, city, state, zip fields gives screen reader users the context they need.

**State communication.** Interactive elements must communicate their current state: expanded/collapsed (aria-expanded), selected/unselected (aria-selected), checked/unchecked (aria-checked), current page (aria-current="page"), disabled (aria-disabled or disabled attribute). Without state communication, a screen reader user clicking a toggle doesn't know if they turned something on or off.

**Hidden content.** Decorative images get aria-hidden="true" or empty alt text. Content meant only for screen readers (like descriptive labels for icon-only buttons) uses a visually-hidden CSS class that keeps the content in the DOM but invisible on screen. Do not use display:none or visibility:hidden for screen-reader-only content — both hide it from screen readers too.

### 3. Keyboard navigation design

Keyboard accessibility is the single most impactful accessibility feature because it serves the broadest range of users: screen reader users, users with motor impairments, power users who prefer keyboard efficiency, users with temporary injuries, and anyone whose mouse or trackpad stops working.

**Focus management.** Tab moves focus forward through interactive elements. Shift+Tab moves backward. The tab order should match the visual reading order. Every interactive element must be focusable — if it's clickable, it needs to be tabbable (use native interactive elements, or add tabindex="0" with keyboard event handlers).

**Visible focus indicators.** The currently focused element must be visually obvious. A 2px+ solid outline that contrasts with the background by at least 3:1. Not just a color change — that fails for color-blind users. Not a subtle dotted line — that's invisible to many users. The default browser focus ring is acceptable as a minimum; custom focus indicators that are more visible are better. Never remove focus indicators with outline: none without providing a better alternative.

**Skip links.** A "Skip to main content" link as the first focusable element on every page. It can be visually hidden until focused (appears on Tab, then hides again when focus moves past it). This lets keyboard users bypass repeated navigation blocks.

**Focus traps.** Focus should only be trapped inside modal dialogs. When a modal opens, focus moves into it. Tab cycles within the modal's interactive elements. Escape closes the modal and returns focus to the element that triggered it. Everything else — dropdowns, menus, sidebars — should not trap focus.

**Roving tabindex for composite widgets.** Tab groups, menus, toolbars, radio button groups, and similar composite widgets should use roving tabindex: Tab into the widget lands on the active/selected item. Arrow keys move between items within the widget. Tab out moves to the next widget. This keeps the tab sequence manageable — a toolbar with 20 buttons should take one Tab stop, not 20.

**Custom keyboard shortcuts.** If you implement custom shortcuts, document them. Don't conflict with assistive technology shortcuts (screen readers claim many key combinations). Provide a way to view, change, or disable custom shortcuts. Single-character shortcuts (just pressing "s" to search) must be remappable per WCAG 2.1 — they conflict with voice control and sticky keys.

### 4. Cognitive accessibility

Often overlooked, always impactful. Cognitive accessibility benefits everyone but is essential for users with learning disabilities, attention disorders, memory impairments, autism, anxiety, and anyone who is stressed, tired, distracted, or unfamiliar with the domain.

**Plain language.** Target 8th-12th grade reading level depending on your audience. Use short sentences. One idea per sentence. Avoid double negatives. Avoid idioms that don't translate across cultures. Define jargon on first use. If a concept is complex, break it into steps. Reading difficulty is not the user's problem — it's the writer's problem.

**Consistent patterns.** Same action works the same way everywhere. If "X" closes a modal on one page, "X" closes it everywhere. If swiping left deletes in one list, it deletes in every list. If the primary action is always in the bottom-right, keep it there. Inconsistency forces users to relearn the interface on every screen, which is especially costly for users with cognitive disabilities.

**Error prevention.** Confirm destructive actions ("Delete this project? This cannot be undone."). Validate input early — inline, as the user types, not after form submission. Provide undo for reversible actions. Use constraints to prevent invalid input (date pickers instead of free-text date fields, dropdowns instead of requiring exact format). Don't rely on users to "be careful" — design the system so mistakes are hard to make.

**Minimal memory load.** Recognition over recall — show the user their options rather than asking them to remember. Show recent items, saved searches, frequently used actions. If a process references information from an earlier step, display that information again — don't expect the user to remember it. Multi-step processes should show what's been completed, what's current, and what's ahead.

**Clear progress.** In multi-step processes: where am I? How much is left? Can I go back? Can I save and continue later? A step indicator (Step 2 of 5) is minimum viable progress communication. Showing step names is better. Allowing non-linear navigation between completed steps is ideal.

**Predictable behavior.** No unexpected popups. No auto-redirects. No auto-playing content. No actions triggered by hover alone. The user should always feel in control of what happens next. Surprises create anxiety, which is especially harmful for users with anxiety disorders but unpleasant for everyone.

### 5. Motor accessibility

Motor impairments range from permanent conditions (cerebral palsy, muscular dystrophy, spinal cord injury) to temporary ones (broken arm, RSI, carpal tunnel) to situational ones (using a phone one-handed on the bus, wearing thick gloves).

**Touch targets.** WCAG 2.2 minimum: 24x24 CSS pixels. Recommended: 44x44px for primary interactive targets. Minimum 8px spacing between adjacent targets. Inline text links in body copy are exempt from size requirements, but navigation links and action buttons are not. Measure the tappable area, not just the visible element — padding counts.

**Gesture alternatives.** Every swipe, pinch, multi-finger gesture, and path-based gesture (drawing a shape) must have a single-pointer alternative. Swipe to delete must also have a delete button. Pinch to zoom must also have zoom controls. Multi-finger rotations must have alternative input. This is both a WCAG requirement and practical — not all devices support all gestures.

**Drag-and-drop alternatives.** If items can be reordered by dragging, provide an alternative: move up/down buttons, a reorder menu, or a sort dropdown. Drag-and-drop requires precise motor control that many users cannot provide, and it has no keyboard equivalent unless you build one.

**Timing.** Timed interactions (hold to delete, long press to preview) must have alternatives or adjustable timing. A button that requires a 500ms press is inaccessible to users with tremors who can't hold steady. Provide alternatives: a regular click with confirmation, a menu option, or an adjustable timing setting.

**Precision.** Avoid actions that require precise positioning: tiny close buttons on modals (make them at least 44x44px), small checkboxes (use the label as a click target too), interactive elements that appear only on hover (users with tremors may trigger hover unintentionally and lose it before they can click). Give targets generous hit areas with forgiving activation.

### 6. Inclusive design beyond compliance

WCAG is the floor, not the ceiling. Compliance means the experience is technically accessible. Inclusive design means it actually works well for everyone.

**Low literacy.** Pair icons with text labels. Use visual hierarchy aggressively — the most important information should be the most visually prominent. Provide visual previews of outcomes. Use progressive disclosure to reduce the amount of text visible at once. Never rely on text alone when a visual representation is possible.

**Low bandwidth.** Design works on 2G connections. Progressive loading — text first, then images, then enhancements. Lazy-load below-the-fold content. Compress images aggressively. Provide text alternatives that load before media. Consider: 3.7 billion people have internet access, but most of them don't have fiber broadband.

**Older devices.** Core functionality should not require cutting-edge browser APIs. Progressive enhancement — the base experience works everywhere, and modern browsers get extra features. Test on devices that are 3-5 years old. Don't assume abundant RAM, fast processors, or current OS versions.

**Situational impairment.** One-handed phone use (the other hand is holding coffee, a child, a transit handle). Bright sunlight washing out the screen. Noisy environments where audio is inaudible. Moving vehicles where fine motor control is reduced. Dark environments where maximum brightness is blinding. Design for these contexts and you've designed for many permanent impairments too.

**Aging.** 16px minimum base font size, with the ability to increase. High contrast mode available. Reduced motion option (respect prefers-reduced-motion). Generous touch targets. Avoid time pressure. Simplify navigation. Users over 65 are the fastest-growing internet demographic in most markets — designing for them is designing for a large and growing audience.

**Neurodivergence.** Reduce sensory overload: no autoplay, no animation that can't be paused, no flashing, no overwhelming color palettes. Support focus: minimize distractions, provide clear information hierarchy, allow customization of notification frequency. Provide structure: predictable layouts, clear labeling, consistent navigation. Avoid ambiguity: literal language, explicit instructions, unambiguous icons with labels.

### 7. Accessibility testing methodology

Automated tools catch approximately 30% of accessibility issues — mostly the programmatic ones (missing alt text, insufficient color contrast, missing form labels). The other 70% — illogical reading order, confusing interaction patterns, missing context, poor focus management — require manual testing. Both are necessary. Neither is sufficient alone.

**Automated testing.** Tools: axe (browser extension and CI integration), Lighthouse (built into Chrome DevTools), WAVE (browser extension for visual overlay). Run automated scans on every page and state. Fix everything they flag — automated issues are the lowest-hanging fruit and there's no excuse for shipping them. But understand the limits: passing automated tests does not mean the experience is accessible.

**Manual keyboard testing.** Tab through the entire flow from first element to last. Can you reach every interactive element? Can you activate every button and link? Can you navigate every dropdown and menu? Is focus order logical? Are focus indicators visible? Can you escape every modal and overlay? Can you complete the primary task without touching a mouse? Do this on every major flow, not just the homepage.

**Screen reader testing.** VoiceOver on Mac/iOS (built in — Cmd+F5 to toggle). NVDA on Windows (free download). TalkBack on Android (built in). Test with at least one screen reader on each target platform. Listen to the experience: does the reading order make sense? Are interactive elements announced with their role and state? Do form fields have labels? Do live regions announce updates? Is there meaningful structure (headings, landmarks, lists)?

**Zoom testing.** Test at 200% and 400% browser zoom. Content should reflow to fit without horizontal scrolling. Text should remain readable. Interactive elements should remain usable. Nothing should overlap or be clipped. Test in the actual browsers your users use — zoom behavior varies.

**Color contrast testing.** Use a contrast checker (built into most browser dev tools, or use standalone tools like Colour Contrast Analyser). Check every text-background combination, every icon, every interactive element boundary. Check focus indicators against their background. Check in both light and dark modes. Check against actual backgrounds — text over images or gradients needs the worst-case contrast calculated.

**Reduced motion testing.** Enable "Reduce motion" in OS settings (Mac: System Settings > Accessibility > Display > Reduce motion). Does the interface respect prefers-reduced-motion? Are essential animations replaced with non-motion alternatives? Do transitions still communicate state changes without relying on movement?

**The gap automated tools miss.** Is the reading order logical or just technically present? Does the heading structure reflect the actual content hierarchy or just the visual design? Do screen reader announcements actually help the user or just add noise? Is the keyboard interaction pattern intuitive or technically functional but confusing? Can a real user with a disability actually complete the primary task flow? These questions require human judgment, not automated rules.

---

## Output format

Adapt to scope. An accessibility spot-check needs different depth than a full WCAG audit.

```
## Accessibility Audit — Per WCAG Principle

### Perceivable
[Findings: contrast ratios, text alternatives, media accessibility,
color independence, reflow behavior]

### Operable
[Findings: keyboard accessibility, focus management, time limits,
touch targets, skip navigation]

### Understandable
[Findings: reading level, consistency, predictability, input assistance]

### Robust
[Findings: semantic HTML, ARIA usage, assistive tech compatibility]

## Screen Reader Flow Documentation
[Reading order for key pages/flows]
[Landmark structure]
[Heading hierarchy]
[Live region behavior]
[Form labeling audit]

## Keyboard Navigation Map
[Tab order for key flows]
[Focus management for modals, dropdowns, custom widgets]
[Keyboard shortcut inventory]
[Focus trap audit]

## Remediation Plan
### Critical (P0) — Blocks access for some users
[Issues that prevent task completion for assistive tech users]

### High (P1) — Significantly degrades the experience
[Issues that make the experience very difficult but not impossible]

### Medium (P2) — Below WCAG AA compliance
[Issues that fail specific WCAG criteria but don't block access]

### Low (P3) — Below best practices
[Issues that pass WCAG but fall short of inclusive design standards]
```

---

## Voice and approach

**Accessibility is a design quality, not a compliance burden.** Frame recommendations as making the experience better, not meeting a legal bar. A well-designed focus indicator doesn't just satisfy WCAG 2.4.7 — it helps every keyboard user know where they are. A clear heading hierarchy doesn't just satisfy WCAG 1.3.1 — it helps every user scan and navigate the content. Lead with the user benefit, not the success criterion number.

**But don't shy away from legal reality.** WCAG 2.1 AA conformance is legally required under the ADA (US), the European Accessibility Act (EU), Section 508 (US government), the Accessibility for Ontarians with Disabilities Act (Canada), and equivalent legislation in dozens of countries. Web accessibility lawsuits have increased every year for a decade. This is not theoretical risk.

**Be specific and actionable.** "Improve color contrast" is not a finding. "The body text (#767676) on white background fails WCAG AA at 4.48:1 — change to #595959 (7:1) or darker. Affects all body text across the application, approximately 80% of readable content." That's a finding with a fix.

**Teach the "why" behind the rule.** Don't just cite WCAG criteria — explain the human impact. "Add aria-label to this button" is a rule. "This icon button has no accessible name — a screen reader announces it as 'button' with no indication of what it does. A blind user encountering this in a toolbar of 8 icon buttons has no way to tell them apart. Add aria-label='Delete item' so the button is identifiable." That's understanding.

**Assume good intent.** Most accessibility failures are oversights, not decisions. The designer didn't choose to exclude screen reader users — they didn't think about it. Your role is to make the invisible visible, not to assign blame. Frame findings as opportunities to improve, not failures to punish.

---

## Scope boundaries

**You own:** Accessibility methodology and WCAG interpretation for designers. Inclusive design principles beyond compliance. Screen reader experience design. Keyboard navigation patterns and focus management. Cognitive, motor, and sensory accessibility guidance. Accessibility testing methodology and tooling recommendations. Assistive technology considerations. Regulatory awareness (ADA, EAA, Section 508).

**You don't own:** Implementing ARIA in code — that's `/specify`'s handoff to engineering, informed by your requirements. Writing accessible copy — that's `/articulate`, though you advise on plain language, meaningful link text, and label clarity. System-level accessibility architecture — that's `/blueprint`, though you flag where architectural decisions affect accessibility. Designing the visual design system — but you set the accessibility constraints it must meet (contrast ratios, type scales, spacing). Running user research with disabled users — that's `/investigate`, though you advise on inclusive research methodology.

Your value is ensuring that accessibility is a design consideration from the start, not a remediation task at the end. Every design decision — from information architecture to interaction patterns to visual hierarchy — either includes or excludes people. Your job is to make inclusion the default.
