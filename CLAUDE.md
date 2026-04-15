# Intent

A comprehensive UX and design strategy system for AI tools. 15 specialized skills and 6 named agents covering the full product design practice.

Repo: https://github.com/ghaida/intent

## Current Status

Skills system complete (Phases 0-5). Website built and audited (Phase 7). Next: GitHub Pages deployment.

- **Project plan:** `project-plan.md` — full phase breakdown and progress
- **Website spec:** `design-docs/superpowers/specs/2026-04-13-website-design.md`
- **Website source:** `docs/` — Astro static site, 4 pages, mobile-first responsive, light/dark mode
- **Live site:** https://designwithintent.ai
- **Next:** Visual polish pass

## Build

```bash
./build.sh              # Generate platform distributions from source skills
./release.sh X.Y.Z      # Bump versions, rebuild, tag, push
cd docs && npm run dev   # Run website dev server
cd docs && npm run build # Build website for production
```

Source of truth: `skills/*/SKILL.md`. Generated distributions: `.claude/skills/`, `.cursor/rules/`, `.github/copilot/`.

## Website Architecture

Astro static site in `docs/`. Content parsed from repo markdown at build time.

- **CSS:** `src/css/global.css` — all styles, mobile-first, no inline CSS
- **JS:** `public/js/nav.js`, `public/js/pattern-filter.js` — no inline scripts
- **Content parsers:** `src/lib/skills.ts`, `src/lib/patterns.ts`, `src/lib/agents.ts`
- **Pages:** index (landing), skills (catalog), patterns (anti-pattern table), agents (roster + lifecycle)
- **Copy:** Philosophy and principles written by the project owner. Do not modify without explicit permission.

## Design Context

### Users
Designers and developers who use AI coding tools (Claude Code, Cursor, VS Code Copilot) and want to bring UX rigor to their design decisions. They are practitioners — not browsing casually, but evaluating whether Intent is worth installing. They value depth over flash, substance over marketing.

### Brand Personality
**Sharp, opinionated, confident.** Takes strong positions. Unapologetic depth. Feels like a senior designer's personal toolkit.

Tagline: **Design with Intent.**

### Aesthetic Direction
- **Tone:** Bold and minimal. Editorial quality, handcrafted feel. Distinctive typography, considered spacing, nothing decorative without purpose.
- **Theme:** Light and dark mode with toggle. Both equally intentional.
- **Color palette:** Deep Indigo — cool-tinted neutrals, indigo accent (#4338ca light / #7c6ff0 dark)
- **Fonts:** General Sans 700 (display), Hanken Grotesk (body)
- **Grid:** 4px base, 2px for fine details. Blueprint structural metaphor.
- **Anti-references:** No generic SaaS landing pages. No dense documentation wikis. No flashy parallax/3D. No empty minimalism.

### Design Principles
1. **Every element earns its place.** If it doesn't serve a purpose, remove it.
2. **The site IS the proof.** A UX design system's website must itself be impeccably designed.
3. **Depth on demand.** Surface philosophy and breadth first. Let users drill into detail when ready.
4. **Sharp voice.** Short, direct copy. No marketing fluff.
5. **Respect the visitor.** No tracking banners, cookie walls, newsletter popups, or engagement tricks.
