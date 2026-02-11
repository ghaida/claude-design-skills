# Design agent team — how to use these skills

This package contains five specialized Claude Project instructions, each representing a distinct design discipline from a principal level product designer's practice.

## The five agents

| Agent | File | Use When... |
|-------|------|-------------|
| **The Strategist** | `agent-01-strategist.md` | Problem is unclear, need to frame the challenge |
| **The Systems Architect** | `agent-02-systems-architect.md` | Need to understand or redesign how a system works |
| **The Flow Designer** | `agent-03-flow-designer.md` | Designing user-facing experiences |
| **The Handoff Specialist** | `agent-04-handoff-specialist.md` | Ready to hand off to engineering |
| **The Creative Director** | `agent-05-creative-director.md` | Need to define visual direction, build a design system |

---

## How to deploy

### Option 1: Claude Projects (recommended)

1. Create a new Claude Project
2. Copy the contents of the relevant agent file into the Project's custom instructions
3. Add your project context, files, or briefs to the Project
4. Start working — Claude will operate as that specialized agent

### Option 2: direct prompting

Paste the agent instructions at the start of a conversation:

```
[Paste contents of agent-01-strategist.md]

---

Now, here's my project: [describe your project]
```

### Option 3: chained workflow

For complex projects, use agents in sequence:

1. Start a Project with Agent 01 → produce a design brief
2. Start a new Project with Agent 02 → use the brief as input, produce systems architecture
3. Start a new Project with Agent 03 → use both as input, produce user flows
4. Start a new Project with Agent 04 → use all prior work, produce engineering specs

---

## Quick decision tree

```
START: I have a design challenge

├─ "I don't know what problem we're solving"
│  └─ Use: AGENT 01 (Strategist)
│     Output: Design brief, hypothesis, research synthesis
│
├─ "I need to understand how this system actually works"
│  └─ Use: AGENT 02 (Systems Architect)
│     Output: Service blueprints, dependency maps, process architecture
│
├─ "I need to design a user-facing experience"
│  └─ Use: AGENT 03 (Flow Designer)
│     Output: Screen flows, copy specs, device variants
│
├─ "Design is done, I need to hand off to engineering"
│  └─ Use: AGENT 04 (Handoff Specialist)
│     Output: Design spec, test plan, stakeholder deck
│
└─ "How should this look? We need a visual direction / design system"
   └─ Use: AGENT 05 (Creative Director)
      Output: Moodboards, color systems, typography, Figma component library
```

---

## Project lifecycle examples

### Small project (2-4 weeks)
**Strategist → Flow Designer → Handoff**
- Agent 01: Quick 2-page brief
- Agent 03: Design the flow
- Agent 04: Write the spec

### Medium project (6-12 weeks)
**Strategist → Creative Director + Flow Designer → Handoff**
- Agent 01: Full brief + research synthesis
- Agent 05: Visual direction, color, typography, hierarchy (parallel with Agent 03)
- Agent 03: User flows across devices (parallel with Agent 05)
- Agent 04: Comprehensive specs

### Large project (12-26 weeks)
**All agents with iteration loops**
- Agent 01: Brief, hypothesis, market analysis
- Agent 02: Service blueprint, dependency analysis, scaling approach
- Agent 05: Moodboards, color system, type system, Figma design system
- Agent 03: Flows across all devices + audience contexts
- Agent 04: Full specs, test plans, stakeholder decks
- Loop back to Agent 01 if testing reveals new insights

---

## What each agent produces

### Agent 01: The Strategist
- Design briefs (3-5 pages)
- Research synthesis (5-10 pages)
- Opportunity assessments
- Hypothesis statements
- Project scoping documents

### Agent 02: The Systems Architect
- Service blueprints (frontstage/backstage/support)
- Ecosystem and dependency maps
- Process architecture diagrams
- Failure mode and state analysis
- Scalability and migration plans

### Agent 03: The Flow Designer
- Screen-by-screen user flows
- Device-specific variants
- Copy specifications
- Interaction specs
- Audience context variations

### Agent 04: The Handoff Specialist
- Engineering specifications
- A/B test plans
- Copy matrices
- Stakeholder presentations
- Edge case documentation

### Agent 05: The Creative Director
- Moodboards with named visual directions
- Color systems with WCAG compliance
- Typography systems with typeface pairings
- Visual hierarchy and spacing specifications
- Figma design system libraries (Atomic Design)

---

## Shared principles (all agents follow)

1. **Evidence-grounded** — Every decision cites evidence or flags assumptions
2. **Problem-first** — Frame the problem before proposing solutions
3. **Transparent gaps** — Always include "Pending Questions" sections
4. **Ecosystem thinking** — Design for the full context, not just one screen
5. **Scalability default** — Consider how this works at 10x scale
6. **Explicit ownership** — State who owns what in cross-functional work
7. **Document the "no"** — Explain what we chose NOT to do, and why

---

## Tips for best results

### Be specific about context
Instead of: "Design a signup flow"
Try: "Design a signup flow for users arriving from a partner referral on mobile. They may not know they have access. The goal is 80% activation within 7 days."

### Provide existing materials
Upload relevant files to your Project:
- Prior research or briefs
- Existing system documentation or service maps
- Competitive examples
- Technical constraints documents

### Ask for the right output format
Each agent has a default output structure. You can also ask:
- "Give me a condensed 1-page version"
- "Expand the edge cases section"
- "Add more detail on the test plan"
- "Format this as a stakeholder presentation outline"

### Use agents to review each other's work
- Have Agent 02 review Agent 03's flows for systems consistency
- Have Agent 04 review Agent 01's brief for spec-readiness
- Have Agent 01 review Agent 04's test plan for hypothesis clarity

---

## Files in this package

```
agent-01-strategist.md        — Strategy & research synthesis
agent-02-systems-architect.md — Systems architecture & service design
agent-03-flow-designer.md     — User flows & interaction
agent-04-handoff-specialist.md — Specs & documentation
agent-05-creative-director.md — Visual direction & design systems
HOW-TO-USE.md                 — This file
```

---

## Adapting for your practice

These agents are modeled on a specific design practice. To adapt:

1. **Audit your work** — Do these four roles capture what you do?
2. **Adjust voice** — Modify tone to match your team's style
3. **Update outputs** — Change output formats to match your deliverables
4. **Add examples** — Include examples from your own portfolio
5. **Test and refine** — Use on 2-3 projects, then iterate

---

*Based on verification of 31 portfolio projects, 180+ specification documents, and comprehensive analysis of design methodology.*
