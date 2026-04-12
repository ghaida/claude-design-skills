# Service Design

## Service Blueprinting Methodology

A service blueprint is a diagram that maps the complete service delivery process — what the customer sees, what the organization does behind the scenes, and how the technical systems support it all. Lynn Shostack introduced the concept in 1984 to address a fundamental problem: services are invisible, and you can't improve what you can't see.

### Shostack's Original Model

Shostack's original blueprint was deliberately simple: a horizontal timeline of the service process with a "line of visibility" separating what the customer sees from what they don't. Above the line: the customer's experience. Below the line: the backstage processes that produce that experience.

**Why it mattered:** Before Shostack, services were designed through intuition and anecdote. The blueprint made the invisible visible — showing where the service was fragile, where it depended on specific people, and where it failed predictably.

### Modern Blueprint Layers

Contemporary service blueprints expand Shostack's model to five layers, each providing different analytical leverage.

**Layer 1: Customer Actions**
What the customer does at each stage of the service. Their decisions, interactions, and movements across channels. This is the user journey — but in a service blueprint, it's one layer of a larger picture, not the whole picture.

Document: What the customer is trying to accomplish, what they physically do, and what channels they use. Note emotional states where you have evidence — but be careful about projecting emotions you haven't researched.

**Layer 2: Frontstage (Onstage) Actions**
What the customer-facing parts of the organization do that the customer can see. The website, the app, the retail store, the call center agent, the email. This is the visible surface of the service.

Document: Every touchpoint the customer interacts with, and every employee action the customer witnesses. The frontstage is where brand perception is formed — it's also where most organizations focus their design effort, sometimes to the exclusion of everything below.

**Layer 3: Backstage Actions**
What the organization does that the customer can't see but that directly supports the frontstage. The warehouse worker who picks the order. The algorithm that generates recommendations. The support agent who reviews a flagged transaction. The designer who creates the email template.

Document: Every internal action that supports a frontstage interaction. This is where efficiency, consistency, and quality are determined — and where most service failures originate.

**Layer 4: Support Processes**
The systems, tools, and organizational processes that enable backstage actions. CRM systems, inventory management, payment processing, identity verification, internal communication tools. These are typically owned by different teams, different departments, sometimes different companies.

Document: The technical systems and organizational processes that backstage actors depend on. This is where cross-functional dependencies live — and where improving one team's process can break another team's workflow.

**Layer 5: Physical Evidence**
The tangible artifacts the customer encounters at each stage. The packaging, the receipt, the app notification, the confirmation email, the physical product itself. Physical evidence shapes expectations and creates memories.

Document: Every artifact the customer receives, sees, or keeps. Physical evidence persists after the interaction ends — it's what the customer takes away.

### The Lines

Service blueprints are divided by three horizontal lines:

**Line of Interaction** — Between Customer Actions and Frontstage. Where the customer and the service provider interact directly. Every crossing of this line is a moment of truth.

**Line of Visibility** — Between Frontstage and Backstage. What the customer can see vs. what they can't. The strategic question at this line: should we make more of the backstage visible (building trust through transparency) or keep it hidden (reducing complexity)?

**Line of Internal Interaction** — Between Backstage and Support Processes. Where human backstage actors interact with technical systems and organizational processes. This line reveals technology dependencies and process bottlenecks.

---

## Moment-of-Truth Analysis

Not all touchpoints are equal. Moments of truth (a term coined by Jan Carlzon, then CEO of SAS Airlines, in 1987) are the critical interactions that disproportionately shape the customer's overall perception of the service.

### Identifying Moments of Truth

A moment of truth has three characteristics:
1. **High emotional stakes** — The customer cares about the outcome. The anxiety of a medical test result, the anticipation of a delivery, the frustration of a failed payment.
2. **Perception formation** — The interaction shapes how the customer perceives the entire service. A smooth onboarding creates a halo effect. A botched recovery from an error colors everything.
3. **Decision influence** — The interaction affects whether the customer continues, recommends, or leaves.

**First impressions** are always moments of truth. The first time a customer interacts with the service — first visit, first transaction, first support contact — sets expectations for everything that follows.

**Failure moments** are always moments of truth. How the service handles things going wrong reveals its true character. A service that recovers gracefully from failure builds more trust than one that never fails but has no recovery mechanism.

**Peak and end** (Kahneman's Peak-End Rule): People judge experiences primarily by their most intense point (peak) and their ending. A service that's mediocre throughout but ends well is remembered more favorably than one that's consistently good but ends poorly.

### Moment-of-Truth Categories

**Positive moments of truth** — Interactions where the service exceeds expectations. Surprising ease, unexpected delight, proactive problem prevention. These create loyalty and word-of-mouth.

**Negative moments of truth** — Interactions where the service fails to meet expectations. Friction, confusion, delay, rudeness, lack of information. These create churn and negative word-of-mouth (which spreads faster).

**Moment of truth zero (Google's concept)** — The moment a potential customer researches the service before ever interacting with it. Reviews, social media, comparison sites. The experience begins before the service does.

### Designing for Moments of Truth

1. **Identify** — Use customer journey research, support ticket analysis, NPS verbatims, and social media analysis to find which interactions matter most.
2. **Invest disproportionately** — Moments of truth deserve more design attention, more testing, more polish, and more monitoring than routine interactions.
3. **Prepare for failure** — Every moment of truth should have a designed failure mode. What happens if the payment doesn't go through? What happens if the delivery is late? What happens if the agent can't solve the problem? The answer should never be "I don't know."
4. **Measure separately** — Track satisfaction and outcome metrics for moments of truth independently from overall service metrics. A service with high average satisfaction but low moment-of-truth satisfaction has a hidden problem.

---

## Touchpoint Mapping

A touchpoint is any point of contact between the customer and the service. Touchpoint mapping catalogs every touchpoint across every channel and evaluates each for quality, consistency, and strategic importance.

### Touchpoint Inventory

**Digital touchpoints:** Website, mobile app, email, SMS, push notifications, chatbot, social media, advertising, search results, app store listing, in-app messages.

**Human touchpoints:** Call center, in-person staff, live chat agents, account managers, delivery personnel, installation technicians.

**Physical touchpoints:** Packaging, product, physical store, printed materials, signage, receipts, business cards.

**Environmental touchpoints:** Store layout, office environment, waiting room, parking, physical accessibility.

### Touchpoint Evaluation Matrix

For each touchpoint, assess:

| Dimension | Question |
|-----------|----------|
| **Frequency** | How often does this touchpoint occur? Daily, weekly, once? |
| **Criticality** | If this touchpoint fails, what's the consequence? Minor annoyance or complete service breakdown? |
| **Emotional impact** | What emotional state is the customer in when they encounter this touchpoint? |
| **Consistency** | Does this touchpoint deliver the same quality every time? |
| **Brand alignment** | Does this touchpoint reflect the brand's values and voice? |
| **Handoff quality** | How well does this touchpoint connect to the previous and next touchpoints? |

### Cross-Channel Consistency

The most common touchpoint failure isn't a bad individual touchpoint — it's inconsistency between touchpoints. The website says one thing, the app says another, the call center agent says a third. The customer starts a process online and can't continue in the store. The mobile app's features don't match the desktop app's features.

**Designing for cross-channel consistency:**
- Shared content model: information authored once, displayed across channels
- Unified customer record: every channel sees the same customer history
- Consistent terminology: the same action has the same name everywhere
- Coherent visual identity: adapted for each channel but recognizably the same brand
- Seamless transitions: start on one channel, continue on another without losing progress

---

## Fail Point Identification and Recovery Design

Every service fails. The question is whether the failure was anticipated and designed for, or whether it's a surprise for both the customer and the organization.

### Fail Point Categories

**Process failures** — The defined process doesn't produce the expected outcome. The order was placed but not fulfilled. The verification step timed out. The payment was charged twice. These are predictable and designable.

**People failures** — A human in the service chain makes an error or performs poorly. An agent gives wrong information. A delivery person is rude. A colleague forgets to hand off a task. These are manageable through training, tools, and process design.

**System failures** — Technology breaks. The API goes down. The database loses a record. The email doesn't send. These are inevitable and must be designed around.

**Customer failures** — The customer does something unexpected. Enters wrong information, misunderstands a step, uses the wrong channel. These are not really failures — they're normal human behavior that the service should accommodate.

**External failures** — Forces outside the service's control. Weather, supply chain disruptions, third-party service outages, regulatory changes. These can't be prevented, only prepared for.

### Recovery Design Principles

**Detect early.** The faster you detect a failure, the more options you have for recovery. Monitoring, alerting, and customer feedback loops should surface problems before the customer has to report them.

**Communicate proactively.** If you know something went wrong, tell the customer before they discover it. "Your order is delayed due to weather; new estimated delivery is Thursday" is worlds better than the customer checking tracking on Wednesday and seeing no update.

**Offer resolution, not explanation.** Customers want to know what you're going to do about it, not a detailed explanation of what went wrong. "Here's what happened" should be followed immediately by "Here's what we're doing about it."

**Empower frontline staff.** If the person the customer is talking to can't fix the problem, the recovery has already failed. Service recovery design should give customer-facing employees the authority and tools to resolve common failures without escalation.

**Make it right, then make it better.** Fix the immediate problem (refund, reship, correct the error). Then add something unexpected — a discount, an upgrade, a personal follow-up. Service recovery done well creates more loyalty than no failure at all (the "service recovery paradox," documented by McCollough & Bharadwaj, 1992).

---

## Channel Orchestration

Modern services operate across multiple channels. Channel orchestration is the practice of designing how experiences flow across these channels — not as independent silos, but as a coordinated service.

### Orchestration Patterns

**Channel-native:** Each channel offers the complete service experience, adapted to the channel's strengths. The website, app, and physical store each provide the full service. This is resource-intensive but maximizes customer choice.

**Channel-complementary:** Different channels serve different parts of the journey. Research on the website, purchase in the store, support through the app. Each channel does what it does best. This is efficient but requires clear handoffs.

**Channel-primary with fallback:** One channel is the primary experience; others serve as fallbacks for specific situations. "Use the app for everything; call us if you're stuck." This is common for digital-native services.

**Channel-sequential:** The service moves the customer across channels in a defined sequence. Sign up online, verify by phone, activate in the app. This is common for regulated services (banking, insurance) where different channels serve compliance needs.

### Orchestration Design Principles

**Don't force channels.** Let customers choose their preferred channel. If someone wants to call instead of using the chatbot, let them. Channel forcing creates frustration even when the forced channel is objectively faster.

**Preserve context across channels.** If a customer starts a process on the website and calls support, the support agent should see what the customer was doing. If a customer adds items to a cart on mobile, the cart should appear on desktop. Context loss across channels is one of the most common service design failures.

**Design the transitions.** The moment a customer moves from one channel to another is a high-risk moment for confusion and context loss. Design explicit handoff experiences: "Continue this on the app — we've saved your progress" with a clear path to pick up where they left off.

**Let channels know about each other.** In-store staff should know what the website offers. The chatbot should know the phone number for human support. The app should know about the physical store's hours. Channels that are unaware of each other create a fractured experience.

**Measure across channels, not within them.** A customer who starts on the website and completes on the phone had a successful journey — but channel-specific metrics would show the website as a "bounce" and the phone as an unattributed conversion. Cross-channel measurement reveals the actual experience.
