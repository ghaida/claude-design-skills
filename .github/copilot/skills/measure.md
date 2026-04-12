---
name: measure
description: >
  Defines and tracks UX success through metrics, measurement frameworks,
  and experimentation. Part of the Intent design strategy system.
  Connects design decisions to observable evidence — did the thing we
  built actually help? Guards against measurement becoming manipulation.
  Trigger when: defining success metrics, designing A/B tests, building
  measurement frameworks, analyzing funnels, reviewing metric dashboards,
  questioning whether the right things are being measured, or when someone
  says "how do we know if this worked," "what should we measure,"
  "let's run a test," or "the numbers look good but something feels off."
  Also trigger for ethical measurement reviews and counter-metric definition.
---

# Measure — Define and Track Success

## Overview

If you can't define success, you can't design for it. And if you measure the wrong thing, you'll optimize for the wrong outcome.

UX measurement connects design decisions to observable evidence — did the thing we built actually help? This skill defines what to measure, how to measure it, and how to make decisions from what you learn. It bridges the gap between "we shipped it" and "it worked."

But measurement is not neutral. Every metric you choose shapes what gets optimized. Measure time-on-site and you'll get infinite scroll. Measure clicks and you'll get clickbait. Measure conversion and you'll get dark patterns — unless you also measure what those metrics cost the user. This skill guards against measurement becoming manipulation, ensuring that metrics incentivize genuine value, not engineered engagement.

**When to activate this skill:** Defining success criteria for a new feature, designing experiments, building measurement frameworks, analyzing funnel performance, reviewing whether existing metrics are measuring the right things, or anytime "the numbers look good" but the experience feels wrong.

---

## Skill family

Measure works alongside the full Intent skill system:

- **`/strategize`**: Their hypotheses need measurable success criteria. Every strategic bet should connect to a metric that tells you whether the bet paid off. `/strategize` defines "we believe X"; `/measure` defines "we'll know X is true when Y."
- **`/investigate`**: Qualitative research complements quantitative measurement. When the numbers say users drop off at step 3, investigate tells you why. When satisfaction scores drop after a redesign, investigate interviews users to understand the experience behind the number. Never make major design decisions from metrics alone.
- **`/evaluate`**: UX assessment produces scores and findings that inform what to measure. Evaluation identifies usability issues; measurement tracks whether fixes actually resolved them.
- **`/specify`**: Test plans and success metrics go into handoff specs. Every feature spec should include what success looks like and how to measure it, so engineering can instrument accordingly.
- **`/philosopher`**: A cross-cutting cognitive mode for questioning your metrics before they become targets. Invoke when: a metric feels too easy to game, the dashboard looks green but users are complaining, you're not sure whether you're measuring user success or business extraction, or you need the question: "What if measuring this changes the behavior we're trying to measure?"

---

## Core capabilities

### 1. Metric selection: HEART framework

Google's HEART framework provides a structured approach to selecting UX metrics. Apply it per feature, not globally — different features need different metrics.

**Happiness — subjective satisfaction:**
- NPS (Net Promoter Score): likelihood to recommend, 0-10 scale. Blunt but useful for trending.
- CSAT (Customer Satisfaction): satisfaction with specific interaction, usually 1-5 scale. More actionable than NPS for feature-level decisions.
- SUS (System Usability Scale): 10-question standardized usability questionnaire. Good for benchmarking across releases.
- Custom surveys: specific questions tied to specific features. "How easy was it to find what you were looking for?" is more useful than "How satisfied are you?"

**Engagement — behavioral depth:**
- Frequency: how often users return (daily, weekly, monthly active users)
- Intensity: depth of usage per session (features used, content consumed, actions taken)
- Breadth: how many features a user touches (adoption breadth, not just depth)
- Recency: when was the last interaction (early warning for churn)

**Adoption — new usage:**
- New user activation: percentage completing key onboarding milestones
- Feature adoption: percentage of eligible users who try a new feature
- Onboarding completion: funnel through first-use experience
- Time-to-value: how quickly new users reach their first meaningful outcome

**Retention — continued usage:**
- Return rate: D1, D7, D30 retention (percentage returning after 1, 7, 30 days)
- Churn rate: percentage of users who stop using the product in a period
- Reactivation: users who left and came back (what brought them back?)
- Cohort retention: retention curves by signup cohort (are newer users retaining better?)

**Task success — effectiveness:**
- Completion rate: percentage of users who finish the task they started
- Error rate: percentage of attempts that result in errors
- Time-on-task: how long the task takes (shorter is usually better, but not always)
- Efficiency: task completion relative to optimal path length

**Not every feature needs all five.** Select the 2-3 dimensions that matter most for the feature's intent. A checkout flow cares most about task success and happiness. A content feed cares most about engagement and retention. A new feature launch cares most about adoption.

**Counter-metrics:** For every metric you optimize, name the metric that could suffer. If engagement goes up but satisfaction goes down, that's a red flag. If conversion improves but support tickets increase, something is wrong. Counter-metrics are your canary in the coal mine.

### 2. Goal-Signal-Metric mapping

The GSM framework prevents you from jumping straight to metrics without understanding what you're actually trying to learn.

**Goal:** What user or business outcome are you trying to achieve? Be specific. "Improve the user experience" is not a goal. "Users can quickly find relevant content without excessive browsing" is a goal.

**Signal:** What observable user behavior would indicate progress toward the goal? This is the bridge between intent and data. "Users navigate directly to relevant content" is a signal. "Users spend more time on the site" is not necessarily a signal of success — it could mean they're lost.

**Metric:** How do you quantify that signal? Specific formula, data source, measurement frequency, and success threshold. "Median clicks-to-content less than 3 for 80th percentile of sessions, measured weekly via analytics" is a metric.

**Example GSM chain:**
- Goal: Users can complete checkout without friction
- Signal: Users proceed through checkout steps without abandoning or going back
- Metric: Checkout completion rate > 75% for users who add items to cart; median checkout time under 90 seconds; back-navigation rate during checkout < 10%

**Build GSM chains for every major feature before launch.** If you can't articulate the goal, you don't know what success looks like. If you can't identify the signal, you're guessing what to measure. If you can't define the metric, you can't learn from what you ship.

### 3. A/B test design

Experimentation is how you learn whether a design change actually helps. But poorly designed experiments produce false confidence.

**Hypothesis structure:**
"If we [specific change], then [specific metric] will [direction of change] by [estimated magnitude] because [causal reasoning]."

Example: "If we move the search bar from the header to the hero section, then search usage will increase by 15% because users will encounter it earlier in their scanning pattern, reducing the friction of scrolling up to search."

**Minimum detectable effect (MDE):**
What's the smallest change worth detecting? A 0.1% improvement in conversion may not be worth the engineering effort. A 5% improvement would be. Set the MDE before the test, not after. This determines your required sample size.

**Sample size calculation:**
Depends on: baseline conversion rate, MDE, statistical power (typically 80%), significance level (typically 95% / alpha = 0.05). Use a sample size calculator — don't guess. Underpowered tests produce inconclusive results that waste time.

**Duration:**
Run for at least 1-2 full weekly cycles to account for day-of-week effects. Longer for seasonal businesses. Never run less than a week even if you hit sample size early — behavioral patterns vary by day.

**Segmentation:**
Check for differential effects across user segments: new vs. returning users, mobile vs. desktop, geography, plan type. An overall neutral result may hide a strong positive effect for one segment and a strong negative for another.

**Guardrail metrics:**
Define what must NOT get worse. If testing a new checkout flow, guardrail metrics might include: revenue per user, support ticket volume, return rate. If the test variant improves conversion but increases returns, the test failed.

**Common mistakes:**
- Peeking at results before the test reaches statistical significance (inflates false positive rate)
- Running too many variants without adjusting for multiple comparisons
- Ignoring novelty effects (new things get clicked more just because they're new — wait for the effect to stabilize)
- Stopping tests too early because early results "look decisive"
- Not accounting for interaction effects when multiple tests run simultaneously
- Testing cosmetic changes when the real problem is structural

### 4. Funnel analysis

Funnels reveal where users fall out of a desired flow. But the value isn't in the numbers — it's in understanding why.

**Define steps precisely:**
Is "add to cart" the click on the button, or the confirmed addition? Is "checkout" the start of the payment form, or the submission? Imprecise step definitions produce misleading conversion rates. Define each step as a specific, observable, unambiguous event.

**Measure conversion between each step:**
Step 1 → Step 2: what percentage proceed? What percentage return to a previous step? What percentage leave entirely? Each transition tells a different story.

**Identify the biggest drop-offs:**
Focus on the step transitions with the lowest conversion rates. A 40% drop-off between "view product" and "add to cart" is a different problem than a 40% drop-off between "enter payment" and "confirm order."

**Segment by everything:**
User type (new vs. returning), device, traffic source, geography, time of day, day of week. Aggregate funnels hide the signal. A funnel that converts at 30% overall might convert at 50% for returning desktop users and 10% for new mobile users — two completely different problems.

**Pair with qualitative:**
When you find the drop-off, you know WHERE users struggle. To understand WHY, pair with `/investigate` — session recordings, usability testing, surveys at the point of friction. Numbers without context produce bad interventions.

**Benchmarking:**
Compare funnels across time periods (did the last release help or hurt?), across segments (who struggles most?), and cautiously against industry benchmarks (useful for order-of-magnitude checks, dangerous for specific targets).

### 5. Qualitative and quantitative triangulation

Numbers tell you WHAT happened. Qualitative tells you WHY. Neither alone is sufficient for design decisions.

**When to triangulate:**
- Metrics show a drop-off but you don't know why → run usability sessions at the friction point
- Satisfaction scores drop after a redesign → interview users to understand what changed in their experience
- A/B test shows no statistical difference → qualitative research reveals both variants had the same fundamental usability problem
- Feature adoption is low → is it a discoverability problem, a usefulness problem, or a usability problem? Only qualitative can distinguish.

**How to triangulate:**
- Start with quantitative to identify WHAT and WHERE
- Use qualitative to understand WHY
- Return to quantitative to verify that your intervention addressed the WHY
- Repeat

**Never make major design decisions from one data type alone.** A metric that says "conversion improved 5%" doesn't tell you whether the improvement came from genuine value creation or from adding friction to the alternative path. A usability test where 5 people struggled doesn't tell you how widespread the problem is. Both together tell you something real.

### 6. Ethical measurement

Metrics shape behavior — of teams, of products, and of users. Measure carefully.

**Goodhart's Law:**
"When a measure becomes a target, it ceases to be a good measure." This is not a theoretical concern. When teams are incentivized on time-on-site, they build infinite scroll and autoplay. When they're incentivized on signups, they build deceptive registration walls. When they're incentivized on engagement, they build notification spam. The metric didn't fail — the metric became the goal instead of a proxy for the goal.

**Engagement does not equal value:**
High engagement can signal addiction, not satisfaction. A user who checks their phone 200 times a day is engaged. They may also be anxious, distracted, and unhappy. Include satisfaction metrics alongside engagement metrics. If engagement rises but satisfaction falls, you're building a slot machine, not a useful product.

**Dark metric patterns to watch for:**
- Counting "successful" newsletter signups from prechecked boxes
- Measuring "engagement" from nagging notifications that users click to dismiss
- Celebrating "retention" that's actually cancellation friction
- Reporting "conversion" from misleading button labels or urgency timers
- Tracking "time on site" driven by confusing navigation

**Connection to Intent's anti-pattern catalog:**
Any metric that would improve by implementing a dark pattern is measuring the wrong thing. Before celebrating a metric improvement, ask: could this improvement have been achieved through a dark pattern? If yes, verify that it wasn't.

**Ethical alternative framework:**
Measure user satisfaction, task completion, and effort alongside every business metric. Build a measurement dashboard with two columns: business outcomes and user outcomes. If business metrics improve while user experience metrics decline, that's a dark pattern signal — even if nobody intended it.

- Business metric: conversion rate → Paired user metric: post-purchase satisfaction
- Business metric: engagement (DAU) → Paired user metric: user-reported value
- Business metric: retention → Paired user metric: ease of cancellation
- Business metric: revenue per user → Paired user metric: perceived value for money

---

## Output format

### Measurement framework (GSM map)
Goal-Signal-Metric chains for each major feature or initiative, including counter-metrics and ethical considerations.

### A/B test plan template
Hypothesis, variants, primary metric, guardrail metrics, sample size calculation, duration, segmentation plan, decision criteria (what result means what action).

### Funnel analysis template
Step definitions, conversion rates, segmentation dimensions, drop-off analysis, qualitative research plan for top friction points.

### Metrics dashboard specification
Which metrics, how displayed, update frequency, alerting thresholds, audience (who sees this and what decisions do they make from it).

### Learning plan
Post-launch measurement cadence: what to measure at day 1, week 1, month 1, quarter 1. When to check back, what to look for, when to declare success or pivot.

---

## Voice and approach

Precise about what data does and doesn't prove. "The data suggests" not "the data proves." Statistical significance does not mean practical significance. A p-value under 0.05 means the result is unlikely to be due to chance — it does not mean the result matters.

Transparent about limitations. Sample size, selection bias, survivorship bias, confounding variables — name them. Honest uncertainty is more useful than false confidence.

Resist false certainty. When the data is ambiguous, say so. When the sample is too small, say so. When you need qualitative research to interpret the numbers, say so. The most dangerous metric is the one that looks conclusive but isn't.

Advocate for measuring what matters to users, not just what's easy to track. Clicks are easy to count. Satisfaction is harder. Task completion is meaningful. Time-on-site is ambiguous. Advocate for the metrics that reflect user success, even when they're harder to instrument.

---

## Scope boundaries

### This skill owns:
- Metric selection and measurement framework design
- A/B test design and experiment methodology
- Funnel analysis methodology and templates
- Ethical measurement guidance and counter-metric definition
- GSM mapping and learning plan creation

### This skill does NOT own:
- Analytics implementation and instrumentation (engineering)
- Qualitative research execution (`/investigate`)
- Strategic framing and hypothesis generation (`/strategize`)
- UX assessment and heuristic evaluation (`/evaluate`)
- Dashboard visual design (visual design)
- Statistical analysis execution (data science)
