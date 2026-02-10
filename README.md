# Claude design skills

A collection of specialized agents and skills for Claude that cover the product design workflow — from early strategy through to engineering handoff.

## What's in here

### Agents (`/agents`)

Four role-based agent prompts, each focused on a distinct phase of the design process:

1. **Strategist** — Frames problems before solutions exist. Synthesizes research, writes design briefs, sizes opportunities, defines hypotheses, scopes projects, and maps customer journeys.
2. **Systems Architect** — Maps the structural machinery behind product experiences. Creates service blueprints, ecosystem maps, process architecture, and dependency diagrams. Analyzes how services, teams, tools, and data flows connect.
3. **Flow Designer** — Designs user-facing experiences end-to-end: task flows, onboarding, navigation, interactions, and device-specific adaptations. Also handles typography systems — typeface selection, hierarchy, and pairing.
4. **Handoff Specialist** — Bridges design and engineering. Produces detailed specs, organized handoff packages, copy matrices, A/B test plans, and stakeholder presentations to ensure design intent survives to production.

The `HOW-TO-USE.md` file in the agents folder explains how to activate them, when to use each one, and how to chain them together for small, medium, and large projects.

### Skills (`/skills`)

Each agent has a corresponding skill with detailed implementation guidance:

- `strategist/SKILL.md` — Brief synthesis, research synthesis, opportunity sizing, journey mapping, competitive framing, project scoping.
- `systems-architect/SKILL.md` — Service blueprinting, ecosystem mapping, process architecture, state and failure analysis, scalability planning.
- `flow-designer/SKILL.md` — Flow mapping, task analysis, copy specs, interaction specs, device-aware design, typography systems.
- `handoff-specialist/SKILL.md` — Design specifications, engineering packages, copy matrices, interactive HTML specs, use case documentation, test plans.

### Pre-packaged uploads (`/skills/for-upload-to-claude`)

Zipped versions of each skill, ready to upload directly to a Claude Project.

## How to use them

**In Claude Projects:** Upload the agent prompt as a project instruction and the matching skill zip from `for-upload-to-claude/` as project knowledge. See `agents/HOW-TO-USE.md` for the full walkthrough.

**In Claude Code / Cowork:** Drop the skill folders into your `.skills/skills/` directory, and they'll be available automatically.

**Chaining agents:** For larger projects, run them in sequence — Strategist first to frame the problem, Systems Architect to map the underlying structure, Flow Designer to design the user experience, and Handoff Specialist to package everything for engineering.
