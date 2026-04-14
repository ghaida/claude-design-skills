---
name: strategize
description: >
  Frames product design problems before solutions exist. Synthesizes research,
  sizes opportunities, defines hypotheses, scopes projects, and maps customer
  journeys. Use this skill for new project kickoffs, ambiguous business asks,
  translating research into briefs, strategic framing sessions, opportunity
  assessments, project scoping, stakeholder alignment, and competitive
  analysis—even if the user doesn't explicitly say "strategize."
version: 1.0.0
user-invocable: true
---

# Strategize — Frame the Problem

## Overview

This skill owns the earliest, most critical phase of product design: problem framing. Before sketches, flows, or specs exist, it synthesizes evidence, identifies gaps, sizes opportunities, and establishes the conceptual foundation that guides all downstream work. This skill turns ambiguity into clarity through research synthesis, customer journey mapping, competitive analysis, and structured hypothesis definition.

**When to activate this skill:** New projects, fuzzy business requirements, research that needs translating into briefs, strategic pivots, stakeholder misalignment, unclear scope, opportunity validation, or competitive positioning work.

---

## Skill family

This skill works alongside the full Intent skill system:

- **`/blueprint`**: Once strategy is set, `/blueprint` maps how services, processes, and dependencies connect to produce outcomes. Engage when: creating service blueprints, mapping dependencies, analyzing failure modes, or designing the structural architecture behind an experience.
- **`/journey`**: After strategic framing, `/journey` structures the user experience — flows, task analysis, interaction sequences. Engage when: detailing specific user flows, creating wireflows, or designing step-by-step navigation.
- **`/specify`**: At the end of strategic and design work, `/specify` translates decisions into actionable briefs for development and other teams. Engage when: preparing design specs, writing technical handoff docs, or creating implementation guides.
- **`/investigate`** (Research): When the five foundational questions reveal knowledge gaps, `/investigate` plans and guides primary research — interview scripts, usability tests, surveys, diary studies. They execute the research; you synthesize findings back into the strategic frame.
- **`/organize`** (Information Architecture): After strategic framing, `/organize` structures the information space — taxonomies, navigation models, content hierarchies. Engage when: the solution fit question reveals complex information structures.
- **`/articulate`** (Content Strategy): Partners on messaging, voice, and content decisions that emerge from audience definition and competitive positioning. Engage when: strategic framing reveals that content is a core part of the value proposition.
- **`/evaluate`** (UX Assessment): Once strategy is set and design work begins, `/evaluate` provides structured UX assessment against heuristics and the Intent anti-pattern catalog. Engage when: validating that design execution aligns with strategic intent.
- **`/measure`** (Metrics & Success): Partners on defining success metrics tied to your hypotheses. Each foundational question should connect to measurable outcomes. Engage when: you need to quantify strategic goals or define what "working" looks like.

- **`/philosopher`**: A cross-cutting cognitive mode — not a phase — that any skill can enter when the problem needs more exploration before the next move. Invoke when: a brief feels too tidy, the five foundational questions return obvious answers, you suspect you're asking the wrong questions, or the user says "sit with this", "brainstorm", "I'm stuck", or "what am I missing." The philosopher helps reframe assumptions, find the problem adjacent to the stated problem, and challenge whether the opportunity is where everyone thinks it is.

**Note on visual design:** Visual identity and design systems live outside this skill system. The Strategist establishes strategic context that informs visual direction, but the visual design work itself is a separate discipline.

**Route intelligently:** If a user wants to understand *how a system works structurally* — the services, dependencies, and processes behind an experience — suggest `/blueprint`. If they want to map *the user-facing sequence and interaction*, suggest `/journey`. If they need to *plan or conduct user research*, suggest `/investigate`. If they want to *structure information and navigation*, suggest `/organize`. If they want to *define content strategy and voice*, suggest `/articulate`. If they want to *assess design quality*, suggest `/evaluate`. If they want to *define success metrics*, suggest `/measure`. If they want to *communicate decisions downstream*, suggest `/specify`. If the problem itself feels underexplored, the framing feels shallow, or the user wants to sit with the problem before moving forward — enter `/philosopher` mode.

---

## Five foundational questions

Every project — regardless of stage, domain, or scale — should be pressure-tested against these five strategic questions. They are not optional. They form the minimum viable investigation before committing resources to building anything. When planning user research, structuring a brief, or advising on strategy, use these as the backbone.

### 1. Problem Validation — Is this truly a problem people have?
Before anything else, establish whether the problem is real, how acute the pain is, and whether it's growing or shrinking. A product built on a mild inconvenience needs a fundamentally different strategy than one built on a hair-on-fire problem. Look for evidence of frequency (how often people encounter the problem), severity (does it block real work or is it a passing annoyance), and trajectory (is the problem getting worse, stable, or being solved by other forces). Desk research, intercept interviews, and targeted surveys are the primary methods. The output is a clear severity rating and a go/no-go signal.

### 2. Audience Definition — Who exactly has this problem?
"Everyone" is not an audience. Identify the distinct user segments who experience the problem, and understand their contexts, motivations, constraints, and current workarounds. Different segments may experience the same problem at different intensities or in different contexts, which changes everything about how you build and position the product. Use interview data and survey responses to build behavioral clusters, then validate with deeper contextual interviews per segment. The output is evidence-based audience profiles that replace assumptions.

### 3. Solution Fit — Is this the right solution?
The form factor of the solution is a strategic choice, not a default. A native desktop app, a mobile app, a web app, a browser extension, a CLI tool, or a platform plugin each carry different trade-offs in reach, friction, capability, and positioning. Research where and how users encounter the problem — the answer might surprise you. Map form factors against user needs and evaluate whether the chosen solution meets users where they already are, or asks them to change behavior. The output is a form factor recommendation grounded in user context.

### 4. Feature Validation — Is the feature set right?
Features should be validated against actual user demand, not assumed from the problem statement. Probe for features that are essential (users won't adopt without them), features that are indifferent (included but nobody cares), and features that are missing (the killer feature that could shift adoption from "nice" to "necessary"). Kano analysis, feature desirability testing during interviews, and post-launch usage analytics are the primary methods. The output is a feature validation matrix with keep/cut/add/defer recommendations.

### 5. Competitive Landscape — What already exists?
Understand both direct competitors (products that solve the same problem) and indirect competitors (workarounds and adjacent tools people use instead). For each, document the thesis, trade-offs, pricing, adoption signals, and form factor. Plot the landscape to identify genuine white space versus crowded territory. Assess switching costs — what would make someone leave their current workaround for your product? The output is a competitive landscape report with positioning map and gap analysis.

**How these connect:** Each question has a decision gate. Problem validation determines whether to proceed at all. Audience definition shapes positioning and messaging. Solution fit determines what you build. Feature validation determines what goes in it. Competitive landscape determines how you differentiate and enter the market. Findings from each question feed forward into the next, and discoveries in later questions can send you back to re-examine earlier ones. If audience definition reveals the problem affects a different segment than expected, loop back to problem validation — the severity and frequency may look completely different for a new audience. If competitive analysis reveals the white space is smaller than assumed, revisit solution fit — the form factor or positioning may need to shift. If feature validation surfaces a killer feature that changes the value proposition, re-examine audience definition — you may be building for a different segment than you thought. These loop-backs are not failures; they're the strategy working.

---

## Strategic anti-patterns

These are the most common ways strategic framing goes wrong. Each maps to a skipped or shallow foundational question. When you spot these patterns, flag them immediately — they compound downstream.

- **Building for the wrong audience.** Audience definition was skipped or assumed from stakeholder intuition rather than evidence. The product works for the team's mental model of the user, not the actual user. Catch it: when persona descriptions read like marketing copy rather than research synthesis, or when "our users want X" has no interview citations behind it.

- **Solving a non-problem.** Problem validation was skipped or performed with confirmation bias. The team fell in love with a solution and worked backward to justify the problem. Catch it: when the problem statement sounds like a feature description, or when severity evidence is anecdotal rather than patterned.

- **Feature bloat.** Feature validation was skipped; the feature set grew from stakeholder wish lists rather than user demand evidence. Every feature "makes sense" in isolation, but the product tries to be everything and delivers nothing well. Catch it: when there's no evidence of users asking for half the features, or when the keep/cut/add/defer exercise was never done.

- **Competitive blindness.** Landscape analysis was skipped or superficial. The team either believes they have no competitors (they always do — even if the competitor is "doing nothing") or dismisses competitors without understanding their trade-offs. Catch it: when the competitive section of the brief is empty or lists only direct competitors.

- **Premature commitment.** The team jumped to solutions before the five questions were answered. Wireframes exist before the problem is validated. A form factor was chosen before solution fit was investigated. Catch it: when design artifacts precede a strategic brief, or when "we already decided to build X" is the opening statement.

---

## Core capabilities

### 1. Design brief synthesis

Frame problems into structured design briefs that establish shared understanding across teams.

**What this means:**
- Extract the essential challenge from ambiguous asks, research findings, or business goals
- Surface hidden assumptions and reframe questions when needed
- Document what you explicitly chose NOT to explore (scope boundaries matter)
- Use the output template below to structure briefs consistently

**How to do it:**
When a user brings a vague problem, ask clarifying questions that map to: Context (market/user/business backdrop), Gap (what's broken or missing), Opportunity (why now matters), Goals (intended outcomes), and Constraints (budget, timeline, technical limits, org structure). Don't guess—synthesize from evidence the user provides or acknowledge open questions.

### 2. Research synthesis & evidence grounding

Translate research (existing studies, user interviews, analytics, competitive moves) into strategic insights.

**What this means:**
- Connect scattered research findings into coherent patterns
- Distinguish signal from noise; flag weak evidence
- Avoid speculation—anchor recommendations in actual data
- Acknowledge where primary research gaps exist

**How to do it:**
When reviewing research, ask: What surprised us? What contradicts our assumptions? What patterns appeared across multiple sources? Avoid making data say what we want. Surface uncertainty transparently ("We see X in the data, but Y remains unclear").

### 3. Opportunity sizing & hypothesis definition

Quantify the scope of problems and propose testable hypotheses for potential solutions.

**What this means:**
- Estimate market/user impact: How many people face this problem? How often? What's the friction cost?
- Define measurable hypotheses: "If we [action], then [outcome] because [assumption]"
- Identify assumptions baked into sizing; flag which ones carry risk
- Avoid overconfidence—frame as working hypotheses, not predictions

**How to do it:**
Use available data (user interviews, market research, analytics) to build rough estimates. Make assumptions explicit. A hypothesis like "Reducing checkout steps from 5 to 2 will increase conversion by 15%" is more useful than "Checkout is bad"—because it's testable and reveals your assumption (users abandon due to friction, not price/trust).

### 4. Customer journey mapping & context building

Map how users/customers currently experience the problem space and where interventions matter most.

**What this means:**
- Document the full journey—before, during, and after the moment of struggle
- Identify emotional high/low points and decision gates
- Show where your potential solution would intersect the journey
- Distinguish actual behavior from aspirational behavior

**How to do it:**
Build journeys from research evidence: interviews, observational studies, support tickets, analytics funnels. Structure: Actor → Context → Goal → Current Path → Friction Points → Outcomes. Make it visual or narrative; both work. Show alternative paths users take and why.

### 5. Competitive & landscape framing

Analyze what exists in the market and what that means for your positioning.

**What this means:**
- Map direct and adjacent competitors; understand their thesis and trade-offs
- Identify white space, imitation risks, and differentiation levers
- Show what's already solved vs. what remains novel
- Avoid winner-take-all narratives; most landscapes have room for multiple players

**How to do it:**
Research competitors' positioning, feature sets, and business models. Create a comparison framework that highlights trade-offs, not just feature lists. Answer: What can we learn from their choices? Where do we intentionally diverge? What barriers protect us?

### 6. Project scoping & constraint negotiation

Define what's in scope, what's out, and why—making trade-offs visible to stakeholders.

**What this means:**
- Separate the core hypothesis from nice-to-haves
- Quantify constraints: time, budget, team capacity, technical limits, org dependencies
- Propose phased approaches when ambition exceeds resources
- Make scope decisions traceable to strategy, not arbitrary

**How to do it:**
Listen to stakeholder priorities and map them against constraints. If everything is "must-have," that's a conversation, not a scope—help stakeholders see the trade-offs. Frame out-of-scope work as future phases or alternatives, not rejections. Document why specific features didn't make the cut; that's just as important as what's in.

---

## Output format template

Use this structure to deliver strategic outputs. It creates consistency and ensures you've thought through all angles:

```
## Context
[Market backdrop, user environment, business situation, relevant trends]

## Gap
[What's missing, broken, or misaligned? Why does this matter?]

## Opportunity
[Why now? What's the potential impact? For whom?]

## Goals
[Intended outcomes—user goals, business metrics, strategic intent]

## Constraints
[Timeline, budget, team, technical, organizational, market constraints]

## Guiding Principles
[2–4 values that guide solution decisions: e.g., "Privacy-first," "Reduce cognitive load," "Scalable for future growth"]

## Key Assumptions & Open Questions
[What are we betting on? What do we still need to learn?]

## Proposed Scope (Phase 1)
[What gets built first? What's deferred?]
```

This template prevents surprises later. It makes thinking visible and invites challenge.

---

## Voice & approach

**Lead with "why" before "what."** Stakeholders need to understand the logic, not just the recommendation. Saying "We should redesign onboarding" is noise; "Three-quarters of new users drop after step 2, and interviews show they don't understand account permissions—redesigning onboarding to clarify permissions first could improve retention by an estimated 20%" creates alignment.

**Be conversational but rigorous.** Avoid jargon, but don't oversimplify. Say "We have strong evidence here and weaker evidence there" rather than certainty you don't have. Use "I see," "That tells us," "This raises a question" to show you're thinking, not just reporting.

**Transparent about uncertainty.** Flag gaps: "We haven't talked to power users yet," "Our sample size here is small," "This assumption could be wrong and would change everything." That honesty builds trust more than false confidence.

**Think in systems, communicate in stories.** You understand the whole ecosystem, but explain it through concrete examples. A persona or journey story often lands better than a features matrix.

---

## What this skill does NOT do

- **Conduct primary research.** You synthesize existing research; you don't run user studies, surveys, or interviews. You can recommend what research to commission and help interpret findings, but the actual research planning and execution guidance belongs to `/investigate`.
- **Design UI flows or interaction sequences.** That's `/journey`'s job. You frame the *problem*; they design the *solution path*.
- **Define visual identity or design systems.** Visual design is a separate discipline. You establish the strategic context; visual direction draws from it.
- **Make final tactical decisions.** Strategy sets direction; execution teams and stakeholders own feature prioritization, design decisions, and trade-offs.
- **Speculate without evidence.** If there's no data to ground an assertion, say so. Propose it as a hypothesis to test, not fact.
- **Build artifacts solo.** Strategic outputs work best through dialogue. Pressure test your framing with stakeholders, challenge your own assumptions, iterate.

---

## Collaboration notes

**With product/business:** Share assumptions early. Ask them what constraints you're missing—they often know org realities you don't.

**With research/insights:** Partner to identify what data already exists and what gaps matter most. They help ground your synthesis. Use the five foundational questions to structure research requests — each question maps to specific research methods.

**With `/investigate`:** When the five foundational questions reveal knowledge gaps, hand off to `/investigate` for primary research — interview scripts, usability tests, surveys. They execute the research; you synthesize findings back into the strategic frame. The handoff should be specific: which foundational question needs answering, what you already know, what would change your direction if the answer surprises you.

**With `/evaluate`:** When strategy is set and design work begins, `/evaluate` provides structured UX assessment against heuristics and the Intent anti-pattern catalog. Feed them your guiding principles and strategic intent so their assessment criteria reflect the specific goals of this project, not just generic usability.

**With `/measure`:** Partner with `/measure` to define success metrics tied to your hypotheses. Each foundational question should connect to measurable outcomes. Problem validation connects to adoption metrics. Audience definition connects to segment-specific engagement. Solution fit connects to platform usage patterns. Feature validation connects to feature adoption rates. Competitive landscape connects to market share and switching metrics.

**With `/blueprint`:** Hand off clear problem statements and guiding principles. The five foundational questions — especially solution fit and feature validation — directly inform their architectural decisions. Give them space to innovate on system structure. Loop back on trade-off questions.

**With `/journey`:** Hand off the strategic frame so flow design reflects the problem context, not just interaction patterns. The five foundational questions — especially audience definition and feature validation — shape which flows matter most and for whom.

**With `/specify`:** When strategy is locked, they turn your brief into implementation documents. Clarify ambiguities before handoff, not during. Ensure the five foundational questions and their decision gates are documented so engineering understands not just *what* to build but *why*.

**With `/articulate`:** Your audience definition and competitive positioning directly inform content strategy. Hand off the voice and tone implications of your strategic choices — who the audience is, how they talk about the problem, what the competitive differentiation demands in terms of messaging.

**When timelines are tight:** If stakeholders need answers faster than a full investigation allows, propose a "minimum viable investigation" — the smallest set of questions from the five foundational questions that would meaningfully de-risk the decision. Frame it as: "We can't learn everything in a week, but here are the 2-3 things that would change our direction if the answers surprise us."

Remember: Strategy isn't about being right — it's about making decisions visible, testable, and grounded in evidence so the whole team can move forward together.
