# Design with Intent

A comprehensive UX and design strategy system for AI tools. 15 specialized skills and 6 named agents that cover the full product design practice — from early strategy and research through experience design, quality assurance, and engineering handoff.

Intent gives AI the context to approach design decisions with depth. Where visual design tools focus on how things look, Intent focuses on why they exist — research, strategy, systems thinking, flows, content, accessibility, ethics, and measurement.

## The agents

Six named agents, each combining multiple skills into a specialist persona:

| Domain | Agent | Skills it combines |
|--------|-------|--------------------|
| Entry point | **Noor** | `/intent` — orients the project, holds UX principles and the anti-pattern catalog, routes to specialists |
| Strategy + Research | **Ember** | `/strategize` + `/investigate` — frames problems, demands evidence, refuses to build on assumptions |
| Experience Design | **Wren** | `/journey` + `/organize` + `/articulate` — shapes user flows, structures information, designs the words |
| Quality + Resilience | **Vigil** | `/evaluate` + `/fortify` + `/include` — evaluates UX quality, hardens for edge cases, ensures accessibility |
| Adaptation + Measurement | **Rune** | `/transpose` + `/localize` + `/measure` — adapts across platforms and cultures, defines success metrics |
| Cross-cutting Wisdom | **Sage** | `/philosopher` + `/blueprint` + `/specify` — maps systems, sits with problems, bridges design to engineering |

For larger projects, chain agents in sequence: Ember to frame the problem, Wren to design the experience, Vigil to ensure quality and accessibility, Rune to hand off to engineering. Sage can be entered at any point when the problem needs more exploration.

## The skills

15 discipline-specific skills plus the Intent foundation, organized by what you need done:

### Intent (foundation)

- `intent/SKILL.md` — Core UX principles, the anti-pattern catalog (72+ named deceptive, addictive, and manipulative patterns with severity ratings and regulatory context), context-gathering protocol, and skill routing logic.
- `intent/references/` — 8 deep reference documents covering research methods, information architecture, interaction patterns, content strategy, accessibility, service design, measurement frameworks, and ethical design.

### Strategy & Research

- `strategize/SKILL.md` — Problem framing through the Five Foundational Questions (problem validation, audience definition, solution fit, feature validation, competitive landscape). Research synthesis, opportunity sizing, hypothesis definition, competitive analysis.
- `investigate/SKILL.md` — Primary research execution and synthesis. Interview guide construction, usability test planning, survey design, diary studies, card sorts, tree tests. Synthesis frameworks: affinity mapping, thematic analysis, insight statements with evidence strength indicators.
- `blueprint/SKILL.md` — Service blueprints, ecosystem maps, process architecture, dependency diagrams, system state and failure mode analysis, scalability planning. Offers visual companion output: rendered HTML diagrams, Pencil files, or structured specs for your design tool.

### Experience Design

- `journey/SKILL.md` — End-to-end user flow design. Task analysis, decision points, entry-to-outcome paths, device-aware design, context variation handling, multi-channel journey mapping. Offers visual companion output: rendered HTML flow diagrams, Pencil files, or structured specs for your design tool.
- `organize/SKILL.md` — Information architecture. Navigation patterns, taxonomy design, labeling systems, wayfinding, search and browse models, card sort and tree test methodology. Offers visual companion output: rendered HTML site maps and navigation mockups, Pencil files, or structured specs for your design tool.
- `articulate/SKILL.md` — UX writing and content strategy. Voice and tone frameworks, error message design, empty states, CTA hierarchy, microcopy patterns, content models, inclusive language.

### Quality & Evaluation

- `evaluate/SKILL.md` — Structured UX assessment. Heuristic evaluation (Nielsen's 10, scored), cognitive walkthroughs, anti-pattern detection, task success analysis. Routes findings to specific skills for resolution.
- `fortify/SKILL.md` — Edge cases and resilience. State inventory (9 states per screen), error recovery patterns, first-run experience design, stress testing, i18n readiness, timeout and latency handling.
- `include/SKILL.md` — Accessibility as a design discipline. WCAG 2.2 for designers, screen reader flow design, keyboard navigation, cognitive and motor accessibility, inclusive design beyond compliance, testing methodology.

### Adaptation & Context

- `transpose/SKILL.md` — Cross-platform UX adaptation. Context analysis, platform-specific conventions (iOS, Android, web, TV, kiosk, voice), content priority shifting, cross-device journey continuity.
- `localize/SKILL.md` — Cultural and linguistic adaptation. Cultural dimension analysis, RTL/LTR design, content expansion/contraction, visual and symbolic adaptation, market-specific compliance, localization testing.

### Measurement

- `measure/SKILL.md` — Success metrics and experimentation. HEART framework, Goal-Signal-Metric mapping, A/B test design, funnel analysis, qualitative-quantitative triangulation, ethical measurement.

### Cross-cutting

- `philosopher/SKILL.md` — Expansive brainstorming protocol. Three strict phases (problem immersion, associative expansion, synthesis only when invited). Intensity levels, structured check-ins, and integration with every other skill. A cognitive mode, not a phase.

### Handoff

- `specify/SKILL.md` — Design-to-engineering bridge. Detailed specs, copy matrices, interactive HTML documentation, use case and edge case documentation, stakeholder presentations, test plans with success criteria. Includes ethical review against the anti-pattern catalog.

## Install

**All platforms (Cursor, Claude Code, Codex CLI, and more):**
```
npx skills add ghaida/intent --all
```

**Claude Code plugin:**
```
/plugin marketplace add ghaida/intent
```
Then open `/plugin` in Claude Code to install.

**Manual download:** Grab the latest zip from [releases](https://github.com/ghaida/intent/releases/latest).

## How to use

**In Claude Code:** After installing the plugin, skills are available as slash commands — `/intent:strategize`, `/intent:journey`, `/intent:evaluate`, etc.

**Quick decision tree:**

```
I have a design challenge
│
├─ "I don't know what problem we're solving"
│  └─ /strategize
│
├─ "I need to design the experience"
│  └─ /journey + /organize + /articulate
│
├─ "Does this actually work? For everyone?"
│  └─ /evaluate + /fortify + /include
│
├─ "Ready for engineering"
│  └─ /specify
│
├─ "I'm stuck / brainstorm / sit with this"
│  └─ /philosopher
│
└─ "I need to set up context for the project"
   └─ /intent
```

## The anti-pattern catalog

Intent includes a catalog of 72+ named UX anti-patterns across 9 categories — deceptive patterns, default manipulation, urgency fabrication, addictive design, attention exploitation, weaponized accessibility, vulnerable user exploitation, AI-specific dark patterns, and common UX failures. Each pattern is named, described, and rated by severity. The catalog includes regulatory context (GDPR, FTC, COPPA, California ARL, EU Digital Services Act).

The catalog lives in the Intent master skill and is referenced by `/evaluate` for detection and `/specify` for ethical review before handoff.

## License

CC0 1.0 Universal — public domain.
