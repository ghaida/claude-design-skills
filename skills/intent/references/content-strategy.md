# Content Strategy

## Voice Framework Methodology

A voice framework is not a list of adjectives. It's a system that produces consistent, recognizable writing across every author, channel, and context in your product. Building one requires methodology, not inspiration.

### Step 1: Brand Attribute Identification

Start with the brand's core attributes — the 3-5 characteristics that define how the organization wants to be perceived. These come from brand strategy, not from the content team's preferences.

**Process:** Gather stakeholders (product, marketing, executive, support). Ask each: "If our product were a person, how would you describe their personality?" Collect independently, then compare. Where there's alignment, you have a genuine attribute. Where there's divergence, you have a conversation that needs to happen before writing guidelines.

**Common pitfall:** Every brand wants to be "innovative, friendly, and trustworthy." These are not differentiating attributes — they're table stakes. Push for specificity. Not "friendly" — "the kind of friend who tells you the truth even when it's uncomfortable." Not "innovative" — "explains complex things simply, like a scientist at a dinner party."

**Output:** 3-5 brand attributes with one-paragraph descriptions that include what the attribute means AND what it doesn't mean. Example: "Direct — we get to the point. We don't pad copy with qualifiers or hide bad news behind hedging language. Direct does not mean blunt or cold — we're straightforward because we respect the reader's time, not because we don't care about their feelings."

### Step 2: Voice Principles

Translate brand attributes into writing principles. Each attribute generates 1-2 specific principles that a writer can act on.

**Attribute → Principle pattern:**
- "Direct" → "Lead with the action. If the user needs to do something, start with the verb."
- "Empathetic" → "Acknowledge the user's situation before providing instructions. Error messages start with what happened, not what to do."
- "Expert" → "Use precise terminology when it helps, but always define it in context. Never use jargon as a substitute for explanation."

**Test:** Can a new writer read these principles and produce copy that sounds like your product without seeing any examples? If not, the principles are too vague.

### Step 3: Tone Spectrum

Voice is constant. Tone shifts by context. A voice framework must define how tone changes across different situations while the voice remains recognizable.

Map tone across a spectrum for each of these dimensions:
- **Formality:** casual ←→ formal
- **Emotion:** warm ←→ matter-of-fact
- **Authority:** peer ←→ expert
- **Complexity:** simple ←→ technical

Then map where different product contexts fall on each spectrum. Onboarding might be casual, warm, peer, simple. Legal disclosures might be formal, matter-of-fact, expert, technical. Error messages might be casual, warm, expert, simple.

### Step 4: Writing Guidelines

Concrete rules that implement the voice principles. These are the operational layer — the "how to write" instructions.

**Include:**
- Sentence length targets (aim for 15-20 words average; break up longer sentences)
- Active vs. passive voice guidance (active for actions, passive acceptable for system states: "Your file was saved" vs. "We saved your file")
- Pronoun usage (we/you/they — and when to use each)
- Capitalization conventions (sentence case vs. title case, and where each applies)
- Punctuation rules (Oxford comma? Exclamation marks? Ellipses?)
- Vocabulary preferences and prohibited words
- Inclusive language standards

---

## Tone Matrix

The tone matrix maps how voice shifts across product contexts. This is the most practical artifact in the content strategy toolkit — it's what writers actually reference daily.

| Context | Formality | Emotion | Authority | Complexity | Example |
|---------|-----------|---------|-----------|------------|---------|
| **Onboarding** | Casual | Warm, encouraging | Peer | Simple | "Welcome! Let's get your workspace set up. This takes about 2 minutes." |
| **Success states** | Casual | Celebratory but brief | Peer | Simple | "Done! Your changes are live." |
| **Error messages** | Moderate | Empathetic, calm | Expert | Simple | "We couldn't save your changes. Your internet connection dropped — try again when you're back online." |
| **Empty states** | Casual | Encouraging, helpful | Peer | Simple | "No projects yet. Create your first one to get started." |
| **Settings/Preferences** | Moderate | Neutral, clear | Expert | Moderate | "Two-factor authentication adds a second verification step when you sign in. We recommend enabling it." |
| **Legal/Compliance** | Formal | Neutral | Expert | Technical (with plain-language summary) | "We process your data under GDPR Article 6(1)(b) — it's necessary for the service you asked us to provide." |
| **Destructive actions** | Moderate | Serious, clear | Expert | Simple | "Deleting this workspace removes all projects, files, and member access. This can't be undone." |
| **Help/Documentation** | Moderate | Patient, thorough | Expert | Moderate to technical | "Webhooks send real-time notifications to your server when events happen in your workspace. Here's how to set one up." |
| **Marketing/Upgrade** | Casual to moderate | Enthusiastic but honest | Peer | Simple | "The Pro plan includes unlimited projects and priority support. Here's what changes — and what stays the same." |
| **Support/Contact** | Moderate | Warm, professional | Peer | Simple | "Stuck on something? Our support team usually responds within an hour." |

---

## Content Modeling

Content modeling defines the structure of content independently from its presentation. Good content modeling makes content reusable across channels, localizable across languages, and maintainable at scale.

### Structured Content

Every piece of content should be modeled as structured data, not as a blob of formatted text.

**Example: An event**
- Title (plain text, max 80 characters)
- Description (rich text, max 500 characters)
- Short description (plain text, max 140 characters — for cards and previews)
- Date and time (ISO 8601 — never store as formatted text)
- Location (structured: venue name, address, coordinates)
- Category (controlled vocabulary)
- Image (with alt text — required, not optional)
- Status (draft, published, cancelled)

**Why structure matters:** A structured event can render as a card, a list item, a calendar entry, a notification, a social media post, or a search result — each using the appropriate fields. A blob of HTML can only render as itself.

### Localization-Ready Content

Content that will be translated needs to be modeled for translation from the start. Retrofitting localization is orders of magnitude more expensive than building it in.

**Rules:**
- Separate content from presentation. Don't hardcode text in templates, components, or images.
- Don't concatenate strings. "You have " + count + " messages" breaks in languages with different word order. Use ICU MessageFormat or equivalent: "{count, plural, one {You have 1 message} other {You have # messages}}".
- Don't assume text length. German text is typically 30% longer than English. Japanese may be shorter. Design layouts that accommodate variation.
- Don't embed text in images. It can't be translated, can't be read by screen readers, and can't be searched.
- Provide context for translators. "Save" the verb is different from "Save" the noun in many languages. String identifiers like `button.save_changes` carry more context than `string_47`.

### Content Reuse

Model content once, use it everywhere. But be deliberate about what's shared and what's unique.

**Shared content:** Legal text, feature descriptions, pricing details — anything that must be consistent across contexts. Change once, update everywhere. Store in a single source.

**Adapted content:** The same information, but with different length or tone for different contexts. An event description might be 500 characters on the detail page and 140 characters on a card. Model both as distinct fields — don't truncate the long version.

**Unique content:** Context-specific text that doesn't make sense anywhere else. An error message for a specific form field. A tooltip for a specific feature. Don't over-abstract — not everything needs to be reusable.

---

## Microcopy Pattern Library

Microcopy is the small text that guides users through interactions. It's the most impactful writing in a product — a single word change in a button label can shift conversion rates by double digits.

### Tooltips

**When to use:** To explain unfamiliar concepts, clarify ambiguous labels, or provide additional context for a decision. NOT as a substitute for a clear label.

**Length:** One to two sentences. If a tooltip needs a paragraph, the feature needs better design, not longer tooltips.

**Trigger:** Hover on desktop (with focus equivalent for keyboard), tap on mobile. Never put essential information in tooltips — they're invisible until triggered.

**Pattern:** "[What this is/does]. [Why it matters or what to consider]." Example: "Two-factor authentication. Adds a second verification step using your phone when you sign in."

### Placeholder Text

**What it's for:** Format examples and input hints. "name@company.com" in an email field. "DD/MM/YYYY" in a date field.

**What it's NOT for:** Field labels. Instructions. Anything the user needs to reference while typing. Placeholder text disappears on focus — if the information matters, put it in a persistent label or help text.

**Accessibility note:** Placeholder text typically renders in low contrast, making it hard to read for many users. Never rely on placeholder text as the only source of information.

### Confirmation Messages

**Success:** What happened + what the user can expect next. "Your payment was processed. You'll receive a confirmation email within a few minutes." Not just "Success!"

**Pending:** What's happening + when to expect resolution. "We're verifying your identity. This usually takes 1-2 business days." Not just "Processing..."

**Failure:** What went wrong + what to do. "Your payment was declined by your bank. Try a different card or contact your bank." Not just "Payment failed."

### Empty States

The first screen a new user sees is almost always an empty state. It's the product's first impression — and most products waste it.

**Good empty states contain:**
1. What this area is for (education)
2. How to add the first item (action)
3. Why it's worth doing (motivation)

**Example:** "This is your project dashboard. You'll see all your active projects here once you create them. Create your first project to get started." + a prominent "Create Project" button.

**Bad empty states:** A blank page. A lonely icon. "No data." These communicate nothing and leave the user stranded.

---

## Terminology Governance

Inconsistent terminology is one of the most common causes of user confusion and one of the easiest to prevent.

### Building a Terminology Glossary

**Identify terms that need governance:** Technical terms, product-specific concepts, feature names, status labels, action verbs. If two writers might use different words for the same thing, it needs a glossary entry.

**For each term, document:**
- The canonical term (the one we use)
- Synonyms we don't use (and why — "we say 'workspace,' not 'project space' or 'dashboard'")
- Definition (in user-facing language, not internal language)
- Context for use (where this term appears and what it means in each context)

### Naming Conventions

**Actions should be specific verbs.** "Save" not "OK." "Delete permanently" not "Remove." "Send invitation" not "Submit." The button label should tell the user exactly what will happen when they click it.

**Status labels should be past participles or adjectives.** "Sent," "Draft," "Active," "Archived" — states the item is in. Not verbs ("Send," "Archive") which imply actions.

**Consistency across surfaces.** If the mobile app says "Log in" and the website says "Sign in," one of them is wrong. Pick one and enforce it everywhere.

### Jargon Management

**Rules:**
1. If the user needs a technical term to use the product, define it the first time it appears — in context, not in a glossary page nobody will visit.
2. If a simpler word exists, use it. "Use" not "utilize." "Start" not "initiate." "End" not "terminate."
3. Internal terminology never reaches the user. The user doesn't know what "SKU" means, that "KYC" stands for Know Your Customer, or that "RBAC" is role-based access control. Translate.
4. When technical terms are unavoidable (API, URL, CSV), use them but don't assume understanding. "Download as CSV (a spreadsheet format)" on first appearance.

---

## Readability and Plain Language

### Readability Scoring

**Flesch-Kincaid Grade Level** is the most widely used readability metric. It estimates the U.S. school grade level required to understand the text. Target: grade 6-8 for consumer products, grade 8-10 for professional tools, grade 10-12 for expert documentation.

**How to improve readability scores:**
- Shorter sentences (average 15-20 words)
- Shorter words (prefer one and two-syllable words)
- Active voice (subject → verb → object)
- One idea per sentence
- Lists instead of long paragraphs

**Limitations:** Readability scores measure surface features (word length, sentence length), not comprehension. A text can score at grade 6 and still be incomprehensible if the concepts are poorly organized or the terminology is unfamiliar. Use readability scores as a quick check, not a quality guarantee.

### Plain Language Principles

Plain language is not simple language. It's clear language. The goal is that the reader can find what they need, understand what they find, and use that understanding to act.

**Federal Plain Language Guidelines (plainlanguage.gov) principles:**
1. Write for your audience — use their vocabulary, address their needs
2. Organize for the reader — most important information first
3. Use short sentences and paragraphs
4. Use everyday words — avoid jargon, legalese, and unnecessary technical language
5. Use active voice — "We'll review your application" not "Your application will be reviewed"
6. Use present tense — "This deletes your account" not "This will delete your account"
7. Use "you" and "we" — direct address is clearer than third person
8. Use lists and tables for complex information
9. Use meaningful headings

**In product interfaces specifically:**
- Button labels should be verbs that describe the action: "Save changes," "Create project," "Send message"
- Error messages should be sentences: subject, verb, solution
- Instructions should start with the goal, then the steps: "To export your data, go to Settings > Export"
- Don't use "please" in every instruction — it inflates word count and becomes invisible. Reserve politeness for when you're asking the user to do something inconvenient
