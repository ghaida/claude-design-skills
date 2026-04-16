---
name: localize
description: >
  Adapts experiences across cultures and languages — not just translation,
  but cultural reconception. Part of the Intent design strategy system.
  When a product enters a new market, everything is in play: information
  density, navigation patterns, color meaning, icon comprehension, date
  formats, trust signals, payment flows, and the fundamental assumptions
  about how people make decisions. Trigger when: planning international
  expansion, auditing i18n readiness, adapting designs for RTL languages,
  reviewing cultural assumptions in a design, preparing localization
  test plans, or when someone says "we need to launch in [country]" and
  the plan is "just translate it." Also trigger for compliance reviews
  across markets (GDPR, PIPL, accessibility laws).
version: 1.1.0
user-invocable: true
---

# Localize — Design Across Cultures

## Overview

Localization is not translation. Translation converts words; localization adapts the experience.

When a product enters a new market, everything is in play: information density, navigation patterns, color meaning, icon comprehension, date formats, trust signals, payment flows, legal compliance, and the fundamental assumptions about how people make decisions. A checkout flow designed for US consumers doesn't become a Japanese experience by translating the strings. A trust-building pattern that works in Germany may be irrelevant in Brazil and offensive in Saudi Arabia.

Design for localization from the start, or pay for it exponentially later. Retrofitting RTL support, plural rules, and cultural adaptation into a product that assumed English-speaking Western users is one of the most expensive kinds of design debt.

**When to activate this skill:** International expansion planning, i18n readiness audits, new market entry design, RTL adaptation, cultural review of existing designs, localization testing strategy, or anytime someone says "just translate it" and the problem is deeper than language.

---

## Skill family

Localize works alongside the full Intent skill system:

- **`/articulate`**: Everything they write will be localized. Content strategy must design for translation from the start — sentence structure, concatenation, tone, humor, idiom. If the English copy is clever, the localized copy may be incomprehensible. Articulate designs translatable content; localize ensures it survives translation.
- **`/organize`**: Navigation and labeling may need cultural adaptation. Category structures that make sense in one culture may be arbitrary in another. Menu labels that are concise in English may expand to unwieldy lengths in German or Finnish.
- **`/fortify`**: i18n technical readiness — text expansion breaking layouts, RTL rendering bugs, date/number format parsing failures, character encoding issues. Fortify maps the failure modes; localize defines the requirements that prevent them.
- **`/strategize`**: Market analysis and audience definition per locale. Which markets, in what order, with what level of adaptation? `/strategize` defines the business case; `/localize` defines the design implications.
- **`/investigate`**: Cultural research methods for unfamiliar markets. When your assumptions about a market are based on stereotypes rather than evidence, investigate plans the research to validate or challenge them.
- **`/philosopher`**: A cross-cutting cognitive mode for confronting invisible assumptions. Invoke when: your design team is monocultural and can't see its own biases, the "obvious" user flow is obvious only to people from your culture, or you need the question: "What cultural assumptions are invisible to us because we're inside them?"

---

## Core capabilities

### 1. Cultural dimension analysis for UX

Cultural frameworks provide starting hypotheses for design adaptation — not stereotypes to design by. Use them to generate questions, then validate with research.

**High-context vs. low-context (Hall):**
- High-context cultures (Japan, China, Arab countries, Korea): communication is implicit, relationships matter before transactions, visual density is expected (not cluttered), social proof and authority signals carry weight, indirectness is politeness.
- Low-context cultures (US, Germany, Scandinavia, Netherlands): communication is explicit, task-first flows are preferred, minimal UI is valued, direct calls to action work, users expect to self-serve.
- UX implications: onboarding flows, help text density, social features, the balance between guidance and autonomy.

**Power distance (Hofstede):**
- High power distance: formal tone, hierarchical navigation, respect for authority in copy ("Approved by Dr. [Name]"), institutional trust signals.
- Low power distance: informal tone, flat navigation, peer trust signals ("1,000 users like you chose this"), egalitarian messaging.
- UX implications: form of address, tone of voice, error messages, authority signals.

**Individualism vs. collectivism:**
- Individualist cultures: personal accounts, individual preferences, "my" dashboard, solo decision-making flows.
- Collectivist cultures: family/group accounts, shared decision-making, social features, gift-giving flows, group purchase patterns.
- UX implications: account models, sharing features, decision-making flows, social proof patterns.

**Uncertainty avoidance:**
- High uncertainty avoidance (Japan, Germany, Greece): detailed explanations, confirmation steps, progress indicators, safety nets, explicit guarantees.
- Low uncertainty avoidance (Singapore, Denmark, UK): tolerance for ambiguity, fewer confirmation steps, willingness to explore, comfort with uncertainty.
- UX implications: how much guidance to provide, number of confirmation steps, error prevention vs. error recovery.

**Long-term orientation:**
- Long-term oriented cultures: loyalty programs resonate, subscription models accepted, trust built gradually, relationship-first onboarding.
- Short-term oriented cultures: immediate value expected, trial-first models, quick wins, instant gratification patterns.

**IMPORTANT:** These are spectrums and tendencies, not rules. Every individual is different. Every market has subcultures. Never design for a stereotype. Use these dimensions to generate hypotheses, then validate with `/investigate` research and `/measure` data from real users in the target market.

### 2. RTL and LTR design

Right-to-left layout is not mirroring. It requires understanding what flips, what doesn't, and what needs rethinking.

**What flips:**
- Layout direction: content flows right-to-left
- Text alignment: right-aligned by default
- Navigation order: back arrow points right, forward points left
- Progress indicators: fill from right to left
- Swipe directions: next is left-to-right, previous is right-to-left
- Slider direction: min on right, max on left
- Icon direction: icons that imply direction (arrows, reply, share) flip

**What does NOT flip:**
- Numbers and phone numbers (always LTR within their container)
- Media playback controls (play/pause/skip are universal)
- Clock direction
- Brand logos
- Universal icons (play, pause, close, add)
- Checkmarks and toggles (debated, but generally don't flip)

**Bidirectional text:**
When RTL and LTR content mix — Arabic text with English brand names, code snippets, URLs, email addresses — the Unicode Bidirectional Algorithm handles most cases, but edge cases require manual intervention with directional markers. Test with real mixed-direction content, not lorem ipsum.

**CSS implementation principles:**
- Use logical properties: `inline-start`/`inline-end` instead of `left`/`right`, `block-start`/`block-end` instead of `top`/`bottom`
- Use `dir="rtl"` on the root element, not CSS transforms
- Flexbox and Grid handle direction automatically with logical properties
- Absolute positioning and transforms need manual attention

**Testing RTL:**
- Test with actual RTL users, not just mirrored screenshots
- Test with real Arabic/Hebrew content, not reversed English
- Test bidirectional content: Arabic paragraphs with English terms, numbers, URLs
- Test form inputs: cursor position, text selection, copy-paste behavior

### 3. Content adaptation beyond translation

Translation converts words. Content adaptation converts meaning, structure, and formatting.

**Text expansion and contraction:**
- German expands ~30% from English. Finnish ~40%. Some compounds create single words that are 30+ characters.
- Chinese and Japanese can compress 30-50% from English character count (but may need more vertical space due to character complexity).
- Layout MUST accommodate expansion without breaking. Test with pseudo-localized strings at 150% length as a minimum.

**String concatenation is the enemy:**
"Hello {name}, you have {n} items in your cart" breaks in almost every language. Word order changes. Pluralization rules differ. Gender agreement is required. Use proper i18n libraries with ICU MessageFormat. Never build sentences by concatenating variables.

**Pluralization:**
- English: 2 forms (1 item, 2 items)
- Arabic: 6 forms (zero, one, two, few, many, other)
- Polish: 4 forms with complex rules
- Chinese/Japanese/Korean: 1 form (no grammatical plural)
- Use CLDR plural rules, not "if count != 1, add 's'"

**Date and time:**
- MM/DD/YYYY (US) vs. DD/MM/YYYY (most of world) vs. YYYY-MM-DD (ISO/East Asia)
- 12-hour (US, UK, Australia) vs. 24-hour (most of world)
- Week starts Monday (ISO, most of world) vs. Sunday (US, Israel, some Middle Eastern countries)
- Use locale-aware formatting libraries. Never hardcode date formats.

**Numbers:**
- 1,000.00 (US, UK) vs. 1.000,00 (Germany, Brazil) vs. 1 000,00 (France, Sweden)
- Decimal and thousands separators vary. Use locale-aware number formatting.

**Currency:**
- Symbol position varies: $1,000.00 vs. 1.000,00 EUR vs. 1 000 kr
- Some currencies have no decimal places (JPY, KRW)
- Exchange rate display needs careful formatting per locale

**Addresses:**
- Format varies wildly by country. Japan: postal code, prefecture, city, ward, block, building, room. US: street, city, state, zip. UK: house, street, town, county, postcode.
- Never assume street/city/state/zip structure. Use locale-aware address forms or flexible freeform input.

**Names:**
- Not everyone has first name + last name
- Chinese, Japanese, Korean: family name first
- Icelandic: patronymic, not family name
- Indonesian: many people have single names
- Spanish: two family names (paternal + maternal)
- Don't force Western name structures. Use "full name" as a single field when possible, with optional structured fields.

### 4. Visual and symbolic adaptation

Visual elements carry cultural meaning that doesn't translate.

**Color meaning (starting points, not rules):**
- Red: luck and prosperity (China), danger and warning (Western), mourning (South Africa), bridal (India)
- Green: Islam (Middle East), nature/go (Western), jealousy (some Latin American), money (US)
- White: purity and weddings (Western), mourning and death (East Asian, some South Asian)
- Yellow: royalty (Thailand), caution (Western), sacred (Hindu)
- Blue: trust and corporate (near-universal, but depth of association varies)
- Don't assume your color palette communicates the same emotions everywhere. Test.

**Icons and symbols:**
- Mailbox icon: varies by country (US mailbox vs. European post box vs. Japanese post mark)
- Trash can: American-style trash can is not universal
- Thumbs up: positive in most Western cultures, offensive in parts of Middle East and West Africa
- Checkmark: correct/yes in Western cultures, can mean "wrong/incorrect" in Japan and Korea (they use circles for correct)
- Hand gestures: culturally loaded everywhere. Avoid them or test thoroughly.
- Animals: cultural significance varies enormously (owls = wisdom in West, bad luck in India; pigs problematic in Islamic and Jewish contexts)

**Imagery:**
- Diverse representation appropriate to the market
- Contextually appropriate clothing, architecture, food, landscapes
- Avoid Western-default stock photography for non-Western markets
- Avoid images that could be politically sensitive in the target market
- Show local context: local devices, local environments, local people

### 5. Market-specific compliance

Legal requirements that directly affect UX. This is not comprehensive legal advice — it's awareness of compliance requirements that shape design decisions.

**GDPR (EU/EEA):**
- Consent must be freely given, specific, informed, unambiguous — no prechecked boxes
- Cookie consent banners with genuine opt-out (not just "accept" buttons)
- Data portability: users must be able to export their data
- Right to deletion: users must be able to delete their account and data
- Privacy by design: data minimization, purpose limitation

**CCPA/CPRA (California):**
- "Do Not Sell or Share My Personal Information" link required
- Opt-out must be as easy as opt-in
- Financial incentive disclosures for data collection

**PIPL (China):**
- Data localization: personal data of Chinese citizens stored in China
- Separate consent for each purpose of data processing
- Cross-border transfer requires security assessment or certification
- Significant implications for product architecture

**Accessibility laws (selection):**
- EAA — European Accessibility Act (EU): WCAG 2.1 AA for products and services, enforcement from 2025
- ADA (US): no explicit digital standard, but WCAG 2.1 AA is the de facto requirement
- AODA (Canada/Ontario): WCAG 2.0 AA required
- JIS X 8341-3 (Japan): aligned with WCAG but with Japanese-specific guidance
- Different standards, different enforcement, different penalties

**Age verification:**
- Varies by country and content type
- COPPA (US): under-13 restrictions
- UK Age Appropriate Design Code: child-specific data protection
- Alcohol, gambling, tobacco: age gates vary by jurisdiction

**Payment regulations:**
- PSD2/SCA (EU): Strong Customer Authentication for online payments
- Local payment methods: iDEAL (Netherlands), Boleto (Brazil), UPI (India), WeChat Pay/Alipay (China)
- Installment expectations: Klarna (Europe), Afterpay (Australia), buy-now-pay-later varies by market

### 6. Localization testing

Testing localization isn't translating test cases. It's verifying that the experience works for real users in real contexts.

**Pseudo-localization:**
Run before any real translation. Replace all strings with accented/extended character versions (e.g., "[Ħéĺĺö Ŵöŕĺð!!!]") to find:
- Hardcoded strings that bypass the i18n system
- String concatenation that will break in other languages
- Layout issues from text expansion (pseudo-expand by 30-50%)
- Truncation where expanded text gets cut off
- Character encoding issues

**Linguistic QA:**
- Native speakers reviewing translations in context (in the actual UI, not a spreadsheet)
- Check: meaning preserved, tone appropriate, no machine-translation artifacts, technical terms handled correctly
- Cultural review: local market experts reviewing flows, imagery, patterns, and metaphors

**Functional testing:**
- All features work with RTL layout enabled
- All features work with expanded text (German, Finnish test strings)
- Date, number, and currency formatting correct per locale
- Form validation works with local formats (postal codes, phone numbers, addresses)
- Search works with local character sets (CJK, Arabic, Cyrillic)
- Sorting works correctly per locale (alphabetical order varies)

**Crowd testing:**
- Real users in target markets testing end-to-end flows
- Unmoderated testing for broad coverage
- Moderated testing for cultural insight
- Device and OS coverage per market (Android-dominant vs. iOS-dominant markets)

---

## Output format

### Localization readiness checklist
Audit of current design and codebase against i18n requirements: string externalization, layout flexibility, format handling, RTL support, cultural assumptions.

### Cultural adaptation brief
Per target market: cultural dimensions analysis, specific design adaptations needed, imagery and symbolism changes, tone and voice adjustments, compliance requirements.

### Market-specific requirement matrix
Cross-market comparison: what changes per market (legal, cultural, technical, content) and what stays consistent.

### Localization test plan
Testing strategy per market: pseudo-localization, linguistic QA, functional testing, crowd testing, compliance verification.

---

## Voice and approach

Humility first. You are not an expert in every culture — but you can build a framework that respects cultural differences and validates assumptions through research. Cultural frameworks are starting points for inquiry, not design specifications.

Never stereotype. Saying "Japanese users prefer dense interfaces" is a hypothesis to test, not a design decision to implement. Always pair cultural dimension analysis with research validation through `/investigate` and measurement through `/measure`.

Be specific about what needs to change and why. Don't say "adapt for the German market" — say which elements need adaptation (text expansion accommodation, formal address tone, comma-as-decimal formatting, GDPR consent flow) and why each matters.

Design for localization from day one. The cost of retrofitting i18n support is orders of magnitude higher than building it in. Every string externalized, every layout flexible, every format locale-aware — from the first commit.

---

## Scope boundaries

### This skill owns:
- Cultural adaptation strategy and frameworks
- i18n UX patterns and requirements (RTL, text expansion, format handling)
- Localization testing methodology and test plans
- Market-specific compliance awareness (as it affects UX)
- Cross-market design adaptation guidance

### This skill does NOT own:
- Actual translation (translation teams and linguists)
- Technical i18n implementation (engineering)
- Market research and primary cultural research (`/investigate` + `/strategize`)
- Visual adaptation details (visual design)
- Accessibility implementation per market (`/include`)
- Legal compliance decisions (legal team — this skill flags requirements, not interprets law)
