# Intent — Design with Reason

Intent is a UX design strategy system made of six specialized agents. Each is a self-contained system prompt you paste into a Claude Project (or similar). Together they cover the full arc of design work — from framing the problem to handing off the spec.

The core thesis: every design decision should have a reason, and that reason should be visible at every layer.

---

## The agents

| Agent | File | Use when... |
|-------|------|-------------|
| **Noor** (Entry Point) | `noor.md` | Starting a project, setting context, routing to specialists |
| **Ember** (Strategy + Research) | `ember.md` | Problem is unclear, need to frame the challenge, synthesize research |
| **Wren** (Experience Design) | `wren.md` | Designing flows, organizing information, writing interface copy |
| **Vigil** (Quality + Resilience) | `vigil.md` | Evaluating quality, hardening for edge cases, ensuring accessibility |
| **Rune** (Handoff) | `rune.md` | Ready to hand off to engineering |
| **Sage** (Philosopher) | `sage.md` | Stuck, need to brainstorm, problem feels underexplored |

---

## How to deploy

### Option 1: Claude Projects (recommended)

1. Create a new Claude Project
2. Copy the contents of the relevant agent file into the Project's custom instructions
3. Add your project context — briefs, research, system documentation, constraints
4. Start working. Claude will operate as that specialized agent.

**Tip:** For most projects, start with Noor. She will help you establish context and point you to the right specialist.

### Option 2: Direct prompting

Paste the agent instructions at the start of a conversation:

```
[Paste contents of noor.md]

---

Now, here's my project: [describe your project]
```

This works for quick sessions where you do not need a full Project setup.

### Option 3: Chained workflow

For complex projects, use agents in sequence. Each agent's output becomes the next agent's input.

1. **Noor** — Establish project context (users, product, constraints, ethical stance)
2. **Ember** — Frame the problem, synthesize research, define scope
3. **Wren** — Design flows, structure information, write the interface copy
4. **Vigil** — Evaluate the design, harden for edge cases, check accessibility
5. **Rune** — Write engineering specs and handoff documentation

Start a new Project (or conversation) for each agent. Carry the prior agent's output forward as context.

**Sage** is not a sequential step. She is available at any point when the team needs to step back and think before moving forward.

---

## Quick decision tree

```
START: I have a design challenge

├── "I don't know what problem we're solving"
│   └── Ember
│      Frames problems, synthesizes research, defines scope
│
├── "I need to design the experience"
│   └── Wren
│      Flows, navigation, information architecture, interface copy
│
├── "Is this actually good? Does it work for everyone?"
│   └── Vigil
│      Evaluates quality, hardens for real conditions, ensures access
│
├── "Ready for engineering"
│   └── Rune
│      Specs, annotations, edge case documentation, handoff packages
│
├── "I'm stuck / brainstorm / what am I missing?"
│   └── Sage
│      Sits with problems, expands thinking, challenges assumptions
│
└── "I need to set up the project context"
    └── Noor
       Orients, gathers context, holds principles, routes to specialists
```

**Note:** Sage is a cross-cutting cognitive mode, not a sequential phase. Any agent can benefit from Sage's expansive thinking when the problem needs more exploration before the next move. You can also use Sage standalone for pure brainstorming.

---

## Project lifecycle examples

### Small project (2-4 weeks)

**Noor --> Ember --> Wren --> Rune**

- Noor: Establish context — users, constraints, ethical stance
- Ember: Quick 2-page brief with problem framing and scope
- Wren: Design the flow, write the copy
- Rune: Write the spec
- Sage: Available at any point if the team gets stuck or the framing feels shallow

### Medium project (6-12 weeks)

**Noor --> Ember --> Wren --> Vigil --> Rune**

- Noor: Full context gathering, including competitive landscape
- Ember: Complete brief with research synthesis, hypothesis, five foundational questions
- Wren: User flows across devices, information architecture, content strategy
- Vigil: Heuristic evaluation, accessibility audit, edge case hardening
- Rune: Comprehensive specs with test plans
- Sage: Enter from any agent when exploration is needed — when the brief feels too tidy or the direction is not clicking

### Large project (12-26 weeks)

**All agents with iteration loops**

- Noor: Context document that becomes the project's source of truth
- Ember: Brief, hypothesis, market analysis, five foundational questions
- Wren: Flows across all devices and audience contexts, full IA, content strategy
- Vigil: Quality evaluation, resilience testing, accessibility audit, anti-pattern scan
- Rune: Full specs, test plans, handoff packages
- Sage: Use at project kickoff, at phase transitions, or whenever the team senses the problem is being solved too quickly
- Loop back to Ember if testing reveals new insights

---

## What each agent produces

### Noor (Entry Point)
- Project context documents
- Anti-pattern flags with severity and regulatory notes
- Routing recommendations to specialists
- Principle-grounded framing of design decisions

### Ember (Strategy + Research)
- Design briefs (3-5 pages)
- Research synthesis documents (5-10 pages)
- Opportunity assessments with quantified impact
- Hypothesis statements for A/B tests
- Five foundational questions assessments
- Project scoping documents (will do / will not do)

### Wren (Experience Design)
- Screen-by-screen user flows
- Device-specific variants (mobile, web, TV)
- Information architecture and navigation structures
- Content strategy and voice guidelines
- Copy specifications and microcopy
- Interaction specs with state documentation

### Vigil (Quality + Resilience)
- UX health scores (0-100) with heuristic breakdowns
- Anti-pattern verdicts with regulatory context
- Cognitive walkthrough results (per-task, per-step)
- Edge case and error recovery documentation
- Accessibility audits against WCAG
- Prioritized remediation roadmaps

### Rune (Handoff)
- Engineering specifications with interaction logic
- Edge case documentation
- Asset inventories and component annotations
- Test plans with audience criteria and success metrics
- Stakeholder presentations translating design decisions
- Cross-functional ownership documentation

### Sage (Philosopher)
- Reframed problem statements
- Surfaced assumptions the team did not know it was making
- Cross-domain connections and structural analogies
- Open questions that change the direction of inquiry
- Synthesized insights translated back into the active agent's language

---

## Shared principles

Every agent in the Intent system follows these:

1. **Evidence-grounded.** Every decision cites evidence or explicitly flags assumptions.
2. **Problem-first.** Frame the problem before proposing solutions.
3. **Transparent gaps.** Always surface what you do not know. Include "Pending Questions" sections.
4. **Ecosystem thinking.** Design for the full context — not just the screen in front of the user.
5. **Document the "no."** Explain what was chosen against, and why.

And the six core UX principles that Noor holds:

- Respect user autonomy
- Design for real conditions
- Make intent visible
- Evidence over intuition
- Systems over screens
- Ethical defaults

---

## Tips for best results

### Be specific about context

Instead of: "Design a signup flow"

Try: "Design a signup flow for users arriving from a partner referral on mobile. They may not know they have access. The goal is 80% activation within 7 days."

Context changes everything. The more specific you are about users, constraints, and goals, the more useful the agent's output becomes.

### Provide existing materials

Upload relevant files to your Project:

- Prior research or briefs
- Existing system documentation
- Competitive examples
- Technical constraints documents
- Brand voice or design system guidelines

### Ask for the right output format

Each agent has a default output structure. You can also ask:

- "Give me a condensed 1-page version"
- "Expand the edge cases section"
- "Format this as a stakeholder presentation outline"
- "Just give me the priority issues, skip the full audit"

### Use agents to cross-review

- Have Vigil review Wren's flows for quality and accessibility
- Have Ember review Rune's specs for strategic alignment
- Have Vigil check Ember's brief for assumption gaps
- Have Sage question any agent's framing when it feels too tidy

---

## Files in this package

```
noor.md     — Entry point. Context, principles, anti-patterns, routing.
ember.md    — Strategy and research. Problem framing, briefs, synthesis.
wren.md     — Experience design. Flows, IA, content, interaction.
vigil.md    — Quality and resilience. Evaluation, hardening, accessibility.
rune.md     — Handoff. Engineering specs, documentation, test plans.
sage.md     — Philosopher. Expansive thinking, assumption challenging.
HOW-TO-USE.md — This file.
```

---

*Intent is a design reasoning system. It does not replace your judgment — it makes the reasoning behind your judgment visible, testable, and traceable. Design with reason.*
