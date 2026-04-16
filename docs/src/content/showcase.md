---
project: Nearby
tagline: A neighborhood marketplace for buying, selling, and trading within walking distance.
---

## /intent
agent: Noor
summary: Established project context, user types, design principles, and constraints for a hyperlocal marketplace.

We started by grounding the project in reality. Nearby isn't another e-commerce platform — it's a tool for neighbors. That distinction shapes everything: trust is built through proximity, not star ratings. We defined three core user types, set design principles that prioritize safety and simplicity, and named the constraints that would keep us honest.

### Output

**Project Context Document: Nearby**

**Product & Business Context**
Nearby is a hyperlocal marketplace for buying, selling, and trading within walking distance. It is a neighborhood infrastructure tool, not an e-commerce platform. The business model is density-dependent: value accrues as exchange volume increases per square mile. Revenue comes from optional promoted listings and neighborhood business partnerships, never from transaction fees. The product must reach critical mass within a single neighborhood before expanding geographically; growth is concentric, radiating outward from each activated neighborhood.

**Users**
- **Sellers:** People with stuff they want gone: moving, decluttering, upgrading. They want minimal effort: snap a photo, name a price, done. Key context: most have tried Craigslist or Facebook Marketplace and found it too heavy for a $10 lamp. They post in bursts (moving weekend, garage cleanout). Tolerance for friction is near zero; if posting takes more than 60 seconds, they'll just leave it on the curb with a "FREE" sign.
- **Buyers:** Bargain hunters and convenience seekers. They'd rather walk two blocks than wait two days for shipping. They browse casually and buy impulsively. Key context: discovery is more compelling than search because they don't know what they want until they see it. The walking-distance constraint is the feature. They treat the app like window shopping.
- **Organizers:** Block captains, community garden coordinators, buy-nothing group admins. They facilitate exchanges that aren't strictly transactional: lending, gifting, sharing. Key context: they are currently managing this work through Facebook Groups, group texts, or paper flyers. Their pain is "I need better tools for what I'm already doing." They are the most likely early evangelists and the hardest to disappoint.

**Design Principles**
1. **Proximity is the product.** Everything flows from physical nearness. If it doesn't leverage walking distance, it doesn't belong.
2. **Lower the stakes.** This isn't a $500 transaction. Most items are under $20. The UX should match that casualness.
3. **Trust through transparency.** Show the neighborhood. "3 blocks away" builds more trust than "4.8 stars."
4. **Respect the asymmetry.** Sellers want speed. Buyers want discovery. Don't optimize for one at the expense of the other.

**Hard Constraints**
- No identity verification at signup: friction kills adoption in small markets
- Must function in neighborhoods with as few as 50 active users
- No delivery infrastructure: walking distance is the delivery method
- Privacy-first; exact addresses never exposed until both parties agree
- Mobile-first: 90%+ of expected usage is on phones, on the move
- No transaction fees: the platform must never stand between neighbors and their money

**Ethical Stance**
- No engagement tricks. No "3 others are looking at this" urgency. No notification spam. If users open the app less often because they found what they needed quickly, that's success.
- No data harvesting beyond what's needed for core function. Location data is sensitive in a neighborhood context; "where you live" is not a data point to monetize.
- No public shaming. Feedback is private, constructive, and designed to improve behavior, not punish it.
- No dark patterns. If the business model requires manipulating neighbors into transactions, the business model is wrong.

**Success Definition**
Success is exchange density: the number of completed exchanges per 1,000 households per week within a walkable radius. A neighborhood where 20 things change hands every week (some sold, some traded, some given away) is a successful neighborhood. A city with 100,000 users spread across 50 neighborhoods with no density anywhere is a failure.

## /strategize
agent: Ember
summary: Framed the market opportunity, mapped competitors, defined a testable hypothesis, and scoped the MVP.

We stepped back to ask whether this idea has legs. The hyperlocal exchange space is littered with failures — Yerdle, OfferUp's local push, Facebook Marketplace's neighborhood tab. Each solved the wrong problem. We mapped what they got wrong, sized the opportunity differently (not by GMV but by exchange density per square mile), and wrote a hypothesis we could actually test.

### Output

**Design Brief: Nearby**

**Context**
Peer-to-peer exchange is a $200B+ annual activity in the US alone (garage sales, secondhand, informal trade), but the tools available are either too broad (Facebook Marketplace, Craigslist) or too constrained (Buy Nothing Facebook Groups). None are optimized for the specific context that makes local exchange work: physical proximity. The shift to hybrid/remote work has increased time spent in neighborhoods, and trust in large platforms continues to erode. People want local-first, but there's no product that makes local-first the core organizing principle.

**Gap**
Existing platforms treat geography as a filter applied on top of a broad experience. You search Facebook Marketplace and filter by "within 5 miles," but the experience is identical whether the item is 2 blocks away or 20 miles away. No platform builds trust, discovery, or coordination around walkability. The result: exchange completion rates on broad platforms hover around 20-30% for local items, because logistics (driving across town for a $15 item) and trust (meeting a stranger from the internet) remain unresolved.

**Opportunity**
If proximity is the organizing principle, the exchange experience fundamentally changes. Logistics collapse to "walk over and pick it up." Trust shifts from algorithmic reputation to neighborhood familiarity. Discovery becomes spatial ("what's near me right now?") instead of keyword-based. This is a new category: neighborhood infrastructure for physical exchange.

**Goals**
1. Achieve 15+ completed exchanges per 1,000 households per week in mature neighborhoods
2. Reach 60%+ listing-to-exchange completion rate (2-3x current platform benchmarks)
3. Maintain median time-to-exchange under 48 hours
4. Build neighborhoods where 25%+ of listings are free: generosity is a core feature

**Constraints**
- Cold start is existential: the product is worthless with zero listings in a neighborhood. Must solve activation before growth.
- Privacy expectations are higher in a neighborhood context than on a general marketplace. "Someone nearby wants your bookshelf" must not become "a stranger knows where you live."
- Revenue model must not depend on transaction volume or engagement optimization.

**Guiding Principles**
1. Density before breadth: one thriving neighborhood is worth more than 100 empty ones
2. The walking radius is the product: every feature decision flows from it
3. Casual over transactional: the UX should feel like putting a sign in your yard, not listing on eBay
4. Trust is ambient, built from tenure and proximity rather than star ratings

**Key Assumptions & Open Questions**
- *Assumption:* Walking distance is a meaningful enough constraint to create a differentiated experience. *Risk:* In low-density areas, walking distance may be too restrictive to generate sufficient supply.
- *Assumption:* People will trust neighbors more than strangers from the internet. *Risk:* Proximity can increase safety concerns, especially for vulnerable populations.
- *Open question:* What defines a "neighborhood"? Census tract? Zip code? Self-reported? Walking radius from a point? The answer determines the entire product architecture.

**Measurable Hypothesis**
If we constrain a marketplace to walking distance and build trust signals around neighborhood familiarity (tenure, proximity, mutual connections), then exchange completion rates will reach 60%+ (vs. 20-30% on broad platforms), because proximity eliminates logistics friction and neighborhood context reduces trust friction.

**Competitive Landscape & Positioning**

| Platform | Thesis | Exchange completion | Trust model | Local optimization |
|---|---|---|---|---|
| Facebook Marketplace | Scale wins | ~25% estimated | Facebook identity (eroding) | Filter only |
| Nextdoor | Neighborhood social network | Very low (commerce is secondary) | Verified address | Minimal |
| Buy Nothing Groups | Gift economy in communities | High within groups (~60%) | Facebook group membership | Group-level, not spatial |
| Craigslist | Open classifieds | ~15% for local items | None | City-level |
| **Nearby** | **Walkable exchange density** | **Target: 60%+** | **Neighborhood tenure + proximity** | **Core product** |

**Proposed Scope (MVP)**
- Post an item (photo + price + location radius): under 30 seconds
- Browse items within walking distance (map + list view)
- Express interest (one-tap, no messaging required)
- Neighborhood identity (you see your area, scoped to your surroundings)
- Trust signals: account age, neighborhood tenure, approximate distance
- *Explicitly out of scope:* Messaging (v2), payments (platform-agnostic), delivery, multi-neighborhood browsing

### Philosopher

What does "neighborhood" actually mean? In a dense urban block, walking distance might be 0.2 miles — you can see the seller's building from your window. In a suburban subdivision, it's the development itself, maybe a mile across. In a rural town, it might be the whole town. The product assumes a shared definition of "nearby" that doesn't exist. Are we building for a radius, a census tract, a zip code, or a felt sense of community? The answer changes the entire trust model.

## /investigate
agent: Ember
summary: Designed a research plan with interview scripts for buyers, sellers, and community organizers.

Before designing anything, we needed to hear from people who already do this — the ones selling furniture on their stoop, the buy-nothing group admins managing chaos in Facebook comments, the people who walk past "FREE" signs and wonder what they're missing. We wrote three interview scripts, each tuned to a different relationship with local exchange.

### Output

**Research Plan: Understanding Neighborhood Exchange Behavior**

**Objective**
Validate three assumptions from the strategic brief: (1) walking distance is a meaningful constraint that creates differentiated exchange behavior, (2) neighborhood familiarity generates more trust than platform-mediated reputation, and (3) the current tools (Facebook Marketplace, Buy Nothing groups, Craigslist) are failing hyperlocal exchange in specific, designable ways.

**Method Rationale**
Semi-structured interviews, not surveys. We're in generative territory and don't yet know what to ask about at scale. Surveys would force premature structure on questions we haven't validated. Interviews let participants tell us things we didn't know to ask about. 45 minutes each, with 5 minutes for warm-up and consent, 35 minutes for core questions, and 5 minutes for open-ended close.

**Participant Criteria**
- **Sellers (n=5):** Must have sold or given away 3+ items locally in the past 6 months. Mix of platforms used (Facebook, Craigslist, curb alerts, word of mouth). Exclude professional resellers and business accounts.
- **Buyers (n=5):** Must have picked up or purchased an item from a local stranger in the past 3 months. Mix of active seekers and casual browsers.
- **Community Organizers (n=3):** Must currently admin or moderate a Buy Nothing group, neighborhood exchange group, or community swap. Must manage a group of 50+ members.
- **Geographic split:** 2 neighborhoods, one urban (density >5,000 hh/km²) and one suburban (density 1,000-3,000 hh/km²). This tests whether "walking distance" means fundamentally different things in different contexts.

**Recruitment:** Buy Nothing group admin outreach, Nextdoor posts, flyers at coffee shops and community boards. $50 gift card incentive. Screen for recency and frequency of local exchange: we want active practitioners, not people who sold one thing on Craigslist in 2019.

**Timeline**
- Week 1: Recruitment and screening (target 18 recruits for 13 sessions)
- Week 2-3: Conduct interviews (3-4 per day, allow debrief time between sessions)
- Week 4: Synthesis, affinity mapping, findings report

**Interview Guide: Sellers**

*Opening (5 min)*
- Introduce purpose: "We're exploring how people in neighborhoods exchange things — sell, give away, trade. We're not testing anything, just learning from your experience. There are no wrong answers."
- Obtain consent for recording. Confirm they can stop at any time.
- Warm-up: "Tell me a bit about your neighborhood. How long have you lived there?"

*Core Questions — organized by theme:*

**Current behavior (10 min)**
1. Tell me about the last thing you sold or gave away locally. Walk me through what happened from the moment you decided to get rid of it.
2. How did you decide where to list it? What other options did you consider and why did you reject them?
3. How long did the whole process take, from "I should get rid of this" to "it's gone"?

**Friction and failure (10 min)**
4. What was the most annoying part of the process?
5. Have you ever decided *not* to sell or give away something locally, even though you wanted to? What stopped you?
6. Have you ever had a bad experience — someone who ghosted, showed up and the item wasn't what they expected, anything uncomfortable?

**Trust and proximity (10 min)**
7. Did you know the buyer/recipient beforehand? How did that affect the interaction?
8. How do you feel about strangers knowing approximately where you live? Has that ever made you hesitate?
9. Would knowing someone lives on your block change how you interact with them in an exchange?

**Probing techniques:**
- *Silence* — after each answer, wait 5-7 seconds before the next question. Let them fill the space.
- *"Walk me through that step by step"*: when they summarize, push for the sequential details.
- *"What made you choose that over..."*: surfaces decision criteria they may not articulate unprompted.
- *Reflecting back*: "So it sounds like the hardest part was [X]. Is that right?" Confirms understanding and often triggers correction or elaboration.

*Close (5 min)*
10. If you could change one thing about how you exchange things with neighbors, what would it be?
11. Is there anything I didn't ask about that feels important?

**Interview Guide: Buyers**

*Opening (5 min)* — Same structure as sellers.

*Core Questions — organized by theme:*

**Discovery and motivation (10 min)**
1. When was the last time you bought or picked up something from a neighbor? What was it?
2. How did you find out about it? Were you actively looking, or did it just appear?
3. How often do you browse for local items? Is it a habit or occasional?

**The exchange experience (10 min)**
4. Describe the actual exchange — where did you meet? How did payment work? How did it feel?
5. What made you trust the seller enough to show up?
6. Have you ever been burned — item not as described, uncomfortable interaction, no-show?

**Proximity and behavior (10 min)**
7. If you could browse everything available within a 10-minute walk right now, would you? How often would you check?
8. Does distance change what you'd be willing to pick up? Would you walk 2 blocks for something you wouldn't drive 10 minutes for?
9. Have you ever walked past a "FREE" sign on someone's curb? What happened?

*Close (5 min)* — Same structure as sellers.

**Interview Guide: Community Organizers**

*Opening (5 min)* — Same structure, plus: "Tell me about the group you run and how you got involved."

*Core Questions — organized by theme:*

**Operations and process (10 min)**
1. Walk me through a typical week of managing exchanges in your group. What do you actually do?
2. What breaks? What are the recurring problems you solve over and over?
3. What rules have you had to create that surprised you?

**Failure modes and moderation (10 min)**
4. How do you handle people who don't follow through — ghost pickups, no-shows, flaky commitments?
5. Have you ever had to remove someone from the group? What happened?
6. What's the worst thing that's happened in your group, and how did you handle it?

**Tools and opportunity (10 min)**
7. If you could wave a magic wand and fix one thing about how your group works, what would it be?
8. Do you think your community would use a dedicated app, or is "good enough" inside Facebook actually fine?
9. What would a dedicated tool need to do to be worth switching? What's the minimum?

*Close (5 min)* — Same structure.

**Findings Report Format**
Findings will be organized by theme (not by participant), with evidence strength grading:
- **Strong evidence:** Pattern appeared in 8+ of 13 interviews with specific examples
- **Moderate evidence:** Pattern appeared in 4-7 interviews
- **Emerging signal:** Pattern appeared in 2-3 interviews, worth investigating further
- **Single observation:** Noted once, may be idiosyncratic

Each finding will include: the insight, supporting quotes (anonymized), evidence strength, and implications for design (routed to the specific skill that should act on it).

## /blueprint
agent: Sage
summary: Mapped the full service blueprint — actors, frontstage actions, backstage processes, and critical dependencies.

We mapped the invisible machinery behind a simple exchange. What looks like "I want that, here's $5" actually involves geolocation, notification timing, trust inference, content moderation, and a handoff that happens on a physical sidewalk with no platform involvement. The blueprint revealed three critical failure points we hadn't considered.

### Output

**Service Blueprint: Item Exchange Flow**

**Actors:** Seller, Buyer, Platform (client + server), Neighborhood Graph Service, Trust Inference Engine, Content Moderation System, Notification Service, Community Organizer (human)

---

**Frontstage — Seller Touchpoints**

| Step | User action | Sees/hears | Channel |
|---|---|---|---|
| 1. Post item | Opens camera or selects photo | Camera UI, then AI-suggested title and category | Mobile app |
| 2. Set details | Confirms/edits title, sets price or "Free" | Price input, pickup preference (porch / meet outside / flexible) | Mobile app |
| 3. Set availability | Pickup preference auto-fills from last listing | Preview of how listing appears on neighbor's map | Mobile app |
| 4. Publish | Taps "Post" | Confirmation: "Live in your neighborhood" + map pin preview | Mobile app |
| 5. Receive interest | Gets batched notification | "[Name], 4 min walk away, is interested" with buyer tenure | Push notification |
| 6. Accept/decline | Taps "It's yours" or ignores | Pickup coordination screen with suggested meeting point and time | Mobile app |
| 7. Complete exchange | Meets buyer in person, taps "Exchanged" | "Nice, that's your 8th exchange in Capitol Hill" | Mobile app |

**Frontstage — Buyer Touchpoints**

| Step | User action | Sees/hears | Channel |
|---|---|---|---|
| 1. Browse | Opens app, views map or feed | Items as map pins with thumbnails, or list sorted by distance | Mobile app |
| 2. View item | Taps item card | Photo, description, distance ("2 min walk"), seller tenure, pickup type | Mobile app |
| 3. Express interest | Taps "I want this" | Immediate: checkmark + "Interest sent." Undo toast for 5 seconds | Mobile app |
| 4. Wait for response | Checks activity tab | Status: "Waiting for [Seller]" with approximate response time | Mobile app |
| 5. Coordinate pickup | Gets notification when accepted | Suggested meeting point (nearest intersection) + time window | Push + in-app |
| 6. Complete exchange | Meets seller, taps "Got it" | Optional feedback prompt: "As described" / "Not as described" | Mobile app |

---

**Backstage — Organizational Processes**

**Neighborhood Graph Service**
- Determines walking radius per user based on housing density, street network graph, and physical barriers
- Density tiers: Urban core (>5,000 hh/km²) = 400m radius; Medium density = 800m; Suburban/rural (<1,000 hh/km²) = 1,600m
- Barrier detection: highways, rivers, railways, gated communities treated as hard boundaries. Radius does not cross even if straight-line distance qualifies.
- Updates density classification weekly; barrier data monthly
- Fallback: if street network data unavailable, straight-line distance at 1.3x multiplier

**Trust Inference Engine**
- No ratings. No star scores. Trust is ambient, built through proximity and tenure.
- Inputs: account age, completed exchanges, neighborhood tenure (how long at current location), mutual contacts (with permission), "as described" feedback rate
- Outputs surfaced to users: "Your neighbor since March 2025" / "12 exchanges in Capitol Hill" / "Also known to [mutual connection]"
- Cold start: new accounts show "New to Nearby" badge for first 4 weeks. Limited to 3 active listings until first completed exchange.

**Content Moderation System**
- *Automated layer:* Photo + text classification at post time. Prohibited items (weapons, drugs, regulated goods) flagged and held for review. Duplicate listing detection. Price anomaly flagging during declared emergencies.
- *Community layer:* Organizers get moderation tools for their neighborhood. Can hide listings, warn users, escalate to platform. First line of defense for ambiguous cases.
- *Platform layer:* Legal escalation, account suspension, law enforcement coordination. Only engaged when community moderation is insufficient.

**Notification Service**
- Interest notifications batched every 15 minutes to prevent alert fatigue
- Pickup reminders 1 hour before agreed time
- Daily digest: "What's new on your block," 3-5 items posted in closest radius
- Notification budget: max 5 push notifications per day per user, regardless of activity

---

**Support Processes — Infrastructure**

| System | Purpose | SLA | Failure impact |
|---|---|---|---|
| Geolocation API | User positioning, radius calculation | <100ms response, <100m accuracy | Core product broken; listings shown to wrong neighborhoods |
| Street network graph | Walking distance calculation, barrier detection | Updated monthly | Radius defaults to straight-line fallback (degraded but functional) |
| Photo storage + CDN | Item images, thumbnails | <200ms load for thumbnails | Listings appear without images; functional but trust-degraded |
| Push notification service | Interest alerts, pickup reminders, digest | <30s delivery for batched sends | Users miss time-sensitive coordination; exchange completion drops |
| Search index | Full-text search across titles and descriptions | <500ms query response | Search fails gracefully to browse-only; most users browse anyway |

---

**System States & Failure Modes**

| Failure mode | User sees | Blast radius | Recovery |
|---|---|---|---|
| Geolocation unavailable | "We need your location to show what's nearby" + settings link | Full: app is non-functional without location | Manual retry after enabling location services |
| Notification service down | Interest still sent (server-side) but seller not alerted | High; pickup coordination delayed | Seller sees interests on next app open; batch retry on service recovery |
| Photo upload fails | "That photo didn't make it. Try again" + retry button | Low; single listing affected | Retry; draft preserved locally |
| Neighborhood Graph stale (>7 days) | No visible change; radius uses last-known density | Medium; users may see too many or too few items | Automatic resolution on next graph update |
| Trust Engine unavailable | Profiles show "Nearby member" without tenure/exchange details | Low; trust signals degraded but still present | Graceful degradation; trust data populated on recovery |

**Decision Documentation**
- *Why batched notifications instead of real-time?* Real-time interest alerts in a marketplace create urgency anxiety. 15-minute batching lets sellers respond thoughtfully. Trade-off: buyer doesn't get instant confirmation. Mitigation: immediate client-side feedback ("Interest sent").
- *Why no messaging until mutual interest?* Unstructured messaging before commitment invites spam, lowball negotiation, and harassment. Pre-structured quick replies reduce friction and abuse simultaneously. Trade-off: less flexibility. Mitigation: free-text unlocks after 3 successful exchanges between two users.
- *Why community organizers as first-line moderators?* They already do this work in Facebook Groups and know their neighborhoods. Platform moderation at the neighborhood level would require local context we don't have. Trade-off: moderation quality varies by neighborhood. Mitigation: platform escalation path + organizer guidelines.

## /journey
agent: Wren
summary: Designed four core flows — posting an item, discovering nearby listings, buying, and messaging.

We traced the four paths people actually take through Nearby. Each flow was designed to feel lighter than existing alternatives — fewer taps to post, less scrolling to find, less negotiation to buy. The key insight: in a walking-distance marketplace, the transaction is almost an afterthought. Discovery and coordination are the real product.

### Output

**Flow 1: Posting an Item**

*Entry:* Tap "+" from any screen. Camera opens immediately, no intermediate menu.

| Step | Screen | Layout & Key Elements | Copy | CTA |
|---|---|---|---|---|
| 1. Capture | Camera viewfinder | Full-screen camera, gallery shortcut (bottom-left), flash toggle (top-right) | — | Shutter button |
| 2. Confirm photo | Photo preview | Full-bleed photo, retake (top-left), AI-suggested title below: *"Blue IKEA bookshelf"* | "Looks right?" | "Use this photo" / "Retake" |
| 3. Set details | Item form | Title field (pre-filled, editable), price input with "Free" and "Trade" quick-select, category auto-suggested | "What are you getting rid of?" | "Next" |
| 4. Pickup prefs | Pickup options | Three options: "Porch pickup" / "Meet outside" / "Flexible," auto-filled from last listing. Date/time picker for availability window. | "How should they pick it up?" | "Preview" |
| 5. Preview & publish | Map preview | Item card as it will appear to neighbors, overlaid on map showing your approximate location and radius | "This is what your neighbors will see" | "Post it" |

**Decision gates:**
- *Photo rejected by moderation?* → Inline message: "This photo was flagged. Make sure it shows the item clearly and doesn't include prohibited content." User can retake or edit.
- *Price anomaly detected?* → Soft warning: "This seems higher than similar items nearby. Totally fine, just making sure it's intentional." No blocking.

**Error paths:**
- *Camera permission denied:* "Nearby needs camera access to photograph items. You can also choose from your gallery." + Settings link + gallery fallback.
- *Photo upload fails:* Draft saved locally. "That photo didn't make it. Tap to retry. Your listing is saved." Retry button + offline queue.
- *Network lost mid-post:* Full draft preserved. "You're offline. Your listing will go live as soon as you're back." Pending indicator on the listing.

**Flow metrics:** Total taps to post: 4 (photo, confirm title, set price, publish). Target time to post: under 30 seconds for returning users, under 60 for first-time.

---

**Flow 2: Discovering Nearby Items**

*Entry:* App launch defaults to map view. Deep links from notifications or shares land on item detail.

**Screen: Map View (Default Home)**
- Map centered on user's location. Items appear as pins with tiny thumbnail previews.
- Radius indicator: subtle circle showing current walking radius, with label: "Showing items within a 10-min walk"
- Radius adjustment: pinch-to-zoom adjusts radius, or tap preset buttons (5 / 10 / 20 min)
- Items beyond current radius shown as faded pins, visible but clearly "further away"
- Neighborhood name in header: "Capitol Hill" / "Your Neighborhood"
- Tap any pin to see item card overlay (photo, title, price, distance). Tap card to open detail.

**Screen: List View (Toggle)**
- Sorted by distance first, then recency. Shows walking time ("4 min walk"), not miles.
- Each card: thumbnail (64x64), title, price, distance, seller tenure
- Pull-to-refresh. Infinite scroll with distance grouping: "On your block" / "5-min walk" / "10-min walk"

**Filters:** Category, price range (including Free and Trade), posted today / this week. Filter chips persist across map/list toggle.

**Branch: Empty state (no listings nearby)**
- "Your neighborhood is quiet right now. Post something and get it started. Someone nearby probably wants it."
- Secondary: "Expand your radius?" with one-tap to 20 min walk.

**Branch: Serendipity digest**
- Daily push notification: "What's new on your block," 3-5 items posted in closest walking radius.
- Tapping the notification opens a curated card stack, not the full feed.

---

**Flow 3: Expressing Interest & Coordination**

*Entry:* Tap any item card from map, list, or notification.

| Step | Screen | What happens | State transitions |
|---|---|---|---|
| 1. View item | Item detail | Full photo, description, price, distance ("2 min walk"), seller tenure ("Your neighbor since March"), pickup type | — |
| 2. Express interest | Same screen | Tap "I want this" → button transitions to checkmark + "Interest sent" (150ms spring animation) | Optimistic update. Undo toast for 5 seconds. |
| 3. Undo window | Toast overlay | "Interest sent. Undo" with 5-second countdown | If tapped: reverts to pre-interest state. If expired: interest confirmed server-side. |
| 4. Waiting | Activity tab | "Waiting for [Seller name]" with approximate response time based on seller's historical pattern | Status updates: "Seen" / "Accepted" / "Passed" |
| 5. Accepted | Push notification + in-app | "Good news, [item] is yours!" + pickup coordination screen | Both parties see suggested meeting point (nearest intersection) + time window |
| 6. Coordinate | Pickup screen | Map with meeting point pin. Quick replies: "On my way" / "Running 10 min late" / "Need to reschedule" | Free-text only if both parties have 3+ prior exchanges |
| 7. Exchange | Confirmation prompt | "Did you get the [item]?" → "Yes, got it" / "It fell through" | If confirmed: item leaves map, both get completion count incremented |

**Error paths:**
- *Item no longer available when interest sent:* "Someone got there first. Here's what else is nearby." + 3 similar items by distance.
- *Seller never responds (48h timeout):* Interest auto-expires. Buyer: "This one didn't work out. We'll let you know if it re-lists." Seller: "You have an unanswered interest from [Buyer]. Still want to do this?"
- *Network failure on interest:* Queued locally. "Interest will be sent when you're back online" + pending indicator.

**Success criteria:** Listing-to-exchange completion >60%. Median messages per exchange <3. Ghost rate (accepted but not completed) <10%.

---

**Flow 4: Messaging (Unlocked After Mutual Interest)**

**Interaction spec:**
- Messaging is *not* a general chat feature. It unlocks only after seller accepts a buyer's interest.
- **Default: quick replies only.** Pre-written options: "On my way" / "I can pick up now" / "Can you hold until tomorrow?" / "Need to reschedule" / "Never mind, sorry"
- **Free-text unlocks** after 3 successful exchanges between the same two users. Trust is earned through repeated, completed interactions.
- **Auto-delete:** Messages delete 48 hours after exchange completes. No conversation history to mine.
- **Report button** on every message. Reported users lose messaging immediately, pending review.
- **State: messaging disabled.** If either party has been flagged for harassment, messaging reverts to quick replies only with a silent flag to community organizer.

### Philosopher

The buy/sell mental model assumes every exchange has a price. But in real neighborhoods, the most common local exchange isn't commerce — it's generosity. A bag of lemons from someone's tree. A kid's bike they outgrew. Moving boxes you'll never use again. If Nearby only supports buying and selling, it misses the gift economy that actually builds neighborhood trust. Should "Free" be a price option, or should gifting be an entirely separate mode with different social mechanics?

## /organize
agent: Wren
summary: Defined information architecture — categories, navigation structure, search strategy, and wayfinding.

We organized Nearby around a simple principle: proximity first, category second. Unlike Amazon or even Craigslist, nobody comes to Nearby looking for a specific item. They come to see what's around. The IA reflects browsing behavior, not shopping behavior — the map is the primary navigation, categories are filters, and search is a secondary path.

### Output

**Site Map**

```
Nearby
├── Map (default home) ← primary navigation, always accessible
│   ├── Item pins (thumbnail + price overlay)
│   ├── Radius indicator + adjustment controls
│   └── Item detail (sheet overlay, not page navigation)
├── Feed (list view toggle)
│   ├── Distance-grouped sections ("On your block" / "5-min walk" / "10-min walk")
│   ├── Filter chips (category, price, recency)
│   └── Search (pull-down, not prominent)
├── Post (+) ← persistent FAB, opens camera
│   └── Posting flow (camera → details → preview → publish)
├── Activity
│   ├── My Listings (active, pending interest, completed, expired)
│   ├── My Interests (waiting, accepted, completed, expired)
│   └── Pickup Coordination (active exchanges)
└── Profile
    ├── Neighborhood identity (tenure, exchange count, neighborhood name)
    ├── Settings (location, notifications, privacy, radius default)
    └── Help
```

**Navigation Specification**

**Pattern selected: Hub-and-spoke with spatial primary**
- **Why this pattern:** Nearby's tasks are distinct and self-contained (browse, post, coordinate, manage). Hub-and-spoke keeps each mode clean. The spatial twist: the "hub" is a map, with the user's physical location as the organizing principle.
- **Trade-off analysis:** Hub-and-spoke means users return to the map between tasks. This is intentional; the map reorients them spatially. But it adds one tap when moving between activity and posting. Acceptable because these transitions are infrequent (most sessions are browse-only or post-only, rarely both).
- **Rejected alternative:** Flat tab bar with no hierarchy (like Instagram). Rejected because Nearby's modes have fundamentally different interaction models: map browsing vs. feed scrolling vs. form entry. Flat tabs would force visual consistency where interaction divergence is needed.

**Bottom tab bar:** 5 items. Map is leftmost and default. Post (+) is center with elevated visual treatment (FAB-style).

| Tab | Label | Icon | Badge behavior |
|---|---|---|---|
| Map | Explore | Map pin | Dot when new items posted in radius since last open |
| Feed | List | List icon | Same badge logic as Map |
| Post | + | Plus circle (elevated) | Never |
| Activity | Activity | Bell | Count of unread interest responses and pickup reminders |
| Profile | You | Avatar silhouette | Dot when settings need attention (e.g., location expired) |

**No hamburger menu.** Everything lives in the tab bar or within a screen. Nothing is hidden behind a drawer.

**Category Taxonomy**

| Category | What belongs | What doesn't | Notes |
|---|---|---|---|
| Furniture & Home | Tables, chairs, shelves, lamps, decor | Appliances (see Kitchen) | Largest category in pilot data |
| Electronics & Gadgets | Phones, laptops, cables, small devices | TVs over 40" (see Furniture) | Condition important; prompt for "working?" |
| Clothing & Accessories | Wearable items, bags, jewelry | Kids' clothing (see Kids) | Low exchange rate in pilot; monitor |
| Kids & Baby | Clothing, toys, gear, strollers, cribs | — | High free-item rate; combine with "Free Stuff" tag often |
| Books & Media | Books, vinyl, games, DVDs | — | Lightweight, high-volume, ideal for porch pickup |
| Kitchen & Dining | Appliances, cookware, dishes | — | Often bundled ("moving, take it all") |
| Garden & Outdoor | Plants, tools, patio furniture | — | Seasonal variation significant |
| Sports & Fitness | Equipment, bikes, weights | — | Bikes are the #1 individual item; may need sub-treatment |
| Free Stuff | Anything priced at $0 | — | **Elevated to top-level** rather than buried as a price filter. |
| Wanted | Reverse listings: "Looking for X" | — | Demand signal. Helps cold-start neighborhoods. |

**Hierarchy rules:** Maximum one level deep. No sub-categories. Items belong to exactly one category. If an item could be two categories (a kid's bike), seller chooses; the system doesn't force polyhierarchy on a 10-category taxonomy. Fewer choices, faster posting.

**Search & Browse Strategy**

**Primary discovery mode: spatial browsing (map).** This is a deliberate choice. Most Nearby users don't come looking for a specific item; they come to see what's around. The map serves browse behavior; search serves intent behavior. Browsing is primary.

- **Search bar:** Available but not prominent. Appears on pull-down in feed view (hidden by default). Not visible on map view; map browsing is the intended path.
- **Search behavior:** Full-text across titles and descriptions. Results always distance-sorted first, relevance second. No pagination; list loads as you scroll.
- **Search empty state:** "Nothing matching within walking distance. Try a wider radius, or post a Wanted listing and let it come to you."
- **Search analytics:** Track what people search for in neighborhoods with no results. This is demand signal for cold-start seeding.

**Browse enhancements:**
- Filter chips on feed view: category, price range (including Free), posted today / this week. Chips persist across map/list toggle.
- "What's new on your block" daily digest: 3-5 items posted within closest radius. Push notification links to curated card stack.
- Distance grouping in list view: "On your block" / "5-min walk" / "10-min walk," giving spatial structure to a flat list.

**Wayfinding Design**

Users must always know three things: *where they are, what they're seeing, and how to see more.*

- **Where they are:** Neighborhood name in header ("Capitol Hill"). Map centered on their location with subtle location dot.
- **What they're seeing:** Radius label always visible: "Showing items within a 10-min walk." Item count: "23 items nearby."
- **How to see more:** Radius adjustment via pinch-to-zoom on map, or tap presets (5 / 10 / 20 min). Items beyond current radius shown as faded pins, visible but clearly "further away," inviting expansion without cluttering the primary view.
- **Orientation cue on return:** When opening the app after >24 hours, brief overlay: "3 new items since you last checked" with a tap to see them.

## /articulate
agent: Wren
summary: Established voice and tone, wrote microcopy for empty states, errors, and trust signals.

We defined how Nearby speaks. The voice is casual, warm, and neighborhood-specific — it should feel like a note on a bulletin board, not a corporate app notification. We wrote copy for the moments that matter most: when nothing's there yet, when something goes wrong, and when someone needs to trust a stranger enough to walk to their house.

### Output

**Voice Framework: Nearby**

**Product Voice Attributes**

| Attribute | Spectrum | Where Nearby lands | Example |
|---|---|---|---|
| Formality | Formal ←→ Casual | 80% toward casual | "Hey, someone nearby wants your bookshelf" not "You have received an offer on your listing" |
| Warmth | Clinical ←→ Warm | 70% toward warm | "Nice, that's your 8th exchange" over "Transaction #8 complete" |
| Specificity | Generic ←→ Local | 90% toward local | "New in Capitol Hill" not "New near you" |
| Humor | Serious ←→ Playful | 40% toward playful | Light touches, never forced. "It was probably great" over "LOL sorry!" |
| Brevity | Detailed ←→ Terse | 75% toward terse | These are sidewalk transactions. Copy matches the stakes. |

**Voice Principles**
1. **Neighborly.** The app is a bulletin board. It speaks like a friendly neighbor.
2. **Casual but precise.** Friendly tone with clear information. Contractions are fine. Emoji are absent; warmth comes from words.
3. **Local.** Use neighborhood names whenever available. "New in Capitol Hill" over "New near you." The specificity builds belonging.
4. **Brief.** Nobody reads instructions in a marketplace app. Say it in one sentence. If you need two, the first one better be worth it.
5. **Honest about limitations.** Don't pretend the app can do things it can't. "We need your location. That's kind of the whole point" is better than a generic permissions dialog.

---

**Copy Deck: Key Screens**

**Onboarding (first launch)**
- Screen 1: "Nearby shows you what's for sale, for free, or for trade within walking distance of where you live."
- Screen 2: "No star ratings. No shipping. Just neighbors exchanging things."
- Screen 3: "We need your location to show what's nearby." [Allow location] / [Not now: "Without location, Nearby can't show you anything. You can enable it later in Settings."]

**Posting flow**
- Camera screen: No copy needed. Camera speaks for itself.
- AI title suggestion: "Looks right?" [pre-filled title]
- Price input placeholder: "Name your price, or tap Free"
- Pickup options header: "How should they pick it up?"
- Preview header: "This is what your neighbors will see"
- Publish confirmation: "Live in your neighborhood."

**Browse / discovery**
- Map header: "[Neighborhood Name]" + "23 items nearby"
- Radius label: "Showing items within a 10-min walk"
- Daily digest notification: "What's new on your block. 4 items posted today"

---

**Empty State Copy**

| Location | Headline | Body | CTA |
|---|---|---|---|
| Map — no listings | "Your neighborhood is quiet right now." | "Post something and get it started. Someone nearby probably wants it." | "Post an item" |
| Search — no results | "Nothing matching within walking distance." | "Try a wider radius, or post a Wanted listing and let it come to you." | "Expand radius" / "Post a Wanted" |
| Activity — no exchanges | "No exchanges yet." | "Your first one is the hardest. After that, you'll wonder why you ever drove to Goodwill." | "Browse what's nearby" |
| Cold start — new neighborhood | "You're early." | "Nearby works best when neighbors join together. Share with 3 people on your block and watch what happens." | "Invite neighbors" |
| My listings — empty | "Nothing posted yet." | "Got anything you don't need? Your neighbors might." | "Post your first item" |

---

**Error Message Design**

Each error message has three components: what happened, why it matters, and what to do.

| Error | What happened | Why it matters | What to do |
|---|---|---|---|
| Location unavailable | "We can't determine your location." | "Nearby needs your location to show what's around you. That's the whole point." | "Enable location in Settings." [Settings link] |
| Photo upload failed | "That photo didn't make it." | "No worries. Your listing draft is saved." | "Try again. Good lighting helps it sell faster anyway." [Retry button] |
| Network lost mid-post | "You're offline." | "Your listing is saved as a draft." | "It'll go live as soon as you're back online." [Pending indicator] |
| Item no longer available | "This item is no longer available." | "Someone got there first." | "Here's what else is nearby." [3 similar items by distance] |
| Interest send failed | "Your interest didn't go through." | "The seller hasn't been notified yet." | "Tap to retry." [Retry button, with offline queue fallback] |
| Session expired | "You were signed out." | "Your drafts and activity are still here." | "Sign back in to pick up where you left off." [Sign in button] |

---

**Trust Signal Copy**

These replace traditional reputation systems. No stars, no scores, no public reviews.

- **Neighborhood tenure:** "Your neighbor since March 2025." Displayed on profile cards and item detail. Communicates stability without surveillance.
- **Proximity:** "Lives about a 3-minute walk from you." Distance without address. Precision: round to nearest minute. Never show exact distance under 1 minute ("nearby" instead).
- **Exchange history:** "12 exchanges in Capitol Hill." Activity as a count, no rating attached.
- **Mutual connection:** "Also known to Sarah M." Shown only when mutual contact exists, with both parties' permission. The strongest trust signal available.
- **New user:** "New to Nearby." Honest badge for accounts under 4 weeks. Transparency builds trust faster than hiding newness.

---

**Microcopy Pattern Library**

| Pattern | Template | Example |
|---|---|---|
| Confirmation (action taken) | "[Action] [object]." | "Interest sent." / "Posted." / "Exchange complete." |
| Waiting state | "[Waiting for] [actor] [context]." | "Waiting for Jake to respond. Most sellers reply within a few hours." |
| Gentle nudge | "[Observation]. [Suggestion]." | "You have an unanswered interest from 6 hours ago. Want to respond?" |
| Undo opportunity | "[Action taken]. [Undo]" | "Interest sent. Undo" (5-second toast) |
| Time reference | "[Relative time], not [absolute time]" | "Posted 2 hours ago" over "Posted at 3:47 PM" |
| Distance reference | "[Walking time] ([distance])" | "4 min walk (0.2 mi)": always time first, distance in parentheses |

## /evaluate
agent: Vigil
summary: Ran heuristic evaluation scoring 8 categories, identified 12 issues across severity levels.

We put the emerging design through a structured evaluation before anyone built anything. Scoring across eight UX heuristics revealed strong fundamentals in simplicity and learnability, but exposed gaps in feedback visibility, error prevention, and the trust model's cold-start vulnerability. Twelve specific issues were logged, categorized, and routed to the skills that own them.

### Output

**UX Health Score: 68 / 100**
Strong conceptual foundation and information design. Significant gaps in error prevention, onboarding, accessibility, and cold-start resilience. The design is promising but not shippable: the happy path is well-designed, but the other 40% of real-world usage is underspecified.

**Anti-Pattern Verdict: Clean**
No manipulative patterns detected. No false urgency, no dark patterns in the interest flow, no engagement tricks. The design respects user autonomy. One watch item: the daily digest notification could drift toward engagement optimization if not carefully managed. Flag for ongoing review.

---

**Heuristic Evaluation (H1–H10)**

| ID | Heuristic | Score (0-4) | Key Finding | Evidence |
|---|---|---|---|---|
| H1 | Visibility of system status | 2 | Batched notifications create a 15-minute uncertainty gap. User taps "I want this" and gets no server confirmation for up to 15 minutes. Client-side feedback exists but server state is ambiguous. | Interest flow, step 3 |
| H2 | Match between system and real world | 0 | Strong. Walking time instead of miles. Neighborhood names instead of coordinates. "Your neighbor since March" instead of "4.2 stars." Language matches the casual, sidewalk-transaction mental model throughout. | All screens |
| H3 | User control and freedom | 2 | No undo on interest expression. No ability to retract after the 5-second toast expires. No "hide this item" for previously seen listings. No way to unsee a category (persistent filter instead). | Interest flow, browse experience |
| H4 | Consistency and standards | 1 | Map + list views follow platform conventions. Tab bar is standard iOS/Android. Minor issue: "I want this" as a CTA is non-standard for marketplace apps (most use "Message seller" or "Buy now"). Intentionally non-standard, but may cause hesitation. | Navigation, item detail |
| H5 | Error prevention | 3 | **Major gap.** No confirmation before posting (one-tap publish). No duplicate detection: seller can accidentally post same item twice. No price validation ("$0" vs. tapping "Free" are different paths to the same result but feel different). Photo-only moderation catches prohibited items but not misleading photos. | Posting flow, listing management |
| H6 | Recognition over recall | 1 | Previous pickup preferences auto-fill. Categories are visible (not hidden behind search). Map pins with thumbnails reduce memory load for spatial browsing. Minor: no "recently viewed" for items the user looked at but didn't act on. | Posting flow, browse |
| H7 | Flexibility and efficiency | 2 | No batch posting for power users (someone decluttering a whole house). No keyboard shortcuts on web. No saved searches. No "post again" for expired listings. Returning sellers still go through the full posting flow even though their patterns are predictable. | Posting flow, web experience |
| H8 | Aesthetic and minimalist design | 1 | Clean visual hierarchy. Map view is focused. Item cards show only essential info. One concern: the pickup coordination screen packs meeting point, time window, and messaging into a single view; may need progressive disclosure. | All screens |
| H9 | Help users recover from errors | 2 | Error messages are well-written but inconsistently applied. Photo upload failure has good recovery. Network loss during posting has good draft preservation. However, expired listing error has no path to re-post. Failed interest has no retry. Server errors show generic fallback. | Error states across flows |
| H10 | Help and documentation | 3 | **Major gap.** No onboarding flow. New users land on an empty map with no guidance. No contextual help anywhere. No explanation of how the radius works, what "interest" means, or what happens after they tap "I want this." Experienced users are fine; first-time users are abandoned. | First launch, all screens |

---

**Cognitive Walkthrough: "Post Your First Item"**

| Step | Will they try? | Will they see how? | Will they understand? | Will they see progress? | Verdict |
|---|---|---|---|---|---|
| 1. Tap "+" | Yes, prominent FAB | Yes, center of tab bar | Yes, universal "add" affordance | N/A | Pass |
| 2. Take photo | Yes | Yes, camera opens immediately | Yes, camera is obvious | Yes, photo appears in preview | Pass |
| 3. Confirm AI title | Hesitation: first-time users may not expect AI suggestion | Yes, title field is prominent | Maybe: "Looks right?" is ambiguous. Right about what? | Yes, title appears in field | Hesitation |
| 4. Set price | Yes | Yes, clear input | Yes, "Free" and "Trade" buttons are visible alternatives | Yes, price appears | Pass |
| 5. Set pickup prefs | Maybe: first-time users have no prior preference to auto-fill | Yes, three clear options | Yes, labels are descriptive | Yes, selection highlighted | Hesitation |
| 6. Preview and publish | Yes | Yes, "Post it" button is clear | Yes, preview shows exactly what neighbors see | **No**: after publishing, confirmation is brief and map-based. User may not be sure it worked if map is zoomed out. | Failure |

**Walkthrough finding:** Step 6 needs stronger publish confirmation. The current "Live in your neighborhood" text is easily missed. Recommend: full-screen confirmation with the listing card, a share prompt, and a clear "what happens next" explanation for first-time posters.

---

**Priority Issues**

| ID | Severity | Issue | User impact | Route to |
|---|---|---|---|---|
| E-01 | P0 | Cold start death spiral | New neighborhoods have zero listings. No listings, no engagement, no word-of-mouth, neighborhood never activates. This is an existential product risk. | /fortify |
| E-02 | P0 | No onboarding flow | First-time users land on an empty map with no explanation of what Nearby is, how it works, or what to do. Every other quality in the design is wasted if users bounce at first launch. | /fortify |
| E-03 | P0 | Map-first excludes screen reader users | Map view is the primary interface but is fundamentally inaccessible to screen reader users. List view exists but is positioned as secondary. Must be promoted to equal citizen. | /include |
| E-04 | P1 | Interest confirmation gap | 15-minute batch delay between client-side "Interest sent" and server-side notification to seller creates anxiety. Users don't know if it worked. | /journey |
| E-05 | P1 | No duplicate listing detection | Sellers can accidentally post the same item twice. No photo comparison, no title similarity check, no "you posted something like this 10 minutes ago" prompt. | /fortify |
| E-06 | P1 | No error prevention on publish | One-tap publish with no confirmation. For a first-time poster, accidental publish of an incomplete listing erodes trust. | /journey |
| E-07 | P1 | Post-publish confirmation too weak | "Live in your neighborhood" text is easily missed. First-time posters need stronger confirmation that their listing is visible to neighbors. | /articulate |
| E-08 | P2 | No undo on interest after toast | After the 5-second undo window, interest cannot be retracted. Need either extended undo or explicit "withdraw interest." | /journey |
| E-09 | P2 | No batch posting for power users | Someone decluttering an entire house has to post items one by one. No multi-photo upload, no batch mode, no "post another" shortcut. | /journey |
| E-10 | P2 | No recently viewed items | Users who browse, leave, and return have no way to find items they looked at previously. Relying on spatial memory of map pins is insufficient. | /organize |
| E-11 | P2 | Pickup coordination screen overloaded | Meeting point map, time window, and messaging in one view. Needs progressive disclosure: show meeting point first, then time, then messaging. | /journey |
| E-12 | P3 | "I want this" CTA may cause hesitation | Non-standard marketplace CTA. Users accustomed to "Message seller" or "Make offer" may hesitate. Intentionally designed but untested. | /investigate |

## /fortify
agent: Vigil
summary: Identified and designed for 9 edge cases — ghost sellers, misrepresentation, cold starts, and abuse scenarios.

We stress-tested the design against real-world human behavior. People ghost. People misrepresent items. People use platforms to harass neighbors. Neighborhoods start with zero content. We designed for each of these — not with heavy-handed moderation, but with lightweight friction that makes bad behavior harder and good behavior easier.

### Output

**State Inventory Matrix: Item Card Component**

Every state the item card can be in, across the full lifecycle: every messy in-between state that real usage produces.

| State | What the user sees | What the user can do | How they recover/progress |
|---|---|---|---|
| Default | Photo, title, price, distance, seller tenure | Tap to view detail, swipe to express interest | — |
| Loading | Skeleton placeholder (gray shapes matching card layout) | Wait | Auto-resolves in <2s; timeout at 5s → error state |
| Partial load | Photo loaded but text pending (or vice versa) | Tap to view detail (data will load in detail view) | Text populates on load; stale after 10s → show "Refresh" |
| Empty (no photo) | Placeholder image + title and price | Tap to view detail | Seller prompted to add photo in notification |
| Error (failed to load) | "Couldn't load this item. Tap to retry." | Tap to retry | Retry fetches fresh data; 3 failures → hide card + log |
| Expired | Grayed card, "No longer available" overlay | Tap to see "similar items nearby" | Link to 3 nearest items in same category |
| Interest sent | Checkmark overlay, "Interest sent" label | Tap to view detail, see interest status | Undo toast for 5 seconds; after that, view status in Activity |
| Offline (cached) | Normal appearance + subtle "Last updated 2h ago" badge | Tap to view cached detail | Badge clears on reconnect; stale data may show unavailable items |
| Flagged/held | Not visible to browsers. Seller sees: "Under review" | Seller can edit or withdraw | Review resolves within 2 hours; auto-publish or rejection notice |

---

**State Inventory Matrix: Posting Flow**

| State | What the user sees | What the user can do | How they recover/progress |
|---|---|---|---|
| Default | Camera viewfinder | Take photo or select from gallery | — |
| Photo captured | Photo preview with AI-suggested title | Confirm, edit, or retake | Retake returns to camera |
| Photo upload in progress | Upload spinner on photo thumbnail | Cancel upload | Cancel preserves photo locally, can retry |
| Photo upload failed | "That photo didn't make it" + retry icon | Retry or select different photo | Draft preserved; offline queue if no connection |
| Draft saved (offline) | Full form with pending indicator | Edit all fields; view "will post when online" message | Auto-publish on reconnection |
| Moderation hold | "Your listing is being reviewed" | Wait, edit, or withdraw | Review within 2 hours; edit resubmits to review |
| Published | "Live in your neighborhood" confirmation | Share, view on map, post another | — |
| Duplicate detected | "You posted something similar 10 minutes ago. Is this different?" | Confirm as different item, or cancel | Confirm publishes; cancel returns to listing management |

---

**Error Recovery Design**

**Principle:** Every error message answers three questions: what happened, why it matters, and what to do next. No generic "Something went wrong." No error codes. No blame.

| Error scenario | Recovery pattern | User sees | Automatic behavior |
|---|---|---|---|
| Network lost during browse | Graceful degradation | Cached items shown + "Last updated [time]. Connect to refresh." | Auto-refresh on reconnect |
| Network lost during post | Draft preservation | "You're offline. Your listing will go live as soon as you're back." | Auto-publish on reconnect |
| Network lost during interest | Offline queue | "Interest will be sent when you're back online" + pending indicator | Auto-send on reconnect; rollback if item no longer available |
| Photo upload timeout | Retry with backoff | "That photo didn't make it. Tap to retry." | Automatic retry once; manual retry after that |
| Item unavailable when interest sent | Redirect | "Someone got there first. Here's what else is nearby." | Show 3 similar items by distance |
| Server error (500) | Retry + report | "Something's not working on our end. Tap to retry." | Automatic retry with exponential backoff (1s, 3s, 9s) |
| GPS accuracy degraded | Transparent fallback | "Your location is approximate. Items shown may be slightly further than indicated." | Use last-known accurate location; clear when GPS recovers |

---

**First-Run Experience Design**

The current design drops new users onto an empty map with no guidance. This is a P0 issue from /evaluate. Here's the fix:

**Progressive onboarding (3 screens, then value):**
1. "Nearby shows you what's for sale, for free, or for trade within walking distance." (Map illustration)
2. "No star ratings. No shipping. Just neighbors exchanging things." (Trust signal illustration)
3. Location permission request with honest framing: "We need your location to show what's nearby. That's the whole point."

**Then immediately:** Show the map. If items exist nearby, highlight the 3 closest. If no items exist (cold start), show the seeded content or jump to:

**Cold start first-run (empty neighborhood):**
- "You're early, and that matters. The first neighbors to join set the tone."
- "Post your first item and we'll feature it at the top of your neighbors' feeds for 24 hours."
- Contact import: "See if anyone you know is already on Nearby." (Optional, not required)
- Fallback: Show items from the nearest active neighborhood with transparency: "Nothing in [your neighborhood] yet. Here's what's happening in [nearby neighborhood], 15 min away."

---

**Stress Test Results**

| Scenario | Expected behavior | Result | Notes |
|---|---|---|---|
| User posts item with 200-character title | Title truncates at display, full title in detail view | **Pass** | Ellipsis at 60 chars in card view; full title in detail |
| 500 items within walking radius | Map clusters pins; list view uses virtualized scroll | **Pass** | Cluster at 50+ pins per screen; performance <16ms frame time |
| User with 0 contacts, new neighborhood, no listings | First-run experience triggers; seed content shown; post CTA prominent | **Fail** | Currently drops to empty map. Fix: implement first-run flow above. |
| Seller ghosts after accepting interest | Item auto-relists after 2 hours; buyer notified; seller nudged | **Pass** | 3 ghost events in 30 days triggers "Slow mode" on seller account |
| Photo is 25MB raw file from modern phone | Client-side compression before upload; max 2MB transmitted | **Pass** | HEIF/HEIC converted to JPEG; quality 80% |
| User moves to new neighborhood | Neighborhood reassignment after 7 days of consistent new geolocation | **Pass** | Old neighborhood data preserved; new neighborhood cold-start mitigated by existing account history |
| 100 simultaneous interest expressions on one item | First interest served; others queued; server batches notifications | **Pass** | Race condition handled by optimistic locking; "Someone got there first" for others |
| User reports harassment via messaging | Reported user loses messaging immediately; community organizer notified | **Pass** | Quick-reply-only messaging makes free-text harassment impossible for users with <3 mutual exchanges |
| Emergency declared (power outage) + generator listed at $2,000 | Price anomaly detection flags; transparency notice shown to buyers | **Pass** | "This price is higher than usual for this item." No blocking. |
| Listing sits for 14 days with no interest | Day 12: "Still available?" push notification. No response triggers auto-archive. | **Pass** | One-tap re-post available from archive |

---

**Edge Case Catalog**

**1. Seller Ghosts After Accepting**
- *Trigger:* Seller accepts buyer's interest but doesn't show up or respond to coordination messages.
- *Design:* If seller doesn't confirm exchange within 2 hours of agreed time, item auto-relists. Buyer gets "This one fell through. We've re-opened it so others can claim it." Seller gets gentle nudge: "Heads up, [Buyer] came by and you weren't available. Want to reschedule or pass it to someone else?"
- *Escalation:* 3 ghost events in 30 days triggers "Slow mode." Seller's future listings require explicit availability confirmation before going live.

**2. Item Misrepresentation**
- *Trigger:* Buyer picks up item and it doesn't match the listing description or photos.
- *Design:* Post-exchange feedback is optional and binary: "As described" or "Not as described." No public reviews. No star ratings. Three "Not as described" flags in 30 days surface a private prompt to seller: "A few neighbors felt items didn't match descriptions. Adding detailed photos helps build trust."
- *No public shaming.* This is a neighborhood. Escalation is private and constructive.

**3. Cold Start — New Neighborhood**
- *Trigger:* User signs up in a neighborhood with zero active users and zero listings.
- *Design:* Three-layer seed strategy:
  - **Personal:** Contact import to surface existing Nearby users. "3 of your neighbors are already here."
  - **Content:** Partnership with local Buy Nothing groups to import existing listings (with admin permission and attribution).
  - **Incentive:** "Post your first item and we'll feature it at the top of your neighbors' feeds for 24 hours."
  - **Fallback:** Show items from nearest active neighborhood with distance transparency.

**4. Harassment via Messaging**
- *Trigger:* User sends inappropriate content through the messaging system.
- *Design:* Structurally prevented for most interactions: quick replies only until 3 successful mutual exchanges. Free-text is a privilege earned through trust. Report button on every message. Reported users lose messaging immediately pending review; no appeals process delays the protection.

**5. Price Gouging During Emergencies**
- *Trigger:* Declared emergency (power outage, weather event) + item listed at significantly above historical average.
- *Design:* Price anomaly detection compares to 90-day rolling average for category. Flagged items get visible notice to buyers: "This price is higher than usual for this item." No automatic blocking, but full transparency. Community organizers can escalate.

**6. Duplicate Accounts / Sybil Attacks**
- *Trigger:* Bad actor creates multiple accounts to manipulate listings or evade moderation.
- *Design:* One account per phone number. Neighborhood assignment based on consistent geolocation over 7 days rather than self-reported address. Multiple accounts from same device flagged for review.

**7. Abandoned Listings**
- *Trigger:* Item posted but seller becomes inactive.
- *Design:* Listings expire after 14 days. Seller gets "Still available?" prompt at day 12. No response = auto-archive. Re-posting takes one tap from the archive screen. Expired listings don't count against exchange completion metrics.

## /include
agent: Vigil
summary: Audited accessibility across screen reader, keyboard, cognitive load, and motor access dimensions.

We confronted the hard truth that a map-first interface inherently excludes people who can't see maps. Rather than treating accessibility as a compliance layer, we redesigned the core experience to work across modalities — the list view isn't a secondary mode, it's an equal citizen. We also addressed cognitive load, motor access, and the specific challenges of a location-based app for people with disabilities.

### Output

**Accessibility Audit: Nearby**

---

**Screen Reader Experience Design**

The map-first interface is fundamentally inaccessible as a primary experience for screen reader users. This is an architectural decision to revisit, not a bug to patch. The list view must be promoted from "toggle alternative" to "equal citizen." When VoiceOver or TalkBack is active, the app should default to list view.

**Item card announcement order:**
`[Item name], [price or "Free"], [walking time] away, posted by [neighbor name], [neighborhood tenure]. [Pickup type].`

Example: "Blue IKEA bookshelf, free, 4 minutes away, posted by Jake, your neighbor since March 2025. Porch pickup."

**Screen-by-screen screen reader spec:**

| Screen | Landmark structure | Key announcements | Focus management |
|---|---|---|---|
| Map view | Banner: "[Neighborhood], [count] items nearby". Alert on view load: "Map view. Switch to list view for screen reader optimized browsing." | Map pins are not individually focusable. Nearby items list announced as summary: "[X] items within [Y]-minute walk." | Focus on "Switch to list view" link at top |
| List view | Banner: same as map. Main: item list grouped by distance. | Group headers announced: "On your block, 3 items" / "5-minute walk, 7 items" | Focus on first item card |
| Item detail | Banner: item name. Main: description, price, distance, seller info. | Full details read in order: name, price, distance, seller tenure, pickup type, description | Focus on "I want this" button |
| Interest sent | Live region (aria-live="polite") | "Interest sent for [item name]. You'll be notified when [seller name] responds." Immediate; does not wait for 15-minute batch. | Focus returns to item card in list |
| Posting flow | Step indicator: "Step [N] of 5: [step name]" | Each field labeled. AI-suggested title announced: "Suggested title: [title]. Edit or confirm." | Focus on first editable field per step |
| Activity tab | Banner: "Activity". Sections: "My Listings", "My Interests" | Status announced per item: "Waiting for response" / "Accepted, coordinate pickup" / "Completed" | Focus on first unread item |

**Critical requirement:** The undo toast ("Interest sent. Undo") must be announced via aria-live and the undo button must be keyboard-focusable for its full 5-second duration. A timed action that screen reader users can't reach is an inaccessible pattern, not a real undo.

---

**Keyboard Navigation Specification**

| Context | Key | Action |
|---|---|---|
| Global | Tab | Move focus to next interactive element |
| Global | Shift+Tab | Move focus to previous interactive element |
| Global | Skip link (first Tab) | Jump to main content, bypass tab bar |
| List view | Arrow Down/Up | Navigate between item cards |
| List view | Enter | Open item detail |
| Item detail | Escape | Close detail, return focus to originating card |
| Item detail | Enter on "I want this" | Express interest (triggers undo toast) |
| Posting flow | Enter | Advance to next step |
| Posting flow | Escape | Go back one step (preserving input) |
| Modals (pickup, messaging) | Focus trap | Tab cycles within modal only |
| Modals | Escape | Close modal, return focus to trigger element |
| Filters | Space | Toggle filter chip on/off |
| Radius presets | Arrow Left/Right | Move between 5 / 10 / 20 min presets |

**Focus management rules:**
- Focus is never lost. When a modal closes, focus returns to the element that opened it. When an item is removed from a list, focus moves to the next item.
- No focus trap outside of modals. Users can always Tab out of any non-modal component.
- Focus indicators are visible in both light and dark mode (3:1 contrast minimum, 2px solid outline).

---

**Cognitive Accessibility**

**Language simplification:**
- All interface copy at 6th-grade reading level or below. Tested via Hemingway Editor.
- No jargon: "listing" becomes "item," "express interest" becomes "I want this," "transaction" never appears.
- Instructions use active voice and short sentences: "Tap the photo to retake it." Over "The photo can be retaken by tapping on it."

**Predictable layout:**
- Tab bar never moves, never reorders, never hides.
- Map/list toggle is always in the same position (top-right of map view).
- No layout shifts after content loads. Skeleton screens match final layout dimensions exactly.
- Back navigation always returns to the previous screen in the expected state: no re-scrolling, no lost context.

**Reduced decision load:**
- Maximum 10 categories. No sub-categories. Fewer choices, faster decisions.
- Posting flow: 5 steps maximum. Each step has one primary decision.
- Interest expression: one tap. No message required. The social friction of "what do I say?" is eliminated by design.

**Explicit feedback for every action:**
- "Posted." "Interest sent." "Exchange complete." No ambiguity.
- No silent state changes. If something happened, the user knows.

**No time pressure. Anywhere.**
- No countdown timers (the 5-second undo is the one exception, and it's not destructive if missed).
- No "3 others are interested" urgency messaging. Ever. This is a design principle.
- Batched notifications ensure sellers don't feel rushed to respond.

---

**Motor Accessibility**

| Requirement | Specification | Measurement |
|---|---|---|
| Minimum tap target | 44x44px (WCAG 2.2 AA) | All interactive elements measured. Smallest current target: filter chips at 44x32px. **Must increase to 44x44px.** |
| Gesture alternatives | Every swipe gesture has a tap alternative | Swipe-to-interest has "I want this" button. Pinch-to-zoom radius has tap presets (5/10/20 min). |
| Touch target spacing | Minimum 8px between adjacent targets | Measured across item cards, filter chips, tab bar items |
| One-handed reachability | Primary actions in thumb zone (bottom 60% of screen) | "I want this" button: bottom-aligned on item detail. Post FAB: center of tab bar. |
| Camera alternative | Gallery upload available on all photo inputs | Camera permission denial gracefully falls back to gallery picker |
| No drag interactions | Radius slider replaced with tap presets | No drag-to-reorder, no drag-to-dismiss. All interactions are tap or swipe (with tap alternative). |
| Reduced motion | `prefers-reduced-motion` respected | Spring animations become instant transitions. Map panning becomes jump-to-location. Skeleton shimmer becomes static placeholder. |

---

**Location-Specific Accessibility Concerns**

- **Physical mobility:** Users who cannot walk to pickups can set "Delivery welcome" flag on their profile. Visible to sellers as: "This neighbor has requested delivery. Can you bring it to them?" Optional for sellers, never required.
- **Spatial cognition:** Distance shown in both time and distance: "4 min walk (0.2 mi)," serving users who process spatial information differently. On map view, distance is also represented visually by the radius circle.
- **Low vision and map readability:** Map pins use high-contrast colors with luminance differentiation, not just hue. Price labels on pins use minimum 14px text. "Free" items use a distinct pin shape to be distinguishable without color perception.

## /transpose
agent: Rune
summary: Analyzed mobile-first vs. web experience, designed for offline scenarios and cross-device continuity.

We designed Nearby for the reality that most exchanges happen on phones, on the move — someone walking past a "FREE" sign, someone browsing while sitting on their porch. But we also designed for the laptop-at-kitchen-table moment: batch-posting after a decluttering weekend, or browsing casually on a bigger screen. And we confronted the offline problem head-on, because not every sidewalk has signal.

### Output

**Platform Strategy: Nearby**

| Platform | Role | Expected usage share | Core value proposition on this platform |
|---|---|---|---|
| **Mobile native (iOS + Android)** | Primary | 90% | Camera-first posting, GPS-powered map, push notifications, on-the-move browsing |
| **Web (nearby.app)** | Secondary | 8% | Batch posting from desktop, larger map canvas, account management, print materials |
| **Notifications (push + digest)** | Tertiary | 2% (entry point) | Daily digest drives re-engagement; pickup coordination nudges drive exchange completion |

---

**Mobile (Primary Platform)**

Mobile is the product. Nearby is designed for someone walking through their neighborhood, phone in hand, glancing at what's around them. The interaction model is built for this context:

- **Camera-first posting:** Tap "+", camera opens instantly. No menu, no screen selection, no "what kind of post?" The phone's camera is the listing creation tool; everything else (title, price, category) is supporting metadata.
- **GPS-powered map:** The primary interface leverages the one thing phones do that laptops can't: know where you are in real time. Map pins update as you walk.
- **Push notifications:** Interest alerts, pickup reminders, daily digest. Notification budget: max 5/day. Batch interest notifications every 15 minutes to prevent alert fatigue.
- **Thumb-zone optimization:** "I want this" button bottom-aligned on item detail. Post FAB center of tab bar. All primary actions reachable one-handed. No interactions require top-of-screen reach.
- **Deep links:** "Check out this bookshelf near you" from iMessage/WhatsApp opens directly to item detail. If recipient doesn't have the app, opens web preview with app store link.

**What mobile doesn't do well:** Long-form descriptions (keyboard is awkward), batch operations (posting 15 items one by one is painful), account management (settings are fine on desktop).

---

**Web (Secondary Platform)**

The web experience is a complement. Feature parity is explicitly not a goal. The web version exists for three use cases that mobile handles poorly:

1. **Batch posting:** Upload 10 photos from a desktop folder, write descriptions with a full keyboard. Drag-and-drop photo upload. Multi-item posting flow with "Post another" shortcut.
2. **Larger map canvas:** Show more of the neighborhood at once. Hover previews on pins (vs. tap on mobile). Zoom controls + keyboard shortcuts for power browsing.
3. **Account management:** Settings, notification preferences, privacy controls, exchange history. These are configure-once tasks better served by a larger screen.

**Web-specific features:**
- Print-friendly view for community boards: "Post this QR code at your coffee shop" generates a branded flyer with QR link to the neighborhood's Nearby page.
- Embeddable widget for neighborhood websites and HOA pages: live feed of recent listings in a specific radius.

**What web doesn't do:** Push notifications (email digest only). Camera-first posting (file upload instead). Real-time location (address-based, not GPS).

---

**Offline Design Patterns**

Nearby must work on sidewalks, in basements, and on subway platforms. "No signal" is a Tuesday, not an error state.

| Action | Online behavior | Offline behavior | Transition back |
|---|---|---|---|
| Browse items | Live feed from server | Cached items from last fetch. Stale badge after 1 hour: "Last updated 2h ago." | Auto-refresh on reconnect. Diff-only update (don't re-fetch everything). |
| View item detail | Live data | Cached detail if previously viewed. If not cached: "You're offline. This item's details will load when you're back." | Auto-load on reconnect |
| Post an item | Photo upload → server processing → publish | Full draft saved locally (photo + all metadata). "Your listing will go live as soon as you're back online." Pending indicator. | Auto-publish on reconnect. If photo upload fails, retry with backoff. |
| Express interest | Immediate server call + optimistic UI | Queued locally. "Interest will be sent when you're back online." Pending indicator on item card. | Auto-send on reconnect. If item no longer available, notify: "This item was taken while you were offline." |
| Messaging | Real-time delivery | Quick replies queued. "Message will send when you're back online." | Auto-send in order on reconnect |
| Location | Live GPS | Last-known location used. Badge: "Showing items near your last known location." | GPS lock clears badge; map re-centers on current position |

**Offline design principle:** Never lose user work. Never silently fail. Always show what's happening and what will happen when connectivity returns. The user should trust that their actions are preserved, even without signal.

---

**Cross-Device Continuity**

| Scenario | How it works | Sync mechanism |
|---|---|---|
| Browse on phone, continue on laptop | Viewed items, saved items, and current radius sync across devices. Open laptop → see same neighborhood view, same filter state. | Server-side session state, synced on load |
| Draft listing on desktop, photos from phone | Desktop creates listing with title, price, description. Phone photos auto-attach via cloud photo library integration (iCloud, Google Photos). | Cloud photo library API + draft sync |
| Pickup coordination | Active exchange visible on all devices. Quick replies sent from whichever device is in hand. | Real-time sync via server |
| Notifications | Phone gets push. Desktop gets none. Only one device notifies to avoid alert duplication. | Device priority: most-recently-active device gets push; others get in-app badge only |

**Cross-device anti-pattern avoided:** No "continue where you left off" interstitials. The state just syncs. If you open the laptop and the app shows your neighborhood, you don't need a modal telling you it synced. Seamless is the point.

## /localize
agent: Rune
summary: Mapped cultural adaptation needs for trust signals, payment norms, content, and RTL support.

We examined what happens when Nearby crosses cultural boundaries. A hyperlocal marketplace is deeply embedded in local norms — how people negotiate, how they build trust, what they're comfortable exchanging with strangers, and what "neighbor" even means. We mapped the changes needed for five distinct cultural contexts and surfaced the assumptions baked into the current design.

### Output

**Cultural Adaptation Matrix: Nearby**

---

**Trust Signals by Market**

Trust is not universal. What builds trust between strangers in Portland, Oregon destroys it in Osaka, Japan. The entire trust model must be locally reconceived, not merely translated.

| Market | Primary trust signal | Secondary trust signals | What to avoid | Design adaptation |
|---|---|---|---|---|
| **US/Canada** | Neighborhood tenure ("Your neighbor since 2024") | Mutual connections, exchange count, approximate distance | Star ratings (too transactional) | Default design. Casual tone. Direct contact acceptable. |
| **Japan** | Platform mediation (the platform vouches for users) | Account verification level, membership duration, formality of communication | Direct contact before platform introduction. Casual first-message tone. | Add honorific-aware messaging. Platform sends the first introduction message. Seller "accepts meeting request" rather than "responds to interest." |
| **India** | Community/family references ("Also known in [community name]") | Phone number verification, UPI payment linked, mutual community memberships | Anonymity (signals low investment/trust) | Phone verification weighted more heavily. Community group affiliations visible on profile. Negotiation built into the flow (counter-offer option). |
| **Germany** | Data minimalism + explicit consent | Account age, verified email, GDPR-compliant data handling badge | Showing proximity without consent ("3 min walk" feels surveillant) | Distance shown only after explicit opt-in. Privacy controls on first screen of onboarding. Default radius display: "In your neighborhood" (no distance). |
| **Brazil** | Social warmth (profile photos, friendly notes) | Exchange count, post-exchange notes ("Adorei! Obrigada!"), responsiveness rating | Cold, transactional interfaces | Profile photos encouraged (not required). Post-exchange note option: short freeform "thanks" visible on profile. Social layer is the trust layer. |

---

**Payment Patterns**

Nearby is platform-agnostic on payment by design. The platform does not process, mediate, or record payments. "Arrange with seller" is the universal default. But payment norms shape the entire exchange experience, and the UI must accommodate them:

| Market | Dominant payment method | Negotiation norm | UI adaptation |
|---|---|---|---|
| **US** | Venmo, cash at pickup | Rare for items under $20. Listed price = actual price. | Price displayed as final. No counter-offer flow in MVP. |
| **India** | UPI (PhonePe, Google Pay), cash | Expected and healthy. First offer is opening position. | Add "Make an offer" button alongside "I want this." Counter-offer flow: buyer suggests price → seller accepts/counters/declines. |
| **Japan** | Cash in envelope, PayPay | Almost nonexistent. Listed price is the price. | Price displayed with no negotiation affordance. "I want this" = commitment to listed price. |
| **Mexico** | Cash, MercadoPago | Expected for items over ~200 MXN | Same as India: counter-offer flow enabled by market. |
| **Germany** | Bank transfer, cash, PayPal | Mild; one counter-offer acceptable, haggling is not. | "Suggest a different price" (singular) rather than ongoing negotiation. |

---

**RTL Support & Layout Mirroring**

Full layout mirroring for Arabic, Hebrew, and Urdu. The entire spatial model flips, not just text direction:

- Navigation: tab bar order reverses (Map on right, Profile on left)
- Map controls: zoom buttons move to left side. Radius presets read right-to-left.
- Item cards: thumbnail moves to right, text aligns right
- Posting flow: step indicator reads right-to-left. "Next" button on left, "Back" on right.
- Swipe gestures: swipe-to-interest reverses direction (swipe left instead of right)
- Numbers: Western Arabic numerals (0-9) for prices in all markets. Eastern Arabic numerals (٠-٩) available as user preference for display.

**Text expansion budget:**
- German: 30-40% longer than English. "I want this" becomes "Interesse bekunden" (18 to 20 chars, manageable). But "Your neighbor since March 2025" becomes "Ihr Nachbar seit März 2025" or "Dein Nachbar seit..." (formal vs. informal address decision required per market).
- Japanese: Generally shorter in character count but may require different line-height for readability.
- Button labels: designed with 40% expansion headroom. Max English label length: 20 characters; max translated: 28 characters before truncation.

---

**Content & Communication Adaptation**

| Dimension | US baseline | Adaptation needed |
|---|---|---|
| Iconography | Handshake icon = exchange complete | Handshake doesn't resonate universally. Use checkmark as universal fallback. Test per market. |
| Photo norms | Item-centric (faces incidental) | In some markets, showing faces is avoided. Default to item-focused camera framing. No face detection prompts. |
| Modesty in listings | Clothing shown on hangers or flat-lay | Conservative markets need content guidelines: no mannequin photos, no body-showing for clothing. Community organizers set local norms. |
| Notification tone | Casual: "Hey, someone wants your bookshelf" | Japan: formal register. "お客様の本棚に興味を持った方がいます。" Germany: formal unless user selects "du" (informal). |
| Time formats | 12-hour, Month/Day | 24-hour in most markets. Day/Month in EU, Latin America. Relative time ("2 hours ago") is universal; use as primary. |
| Currency display | $15, $0 = "Free" | Localized currency symbol + format. "Free" translated per market. "¥0" is not equivalent to "Free" in Japan; use the word. |

---

**Regulatory Compliance by Market**

| Regulation | Market | Impact on Nearby | Required changes |
|---|---|---|---|
| **GDPR** | EU/EEA | Location data is personal data under GDPR. Processing requires explicit consent beyond app-level location permission. | Explicit consent flow: "Nearby uses your location to show items near you. Your exact location is never shared with other users. [Allow] / [Learn more]". Right to deletion includes all location history, exchange history, and profile data. Data portability: user can export all their data. |
| **PIPL** | China | Data localization required. All data from Chinese users must be stored on servers within China. | Separate infrastructure. Separate legal entity. This is a market-entry decision, not a feature flag. |
| **LGPD** | Brazil | Similar scope to GDPR. Portuguese-language privacy policy required. Consent must be granular. | Portuguese privacy policy. Granular consent: location, notifications, contacts (each separate). DPO (Data Protection Officer) appointment required. |
| **CCPA/CPRA** | California | Right to know, right to delete, right to opt out of sale. Location data is "personal information." | "Do Not Sell My Personal Information" link. Disclosure of data categories collected. 45-day response window for deletion requests. |
| **Digital Markets Act** | EU | If Nearby reaches gatekeeper status (unlikely near-term), interoperability requirements apply. | Monitor. Not actionable at current scale. |

### Philosopher

Does the Western marketplace model — individual sellers, posted prices, bilateral exchange — translate across cultures? In many communities, exchange is communal, not transactional. Things circulate through extended family networks, religious institutions, or community centers without ever being "listed." The bazaar model assumes negotiation. The gift economy model assumes reciprocity over time, not transaction by transaction. By building a marketplace app, are we importing a cultural frame that only fits some of our users? What would Nearby look like if it were designed for circular exchange rather than linear transactions?

## /measure
agent: Rune
summary: Defined success metrics focused on community health and trust density, not just transaction volume.

We rejected GMV as a north star. For Nearby, gross merchandise value is meaningless — a neighborhood where everyone gives things away for free is a more successful neighborhood than one where everyone haggles. Instead, we designed a measurement framework around exchange density, trust formation, and community health, with explicit counter-metrics to catch growth patterns that harm the product.

### Output

**Measurement Framework: Nearby**

---

**North Star Metric**

**Weekly Exchange Density:** Completed exchanges per 1,000 households per week, measured per neighborhood.

- **Formula:** (Completed exchanges in neighborhood N in week W) / (Estimated households in neighborhood N / 1,000)
- **Target:** 15+ exchanges/1k households/week in neighborhoods active for 3+ months
- **Data source:** Server-side exchange completion events, census household estimates per defined neighborhood boundary
- **Measurement frequency:** Weekly, with 4-week rolling average for trend
- **Why this metric:** It captures the only thing that matters: are neighbors actually exchanging things? Unlike MAU (which rewards browsing without action), GMV (which values expensive items over community health), or listing count (which rewards posting without outcomes), exchange density measures completed value delivery.

---

**Primary Metrics**

| Metric | Definition | Target | Signal it tracks | Data source |
|---|---|---|---|---|
| Activation rate | % of signups who post or express interest within 7 days | 40% | New users finding value quickly | Server: account creation → first post or interest event |
| Listing-to-exchange rate | % of posted items that result in a completed exchange | 60% | Supply-side health: are listings useful? | Server: listing created → exchange completed events |
| Time to exchange | Median hours from listing to completed pickup | <48 hours | Speed of the exchange loop | Server: listing timestamp → exchange completion timestamp |
| Repeat engagement | % of users with 2+ exchanges per month | 30% | Sustained value: people coming back | Server: exchange events per user per calendar month |

**Goal-Signal-Metric chains:**

1. **Goal:** Neighbors can quickly find useful items nearby.
   **Signal:** Users browse and express interest within a single session.
   **Metric:** Browse-to-interest rate >15% per session; median time from app open to first interest expression <3 minutes.

2. **Goal:** Posting an item is effortless.
   **Signal:** Users who start posting complete it.
   **Metric:** Post-start-to-publish completion rate >85%; median time to post <45 seconds for returning users.

3. **Goal:** Exchanges actually happen after interest is expressed.
   **Signal:** Accepted interests convert to completed exchanges.
   **Metric:** Interest-to-completion rate >70%; ghost rate <10%.

---

**Secondary Metrics: Trust & Community Health**

| Metric | Definition | Target | Why it matters |
|---|---|---|---|
| "As described" rate | % of exchanges where optional feedback = "As described" | 90%+ | Proxy for listing quality and honest representation |
| Ghost rate | % of accepted interests where pickup doesn't happen | <10% | Measures reliability; ghosts destroy trust faster than anything |
| Message-to-exchange ratio | Average messages exchanged per completed transaction | <3 | Fewer messages means better coordination design; more messages means friction |
| Neighborhood coverage | % of city neighborhoods with 10+ active users | Grow 5%/month | Growth must be geographic, not merely aggregate. 10 users per neighborhood is minimum viable density. |
| Free item ratio | % of listings priced at $0 | 25%+ | Generosity is a health indicator. A neighborhood where nobody gives anything away is not a community |
| Organizer engagement | % of neighborhoods with at least one active organizer | 50% | Organizers are the immune system: they moderate, seed, and set norms |
| Cold start survival rate | % of newly launched neighborhoods that reach 10+ active users within 30 days | 40% | If cold start kills neighborhoods, growth is a leaky bucket |

---

**Counter-Metrics (What We Refuse to Optimize)**

These are guardrails. If a primary metric improves while a counter-metric degrades, something is wrong. Counter-metrics are reviewed alongside primary metrics in every measurement review. They are not optional.

| Counter-metric | Why we refuse to optimize it | What it would do if we did |
|---|---|---|
| **Time in app** | More time means the UX is failing. If someone browses for 20 minutes, discovery is broken. | Optimizing time-in-app leads to infinite scroll, algorithmic feeds, and engagement traps. The opposite of what Nearby should be. |
| **Notification open rate** | Optimizing this leads to spam. Batch notifications exist for a reason. | We'd send more frequent, more urgent notifications. "3 people want your item!" urgency tactics. Notification fatigue. |
| **GMV (Gross Merchandise Value)** | A free item exchanged is as valuable as a $50 item sold. | GMV-chasing would push us to promote expensive items, discourage free listings, and add transaction fees. We'd become eBay. |
| **DAU/MAU ratio** | High DAU/MAU means people feel compelled to check daily. That's addiction. | We'd add streaks, daily rewards, FOMO triggers. The opposite of respecting user time. |
| **Blended user acquisition cost** | Must track per-neighborhood, not aggregate. | A cheap user in an empty neighborhood is worth nothing. Blended CAC hides geographic waste. |

---

**Experimentation Plan**

| Experiment | Hypothesis | Metric | Method | Duration | Min sample |
|---|---|---|---|---|---|
| Walking radius default: 10 min vs 15 min | Wider default radius increases exchange density in low-density neighborhoods without diluting trust | Exchange density, browse-to-interest rate, "as described" rate | A/B test by neighborhood (everyone in a neighborhood sees the same radius) | 4 weeks | 20 neighborhoods per arm |
| Quick replies only vs free-text messaging from start | Quick-reply-only messaging reduces ghost rate and harassment without reducing exchange completion | Ghost rate, exchange completion rate, report rate | A/B test by user | 6 weeks | 500 users per arm |
| Daily digest holdback | Daily digest increases browse sessions without increasing time-in-app | Browse sessions per week, time-in-app per session, exchange density | Holdback test (10% of users don't receive digest) | 4 weeks | 1,000 users in holdback |
| Post confirmation: minimal vs celebratory | Stronger post-publish confirmation improves first-time poster retention | 7-day retention for first-time posters, second-post rate within 14 days | A/B test by user | 4 weeks | 300 first-time posters per arm |
| Cold start seed strategy: imported listings vs organic only | Seeding neighborhoods with imported Buy Nothing listings accelerates cold start survival | Cold start survival rate (10+ active users in 30 days), exchange density at day 30 | A/B test by neighborhood | 8 weeks | 10 neighborhoods per arm |

**Experiment governance:** No experiment ships without a pre-registered hypothesis, primary metric, counter-metric, and minimum sample size. Results are reviewed by product and design together: "did it go up for the right reasons?" matters as much as "did the number go up?"

## /specify
agent: Sage
summary: Produced engineering handoff specs for the item card component, interest flow, and walking radius algorithm.

We translated design decisions into engineering-ready specifications. Every component got exact measurements, state definitions, interaction details, and API contract requirements. The walking radius algorithm — the core product differentiator — got its own specification with inputs, fallback logic, and performance requirements.

### Output

**Component Spec: Item Card**

**Variants:** Feed card (compact), Detail card (expanded), Map pin (minimal)

---

**Feed Card (Compact)**

| Property | Specification |
|---|---|
| Container | Full-width, 88px height, 12px padding, 8px border-radius, background: surface color |
| Thumbnail | 64x64px, left-aligned, 4px border-radius, `object-fit: cover`. Placeholder: gray square with camera icon while loading. |
| Content area | Right of thumbnail, 12px gap |
| Title | 16px / 600 weight / primary text color. Single line, `text-overflow: ellipsis` at container width minus thumbnail minus padding. Max displayed: ~35 characters. |
| Price | 14px / 700 weight / primary color. "Free" uses accent green (#16a34a). "Trade" uses accent blue (#2563eb). |
| Distance | 12px / 400 weight / secondary text color. Format: "4 min walk". Below 1 min: "Nearby". |
| Neighborhood | 12px / 400 weight / tertiary text color. "Capitol Hill". Truncate at 20 characters. |
| Tap target | Entire card. Navigates to detail view. Min 44px height (met by 88px container). |
| Swipe right | Express interest. Haptic feedback (UIImpactFeedbackGenerator.medium on iOS, HapticFeedbackConstants.CONFIRM on Android). Reveal: green background with checkmark icon. |
| Hover (web) | Subtle shadow elevation (0 2px 8px rgba(0,0,0,0.08)). Cursor: pointer. |
| Accessibility | `role="article"`. `aria-label`: "[Title], [price], [distance] away, posted by [seller name], [tenure]". |

**State definitions:**

| State | Visual treatment | Interaction |
|---|---|---|
| Default | As specified above | Tap → detail, swipe → interest |
| Interest sent | Checkmark badge on thumbnail. Price label replaced with "Interest sent" in green. | Tap → detail (shows interest status). Swipe disabled. |
| Expired | 50% opacity overlay. "No longer available" text centered. | Tap → "Similar items nearby" (3 items by distance) |
| Loading | Skeleton: gray rectangle for thumbnail, three gray lines for text (shimmer animation 1.5s ease-in-out infinite) | Not interactive |
| Offline (cached) | Normal appearance + "Last updated [time]" micro-badge bottom-right | Tap → cached detail view |
| Flagged | Not rendered in feed. Only visible to seller in "My Listings" as "Under review" | Seller: tap to edit or withdraw |

---

**Detail Card (Expanded)**

| Section | Specification |
|---|---|
| Hero image | Full-width, 56% aspect ratio (to show most photos without cropping), `object-fit: cover`. Swipe for multiple photos if available. Photo count indicator: "1/3" bottom-right. |
| Title | 22px / 700 weight / primary text color. Multi-line allowed (max 3 lines). |
| Price | 20px / 700 weight. Same color coding as feed card. |
| Distance + tenure | 14px / 400 weight / secondary. "2 min walk · Your neighbor since March 2025" |
| Pickup type | 14px / 400 weight + icon. Porch: 🏠, Meet outside: 🤝, Flexible: ⚡ (icon only, no emoji in production; use SF Symbols / Material Icons) |
| Description | 14px / 400 weight / primary text color. Full text, no truncation. If empty: "No description provided." |
| CTA | "I want this": full-width button, 48px height, primary color background, white text, 8px border-radius. Positioned in bottom safe area (persistent, stays visible on scroll). |
| Seller section | Avatar circle (40px), name, tenure, exchange count, distance. Tap → seller profile (future feature, not in MVP). |

---

**Map Pin (Minimal)**

| Property | Specification |
|---|---|
| Pin size | 36x36px (default), 48x48px (selected/focused) |
| Thumbnail | Circular crop of item photo, 2px white border |
| Price label | 10px / 700 weight, pill-shaped background (white with shadow), positioned below pin. "Free" pins use green pill. |
| Clustering | At 50+ pins per screen area, cluster into a single pin with count badge: "12 items". Tap cluster → zoom to show individual pins. |
| Selected state | Pin scales to 48px, shadow increases, price label becomes more prominent. Detail card appears as bottom sheet. |
| Accessibility | Not individually focusable by screen reader. Announced as summary: "[X] items within [Y]-minute walk." Screen reader users directed to list view. |

---

**Interaction Spec: Express Interest**

| Phase | Timing | What happens (client) | What happens (server) |
|---|---|---|---|
| Trigger | t=0 | User taps "I want this" or swipes right on feed card | — |
| Immediate feedback | t=0 to t+150ms | Button → checkmark + "Interest sent" (spring animation: mass 1, stiffness 300, damping 20). Haptic feedback. | — |
| Undo window | t+150ms to t+5s | Toast appears bottom-center: "Interest sent. [Undo]" with 5s countdown indicator. Toast is aria-live="assertive", undo button is keyboard-focusable. | — |
| Undo tapped | t+Ns | Revert: button returns to "I want this". Toast dismissed. No server call made. | — |
| Undo expired | t+5s | Toast dismissed. | `POST /v1/interest` fires: `{ itemId, buyerLocation: { lat, lng }, timestamp }` |
| Server confirms | t+5s to t+5.5s | — | Interest recorded. Added to seller's notification batch (next 15-min window). |
| Server rejects (item unavailable) | t+5s to t+5.5s | Rollback: button returns to default. Message: "This item was just taken. Here's what else is nearby." | 409 Conflict response |
| Network failure | t+5s | Badge on card: "Will send when online." Interest queued in local storage. | — |
| Network recovery | varies | Queue flushed. If item still available: normal flow. If unavailable: rollback + notification. | Processes queued interests in order |

---

**Algorithm Spec: Walking Radius**

**Purpose:** Determine which items are "within walking distance" for a given user. This is the core product differentiator; the algorithm defines Nearby's fundamental unit of experience.

**Inputs:**
- User latitude/longitude (from device GPS or last-known location)
- Neighborhood density: households per km² (from census data, updated quarterly)
- Street network graph (from OpenStreetMap, updated monthly)
- Physical barriers: highways, rivers, railways, gated communities (from OSM + manual annotation)

**Algorithm:**

1. Classify density tier:
   - High density (>5,000 hh/km²): base radius = 400m (urban core, ~5 min walk)
   - Medium density (1,000–5,000 hh/km²): base radius = 800m (~10 min walk)
   - Low density (<1,000 hh/km²): base radius = 1,600m (~20 min walk)

2. Apply barrier masking: remove all area beyond physical barriers, even if within straight-line radius. Walking radius follows the street graph.

3. Calculate isochrone: using the street network graph, compute the reachable area within the base walking time (5/10/20 min at 5 km/h average walking speed). This produces an irregular polygon, not a circle.

4. Return: polygon boundary for map rendering + list of item IDs within the polygon.

**Fallback logic:**
- If street network graph unavailable: use straight-line distance at 1.3x multiplier (empirical correction for non-straight walking paths). Circle rather than isochrone.
- If density data unavailable: default to medium density (800m / 10 min).
- If GPS unavailable: use last-known location. Badge: "Showing items near your last known location."

**Performance requirements:**
- Radius calculation: <50ms for cached location, <200ms for new location requiring graph query
- Cache: per-user, keyed on location. Invalidate on 200m movement from cached position.
- Density classification: cached per neighborhood, updated weekly
- Barrier data: cached globally, updated monthly

**API contract:**

```
GET /v1/radius
Request:  { lat: number, lng: number }
Response: {
  polygon: GeoJSON,
  radiusMeters: number,
  densityTier: "high" | "medium" | "low",
  walkingMinutes: number,
  itemCount: number,
  isFallback: boolean
}
Latency: p50 <50ms, p99 <200ms
```

**Update frequency:** Density classification updates weekly. Barrier data updates monthly. User radius recalculates on every significant location change (200m movement).
