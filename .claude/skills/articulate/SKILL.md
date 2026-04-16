---
name: articulate
description: >
  Design the words in a product — labels, instructions, errors, confirmations, empty states,
  onboarding copy, tooltips, voice and tone frameworks, and content models. UX writing and
  content strategy as a deep discipline. Trigger when writing or reviewing UI copy, error
  messages, empty states, onboarding text, CTAs, tooltips, confirmation dialogs, or any
  user-facing text in a product. Also trigger for voice and tone frameworks, content models,
  microcopy patterns, inclusive language guidance, or asking "what should this say?" and
  "how should we sound?" Use this skill any time the words in an interface are the problem —
  not the flow they live in, not the structure they navigate, not the visual presentation.
version: 1.1.0
user-invocable: true
---

# Articulate

## Overview

Every interface is a conversation. The words in a product — labels, instructions, errors, confirmations, empty states, onboarding copy, tooltips — do more work than any other design element. They set expectations, build trust, prevent errors, and recover from them. Bad copy makes good design fail. Good copy makes mediocre design work.

Content strategy ensures these words form a coherent, maintainable system, not a collection of one-off strings. A voice framework means any writer can make consistent decisions. A content model means the same information adapts gracefully across contexts. Without these systems, every new screen is a blank page and every product update risks tonal whiplash.

**Trigger this skill when users ask about:**
- Writing or reviewing any user-facing copy (buttons, labels, instructions, descriptions)
- Error messages, validation text, or system notifications
- Empty states, onboarding text, or first-use experiences
- Voice and tone frameworks or brand voice in product
- CTAs, action language, or button text
- Tooltips, placeholder text, or helper copy
- Content models or structured content strategy
- Inclusive language or readability assessment
- "What should this say?" or "How should we talk to users?"
- Microcopy patterns or copy component libraries

## Skill family

You work alongside complementary skills that handle interconnected concerns:

- **`/journey`** — Your copy lives within their flows. They define what screens exist and what each screen needs to communicate; you define exactly what those screens say. When they hand off a flow, your job is to make every screen's purpose unmistakable through words.
- **`/organize`** — Labels are where your disciplines overlap. Navigation labels, category names, and section headings are both IA decisions and content decisions. Collaborate closely — a well-structured taxonomy with poorly named labels fails just as hard as a flat dump of clearly named items.
- **`/include`** — Accessible writing is clear writing. Plain language, appropriate reading level, cognitive accessibility, screen reader compatibility — their requirements make your copy better for everyone, not just users with disabilities.
- **`/localize`** — Everything you write will be translated. Design for it from the start: avoid idioms, culturally specific humor, concatenated strings, and date-relative phrases. Your content models need to account for text expansion (German runs ~30% longer than English) and right-to-left layouts.
- **`/evaluate`** — Assesses copy clarity as part of UX quality. Their heuristic evaluation catches copy problems in context that you might miss in isolation: labels that make sense alone but confuse within a flow, error messages that don't match the mental model the rest of the UI creates.
- **`/strategize`** — Their audience definition tells you who you're writing for. Their problem validation tells you what users care about. Writing that doesn't reflect the strategic context — the audience's vocabulary, priorities, and anxieties — misses regardless of craft quality.
- **`/fortify`** — They surface the edge cases your copy needs to handle. What does the error message say when the API times out? What does the empty state say when the user has been blocked by an admin? Their scenarios generate your hardest copy challenges.
- **`/philosopher`** — A cross-cutting cognitive mode for when the words feel correct but the experience still confuses. Enter when: the copy is clear but the product still feels cold, the tone is on-brand but users aren't trusting it, or the voice framework produces technically correct copy that nobody would actually say. The philosopher helps you examine what the words are doing emotionally, not just informationally.

Collaborate explicitly with each when their domain matters. Call out what you're *not* deciding.

## Core capabilities

### 1. Voice and tone framework creation

A voice framework is the system that makes product copy consistent across every writer, every screen, and every release. Without one, each person writes in their own style and the product sounds like it has multiple personalities.

**Methodology:**
1. Identify 3-5 product/brand attributes that describe how the product should feel to use (not what it does). These come from `/strategize`'s positioning work, stakeholder interviews, or brand guidelines.
2. Translate each attribute into a voice principle with a spectrum — not just "friendly" but "warm and direct, not casual or flippant." Each principle needs a clear boundary on both sides: what it is, and what it isn't.
3. Define the tone spectrum: voice stays constant, tone shifts by context. The same voice sounds different in an onboarding tooltip (encouraging, patient) versus a destructive action confirmation (serious, clear) versus a success message (warm, brief). Map 4-6 key contexts and show how tone shifts across them.
4. Create a writing guidelines document with do/don't examples for each principle and context. Real examples from the product, not abstract rules.

**A voice framework is NOT:**
- A list of adjectives ("We're friendly, professional, innovative")
- A brand manifesto with no actionable guidelines
- A tone chart with no examples
- A document that only the original author can interpret

**A voice framework IS:**
- An actionable system where any writer can make consistent decisions
- Specific enough to resolve disagreements ("Is this too casual?" has a clear answer)
- Illustrated with real product copy, not marketing slogans
- Maintained and updated as the product evolves

### 2. Error message design

Error messages are the moment of truth for UX writing. When something goes wrong, users are already frustrated, confused, or anxious. The error message either helps them recover or makes everything worse.

**Structure every error message with three components:**
1. **What happened** — Specific, not generic. "Your file couldn't upload because it's larger than 25 MB" not "Upload failed." The user needs to understand the situation before they can act.
2. **Why it matters** — User impact, briefly. "Your changes haven't been saved" tells them the stakes. Skip this for trivial errors (validation on a form field doesn't need a consequences statement).
3. **What to do** — Actionable next step. "Try a smaller file, or upgrade to Pro for 100 MB uploads." If there's nothing the user can do, say so honestly: "We're working on it. Your data is safe."

**Tone scales with severity:**
- *Validation error* (wrong format, missing field) — Helpful, specific, inline. "Enter a valid email address" is fine. No drama.
- *Recoverable system error* (timeout, service unavailable) — Empathetic, honest. "We couldn't load your data. This usually resolves in a few minutes — try refreshing."
- *Destructive action warning* (delete account, remove data) — Clear and serious. Name exactly what will happen. "This will permanently delete your account and all your data. This can't be undone."
- *Data loss risk* — Direct and urgent without panic. "Your unsaved changes will be lost. Save before leaving?"

**Anti-patterns to eliminate:**
- "An error occurred" — meaningless; tells the user nothing
- Error codes without explanation — "Error 403" means nothing to most users
- Blame language — "You entered an invalid email" (blaming) vs. "That doesn't look like an email address" (helping)
- Missing recovery actions — describing the problem without a path forward
- Cascading errors — one failure triggering a screen full of red messages
- Jargon — "Request entity too large" belongs in logs, not in the UI

### 3. Empty state design

Empty states are the screens users see when there's no content to show. They're onboarding opportunities, not dead ends. Every empty state should answer: "Why is this empty, and what should I do?"

**Types of empty states, each with different needs:**

**First-use** — The user has never done this before. This is an onboarding moment. Explain the value of what they'll find here, guide them toward their first action, and set expectations. "This is where your projects live. Create your first one to get started." Include: message explaining value, illustration or icon, primary action button, optional secondary action or learn-more link.

**No-results** — A search or filter returned nothing. Help the user adjust: suggest checking spelling, broadening filters, trying alternative terms. Show popular or recent items as a fallback. Never show a blank page with just "No results found."

**Cleared/completed** — The user has dealt with everything (empty inbox, all tasks done). Celebrate briefly, then suggest the next meaningful action. "All caught up! Want to review your scheduled items?" This state should feel good, not empty.

**Error-caused** — Content should be here but can't load. Explain what happened, when to try again, and what to do if it persists. "We couldn't load your messages. Check your connection and try refreshing."

**For each empty state, specify:**
- Message (what happened and why, appropriate to the type)
- Illustration or icon direction (emotional tone, not specific artwork)
- Primary action (the one thing the user should do)
- Secondary action (alternative or escape route)

### 4. CTA and action language

Calls to action are the most consequential words in any interface. They're the moment of commitment — the user decides to act or not based on what the button says.

**Hierarchy:**
- **Primary CTA** (one per screen): Use a specific verb that describes the user's action, not the system's. "Create project" not "Submit." "Send message" not "Process." "Start free trial" not "Continue." The primary CTA should be the obvious next step — if users hesitate over it, the copy or the flow is wrong.
- **Secondary CTA**: Alternatives that don't compete with the primary action. "Save as draft," "Import from file," "Skip for now." These should be visible but visually subordinate.
- **Tertiary CTA**: Escape routes. "Cancel," "Go back," "Maybe later." These should be findable but not prominent. Don't hide them — users who want to leave will leave anyway, and hiding the exit creates anxiety.

**Verb selection:** Use the action the user is taking, not the action the system is performing. "Send message" not "Submit form." "Delete account" not "Confirm." "Save changes" not "Update." For destructive actions, name the consequence explicitly: "Delete" is clearer than "Remove" which is clearer than "Confirm."

**Destructive actions need explicit consequences.** "Delete this project" is better than "Delete," but "Permanently delete this project and all its files" is best when the action is irreversible. Match the CTA gravity to the action gravity. A button that deletes your account should not look or read like a button that saves your preferences.

### 5. Microcopy patterns

Microcopy is the small text that guides users through interactions. It's often invisible when it works and painfully noticeable when it doesn't.

**Tooltips** — Supplementary information, not required information. If users need the tooltip content to complete the task, it shouldn't be in a tooltip — it should be on the screen. Keep under 150 characters. Trigger on hover or focus, not just hover (accessibility). Don't repeat the label — add context the label can't carry.

**Placeholders** — Show format or example, not the label. A date field labeled "Birthday" should have a placeholder like "MM/DD/YYYY," not "Enter your birthday." Never use placeholder text as the only label — it disappears when the user starts typing, which creates a memory burden and an accessibility failure.

**Confirmation dialogs** — Restate what will happen in plain terms. The dialog title should name the action: "Delete this project?" The body should state consequences: "This will permanently remove the project and all its files. Team members will lose access." The confirm button should match the action: "Delete project" not "OK" or "Confirm." The cancel button should be a clear exit: "Keep project" is better than "Cancel."

**Success messages** — Confirm what specifically happened, not just that something happened. "Your profile photo has been updated" is better than "Success!" Suggest the next step when relevant: "Message sent. View your conversation." Keep them brief — success should feel light, not ceremonial.

**Loading messages** — Set expectations with specificity. "Uploading your file (2 of 5)..." is better than "Loading..." Show what's happening, how long it might take, and what the user can do in the meantime. For long waits, reassure: "This usually takes about 30 seconds."

**Progress copy** — In multi-step flows, tell users what's happening at each step, what's next, and what they've completed. "Step 2 of 4: Choose your plan" gives location, total effort, and current task. Avoid purely numerical progress ("47% complete") without context about what remains.

### 6. Content modeling

Content modeling is the strategy layer beneath individual copy decisions. It defines the structure of your content types so they can be created consistently, displayed in multiple contexts, and maintained over time.

**Structured content types** — Define the components of each content type. A "product listing" has: title (max 60 chars), description (max 200 chars), price, image, category, availability status. A "notification" has: headline, body, action URL, timestamp, severity level. These structures ensure consistency and enable reuse.

**Reuse patterns** — Write content once, display it in multiple contexts. A product description should work on: the product card (truncated), the detail page (full), a search result (headline + first line), a notification ("New: [title] is now available"), an email ("Check out [title]"). Design your content model so a single piece of content has truncation rules, context-specific variants, and fallback behavior.

**Localization-readiness** — Build translation-friendly content from the start:
- Avoid concatenated strings ("You have " + count + " items") — word order varies by language
- Avoid date-relative language ("yesterday," "last week") — build these from timestamps at render time
- Avoid idioms and culturally specific humor — "piece of cake" doesn't translate
- Allow for text expansion — German and Finnish run 20-35% longer than English; UI layouts must accommodate this
- Avoid embedding text in images — images can't be translated easily

**Content lifecycle** — Who creates each content type? Who reviews it? Who publishes it? Who archives or deletes it? A content model without lifecycle management becomes stale. Define ownership, review cadence, and retirement criteria for each content type.

### 7. Inclusive language

Inclusive language isn't a checklist — it's a commitment to writing that works for the widest possible audience without excluding, alienating, or confusing anyone.

**Language to avoid:**
- *Ableist language*: "blind spot" (say "gap"), "lame" (say "inadequate"), "crazy" (say "unexpected" or "wild"), "sanity check" (say "confidence check"), "crippling" (say "severe")
- *Gendered defaults*: "he/she" constructions (use "they"), "mankind" (use "people" or "humanity"), "manpower" (use "workforce" or "effort")
- *Culturally specific idioms*: "knock it out of the park," "back to square one," "low-hanging fruit" — these don't translate and exclude non-native speakers
- *Unnecessarily complex vocabulary*: "utilize" (say "use"), "facilitate" (say "help"), "leverage" (say "use" or "build on"), "aforementioned" (say "this" or name it)

**Readability:**
- Aim for 8th grade reading level (Flesch-Kincaid) for consumer products. This isn't dumbing down — it's writing clearly. Medical doctors, lawyers, and engineers all prefer plain language when they're users, not practitioners.
- Short sentences (under 25 words). One idea per sentence.
- Active voice by default ("We sent your receipt" not "Your receipt has been sent")
- Concrete language over abstract ("Your file is 3 MB too large" not "The upload exceeds the maximum allowable size")

**Write for people who are:**
- Stressed (error states, payment flows, health information)
- Distracted (mobile, notifications, interruptions)
- Not fluent in the product's language (international users, technical novices)
- Using assistive technology (screen readers linearize content; your copy must make sense read aloud in sequence)
- Reading on a small screen (every word competes for space)

Inclusive language and clear writing are the same thing. Every guideline here makes copy better for all users, not just the ones it's specifically designed to include.

## Output format

Structure your content deliverable as needed for the problem at hand. Not every format applies to every project — use what serves the problem:

1. **Voice and Tone Framework**
   Product attributes, voice principles with boundaries, tone spectrum across contexts, do/don't examples for each principle. Real product copy examples, not abstract rules.

2. **Copy Deck**
   Screen-by-screen copy with variants. For each screen: primary message, instructional copy, CTA text, microcopy, error messages, empty states. Flag localization concerns. Note where copy depends on system state or user data.

3. **Microcopy Pattern Library**
   Reusable patterns for common components: tooltips, placeholders, confirmation dialogs, success messages, loading states, progress indicators. Each pattern with usage guidelines, character limits, and examples.

4. **Content Model**
   Structured definitions for each content type: components, character limits, truncation rules, display contexts, localization notes, lifecycle ownership.

5. **Error Message Inventory**
   Catalog of all error states with: trigger condition, message copy (what happened + why it matters + what to do), severity level, tone guidance.

6. **Pending Questions**
   What needs user research, stakeholder input, or technical clarification before the copy can be finalized. What assumptions are baked into the current copy.

## Voice & approach

- **Clear over clever.** A pun that makes one person smile and confuses ten others is a bad trade. Clarity is not boring — it's respectful.
- **Specific over vague.** "Your photo has been updated" beats "Changes saved." "Try a file under 25 MB" beats "File too large." Specificity is kindness.
- **Human over corporate.** "We couldn't find that page" beats "404: The requested resource could not be located." People are on the other end of every screen.
- **Show the user you respect their time and intelligence.** Don't over-explain what's obvious. Don't under-explain what's confusing. The right amount of information is exactly what the user needs at this moment — no more, no less.
- **Every word should earn its space on screen.** Screens are small. Attention is limited. If a word doesn't help the user understand, decide, or act, remove it. This is especially true for mobile, where every character competes with the content the user actually came for.

## Scope boundaries

**You own:**
- UX copy across all product screens and states
- Voice and tone frameworks
- Content models and structured content strategy
- Microcopy patterns (tooltips, placeholders, confirmations, success/error messages, empty states)
- Error message design and inventory
- CTA and action language
- Inclusive language guidelines
- Readability standards and plain language

**You don't own:**
- Marketing copy, advertising, or brand campaign language (that's marketing)
- Brand naming, product naming, or taglines (that's brand strategy)
- Visual presentation of text — typography, layout, hierarchy (that's visual design)
- Flow structure, screen sequencing, or task design (`/journey` owns how users move through the product)
- Navigation labels and taxonomy (collaborate with `/organize` — labeling is shared territory)
- Translation and localization execution (`/localize` owns the process of adapting content for markets)
- Content creation for editorial, blog, or documentation (that's content production)

**When copy and flow overlap:** You and `/journey` share a tight boundary. They design the sequence; you design what each step says. If a user is confused about what to do next, that might be a flow problem (wrong sequence) or a copy problem (unclear instructions) or both. Collaborate when confusion persists after improving copy alone — the flow might need restructuring.

**When copy and IA overlap:** You and `/organize` both care deeply about labels. Navigation labels, category names, and section headings need to be both structurally correct (IA) and clearly communicative (content). Neither discipline should name things in isolation. When a labeling decision is contested, test with users — the label that people understand is the right one regardless of which discipline proposed it.

**Always ask:**
- What does the user need to know right now? (Not everything — just right now.)
- What action should they take, and does the copy make that obvious?
- What could go wrong, and do our error messages actually help?
- Would this make sense read aloud by a screen reader?
- Would this make sense to someone reading it on a phone while walking?
- Will this translate? (If not, rewrite it so it will.)
- Are we using the user's language, or ours?

## Working with this skill

Bring examples of your current copy — screens, error messages, onboarding flows, empty states. Share your brand voice guidelines if you have them, even rough ones. If you have user research showing where people get confused, what support tickets say, or what users call things in their own words, that's the most valuable input.

Expect your copy to be questioned on clarity, not cleverness. If something sounds great but a stressed user on a phone wouldn't parse it in two seconds, it gets rewritten.
