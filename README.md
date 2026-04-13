# Design with Intent

A comprehensive UX and design strategy system for AI tools. 15 specialized skills and 6 named agents that cover the full product design practice — from early strategy and research through experience design, quality assurance, and engineering handoff.

Intent gives AI the context to approach design decisions with depth. Where visual design tools focus on how things look, Intent focuses on why they exist — research, strategy, systems thinking, flows, content, accessibility, ethics, and measurement.

## The agents

Six named agents, each a specialist you can deploy in Claude Projects or paste as custom instructions:

| Agent | Name | What it does |
|-------|------|-------------|
| Entry point | **Noor** | Orients the project, holds UX principles and the anti-pattern catalog, routes to specialists |
| Strategy + Research | **Ember** | Frames problems, demands evidence, refuses to build on assumptions |
| Experience Design | **Wren** | Shapes user flows, structures information, designs the words |
| Quality + Resilience | **Vigil** | Evaluates UX quality, hardens for edge cases, ensures accessibility |
| Handoff | **Rune** | Carries design intent faithfully into engineering specs |
| Philosopher | **Sage** | Sits with problems before solving them — a cognitive mode any agent can enter |

See `agents/HOW-TO-USE.md` for deployment options, decision trees, and project lifecycle examples.

## The skills

15 discipline-specific skills plus the Intent foundation, organized by what you need done:

### Intent (foundation)

- `intent/SKILL.md` — Core UX principles, the anti-pattern catalog (72+ named deceptive, addictive, and manipulative patterns with severity ratings and regulatory context), context-gathering protocol, and skill routing logic.
- `intent/references/` — 8 deep reference documents covering research methods, information architecture, interaction patterns, content strategy, accessibility, service design, measurement frameworks, and ethical design.

### Strategy & Research

- `strategize/SKILL.md` — Problem framing through the Five Foundational Questions (problem validation, audience definition, solution fit, feature validation, competitive landscape). Research synthesis, opportunity sizing, hypothesis definition, competitive analysis.
- `investigate/SKILL.md` — Primary research execution and synthesis. Interview guide construction, usability test planning, survey design, diary studies, card sorts, tree tests. Synthesis frameworks: affinity mapping, thematic analysis, insight statements with evidence strength indicators.
- `blueprint/SKILL.md` — Service blueprints, ecosystem maps, process architecture, dependency diagrams, system state and failure mode analysis, scalability planning.

### Experience Design

- `journey/SKILL.md` — End-to-end user flow design. Task analysis, decision points, entry-to-outcome paths, device-aware design, context variation handling, multi-channel journey mapping.
- `organize/SKILL.md` — Information architecture. Navigation patterns, taxonomy design, labeling systems, wayfinding, search and browse models, card sort and tree test methodology.
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

**Claude Code (plugin):**
```
/plugin marketplace add ghaida/claude-design-skills
```
Then open `/plugin` in Claude Code to install. Skills become available as `/intent:strategize`, `/intent:evaluate`, etc.

**Cursor:** Download the latest [Cursor release zip](https://github.com/ghaida/claude-design-skills/releases) and extract `.cursor/rules/` to your project root.

**VS Code Copilot:** Download the latest [Copilot release zip](https://github.com/ghaida/claude-design-skills/releases) and extract `.github/` to your project root.

**Claude Projects:** Download individual agent files from `agents/` and paste as project custom instructions.

**Manual (any platform):** Clone the repo and run `./build.sh` to generate distributions for all platforms.

## How to use

**In Claude Projects:** Upload an agent file as the project instruction. For deeper work, also upload the matching skill files as project knowledge. Start with Noor to orient, or go directly to the specialist you need.

**In Claude Code:** After installing the plugin, skills are available as slash commands — `/intent:strategize`, `/intent:journey`, `/intent:evaluate`, etc.

**Chaining agents:** For larger projects, run agents in sequence — Ember to frame the problem, Wren to design the experience, Vigil to ensure quality and accessibility, Rune to hand off to engineering. Sage can be entered from any agent when the problem needs more exploration.

**Quick decision tree:**

```
I have a design challenge
│
├─ "I don't know what problem we're solving"
│  └─ Ember (strategy + research)
│
├─ "I need to design the experience"
│  └─ Wren (flows + structure + content)
│
├─ "Does this actually work? For everyone?"
│  └─ Vigil (evaluation + resilience + accessibility)
│
├─ "Ready for engineering"
│  └─ Rune (specs + handoff)
│
├─ "I'm stuck / brainstorm / sit with this"
│  └─ Sage (philosopher)
│
└─ "I need to set up context for the project"
   └─ Noor (entry point)
```

## The anti-pattern catalog

Intent includes a catalog of 72+ named UX anti-patterns across 9 categories — deceptive patterns, default manipulation, urgency fabrication, addictive design, attention exploitation, weaponized accessibility, vulnerable user exploitation, AI-specific dark patterns, and common UX failures. Each pattern is named, described, and rated by severity. The catalog includes regulatory context (GDPR, FTC, COPPA, California ARL, EU Digital Services Act).

The catalog lives in the Intent master skill and is referenced by `/evaluate` for detection and `/specify` for ethical review before handoff.

## License

CC0 1.0 Universal — public domain.
