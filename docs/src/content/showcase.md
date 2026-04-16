---
project: Nearby
tagline: A neighborhood marketplace for buying, selling, and trading within walking distance.
---

## /intent
agent: Noor
summary: Established project context, user types, design principles, and constraints for a hyperlocal marketplace.

We started by grounding the project in reality. Nearby isn't another e-commerce platform — it's a tool for neighbors. That distinction shapes everything: trust is built through proximity, not star ratings. We defined three core user types, set design principles that prioritize safety and simplicity, and named the constraints that would keep us honest.

### Output

**Project Context: Nearby**

**Users**
- **Sellers:** People with stuff they want gone — moving, decluttering, upgrading. Not professional resellers. They want minimal effort: snap a photo, name a price, done.
- **Buyers:** Bargain hunters and convenience seekers. They'd rather walk two blocks than wait two days for shipping. They browse casually and buy impulsively.
- **Organizers:** Block captains, community garden coordinators, buy-nothing group admins. They facilitate exchanges that aren't strictly transactional — lending, gifting, sharing.

**Design Principles**
1. **Proximity is the product.** Everything flows from physical nearness. If it doesn't leverage walking distance, it doesn't belong.
2. **Lower the stakes.** This isn't a $500 transaction. Most items are under $20. The UX should match that casualness.
3. **Trust through transparency.** Show the neighborhood, not a profile score. "3 blocks away" builds more trust than "4.8 stars."
4. **Respect the asymmetry.** Sellers want speed. Buyers want discovery. Don't optimize for one at the expense of the other.

**Constraints**
- No identity verification at signup — friction kills adoption in small markets
- Must function in neighborhoods with as few as 50 active users
- No delivery infrastructure — walking distance is the delivery method
- Privacy-first: exact addresses never exposed until both parties agree

## /strategize
agent: Ember
summary: Framed the market opportunity, mapped competitors, defined a testable hypothesis, and scoped the MVP.

We stepped back to ask whether this idea has legs. The hyperlocal exchange space is littered with failures — Yerdle, OfferUp's local push, Facebook Marketplace's neighborhood tab. Each solved the wrong problem. We mapped what they got wrong, sized the opportunity differently (not by GMV but by exchange density per square mile), and wrote a hypothesis we could actually test.

### Output

**Strategic Frame**

**Opportunity**
The hyperlocal exchange market is underserved not because demand is low, but because existing platforms optimize for the wrong metric. Facebook Marketplace optimizes for reach. OfferUp optimizes for shipping. Craigslist optimizes for nothing. Nobody optimizes for *walkable exchange density* — the number of transactions completable on foot within a neighborhood.

**Competitive Landscape**
- **Facebook Marketplace:** Massive supply, zero neighborhood identity. Trust comes from Facebook profiles, which people increasingly distrust.
- **Nextdoor:** Has the neighborhood graph but treats commerce as a secondary feature. Listing experience is buried.
- **Buy Nothing groups:** Right philosophy, wrong infrastructure. Facebook Groups weren't designed for item exchange. Discovery is chronological, search is useless, coordination happens in comment threads.
- **Craigslist:** Still works for big-ticket items. Irrelevant for "free couch on my porch, come get it."

**Hypothesis**
In neighborhoods with at least 200 households, a marketplace constrained to walking distance will achieve 3x the exchange completion rate of unconstrained platforms, because proximity eliminates the two biggest friction points: logistics and trust.

**MVP Scope**
- Post an item (photo + price + location radius)
- Browse items within walking distance (map + list view)
- Express interest (one-tap, no messaging yet)
- Neighborhood identity (you see your area, not the whole city)

### Philosopher

What does "neighborhood" actually mean? In a dense urban block, walking distance might be 0.2 miles — you can see the seller's building from your window. In a suburban subdivision, it's the development itself, maybe a mile across. In a rural town, it might be the whole town. The product assumes a shared definition of "nearby" that doesn't exist. Are we building for a radius, a census tract, a zip code, or a felt sense of community? The answer changes the entire trust model.

## /investigate
agent: Ember
summary: Designed a research plan with interview scripts for buyers, sellers, and community organizers.

Before designing anything, we needed to hear from people who already do this — the ones selling furniture on their stoop, the buy-nothing group admins managing chaos in Facebook comments, the people who walk past "FREE" signs and wonder what they're missing. We wrote three interview scripts, each tuned to a different relationship with local exchange.

### Output

**Research Plan**

**Method:** Semi-structured interviews, 45 minutes each
**Sample:** 5 sellers, 5 buyers, 3 community organizers across 2 neighborhoods (one urban, one suburban)
**Recruitment:** Buy Nothing groups, neighborhood Facebook groups, Nextdoor, flyers at coffee shops

**Script: Sellers**
1. Tell me about the last thing you sold or gave away locally. Walk me through what happened from the moment you decided to get rid of it.
2. How did you decide where to list it? What other options did you consider?
3. What was the most annoying part of the process?
4. Did you know the buyer beforehand? How did that affect the interaction?
5. Have you ever decided *not* to sell something locally? What stopped you?
6. *Probe:* How do you feel about strangers knowing where you live?
7. *Probe:* What would make you post more things, more often?

**Script: Buyers**
1. When was the last time you bought or picked up something from a neighbor? What was it?
2. How did you find out about it? Were you actively looking or did it just appear?
3. What made you trust the seller enough to show up?
4. Describe the actual exchange — where did you meet? How did payment work?
5. Have you ever been burned? What happened?
6. *Probe:* If you could browse everything available within a 10-minute walk right now, would you? How often?

**Script: Community Organizers**
1. How do you currently manage exchanges in your group? Walk me through a typical week.
2. What breaks? What are the recurring problems you solve over and over?
3. How do you handle people who don't follow through — ghost pickups, no-shows?
4. What rules have you had to create that surprised you?
5. If you could wave a magic wand and fix one thing about how your group works, what would it be?
6. *Probe:* Do you think your community would use a dedicated app, or is "good enough" inside Facebook actually fine?

## /blueprint
agent: Sage
summary: Mapped the full service blueprint — actors, frontstage actions, backstage processes, and critical dependencies.

We mapped the invisible machinery behind a simple exchange. What looks like "I want that, here's $5" actually involves geolocation, notification timing, trust inference, content moderation, and a handoff that happens on a physical sidewalk with no platform involvement. The blueprint revealed three critical failure points we hadn't considered.

### Output

**Service Blueprint: Item Exchange Flow**

**Actors:** Seller, Buyer, Platform, Neighborhood Graph, Moderation System

**Frontstage (Seller)**
1. Seller photographs item and writes description
2. Platform suggests price based on similar local listings
3. Seller sets pickup availability (porch, meet outside, flexible)
4. Listing goes live within walking radius

**Frontstage (Buyer)**
1. Buyer browses map or feed of nearby items
2. Buyer taps "I'm interested" — no message required
3. Seller sees interest + buyer's approximate distance ("4 min walk")
4. Seller accepts — both get pickup coordination prompt
5. Exchange happens in person

**Backstage**
- **Neighborhood Graph:** Determines walking radius based on density, street grid, and barriers (highways, rivers, gated areas). Updates weekly.
- **Trust Inference:** No ratings. Instead: account age, completed exchanges, neighborhood tenure, mutual connections. Surfaces as "Your neighbor since March" not "4.2 stars."
- **Content Moderation:** Automated: prohibited items filter, duplicate detection, price anomaly flagging. Human: community-reported issues, escalation to local organizer before platform.
- **Notification Timing:** Interest notifications batch every 15 minutes to avoid alert fatigue. Pickup reminders 1 hour before agreed time.

**Critical Dependencies**
- Geolocation accuracy must be within 100m — city block precision, not GPS drift
- The "walking radius" algorithm is the product. Get it wrong and nothing else matters
- Trust signals require minimum 4 weeks of account history to be meaningful — cold start problem is severe

## /journey
agent: Wren
summary: Designed four core flows — posting an item, discovering nearby listings, buying, and messaging.

We traced the four paths people actually take through Nearby. Each flow was designed to feel lighter than existing alternatives — fewer taps to post, less scrolling to find, less negotiation to buy. The key insight: in a walking-distance marketplace, the transaction is almost an afterthought. Discovery and coordination are the real product.

### Output

**Flow 1: Posting an Item**
1. Tap "+" from any screen — camera opens immediately
2. Snap photo (or select from gallery). AI suggests title: *"Blue IKEA bookshelf"*
3. Confirm or edit title. Set price (or tap "Free" / "Trade")
4. Pickup preference auto-fills from last listing. Edit if needed.
5. Preview shows how it appears on the map. Publish.
- **Total taps to post:** 4 (photo, confirm title, set price, publish)
- **Time to post:** Under 30 seconds for returning users

**Flow 2: Discovering Nearby Items**
- **Default view:** Map centered on your location. Items appear as pins with tiny thumbnails.
- **List view toggle:** Sorted by distance, then recency. Shows walking time, not miles.
- **Filters:** Category, price range (including Free), posted today / this week
- **Serendipity feature:** "What's new on your block" — a daily digest of 3-5 items posted within closest walking radius
- **Empty state:** "Nothing nearby yet. Be the first to post — your neighbors are watching." (With a nudge to share the app)

**Flow 3: Expressing Interest & Buying**
1. Tap item card. See photo, description, distance ("2 min walk"), seller neighborhood tenure.
2. Tap "I want this." No message needed — reduces social friction.
3. Seller receives batched notification with buyer's distance and tenure.
4. Seller taps "It's yours" or doesn't respond (no explicit rejection).
5. Both receive pickup coordination screen: suggested meeting point (nearest intersection), suggested time window.
6. After exchange, both confirm completion. Item leaves the map.

**Flow 4: Messaging (Only When Needed)**
- Messaging unlocks *only after* mutual interest is confirmed
- Pre-written quick replies: "Is this still available?" / "I can pick up now" / "Can you hold until tomorrow?"
- Messages auto-delete 48 hours after exchange completes
- No open-ended chat. This isn't a social network.

### Philosopher

The buy/sell mental model assumes every exchange has a price. But in real neighborhoods, the most common local exchange isn't commerce — it's generosity. A bag of lemons from someone's tree. A kid's bike they outgrew. Moving boxes you'll never use again. If Nearby only supports buying and selling, it misses the gift economy that actually builds neighborhood trust. Should "Free" be a price option, or should gifting be an entirely separate mode with different social mechanics?

## /organize
agent: Wren
summary: Defined information architecture — categories, navigation structure, search strategy, and wayfinding.

We organized Nearby around a simple principle: proximity first, category second. Unlike Amazon or even Craigslist, nobody comes to Nearby looking for a specific item. They come to see what's around. The IA reflects browsing behavior, not shopping behavior — the map is the primary navigation, categories are filters, and search is a secondary path.

### Output

**Navigation Structure**
- **Primary:** Map (default home), Feed (list view), Post (+), Activity, Profile
- **Bottom tab bar:** 5 items, map is leftmost and default
- **No hamburger menu.** Everything lives in the tab bar or within a screen.

**Category Taxonomy**
- Furniture & Home
- Electronics & Gadgets
- Clothing & Accessories
- Kids & Baby
- Books & Media
- Kitchen & Dining
- Garden & Outdoor
- Sports & Fitness
- Free Stuff (elevated to top-level — not buried as a price filter)
- Wanted (reverse listings: "Looking for a standing desk nearby")

**Search Strategy**
- **Primary discovery:** Spatial browsing (map) — most users won't search
- **Search bar:** Available but not prominent. Appears on pull-down in feed view.
- **Search behavior:** Full-text across titles and descriptions. Results always distance-sorted.
- **No search results?** "Nothing matching nearby. Try expanding your radius or post a Wanted listing."

**Wayfinding Signals**
- Current radius always visible: "Showing items within a 10-min walk"
- Radius adjustable via slider on map view (5 min / 10 min / 20 min walk)
- Items beyond radius shown as faded pins — visible but clearly "further away"
- Neighborhood name shown in header: "Capitol Hill" / "Elmwood Park" / "Your Neighborhood"

## /articulate
agent: Wren
summary: Established voice and tone, wrote microcopy for empty states, errors, and trust signals.

We defined how Nearby speaks. The voice is casual, warm, and neighborhood-specific — it should feel like a note on a bulletin board, not a corporate app notification. We wrote copy for the moments that matter most: when nothing's there yet, when something goes wrong, and when someone needs to trust a stranger enough to walk to their house.

### Output

**Voice Principles**
- **Neighborly, not corporate.** "Hey, someone nearby wants your bookshelf" not "You have a new offer on your listing."
- **Casual, not sloppy.** Friendly tone but clear information. No emoji overload.
- **Local, not generic.** Use neighborhood names when possible. "New in Capitol Hill" not "New near you."
- **Brief.** These are sidewalk transactions, not enterprise purchases. Copy should match the stakes.

**Empty States**
- **No listings nearby:** "Your neighborhood is quiet right now. Post something and get it started — someone nearby probably wants it."
- **No search results:** "Nothing matching within walking distance. Try a wider radius, or post a Wanted listing and let it come to you."
- **No activity yet:** "No exchanges yet. Your first one is the hardest — after that, you'll wonder why you ever drove to Goodwill."
- **New neighborhood (cold start):** "You're early. Nearby works best when neighbors join together. Share with 3 people on your block and watch what happens."

**Error Messages**
- **Location unavailable:** "We need your location to show what's nearby. That's kind of the whole point. Enable location access in Settings."
- **Photo upload failed:** "That photo didn't make it. Try again — good lighting helps it sell faster anyway."
- **Listing expired:** "This item is no longer available. It was probably great. Here's what else is nearby."

**Trust Signals**
- "Your neighbor since [month, year]" — displayed on profiles, replaces star ratings
- "Lives about a 3-minute walk from you" — distance without address
- "Completed 12 exchanges in your neighborhood" — activity without judgment
- "Also known to [mutual connection name]" — when available via contacts, with permission

## /evaluate
agent: Vigil
summary: Ran heuristic evaluation scoring 8 categories, identified 12 issues across severity levels.

We put the emerging design through a structured evaluation before anyone built anything. Scoring across eight UX heuristics revealed strong fundamentals in simplicity and learnability, but exposed gaps in feedback visibility, error prevention, and the trust model's cold-start vulnerability. Twelve specific issues were logged, categorized, and routed to the skills that own them.

### Output

**Heuristic Evaluation Summary**

| Heuristic | Score (1-5) | Key Finding |
|-----------|-------------|-------------|
| Visibility of system status | 3 | Batched notifications create uncertainty — did my interest get sent? |
| Match between system and real world | 5 | Walking time, neighborhood names, casual language — strong |
| User control and freedom | 4 | Can't retract interest once expressed — needs undo |
| Consistency and standards | 4 | Map + list views follow platform conventions well |
| Error prevention | 2 | No confirmation before posting. No duplicate detection for sellers |
| Recognition over recall | 4 | Previous pickup preferences remembered. Good affordances |
| Flexibility and efficiency | 3 | Power users (frequent sellers) lack batch posting tools |
| Help and documentation | 2 | No onboarding. New users dropped into empty map cold |

**Top Issues**
1. **P0 — Cold start death spiral.** New neighborhoods have no listings. No listings means no engagement. No engagement means no word-of-mouth. Must design seed content strategy. *Route: /fortify*
2. **P0 — No onboarding flow.** Users land on an empty map with no guidance. First-time experience is non-existent. *Route: /fortify*
3. **P1 — Interest confirmation gap.** After tapping "I want this," no immediate feedback. 15-minute batch delay feels like nothing happened. *Route: /journey*
4. **P1 — No duplicate listing detection.** Seller can accidentally post same item twice. *Route: /fortify*
5. **P2 — Undo missing on interest.** Changed your mind? Too bad. Need 30-second undo window. *Route: /journey*
6. **P2 — Accessibility of map view.** Map-first design excludes screen reader users entirely. *Route: /include*

## /fortify
agent: Vigil
summary: Identified and designed for 9 edge cases — ghost sellers, misrepresentation, cold starts, and abuse scenarios.

We stress-tested the design against real-world human behavior. People ghost. People misrepresent items. People use platforms to harass neighbors. Neighborhoods start with zero content. We designed for each of these — not with heavy-handed moderation, but with lightweight friction that makes bad behavior harder and good behavior easier.

### Output

**Edge Case Inventory**

**1. Seller Ghosts After Accepting**
- *Scenario:* Buyer walks to pickup location, seller doesn't show or respond.
- *Design:* If seller doesn't confirm exchange within 2 hours of agreed time, item auto-relists. Buyer gets "This one fell through — we've re-opened it so others can claim it." Seller gets gentle nudge: "Heads up, [Buyer] came by and you weren't available. Want to reschedule or pass it to someone else?"
- *Escalation:* 3 ghost events in 30 days triggers "Slow mode" — seller's future listings require explicit availability confirmation before going live.

**2. Item Misrepresentation**
- *Scenario:* "Gently used chair" turns out to be broken.
- *Design:* Post-exchange feedback is optional and binary: "As described" or "Not as described." No public reviews. 3 "Not as described" flags surface a private prompt to seller: "A few neighbors felt items didn't match descriptions. Adding detailed photos helps build trust."
- *No public shaming.* This is a neighborhood, not eBay.

**3. Cold Start — New Neighborhood**
- *Scenario:* User signs up, sees empty map.
- *Design:* Seed strategy in three layers:
  - **Personal:** Import from phone contacts who already use Nearby. "3 of your neighbors are already here."
  - **Content:** Partner with local buy-nothing groups to import existing listings (with permission).
  - **Incentive:** "Post your first item and we'll feature it at the top of your neighbors' feeds for 24 hours."

**4. No Listings in Radius**
- *Scenario:* Rural or low-density area with nothing within walking distance.
- *Design:* Expand radius automatically with transparency: "Nothing within 10 minutes. Showing items within a 30-minute walk." Allow bike/drive radius toggle for low-density areas without breaking the core metaphor.

**5. Harassment via Messaging**
- *Scenario:* Someone uses post-interest messaging to send inappropriate content.
- *Design:* Messages are pre-structured (quick replies only) until 3rd successful exchange between two users. Free-text unlocks only after established trust. Report button on every message. Reported users lose messaging immediately pending review.

**6. Prohibited Items**
- *Scenario:* Someone posts weapons, drugs, or stolen goods.
- *Design:* Photo + text classification at post time. Flagged items held for review before publishing. Community organizers get moderation tools for their neighborhood. Platform handles legal escalation.

**7. Price Gouging During Emergencies**
- *Scenario:* Generator listed for $2,000 during a power outage.
- *Design:* Price anomaly detection compares to historical averages. Items flagged as significantly above-market during declared emergencies get a visible notice: "This price is higher than usual for this item." No automatic blocking — but transparency.

**8. Duplicate Accounts / Sybil Attacks**
- *Design:* One account per phone number. Neighborhood assignment based on consistent geolocation over 7 days, not self-reported address.

**9. Abandoned Listings**
- *Scenario:* Items posted months ago, seller no longer active.
- *Design:* Listings expire after 14 days. Seller gets "Still available?" prompt at day 12. No response = auto-archive. Re-posting takes one tap.

## /include
agent: Vigil
summary: Audited accessibility across screen reader, keyboard, cognitive load, and motor access dimensions.

We confronted the hard truth that a map-first interface inherently excludes people who can't see maps. Rather than treating accessibility as a compliance layer, we redesigned the core experience to work across modalities — the list view isn't a secondary mode, it's an equal citizen. We also addressed cognitive load, motor access, and the specific challenges of a location-based app for people with disabilities.

### Output

**Accessibility Audit**

**Screen Reader Experience**
- **Map view:** Not accessible as primary interface. List view must be fully equivalent, not degraded.
- **Item cards:** Read as "[Item name], [price or Free], [walking time] away, posted by [neighbor name], [neighborhood tenure]"
- **Interest flow:** "Express interest in [item name]" button. Confirmation: "Interest sent. You'll be notified when [seller name] responds." Immediate confirmation — no reliance on 15-minute batch.
- **Navigation:** All tab bar items labeled. Active state announced. Map view announces "Map view — switch to list view for screen reader optimized browsing."

**Keyboard Navigation**
- Full tab-order through feed items, filters, and actions
- Arrow keys navigate between item cards in list view
- Enter to open item detail, Escape to close
- Skip link to main content (bypasses tab bar on each page load)
- Focus trap in modals (pickup coordination, messaging)

**Cognitive Accessibility**
- **Simplified language:** All copy at 6th-grade reading level. Tested via Hemingway Editor.
- **Predictable layout:** Tab bar never moves. Map/list toggle always in same position. No layout shifts.
- **Reduce choices:** Maximum 10 categories. No sub-categories. Fewer options, faster decisions.
- **Clear confirmation:** Every action gets explicit feedback. "Posted." "Interest sent." "Exchange complete."
- **Time pressure removed:** No countdown timers. No "3 others are interested" urgency tactics.

**Motor Accessibility**
- All tap targets minimum 44x44px (WCAG 2.2 AA)
- Swipe gestures always have tap alternatives
- Photo capture: support gallery upload as alternative to in-app camera
- "I want this" button positioned in easy-reach thumb zone on mobile
- No drag-to-adjust for radius slider — tap presets (5/10/20 min) also available

**Location-Specific Concerns**
- For users who cannot physically walk to pickups: allow "delivery request" flag visible to sellers
- Distance shown in time *and* distance: "4 min walk (0.2 mi)" for users who process spatial information differently

## /transpose
agent: Rune
summary: Analyzed mobile-first vs. web experience, designed for offline scenarios and cross-device continuity.

We designed Nearby for the reality that most exchanges happen on phones, on the move — someone walking past a "FREE" sign, someone browsing while sitting on their porch. But we also designed for the laptop-at-kitchen-table moment: batch-posting after a decluttering weekend, or browsing casually on a bigger screen. And we confronted the offline problem head-on, because not every sidewalk has signal.

### Output

**Platform Strategy**

**Mobile (Primary)**
- Native app (iOS + Android). This is where 90% of usage happens.
- Camera-first posting leverages phone hardware. Map view leverages GPS.
- Push notifications for interest, pickup reminders, and daily digest.
- Thumb-zone optimized: primary actions (post, browse, respond) reachable one-handed.
- Deep links from share: "Check out this bookshelf near you" opens directly to item.

**Web (Secondary)**
- Responsive web app at nearby.app. Same account, synced state.
- Optimized for: batch posting (upload multiple photos from desktop), browsing on larger screen, account management and settings.
- Map view uses larger canvas effectively — shows more of the neighborhood at once.
- No feature parity required. Web is a complement, not a clone.
- Web-specific: print-friendly view for community boards ("Post this QR code at your coffee shop").

**Offline Design**
- **Browsing:** Last-fetched items cached locally. Stale badge after 1 hour: "Last updated 2 hours ago. Connect to refresh."
- **Posting:** Draft items saved offline. Auto-publish when connection returns. "Your bookshelf will go live as soon as you're back online."
- **Interest:** Queued offline. Sent on reconnection. User sees "Interest will be sent when you're back online" with a pending indicator.
- **Location:** Last known location used if GPS unavailable. Items shown are approximate. Badge: "Showing items near your last known location."

**Cross-Device Continuity**
- Start browsing on phone while walking, continue on laptop at home
- Draft a listing on desktop (better keyboard for descriptions), photos from phone auto-attach via cloud sync
- Notifications respect device context: phone gets push, desktop gets none (no notification spam across devices)

## /localize
agent: Rune
summary: Mapped cultural adaptation needs for trust signals, payment norms, content, and RTL support.

We examined what happens when Nearby crosses cultural boundaries. A hyperlocal marketplace is deeply embedded in local norms — how people negotiate, how they build trust, what they're comfortable exchanging with strangers, and what "neighbor" even means. We mapped the changes needed for five distinct cultural contexts and surfaced the assumptions baked into the current design.

### Output

**Cultural Adaptation Matrix**

**Trust Signals by Market**
- **US/Canada:** Neighborhood tenure + mutual connections. "Your neighbor since 2024."
- **Japan:** Formality markers. Honorific-aware messaging. Platform mediates more — direct contact between strangers requires more ritual.
- **India:** Community and family references. "Also known in [community name]." Phone number verification weighted more heavily than in Western markets.
- **Germany:** Data minimalism. Showing "3-minute walk away" may feel invasive without explicit consent. Privacy controls front and center.
- **Brazil:** Social warmth. Profile photos important. Ability to leave friendly notes ("Adorei! Obrigada!") after exchanges. The social layer is the trust layer.

**Payment Patterns**
- **US:** Venmo/Cash. Cash at pickup. Price negotiation rare for low-value items.
- **India:** UPI (PhonePe, Google Pay) dominant. Cash still common. Price negotiation expected and healthy.
- **Japan:** Cash in envelope (even for small amounts). PayPay for digital. Price negotiation almost nonexistent — listed price is the price.
- **Mexico:** Cash dominant. MercadoPago for digital-savvy users. Negotiation expected.
- **Nearby's position:** Platform-agnostic on payment. Show "Payment: Arrange with seller" and let local norms govern.

**Content & Communication**
- **RTL support:** Full layout mirroring for Arabic, Hebrew, Urdu. Map controls, navigation, text alignment all flip.
- **Text expansion:** German labels 30-40% longer than English. Button labels must accommodate: "Interesse bekunden" vs "I want this."
- **Iconography:** Handshake icon (exchange complete) may not resonate in all cultures. Use checkmark as universal fallback.
- **Photo norms:** Some cultures avoid showing faces in listings. Ensure item-only photos are the norm, not the exception.
- **Modesty considerations:** Clothing listings in conservative markets need content guidelines that respect local norms.

**Regulatory**
- **GDPR (EU):** Location data is personal data. Explicit consent flow before any geolocation. Right to deletion includes all location history.
- **PIPL (China):** Data localization required. Separate infrastructure.
- **LGPD (Brazil):** Similar to GDPR. Portuguese-language privacy policy required.

### Philosopher

Does the Western marketplace model — individual sellers, posted prices, bilateral exchange — translate across cultures? In many communities, exchange is communal, not transactional. Things circulate through extended family networks, religious institutions, or community centers without ever being "listed." The bazaar model assumes negotiation. The gift economy model assumes reciprocity over time, not transaction by transaction. By building a marketplace app, are we importing a cultural frame that only fits some of our users? What would Nearby look like if it were designed for circular exchange rather than linear transactions?

## /measure
agent: Rune
summary: Defined success metrics focused on community health and trust density, not just transaction volume.

We rejected GMV as a north star. For Nearby, gross merchandise value is meaningless — a neighborhood where everyone gives things away for free is a more successful neighborhood than one where everyone haggles. Instead, we designed a measurement framework around exchange density, trust formation, and community health, with explicit counter-metrics to catch growth patterns that harm the product.

### Output

**Measurement Framework**

**North Star Metric**
*Weekly Exchange Density:* Completed exchanges per 1,000 households in a neighborhood per week. Target: 15+ exchanges/1k households/week in mature neighborhoods.

**Primary Metrics**
- **Activation rate:** % of signups who post or express interest within 7 days. Target: 40%.
- **Listing-to-exchange rate:** % of posted items that result in a completed exchange. Target: 60%.
- **Time to exchange:** Median hours from listing to completed pickup. Target: under 48 hours.
- **Repeat engagement:** % of users with 2+ exchanges per month. Target: 30%.

**Trust Metrics**
- **"As described" rate:** % of exchanges marked "As described" in optional feedback. Target: 90%+.
- **Ghost rate:** % of accepted interests where pickup doesn't happen. Target: under 10%.
- **Message-to-exchange ratio:** Lower is better — fewer messages means coordination is working. Target: under 3 messages per exchange.

**Community Health Metrics**
- **Neighborhood coverage:** % of city neighborhoods with 10+ active users. Growth should be geographic, not just aggregate.
- **Free item ratio:** % of listings priced at $0. A healthy community has at least 25% free items — generosity is a feature.
- **Organizer engagement:** % of neighborhoods with at least one active organizer. Target: 50%.

**Counter-Metrics (What We Refuse to Optimize)**
- **Time in app:** More time means the UX is failing, not succeeding. If someone browses for 20 minutes, discovery is broken.
- **Notification open rate:** Optimizing this leads to spam. Batch notifications exist for a reason.
- **GMV:** A free item exchanged is as valuable as a $50 item sold. GMV-chasing would push us toward eBay.
- **User acquisition cost blended:** Must track per-neighborhood, not aggregate. A cheap user in an empty neighborhood is worth nothing.

**Experimentation Plan**
- A/B test: Walking radius default (10 min vs 15 min) — impact on exchange density
- A/B test: Quick replies only vs free-text messaging from start — impact on ghost rate
- Holdback test: Daily digest feature — does it increase browse sessions without increasing time-in-app?

## /specify
agent: Sage
summary: Produced engineering handoff specs for the item card component, interest flow, and walking radius algorithm.

We translated design decisions into engineering-ready specifications. Every component got exact measurements, state definitions, interaction details, and API contract requirements. The walking radius algorithm — the core product differentiator — got its own specification with inputs, fallback logic, and performance requirements.

### Output

**Component Spec: Item Card**

**Variants:** Feed card (compact), Detail card (expanded), Map pin (minimal)

**Feed Card Layout**
- Container: full-width, 88px height, 12px padding, 8px border-radius
- Thumbnail: 64x64px, left-aligned, 4px border-radius, object-fit: cover
- Content area: left of thumbnail, 12px gap
  - Title: 16px/600 weight, single line, ellipsis overflow
  - Price: 14px/700 weight, primary color. "Free" uses accent green (#16a34a)
  - Distance: 12px/400 weight, secondary text color. Format: "4 min walk"
  - Neighborhood: 12px/400 weight, tertiary text color. "Capitol Hill"
- Tap target: entire card, navigates to detail view
- Swipe right: express interest (with haptic feedback)
- Accessibility: role="article", aria-label combines all text fields

**Interaction: Express Interest**
- **Trigger:** Tap "I want this" button or swipe right on feed card
- **Immediate feedback:** Button transitions to checkmark + "Interest sent" (150ms spring animation)
- **Undo window:** 5 seconds. Toast appears: "Interest sent. [Undo]"
- **API call:** `POST /v1/interest` with `{ itemId, buyerLocation: { lat, lng } }`
- **Batch behavior:** Server batches interest notifications to seller every 15 min. Client shows sent state immediately.
- **Error handling:** Network failure queues locally. Retry on reconnection. Badge: "Will send when online."
- **State management:** Optimistic update. Rollback on server rejection (item no longer available).

**Algorithm: Walking Radius**
- **Inputs:** User lat/lng, neighborhood density (households/km2), street network graph
- **Base radius:** 800m (approximately 10-minute walk)
- **Density adjustment:**
  - High density (>5,000 hh/km2): 400m radius (urban core)
  - Medium density (1,000-5,000 hh/km2): 800m radius (default)
  - Low density (<1,000 hh/km2): 1,600m radius (suburban/rural)
- **Barrier detection:** Highways, rivers, railways, and gated communities treated as hard boundaries. Walking radius does not cross barriers even if straight-line distance is within range.
- **Fallback:** If street network data unavailable, use straight-line distance at 1.3x multiplier (accounts for non-straight walking paths).
- **Performance:** Radius calculation must complete in <50ms. Cache per user location, invalidate on 200m movement.
- **Update frequency:** Density classification updates weekly. Barrier data updates monthly.
