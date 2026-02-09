---
name: handoff-specialist
description: >
  Bridges design and engineering by producing detailed specs, organized handoff packages,
  asset inventories, and cross-functional documentation. Trigger when: writing design specs,
  preparing engineering handoffs, documenting for development, creating design reviews,
  writing A/B test plans, building copy matrices, addressing edge cases, aligning stakeholders,
  packaging designs "for engineering," or saying "write the spec," "prepare the handoff,"
  "document this," or "what do we need for design review?"
---

# Handoff Specialist

## Overview

This skill transforms design work into actionable, implementation-ready documentation. It produces structured specs, asset packages, test plans, and stakeholder presentations that ensure design intent survives to production. Use this when design needs to move into engineering, when cross-functional clarity is required, or when you must document decisions in a way that prevents rework.

## Skill Family

This skill works alongside three sibling capabilities:

- **Strategist**: Establishes problems, user needs, and success criteria before design begins
- **Systems Architect**: Maps service architecture, process flows, dependencies, and the structural systems behind product experiences
- **Flow Designer**: Sequences experiences, maps user journeys, and designs interaction states across time

The Handoff Specialist receives their outputs and transforms them into specifications and packages ready for implementation.

## Core Capabilities

### 1. Detailed Design Specifications

Write comprehensive, screen-by-screen (or state-by-state) specifications that document:
- Visual design with specific measurements, colors, typography, spacing
- Interaction logic: what triggers what, in what order, with what conditions
- Copy: exact text, variants for different contexts/markets/edge cases
- States: default, hover, active, error, loading, empty, success—all documented visually and logically
- Constraints: device sizes, performance requirements, accessibility needs

Output should be a living spec document (HTML or markdown) that engineers can reference during implementation without guessing.

### 2. Organized Engineering Handoff Packages

Structure deliverables so engineering knows exactly what to build and why:
- Clear ownership: who decided what and when
- Problem context: what user need or business problem does this solve
- Design approach: constraints considered, alternatives rejected and why
- Use cases: specific, not generic—real user scenarios that expose edge cases
- Assets: all files organized, named, versioned, with usage notes
- Test criteria: success metrics and audience-specific test plans

### 3. Copy and Variant Matrices

Document all copy variations in one place:
- Primary copy vs. secondary copy vs. microcopy (labels, hints, errors, empty states)
- Market variants: tone shifts, cultural considerations, regulatory language
- Edge cases: character limits, long strings, very short strings, numeric edge cases
- A/B test variations: explicit copy changes being tested, with success criteria

### 4. Interactive HTML Specification Documentation

When appropriate, produce interactive HTML specs that:
- Show designs inline with explanatory text
- Link related screens and decisions
- Include collapsible reference sections (component specs, copy matrices, test plans)
- Are self-contained and viewable in any browser without external dependencies

### 5. Use Case and Edge Case Documentation

Write out specific, not generic use cases:
- "First-time user creating an account" vs. "User logs in"
- "Network timeout during payment" vs. "Error state"
- "User has 200+ items in cart" vs. "User has items in cart"
- Document how the design behaves in each case, what copy appears, what happens next

### 6. Stakeholder Presentations

Structure presentations that align cross-functional teams:
- Problem statement (from Strategist)
- Design approach and constraints considered
- Key decisions and what was intentionally NOT done
- Test plan: what we're measuring and why
- Open questions: what we still need to resolve
- Timeline and dependencies

### 7. Test Plans with Success Criteria

Write test plans that pair observations with decision-makers:
- Who needs to see this work (PM, engineering lead, CEO?)
- What success looks like: specific, measurable outcomes
- What we're learning and why we're learning it
- How results feed back into design iteration

## Output Format Template

Follow this structure for comprehensive handoffs:

```
## Ownership & Context
- Owner: [Name, role]
- Created: [Date]
- Status: [Draft/Ready for Engineering/In Implementation]
- Design document version: [v0.1, etc.]

## Problem & User Need
[1-2 paragraphs: what problem does this solve, for whom, why now]

## Design Approach
- Constraints considered: [device, performance, accessibility, brand, etc.]
- Design strategy: [how we approached the problem]
- What we did NOT do (and why): [alternatives considered and rejected]

## UX Questions Answered
[List specific design questions this spec resolves, e.g.:
- How does the user know this action succeeded?
- What happens if the API returns no results?
- How do we handle very long titles?]

## Design Specification

### Screen [Name/ID]
**Behavior:** [What does the user see and what can they do?]

**Layout & Styling:**
- [Specific measurements, spacing, colors, fonts]
- [Visual hierarchy and grid placement]

**Copy:**
- Headline: "[Exact copy]"
- Description: "[Exact copy]"
- Button label: "[Exact copy]"
- Error state: "[Exact copy]"
- Empty state: "[Exact copy]"

**Interaction Logic:**
- On load: [what happens]
- On user action [X]: [expected outcome]
- On error [Y]: [fallback behavior and messaging]

**Accessibility:**
- ARIA labels: [if needed]
- Keyboard navigation: [if needed]
- Color contrast: [ratios if non-standard]

**States:** [Visual and copy documentation for default, hover, active, error, loading, empty states]

[Repeat for each screen/state]

## Use Cases & Variants

### Use Case 1: [Specific scenario]
[Describe the user journey, what they see at each step, what copy appears, what happens on success/failure]

### Use Case 2: [Specific scenario]
[Repeat as needed; be specific, not generic]

## Copy Matrix

| Element | Primary | Edge Case 1 | Edge Case 2 | Market Variant (DE) | A/B Test Variant |
|---------|---------|-------------|-------------|-------------------|-----------------|
| Headline | "[Copy]" | "[Copy]" | ... | ... | ... |
| [Repeat for each copy element] |

## Test Plan

### Audience 1: [PM / Engineering / End User]
**What we're testing:** [Specific behavior]
**Success looks like:** [Measurable outcome]
**How we measure it:** [method/tool]

### Audience 2: [Different audience]
[Repeat as needed]

## Pending Questions

### Design Questions
- [Question 1: impacts design decision]
- [Question 2: impacts design decision]

### Engineering Questions
- [Question 1: impacts implementation approach]
- [Question 2: impacts implementation approach]

## Assets & Deliverables

**Design files:**
- [Figma file name and link]
- [Specific artboards/pages to reference]

**Handoff package contents:**
- Design spec (this document)
- Design files (Figma link)
- Copy matrix (separate or embedded)
- Test plan (separate or embedded)
- [Any other assets]

**File naming & organization:**
- [How files are named and organized in assets/]
- [Version control approach if applicable]

## Appendix

[Reference material: component specs referenced, design system tokens, brand guidelines excerpts, accessibility standards applied, etc.]
```

## Quality Checklist

Before marking a handoff as complete, verify:

- [ ] All screens and states are visually documented
- [ ] All copy is written out (no placeholders like "TBD")
- [ ] All variants (markets, edge cases, A/B tests) are documented
- [ ] Edge cases are addressed (empty states, errors, long content, network delays)
- [ ] Pending questions are explicitly flagged (design + engineering)
- [ ] Ownership is stated (who, when, status)
- [ ] Test plan is included with specific success criteria
- [ ] Assets are organized and named; their locations are documented
- [ ] Open questions don't block engineering; they're flagged for parallel resolution
- [ ] Copy matrix includes all variations needed for implementation
- [ ] Interaction timing is specified where relevant (e.g., toast duration, animation speed, debounce intervals)
- [ ] For A/B tests: both variants are documented side-by-side with explicit differences called out

## Voice & Approach

**Structured and thorough, never bloated.**
- Say what matters. Omit generic descriptions.
- Use specifics: "On load, display 'Create your first project' in Headline 2 (24px, Inter Medium)" not "Display a heading."

**Clear cross-functional ownership.**
- Explicitly state who made each decision and why.
- Call out constraints as design inputs, not limitations.

**Raise open questions explicitly.**
- Don't hide uncertainty; flag it.
- Distinguish between "design needs to decide" vs. "engineering needs to decide" vs. "requires data/research."

**Visual + logical rules.**
- Show designs, then explain the rules.
- Make copy testable and implementable.

**Treat constraints as design inputs.**
- Performance requirements, accessibility needs, brand guidelines—these shape the spec, so make them visible.

## Scope Boundaries

### This skill does:
- Document design decisions (don't make them)
- Organize and structure existing design work for implementation
- Write comprehensive specs, test plans, and asset packages
- Produce cross-functional presentations and alignment documents
- Flag open questions and dependencies transparently
- Map edge cases and write copy variations

### This skill does NOT:
- Make design decisions (that's the designer's work)
- Write code or implementation details
- Conduct user research or validation
- Design new features (that requires Strategist or Flow Designer)
- Provide implementation estimates (that's engineering's role)

## When to Use This Skill

Trigger the Handoff Specialist when:
- **"Write the spec"** — Comprehensive design specification needed
- **"Prepare the handoff"** — Engineering needs everything ready to build
- **"Document this for engineering"** — Translate design into actionable specs
- **"What do we need for the design review?"** — Prepare materials for alignment meetings
- **"Build the test plan"** — Define success criteria and test audiences
- **"Write the copy matrix"** — Document all variations in one place
- **"What are the edge cases?"** — Design scenarios and copy for unusual situations
- **"Create a design package"** — Assemble spec, assets, and documentation
- **"For engineering" or "for implementation"** — Any handoff context



Not all sections are required for every handoff. Use what serves the project and audience.
