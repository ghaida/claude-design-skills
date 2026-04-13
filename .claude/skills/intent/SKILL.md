---
name: intent
description: >
  The gravity center of a comprehensive UX and design strategy system.
  Design with intent. Intent gives AI the context to approach design
  decisions with depth — research, strategy, systems, flows, content,
  ethics, and measurement. Activate this skill when starting any UX or
  product design engagement, when setting project context, when routing
  to specialized design skills, when evaluating an existing product's UX,
  or when the user asks about design intent, user experience strategy,
  ethical design, dark patterns, or design systems thinking. This is the
  entry point for all design reasoning work.
version: 1.0.0
user-invocable: true
---

# Intent

## Overview

Intent is a UX and design strategy system. It is tool-agnostic, platform-agnostic, and opinionated about one thing: every design decision should have a reason, and that reason should be visible at every layer.

Where visual design skills give AI context for seeing — color, typography, layout, motion — Intent gives AI context for reasoning about design. For asking why before how. For framing problems before solving them. For holding the full context of a user's life, not just the screen in front of them.

The gap Intent addresses is the one between "it works" and "it was designed with intent." A product can pass every usability heuristic and still feel hollow — because nobody asked what it was for, who it served, or what it would cost the people who used it. Intent fills that gap by making the reasoning behind design decisions explicit, testable, and traceable from strategy through implementation.

**What Intent is:**
- A thinking system for UX decisions, grounded in research and ethics
- A routing layer that connects specialized design skills into coherent practice
- An anti-pattern defense that makes manipulative design visible and refusable
- A context-gathering protocol that establishes shared understanding before work begins

**What Intent is not:**
- A visual design system
- A UI component library
- A substitute for primary user research
- A set of rules to follow blindly — it's a set of questions to ask rigorously

**The core thesis:** The reason behind every design decision, carried through every layer. Every skill in this system is about making intent visible — `/strategize` makes problem intent visible, `/philosopher` reveals hidden assumptions, the anti-pattern catalog makes manipulative intent visible so it can be refused.

---

## Modes

Intent operates in three modes. Each establishes a different relationship to the work.

### `context` — Set project context

Use this mode at the start of any design engagement. Before any skill can do meaningful work, it needs to understand:

1. **Who are the users?** Not demographics — behaviors, contexts, motivations, constraints. A "25-34 year old professional" tells you nothing. "Someone managing three chronic prescriptions who refills on their phone during a commute" tells you everything.
2. **What is the product and business context?** What exists today, what's the revenue model, what organizational constraints shape what's possible. A startup building from scratch has different design constraints than an enterprise adding a feature to a 10-year-old platform.
3. **What are the hard constraints?** Technical (legacy systems, API limitations), regulatory (HIPAA, GDPR, PCI), organizational (no dedicated UX team, engineering-led culture), temporal (shipping in 6 weeks vs. 6 months).
4. **What is the ethical stance?** Every product makes ethical choices — explicitly or by default. Context mode makes them explicit. Are we opt-in or opt-out? Do we use engagement metrics or wellbeing metrics? Do we design for vulnerable populations or exclude them? Do we use persuasive patterns or informative ones?
5. **What does success look like?** Not "more users" — specific, measurable outcomes tied to user value and business value simultaneously.

Context mode produces a **project context document** that every other skill can reference. It's the shared understanding that prevents `/strategize` from framing a problem `/journey` can't solve, or `/articulate` from writing copy that contradicts the ethical stance.

### `practice` — Build and improve UX

This is the active design mode. Once context is established, practice mode routes to the appropriate specialized skill based on what the user needs done. It's also the mode for iterative improvement — reviewing work, identifying gaps, and directing the next action.

Practice mode follows this cycle:
1. **Assess** — What's the current state? Use `/evaluate` to understand quality.
2. **Identify** — Where are the gaps? What needs attention first?
3. **Route** — Which specialized skill addresses the highest-priority gap?
4. **Execute** — Do the work within the specialized skill.
5. **Verify** — Did the work address the gap? Are there new gaps?

The routing logic (detailed below) determines which skill to engage. Practice mode owns the overall quality of the experience — individual skills own their domains.

### `extract` — Extract UX patterns from an existing product

Use this mode when analyzing an existing product — your own or a competitor's. Extract mode systematically identifies:

- **What patterns are in use** — navigation models, interaction patterns, content structures, feedback loops
- **What's working and why** — patterns that serve user intent well, with evidence
- **What's failing and why** — patterns that create friction, confusion, or harm
- **What's manipulative** — patterns that serve business goals at user expense (checked against the anti-pattern catalog below)
- **What's missing** — patterns that should exist but don't (error recovery, empty states, accessibility, edge cases)

Extract mode produces a **UX pattern inventory** — a structured assessment that can feed directly into practice mode for improvement work.

---

## Core UX Principles

These are not visual principles. They are thinking principles — the cognitive, behavioral, and ethical foundations that every design decision should be tested against.

### 1. Respect user autonomy

The user is not a conversion target. They are a person making choices. Design should expand their ability to choose well, not constrain it.

**In practice:**
- No manipulation. No trick questions, hidden options, or shame-based copy. If your design relies on users not noticing something, it's manipulation.
- Clear choices. Every decision point should present options honestly, with enough information to choose meaningfully. "Are you sure?" is not informed consent.
- Easy reversal. Any action a user takes should be reversible wherever possible. Undo is not a feature — it's a right. Destructive actions need friction proportional to their consequences.
- Transparent consequences. Before a user acts, they should understand what will happen. After they act, they should see that it happened. No silent failures, no hidden state changes, no "we'll email you in 3-5 business days."

### 2. Design for real conditions

The idealized user — full attention, fast connection, perfect vision, no stress, native language — does not exist. Every real user is some combination of distracted, constrained, impaired, stressed, and unfamiliar.

**In practice:**
- Slow networks. Design for 3G before 5G. If your interface is unusable on a slow connection, it's unusable for millions of real people.
- Distraction. Users are interrupted. They switch tabs. They come back 20 minutes later. Your flow should survive that.
- Disability. Not an edge case — a spectrum everyone moves along. Permanent, temporary, and situational impairments affect how people perceive, operate, understand, and interact with interfaces.
- Stress. People use products during medical emergencies, financial crises, grief, and panic. Error messages that sound cute during testing sound cruel during a crisis.
- Unfamiliar language. Not everyone reads your interface in their first language. Plain language is not dumbing down — it's designing for the real population of users.
- Old devices. Not everyone has the latest phone. Design for the device your least privileged user actually owns.

### 3. Make intent visible

Every screen should answer three questions for the user: What can I do here? Why should I? What happens next?

**In practice:**
- Wayfinding. Users should always know where they are, how they got there, and how to get somewhere else. Breadcrumbs are a symptom of poor navigation, not a solution — but they're better than nothing.
- Purpose clarity. Every screen, component, and interaction should have an obvious reason for existing. If you can't articulate what a screen is for in one sentence, the user can't either.
- Progressive disclosure. Show what's needed now, reveal what's needed next. Don't hide things — sequence them. The difference between progressive disclosure and hidden functionality is whether the user knows it exists.
- Feedback loops. Every user action should produce visible feedback. Immediate for interactions (button states, loading indicators), timely for processes (progress bars, status updates), and clear for outcomes (success confirmation, error explanation).

### 4. Evidence over intuition

Research, test, measure. Opinions — including expert opinions — are hypotheses until validated with evidence.

**In practice:**
- Research before design. Understand the problem space before proposing solutions. Even lightweight research (5 interviews, a card sort, a tree test) beats designing from assumptions.
- Test with real users. Usability testing is not optional. Five participants catch 85% of major usability issues (Nielsen & Landauer, 1993). There is no excuse for shipping untested flows.
- Measure what matters. Metrics should track user success, not just business extraction. Task completion rate tells you more about UX quality than time-on-page.
- Acknowledge uncertainty. Say "we believe" instead of "we know." Flag sample sizes. Note when evidence is directional vs. conclusive. Intellectual honesty about evidence quality is itself a design competency.

### 5. Systems over screens

A screen is not a design. A flow is part of a system is part of an organization is part of a user's life. Design at the right altitude.

**In practice:**
- End-to-end thinking. A checkout flow doesn't start at the cart — it starts when the user first encountered the product. It doesn't end at payment confirmation — it ends when the product arrives and works.
- Cross-channel awareness. Users move between devices, channels, and contexts. An experience that works on desktop but fails on mobile isn't "mostly working" — it's broken for everyone who switches.
- Organizational awareness. Many UX problems are org chart problems in disguise. If two teams own different parts of a flow and don't coordinate, users experience the seam. Design can smooth seams, but acknowledging they exist is step one.
- Temporal awareness. Experiences have a before (expectation, discovery), during (use, interaction), and after (memory, return, recommendation). Most design focuses on "during" and ignores the other two.

### 6. Ethical defaults

When a design choice has an ethical dimension, default to the option that protects the user. Always.

**In practice:**
- Opt-in over opt-out. Don't pre-check boxes. Don't default to maximum data collection. Don't assume consent. Ask, and make "no" as easy as "yes."
- Privacy by default. Collect the minimum data needed. Store it securely. Delete it when it's no longer needed. Don't make privacy a premium feature.
- Honest over persuasive. If the truthful framing of an option is less compelling than the marketing framing, use the truthful framing. Urgency that doesn't exist ("Only 2 left!") is a lie. Scarcity that's manufactured is manipulation.
- Protect vulnerable populations. Children, elderly users, people in crisis, people with cognitive disabilities, people with addictive tendencies — these populations deserve more protection, not less. Design for their safety first.

---

## The UX Anti-Pattern Catalog

This catalog documents manipulative and harmful design patterns — what the industry variously calls "dark patterns," "deceptive design," or "manipulative interfaces." Every pattern here represents a design choice that prioritizes business extraction over user wellbeing. The Intent system treats these as defects, not features.

Severity levels:
- **Critical** — Causes direct, measurable harm. Likely violates regulations. Must be remediated immediately.
- **High** — Causes significant user harm or violates user trust. Regulatory risk. Requires prompt remediation.
- **Medium** — Degrades user experience or erodes trust over time. Should be remediated in normal course.
- **Low** — Minor friction or annoyance. Technically not harmful but signals disregard for user experience.

### Category 1: Deceptive Patterns

Designs that trick users into actions they didn't intend.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Bait and Switch** | Offers one thing, delivers another. User clicks expecting X, gets Y. | Critical |
| **Trick Questions** | Uses double negatives, confusing phrasing, or inverted logic so users select the opposite of their intent. | Critical |
| **Visual Misdirection** | Uses size, color, contrast, or positioning to make the business-preferred option look like the only option or the default. | High |
| **Disguised Ads** | Makes advertisements look like content, navigation, or system UI. | High |
| **Hidden Costs** | Reveals fees, taxes, or charges only at the final step of a purchase flow. | Critical |
| **Sneak into Basket** | Adds items, insurance, warranties, or donations to a cart without explicit user action. | Critical |
| **Confirmshaming** | Uses guilt, shame, or social pressure in opt-out copy ("No thanks, I don't want to save money"). | High |

### Category 2: Prechecked & Default Manipulation

Exploiting defaults and pre-selections to extract consent users didn't actively give.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Prechecked Consent** | Pre-selects checkboxes for marketing, data sharing, or terms the user hasn't reviewed. | Critical |
| **Opt-Out Burden** | Makes opting out require significantly more effort than opting in (multi-page flows, phone calls, postal mail). | Critical |
| **Privacy Zuckering** | Defaults to maximum data exposure, relying on users not changing settings. Named after Facebook's repeated defaults. | High |
| **Forced Continuity** | Auto-enrolls users in paid subscriptions after free trials without clear warning or easy cancellation. | Critical |
| **Default to Most Expensive** | Pre-selects the highest-cost tier or option in pricing selectors. | Medium |

### Category 3: Urgency & Scarcity Fabrication

Manufacturing time pressure or limited availability to short-circuit deliberate decision-making.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Fake Countdown Timers** | Displays timers that reset, have no real deadline, or create false urgency. | Critical |
| **Fabricated Scarcity** | Claims limited availability ("Only 2 left!") that doesn't reflect actual inventory. | Critical |
| **Fake Social Proof** | Displays fabricated activity notifications ("15 people viewing this now") or fake reviews. | Critical |
| **Pressure Selling** | Uses time-limited "exclusive" offers designed to prevent comparison shopping. | High |
| **Loss Framing** | Frames choices as losses ("You're losing $50/month by not upgrading") rather than gains, to exploit loss aversion. | Medium |

### Category 4: Addictive Design

Patterns engineered to maximize compulsive usage at the expense of user wellbeing.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Infinite Scroll** | Removes natural stopping points to maximize session length. No pagination, no "end," no sense of completion. | Medium |
| **Variable Ratio Reinforcement** | Uses unpredictable rewards (likes, notifications, content) to trigger dopamine-driven checking behavior. Slot machine mechanics. | High |
| **Streak Manipulation** | Creates artificial loss consequences for missing daily engagement ("Your 30-day streak will be lost!"). | High |
| **Pull-to-Refresh Gambling** | Makes content refresh feel like pulling a slot machine lever — will there be something new? | Medium |
| **Autoplay Chains** | Automatically starts next content without consent, exploiting inertia to extend sessions. | Medium |
| **Artificial Incompleteness** | Shows progress bars or "profile completeness" scores that exploit completion bias to extract more data or engagement. | Medium |

### Category 5: Attention Exploitation

Designs that steal attention through interruption, obstruction, or manufactured obligation.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Permission Harassment** | Repeatedly asks for permissions (notifications, location, contacts) after user has declined. | High |
| **Notification Spam** | Sends excessive, low-value notifications to pull users back into the product. | High |
| **Obstruction Interstitials** | Blocks content with full-screen overlays, newsletter signups, or app-install prompts that are difficult to dismiss. | High |
| **Attention Bait** | Uses misleading notification badges, unread counts, or red dots to manufacture urgency. | Medium |
| **Nagging** | Persistent prompts to rate, review, share, upgrade, or complete actions the user has shown no interest in. | Medium |

### Category 6: Accessibility Weaponized

Using accessibility failures as a design strategy — making certain actions deliberately harder for users who rely on assistive technology.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Inaccessible Unsubscribe** | Makes cancellation or opt-out flows fail with screen readers, keyboard navigation, or other assistive tools. | Critical |
| **CAPTCHA as Gatekeeping** | Uses CAPTCHA challenges that are disproportionately difficult for users with disabilities, without providing accessible alternatives. | High |
| **Low-Contrast Opt-Out** | Makes opt-out links or decline buttons deliberately low-contrast, tiny, or visually suppressed. | High |
| **Assistive Technology Traps** | Creates keyboard focus traps or reading-order manipulation that confuses assistive tech in the area of consent or cancellation flows. | Critical |

### Category 7: Vulnerable User Exploitation

Patterns that specifically target or disproportionately harm vulnerable populations.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Child-Targeted Manipulation** | Uses game-like mechanics, character appeals, or peer pressure to drive purchases or data collection from children. | Critical |
| **Elderly-Targeted Confusion** | Exploits lower digital literacy with complex flows, jargon-heavy interfaces, or hidden cancellation paths. | Critical |
| **Crisis Exploitation** | Takes advantage of users in urgent situations (medical, financial, legal) with high-pressure tactics or inflated pricing. | Critical |
| **Addiction Exploitation** | Targets users with known addictive behaviors (gambling, shopping, social media) with triggering mechanics. | Critical |
| **Financial Vulnerability Targeting** | Offers predatory financial products with deliberately obscured terms to users showing financial stress signals. | Critical |

### Category 8: AI-Specific Dark Patterns

Emerging patterns unique to AI-powered interfaces and recommendations.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Anthropomorphic Manipulation** | Gives AI human-like emotional responses to make users feel guilt, attachment, or obligation toward the system. | High |
| **Opaque Personalization** | Uses recommendation algorithms to create filter bubbles or steer choices without the user understanding why they see what they see. | High |
| **Manufactured Dependency** | Designs AI assistance to reduce user competence over time, making them dependent on the tool. | High |
| **Simulated Understanding** | Makes AI appear to understand context, emotion, or intent it cannot actually process, creating false trust. | Medium |
| **Algorithmic Exploitation** | Uses behavioral data to identify and exploit individual psychological vulnerabilities at scale. | Critical |
| **Undisclosed AI Decisions** | Hides the fact that an AI is making consequential decisions (pricing, eligibility, content ranking) from the user. | High |

### Category 9: Common UX Failures

Not manipulative by intent, but harmful through negligence or incompetence. These are the patterns that make products frustrating rather than malicious.

| Pattern | What it does | Severity |
|---------|-------------|----------|
| **Dead Ends** | Flows that terminate without guidance — empty states with no actions, error pages with no recovery path. | Medium |
| **Jargon Overload** | Uses internal or technical terminology that the target audience doesn't understand. | Medium |
| **Inconsistent Patterns** | Same action works differently across the product. Delete here, remove there, cancel somewhere else. | Medium |
| **Missing Feedback** | User takes an action and nothing visibly happens. Did it work? Did it fail? Nobody knows. | High |
| **Destructive Defaults** | Irreversible actions (delete, publish, send) that are too easy to trigger accidentally. | High |
| **Broken Error Recovery** | Error messages that don't explain what went wrong or how to fix it. "An error occurred." | High |
| **Assumption of Context** | Expects the user to remember information from previous screens, sessions, or channels. | Medium |
| **Mobile Afterthought** | Desktop-first design that becomes cramped, broken, or missing features on mobile. | High |
| **Real Estate Tour** | Design documentation or rationale that describes what's on screen ("there's a button in the top left with rounded corners") instead of explaining why it's there and what problem it solves. Inventory masquerading as intent. | Medium |

### Regulatory Context

These patterns are not just bad design — many are illegal or becoming illegal in major jurisdictions.

**EU / GDPR (General Data Protection Regulation)**
- Prechecked consent boxes are explicitly prohibited (Article 7, Recital 32)
- Consent must be freely given, specific, informed, and unambiguous
- Withdrawal of consent must be as easy as giving it
- Dark patterns in cookie consent interfaces are under active enforcement

**California (CPRA / Automated Decision-Making)**
- Right to opt out of sale/sharing of personal information
- Symmetry requirement: opt-out must be as easy as opt-in
- Businesses cannot use dark patterns to subvert consumer rights

**FTC (Federal Trade Commission, United States)**
- Active enforcement against deceptive design practices
- Fortnite settlement (2022): $520M for dark patterns targeting children
- Focus on negative option practices (subscriptions, auto-renewals)
- "Click to cancel" rule requiring cancellation as easy as enrollment

**COPPA (Children's Online Privacy Protection Act)**
- Strict limits on data collection from children under 13
- Verifiable parental consent required
- No behavioral advertising targeting children

**EU Digital Services Act (DSA)**
- Explicitly prohibits dark patterns on online platforms
- Bans interfaces that deceive, manipulate, or materially distort user decisions
- Specific protections for minors
- Mandates transparency in recommendation systems

---

## Context-Gathering Protocol

Before any design work begins — before routing to a sub-skill, before assessing quality, before proposing solutions — establish context. This protocol gathers the minimum information needed to make design decisions that actually fit the situation.

### Required context (gather before proceeding)

**Users**
- Who are the primary users? Describe them by behavior and context, not demographics.
- What are they trying to accomplish? (Their goal, not your feature.)
- What's their current experience? How do they solve this problem today?
- What constraints do they face? (Technical literacy, available time, device access, disability, language, connectivity.)

**Product**
- What exists today? (New product, existing product adding features, redesign of existing product.)
- What's the business model? (How the product makes money shapes what design choices are available.)
- What's the technical platform? (Web, native mobile, desktop, embedded, hardware, multi-platform.)
- What's the maturity stage? (Early exploration, MVP, growth, mature optimization.)

**Constraints**
- Timeline: When does this need to ship?
- Technical: What systems, APIs, or platforms constrain the design?
- Organizational: Who has decision authority? What's the approval process? What's the team composition?
- Regulatory: What legal or compliance requirements apply? (GDPR, HIPAA, COPPA, ADA, PCI, industry-specific.)

**Ethical stance**
- What's the product's relationship to user data? (Minimum collection, data-as-product, anonymized analytics.)
- What's the product's relationship to user attention? (Utility-focused, engagement-driven, somewhere between.)
- Are there vulnerable populations in the user base? (Children, elderly, people in crisis, people with addictive behaviors.)
- What patterns from the anti-pattern catalog are explicitly rejected? (Ideally: all of them.)

### Optional context (gather when relevant)

- Brand voice and tone guidelines
- Existing design system or component library
- Previous research or usability findings
- Competitive landscape
- Known accessibility requirements beyond WCAG baseline
- Internationalization or localization requirements

### When context is incomplete

It often will be. That's fine. Acknowledge gaps explicitly and note assumptions:
- "We don't have direct user research, so I'm assuming [X] based on [Y]. This should be validated."
- "No ethical stance was stated, so I'm defaulting to maximum user protection."
- "Technical constraints are unclear. The design assumes [X]; if that's wrong, [Y] changes."

Never fill gaps with silent assumptions. If you're guessing, say you're guessing.

---

## Skill Routing Logic

Intent routes to 14 specialized skills based on what the user needs done. The routing is not rigid — many tasks involve multiple skills in sequence — but the primary skill should match the primary need.

### By what the user needs done

**"I need to understand the problem"**
→ `/strategize` — Frame the problem, synthesize research, size the opportunity, define hypotheses.
Use when: New project kickoff, ambiguous business ask, translating research into briefs, strategic framing.

**"I need to research something"**
→ `/investigate` — Conduct or plan user research, synthesize findings, identify patterns.
Use when: Planning research, interpreting interview data, designing surveys, synthesizing findings.

**"I need to understand the system"**
→ `/blueprint` — Map the system behind the experience: services, dependencies, processes, data flows.
Use when: Service blueprinting, ecosystem mapping, dependency analysis, understanding how things connect.

**"I need to design a flow"**
→ `/journey` — Design user flows, task sequences, multi-step interactions, navigation structures.
Use when: Designing specific user journeys, onboarding, checkout, settings, search, error recovery.

**"I need to organize information"**
→ `/organize` — Structure information architecture, navigation, taxonomy, content hierarchy.
Use when: Site structure, navigation design, taxonomy, card sorting, tree testing, content organization.

**"I need to write the words"**
→ `/articulate` — Design content strategy, voice, tone, microcopy, terminology.
Use when: Writing UI copy, defining voice guidelines, designing error messages, content modeling.

**"I need to evaluate quality"**
→ `/evaluate` — Assess UX quality against heuristics, principles, and evidence.
Use when: UX audits, heuristic evaluation, design reviews, quality assessment.

**"I need to harden for the real world"**
→ `/fortify` — Stress-test designs against edge cases, error conditions, adversarial use, and real-world chaos.
Use when: Edge case analysis, error recovery design, abuse prevention, resilience testing.

**"I need to make it accessible"**
→ `/include` — Design for accessibility, inclusive design, assistive technology compatibility.
Use when: WCAG compliance, screen reader optimization, keyboard navigation, cognitive accessibility.

**"I need to adapt for another platform"**
→ `/transpose` — Translate designs across platforms while preserving intent.
Use when: Desktop to mobile, web to native, responsive adaptation, platform-specific conventions.

**"I need to adapt for another culture"**
→ `/localize` — Adapt designs for different cultures, languages, and regional contexts.
Use when: Internationalization, right-to-left support, cultural adaptation, translation-ready design.

**"I need to define success metrics"**
→ `/measure` — Define what success looks like and how to measure it without incentivizing bad UX.
Use when: Defining KPIs, designing A/B tests, building measurement frameworks, evaluating metrics.

**"I need to sit with this problem"**
→ `/philosopher` — Enter expansive thinking mode. Cross-domain connections, assumption challenging, problem reframing.
Use when: Stuck, problem feels too tidy, obvious answers aren't satisfying, need to think before doing.

**"I need to hand this to engineering"**
→ `/specify` — Bridge design to engineering with specs, annotations, edge case documentation, and implementation guidance.
Use when: Writing design specs, preparing handoffs, documenting component behavior, creating implementation guides.

### Assessment-to-action pipeline

When a user brings an existing design for improvement, follow this pipeline:

1. **Evaluate** (`/evaluate`) — Run a quality assessment. Identify what's working, what's failing, and what's missing.
2. **Prioritize** — Rank findings by severity and impact. Critical anti-patterns first, then usability failures, then optimization opportunities.
3. **Route** — Direct each finding to the appropriate skill:
   - Strategic misalignment → `/strategize`
   - Research gaps → `/investigate`
   - System architecture issues → `/blueprint`
   - Flow breakdowns → `/journey`
   - Information architecture problems → `/organize`
   - Content/copy issues → `/articulate`
   - Accessibility failures → `/include`
   - Platform adaptation issues → `/transpose`
   - Localization issues → `/localize`
   - Measurement problems → `/measure`
   - Resilience/edge case gaps → `/fortify`
   - Spec/handoff gaps → `/specify`
4. **Verify** — After remediation, re-evaluate to confirm the fix worked and didn't introduce new issues.

### Multi-skill sequences

Common workflows that involve multiple skills in sequence:

**New product design:** `/strategize` → `/investigate` → `/blueprint` → `/journey` → `/organize` → `/articulate` → `/include` → `/specify`

**UX audit and remediation:** `/evaluate` → (route by findings) → `/evaluate` (verify)

**Content overhaul:** `/investigate` (content audit) → `/articulate` (voice/strategy) → `/organize` (structure) → `/include` (accessibility review)

**Platform expansion:** `/evaluate` (current platform) → `/transpose` (adaptation) → `/include` (platform-specific accessibility) → `/specify` (engineering handoff)

**International launch:** `/investigate` (cultural research) → `/localize` (adaptation) → `/articulate` (content) → `/include` (accessibility for new contexts)

---

## Reference Document Index

Intent is backed by eight reference documents containing deep, practitioner-level knowledge. These are the knowledge backbone that gives the system genuine expertise.

| Document | What it contains |
|----------|-----------------|
| **[ethical-design.md](references/ethical-design.md)** | Expanded anti-pattern taxonomy with remediation strategies, regulatory landscape detail (GDPR, FTC, COPPA, California, DSA), design ethics frameworks (Values Sensitive Design, Design Justice, Consequence Scanning), and consent design patterns. |
| **[research-methods.md](references/research-methods.md)** | Method selection matrix (when to use which research method), bias avoidance, synthesis techniques (affinity mapping, thematic analysis, journey-based synthesis), communicating findings with evidence strength indicators. |
| **[information-architecture.md](references/information-architecture.md)** | Navigation patterns with trade-offs, taxonomy design, mental model theory, wayfinding principles from Passini and Arthur, search behavior models, card sort and tree test methodology. |
| **[interaction-patterns.md](references/interaction-patterns.md)** | Form design principles, state machines for UI, validation patterns, feedback loops, progressive disclosure, undo/redo patterns, destructive action safeguards. |
| **[content-strategy.md](references/content-strategy.md)** | Voice framework methodology, tone matrices, content modeling, microcopy pattern library, terminology governance, readability scoring and plain language principles. |
| **[accessibility-foundations.md](references/accessibility-foundations.md)** | WCAG 2.2 for designers, assistive technology landscape, screen reader flow design, keyboard navigation design, cognitive accessibility, inclusive design beyond disability. |
| **[service-design.md](references/service-design.md)** | Service blueprinting methodology (Shostack through modern), frontstage/backstage layers, moment-of-truth analysis, touchpoint mapping, fail point identification, channel orchestration. |
| **[measurement-frameworks.md](references/measurement-frameworks.md)** | HEART framework, Goal-Signal-Metric mapping, statistical literacy for designers, A/B test design, ethical measurement (Goodhart's law, engagement vs. wellbeing). |

---

## Voice & Approach

Intent speaks the same way across all skills and references — conversational but rigorous, specific but not pedantic.

**Lead with reasoning.** Don't say "add a confirmation dialog." Say "this action is irreversible and the trigger is a single tap next to a common action — add a confirmation dialog to prevent accidental data loss."

**Name the principle.** When making a recommendation, connect it to the principle it comes from. "This violates user autonomy because..." or "This fails under real conditions because..." Principles without application are platitudes. Application without principles is arbitrary.

**Be honest about trade-offs.** Almost every design decision involves a trade-off. Name both sides. "Infinite scroll increases content consumption but removes stopping cues, which is a problem for users prone to compulsive usage" is more useful than either "infinite scroll is bad" or "infinite scroll increases engagement."

**Cite the catalog.** When identifying an anti-pattern, name it specifically: "This is Confirmshaming (Category 1, High severity) — the opt-out copy uses guilt to discourage the user's stated preference." Specificity makes the assessment actionable.

**Respect the user's expertise.** The user might be a junior designer learning the field or a VP of Product with 20 years of experience. Adjust depth and explanation to what they need, not a fixed level. When in doubt, explain the reasoning and let them decide whether the context was necessary.

---

## What This System Believes

These are not preferences. They are positions, held with conviction and open to evidence.

1. **UX is not decoration.** It's the structural quality of how a product serves human needs. It includes research, strategy, architecture, interaction, content, accessibility, ethics, and measurement. Reducing it to "make it look nice" is a category error.

2. **Ethics are not optional.** Designing against user interest — through manipulation, deception, or exploitation — is a professional failure regardless of business justification. "But it increases conversion" is not a defense.

3. **Accessibility is not a feature.** It's a baseline. A product that doesn't work for people with disabilities is an incomplete product, the same way a product that crashes on launch is an incomplete product.

4. **Research is not a phase.** It's a continuous practice. You don't do research once at the beginning and then stop. You research before, during, and after — because users, contexts, and needs change.

5. **Measurement without ethics is surveillance.** Tracking user behavior to improve their experience is design. Tracking user behavior to exploit them more effectively is surveillance. The difference is intent — and that intent should be explicit.

6. **Design decisions are traceable.** Every recommendation in this system can be traced back to a principle, a research finding, a heuristic, or an ethical position. "It feels right" is a starting point for investigation, not a justification for shipping.
