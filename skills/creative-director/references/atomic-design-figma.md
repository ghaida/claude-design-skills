# Atomic Design in Figma: Implementation guide

This reference covers the detailed, hands-on process for building a design system in Figma using Atomic Design principles. The SKILL.md provides the strategic framework; this document provides the tactical execution.

## Table of contents

1. [File structure & organization](#file-structure--organization)
2. [Design tokens in Figma](#design-tokens-in-figma)
3. [Building atoms](#building-atoms)
4. [Composing molecules](#composing-molecules)
5. [Assembling organisms](#assembling-organisms)
6. [Page templates](#page-templates)
7. [Component quality checklist](#component-quality-checklist)
8. [Naming conventions](#naming-conventions)
9. [Figma-specific patterns](#figma-specific-patterns)

---

## File structure & organization

### Figma file architecture

Organize the design system across pages within a single Figma file (or a linked library file for larger systems):

```
📄 Design System
├── 🎨 Tokens (Cover page with system overview)
├── 🎨 Colors (All color styles with usage docs)
├── 🎨 Typography (Type scale, specimens, pairing demos)
├── 🎨 Spacing & Layout (Spacing scale, grid definitions)
├── 🎨 Icons (Icon set at defined sizes)
├── ⚛️ Atoms (Buttons, inputs, toggles, badges, etc.)
├── 🧬 Molecules (Form fields, cards, list items, etc.)
├── 🧫 Organisms (Nav bars, headers, tables, modals, etc.)
├── 📐 Templates (Full-page compositions)
└── 📖 Documentation (Usage guidelines, do/don't examples)
```

Each page should have a cover frame at the top explaining what the page contains and any usage notes.

### Section frames

Within each page, organize components into section frames:
- Use a consistent section frame width (e.g., 1440px or the primary breakpoint width)
- Add section titles as text above each group
- Include "anatomy" callouts showing component structure
- Add "do/don't" examples where misuse is common

---

## Design tokens in Figma

Tokens are the foundation. Everything else references them.

### Color tokens

Use Figma's **Variables** feature (preferred) or **Color Styles** to define tokens:

**Variable Collections:**
```
Collection: Colors
├── Primitives (raw values, not used directly)
│   ├── blue/50: #EFF6FF
│   ├── blue/100: #DBEAFE
│   ├── blue/500: #3B82F6
│   ├── blue/900: #1E3A8A
│   ├── neutral/0: #FFFFFF
│   ├── neutral/50: #FAFAFA
│   ├── neutral/900: #171717
│   └── ... (full scales for each hue)
│
├── Semantic (reference primitives, used by components)
│   ├── color/bg/primary: → neutral/0
│   ├── color/bg/secondary: → neutral/50
│   ├── color/bg/inverse: → neutral/900
│   ├── color/text/primary: → neutral/900
│   ├── color/text/secondary: → neutral/500
│   ├── color/text/on-inverse: → neutral/0
│   ├── color/text/link: → blue/600
│   ├── color/border/default: → neutral/200
│   ├── color/border/focus: → blue/500
│   ├── color/action/primary: → blue/600
│   ├── color/action/primary-hover: → blue/700
│   ├── color/status/success: → green/600
│   ├── color/status/warning: → amber/500
│   ├── color/status/error: → red/600
│   └── color/status/info: → blue/500
```

**Modes for theming:**
Create modes within the semantic collection for Light and Dark themes. Each mode maps semantic tokens to different primitives:
- Light: `color/bg/primary` → `neutral/0` (white)
- Dark: `color/bg/primary` → `neutral/900` (near-black)

### Typography tokens

Define as **Text Styles** in Figma:

```
Text Styles:
├── Display/Large    (Font, 48px, -0.02em, 52px line-height)
├── Display/Small    (Font, 36px, -0.02em, 40px line-height)
├── Heading/H1       (Font, 28px, -0.01em, 36px line-height)
├── Heading/H2       (Font, 22px, -0.01em, 28px line-height)
├── Heading/H3       (Font, 18px, 0em, 24px line-height)
├── Body/Large       (Font, 16px, 0em, 24px line-height)
├── Body/Default     (Font, 15px, 0em, 22px line-height)
├── Body/Small       (Font, 14px, 0em, 20px line-height)
├── UI/Label         (Font, 13px, 0.01em, 16px line-height, Medium)
├── UI/Button        (Font, 14px, 0.01em, 20px line-height, Semibold)
├── Caption/Default  (Font, 12px, 0.02em, 16px line-height)
└── Caption/Small    (Font, 11px, 0.02em, 14px line-height)
```

### Spacing tokens

Define as **Variables** in a Spacing collection:

```
Collection: Spacing
├── space/2xs: 2px
├── space/xs: 4px
├── space/sm: 8px
├── space/md: 12px
├── space/base: 16px
├── space/lg: 24px
├── space/xl: 32px
├── space/2xl: 48px
├── space/3xl: 64px
└── space/4xl: 96px
```

### Other tokens

```
Collection: Radius
├── radius/none: 0px
├── radius/sm: 4px
├── radius/md: 8px
├── radius/lg: 12px
├── radius/xl: 16px
└── radius/full: 9999px

Collection: Elevation
├── shadow/sm: 0 1px 2px rgba(0,0,0,0.05)
├── shadow/md: 0 4px 6px rgba(0,0,0,0.07)
├── shadow/lg: 0 10px 15px rgba(0,0,0,0.10)
└── shadow/xl: 0 20px 25px rgba(0,0,0,0.10)
```

---

## Building atoms

Each atom is a Figma component with the following requirements:

### Button atom

**Variants (using component properties):**

| Property | Values |
|----------|--------|
| Type | Primary, Secondary, Tertiary, Ghost, Danger |
| Size | Small (32px), Medium (40px), Large (48px) |
| State | Default, Hover, Active, Disabled, Loading |
| Icon | None, Leading, Trailing, Icon-only |

**Construction:**
- Auto-layout: horizontal, center-aligned
- Padding: horizontal = `space/base`, vertical = calculated from size minus text height
- Gap between icon and label: `space/sm`
- Border-radius: `radius/md`
- Fill: from color tokens (`color/action/primary` for Primary type)
- Text: from text styles (`UI/Button`)
- Min-width: 80px (prevents tiny buttons)

**States use color token swaps:**
- Hover: `color/action/primary-hover`
- Active: `color/action/primary-active`
- Disabled: `color/action/disabled`, opacity 0.5 on text
- Loading: spinner replaces icon or text, pointer-events none

### Input atom

**Properties:**
| Property | Values |
|----------|--------|
| State | Default, Hover, Focused, Filled, Error, Disabled |
| Size | Small, Medium, Large |
| Leading Icon | Boolean (show/hide) |
| Trailing Icon | Boolean (show/hide) |
| Placeholder | Text property |

**Construction:**
- Auto-layout: horizontal, center-aligned
- Height: 40px (Medium), 32px (Small), 48px (Large)
- Padding: horizontal = `space/md`, vertical = auto
- Border: 1px solid `color/border/default`
- Border-radius: `radius/md`
- Background: `color/bg/primary`
- Text: `Body/Default` in `color/text/primary` (filled) or `color/text/secondary` (placeholder)

**Focus state:**
- Border: 2px solid `color/border/focus`
- Box-shadow: 0 0 0 3px `color/action/primary` at 20% opacity (focus ring)

### Additional atoms

Apply the same pattern to:
- **Checkbox**: Box + check mark + label, boolean for checked/indeterminate
- **Radio button**: Circle + dot + label, boolean for selected
- **Toggle**: Track + thumb, boolean for on/off
- **Badge**: Text with background, variants for color (neutral, success, warning, error, info)
- **Avatar**: Image container with size variants (24, 32, 40, 48px) and fallback (initials, icon)
- **Icon**: Frame at fixed sizes (16, 20, 24px) with color token fill
- **Divider**: Line with `color/border/default`, horizontal and vertical variants
- **Spacer**: Empty frame using spacing tokens (useful for auto-layout gaps)

---

## Composing molecules

Molecules combine atoms into functional units. The key is managing the *relationships* between atoms through auto-layout.

### Form field molecule

**Composition:**
```
[Auto-layout: vertical, gap: space/xs]
├── Label (Caption/Default, color/text/primary, Semibold)
├── Input Atom (any variant)
├── [Conditional] Helper Text (Caption/Small, color/text/secondary)
└── [Conditional] Error Message (Caption/Small, color/status/error)
```

**Properties exposed:**
- Label text (text property)
- Helper text (text property, visibility boolean)
- Error message (text property, visibility boolean)
- Required indicator (boolean, shows * after label)
- Input state (maps to inner Input atom state)

### Card molecule

**Composition:**
```
[Auto-layout: vertical, gap: 0]
├── [Conditional] Image/Media Area (fixed aspect ratio, fill container width)
├── Content Area [Auto-layout: vertical, padding: space/base, gap: space/sm]
│   ├── [Conditional] Badge/Tag
│   ├── Title (Heading/H3)
│   ├── Description (Body/Default, color/text/secondary, max 3 lines)
│   └── [Conditional] Action Area [Auto-layout: horizontal, gap: space/sm]
│       ├── Primary Button Atom
│       └── [Conditional] Secondary Button Atom
```

**Properties:**
- With/without image (boolean)
- With/without actions (boolean)
- With/without badge (boolean)
- Elevation (flat, raised) — toggles shadow token

### Other molecules

- **List Item**: Icon/Avatar + text group (title + subtitle) + metadata + action, full-width with hover state
- **Search Bar**: Input with leading search icon + trailing clear button (visible when filled)
- **Navigation Item**: Icon + label + optional badge, with active/inactive/hover states
- **Button Group**: Primary + Secondary buttons with consistent gap
- **Toast**: Status icon + message + optional action button + dismiss icon, with status variants

---

## Assembling organisms

Organisms are the largest reusable components. They contain enough complexity to represent a meaningful UI section.

### Navigation bar organism

**Composition:**
```
[Auto-layout: horizontal, justify: space-between, padding: space/sm space/base]
├── Left Section [Auto-layout: horizontal, gap: space/lg]
│   ├── Logo (fixed size, instance swap)
│   └── Nav Items [Auto-layout: horizontal, gap: space/xs]
│       └── Navigation Item Molecule × N
├── Right Section [Auto-layout: horizontal, gap: space/sm]
│   ├── [Conditional] Search Bar Molecule
│   ├── [Conditional] Notification Icon + Badge
│   └── Avatar + Dropdown Trigger
```

**Responsive behavior:**
- Desktop: Full navigation visible
- Tablet: Collapse to hamburger menu, keep logo and key actions
- Mobile: Hamburger menu, minimal visible items

Create separate component variants for each breakpoint, or use min/max width constraints with auto-layout.

### Data table organism

**Composition:**
```
[Auto-layout: vertical, gap: 0]
├── Table Header [Auto-layout: horizontal]
│   └── Column Headers × N (sortable indicator, resize handle)
├── Table Body
│   └── Table Row × N [Auto-layout: horizontal]
│       └── Cell × N (text, number, badge, action variants)
├── [Conditional] Empty State (illustration + message + action)
├── [Conditional] Loading State (skeleton rows × 5)
└── Table Footer [Auto-layout: horizontal, justify: space-between]
    ├── Row count / selection info
    └── Pagination controls
```

### Modal/dialog organism

**Composition:**
```
Overlay (semi-transparent background)
└── Dialog Container [Auto-layout: vertical, gap: 0, max-width: 560px]
    ├── Header [Auto-layout: horizontal, justify: space-between, padding: space/base]
    │   ├── Title (Heading/H2)
    │   └── Close Button (Icon-only ghost button)
    ├── Divider
    ├── Body [Auto-layout: vertical, padding: space/base, gap: space/md]
    │   └── Content (slot — can contain any content)
    ├── Divider
    └── Footer [Auto-layout: horizontal, justify: flex-end, padding: space/sm space/base, gap: space/sm]
        ├── Secondary Button
        └── Primary Button
```

**Variants:**
- Size: Small (400px), Medium (560px), Large (720px)
- Type: Default, Destructive (danger-styled primary button), Informational (no footer actions)

---

## Page templates

Templates demonstrate the system at full-page scale. They validate that all tokens, atoms, molecules, and organisms work together coherently.

### Template construction rules

1. **Use real(istic) content**: No "Lorem ipsum." Use content that represents actual product data at realistic lengths.
2. **Show multiple states**: Include a "populated" version and an "empty" or "loading" version of each template.
3. **Demonstrate hierarchy**: The eye should travel through the page in the intended order. If it doesn't, the hierarchy system has a problem.
4. **Test at breakpoints**: Create desktop (1440px), tablet (768px), and mobile (375px) versions. The system should adapt gracefully.
5. **Use only system components**: If a template requires a component that doesn't exist in the system, that's a signal to build the component — not to use a one-off.

### Recommended templates

1. **Dashboard**: Dense information display with cards, charts, navigation, and summary data
2. **Detail/Content Page**: Long-form content with headings, body text, media, and related items
3. **Form Page**: Multi-section form with validation, progress indication, and submission
4. **List/Table Page**: Filterable, sortable data display with bulk actions and pagination
5. **Settings Page**: Grouped preferences with toggles, dropdowns, and save/cancel patterns

---

## Component quality checklist

Before marking any component as "done," verify:

- [ ] **Auto-layout**: Component uses auto-layout (not absolute positioning) for all internal spacing
- [ ] **Token references**: All colors, text styles, spacing, radii, and shadows reference design tokens — no hard-coded values
- [ ] **All states**: Every interactive state is represented (default, hover, active, focused, disabled, loading, error, empty)
- [ ] **Component properties**: Uses Figma component properties (boolean, text, instance swap, variant) for all configurable aspects
- [ ] **Content resilience**: Tested with short content ("OK"), medium content ("Save changes"), and long content ("Confirm your email address and preferences")
- [ ] **Description**: Has a component description explaining usage and when to use vs. alternatives
- [ ] **Naming**: Follows the `[Category]/[Component]/[Variant]` naming convention
- [ ] **Accessibility notes**: Color contrast passes WCAG AA, focus states visible, touch targets ≥ 44px on mobile
- [ ] **Responsive behavior**: Scales appropriately if used in different container widths

---

## Naming conventions

### Components
```
[Layer]/[Component Name]/[Variant Group]
Atoms/Button/Primary
Atoms/Button/Secondary-Outline
Molecules/FormField/Default
Molecules/FormField/With Helper
Organisms/NavBar/Desktop
Organisms/NavBar/Mobile
Templates/Dashboard/Default
Templates/Dashboard/Empty State
```

### Design tokens (variables)
```
[category]/[property]/[modifier]
color/bg/primary
color/bg/secondary
color/text/primary
color/text/on-primary
color/border/default
color/border/focus
color/action/primary
color/action/primary-hover
color/status/success
space/xs
space/sm
space/md
radius/md
shadow/lg
```

### Text styles
```
[Role]/[Size or Variant]
Display/Large
Display/Small
Heading/H1
Heading/H2
Body/Default
Body/Small
UI/Label
UI/Button
Caption/Default
```

---

## Figma-specific patterns

### Auto-layout best practices
- Set frame to "hug contents" in both dimensions by default; switch to "fill container" when the component should stretch to its parent's width
- Use `space-between` justification for elements that should push to opposite edges (e.g., label and value in a settings row)
- Set min-width and max-width on text layers to prevent absurdly narrow or wide renders
- Use padding variables (spacing tokens) so padding values can be changed system-wide

### Component property patterns
- Use **boolean** properties for show/hide (icons, helper text, badges)
- Use **text** properties for editable labels (button text, input placeholder)
- Use **instance swap** properties for interchangeable sub-components (leading icon options)
- Use **variant** properties for mutually exclusive states (button type, size, state)

### Prototyping considerations
- Wire up interactive states in Figma prototyping (hover, press, focus)
- Use Smart Animate for smooth state transitions between component variants
- Set up prototype flows for common patterns (form validation, modal open/close, navigation)
- Document intended animation timing and easing in component descriptions (e.g., "200ms ease-out")

### Publishing & library management
- Publish the design system as a Figma Library so product files can consume components
- Use branch-and-merge workflow for system updates
- Include a changelog on the Documentation page
- When updating components, use Figma's "Review updates" notification system to communicate changes to consumers
