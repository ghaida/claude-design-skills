# Measurement Frameworks

## HEART Framework

Developed by Kerry Rodden, Hilary Hutchinson, and Xin Fu at Google, the HEART framework provides a structured way to define user-centered metrics at any scale — from a single feature to an entire product.

### The Five Dimensions

**Happiness** — Subjective user satisfaction, attitudes, and perceived ease of use. Measured through surveys (CSAT, SUS, NPS), in-app satisfaction prompts, and qualitative feedback.

What it catches that other metrics miss: A product can have high task completion rates but low happiness if the process feels tedious, patronizing, or stressful. Happiness metrics capture the emotional quality of the experience.

What it misses: Happy users aren't necessarily successful users. A product can feel pleasant while failing to deliver actual value. Happiness without task success is entertainment, not utility.

**Engagement** — The depth and frequency of user interaction with the product. Measured through session frequency, session duration, feature usage, actions per session, content consumption.

What it catches: Whether users find the product valuable enough to return to and invest time in. Engagement distinguishes "signed up but never came back" from "uses it daily."

What to watch for: Engagement can be gamed with addictive patterns (infinite scroll, notification spam, variable ratio reinforcement). High engagement driven by manipulation is not success — it's exploitation. Always pair engagement metrics with happiness and task success to distinguish healthy engagement from compulsive engagement.

**Adoption** — New users of a product or feature. Measured through sign-ups, feature activation (first meaningful use, not just account creation), upgrade conversions, new feature discovery.

What it catches: Whether growth is happening and whether new features are being discovered and used. Adoption metrics answer: are we reaching new people, and are they finding value?

What it misses: Adoption without retention is a leaky bucket. High sign-up rates with low day-7 retention mean the acquisition is working but the product isn't.

**Retention** — Users who return over time. Measured through day-1/7/30 retention curves, churn rates, reactivation rates, subscription renewals.

What it catches: Whether the product delivers sustained value. Retention is the strongest proxy for product-market fit — people who come back found something worth returning for.

What to watch for: Retention can be artificially inflated by switching costs, data lock-in, or sunk-cost fallacy rather than genuine value. A user who keeps their subscription because cancellation is difficult is retained but not satisfied. Pair retention with happiness metrics to distinguish healthy retention from captive retention.

**Task Success** — The ability of users to complete their intended tasks efficiently and completely. Measured through task completion rate, time on task, error rate, task abandonment rate, support ticket volume.

What it catches: Whether the product actually works for what users need it to do. Task success is the most direct measure of UX quality — it answers the question "can people use this thing to accomplish their goals?"

What it misses: Efficiency without satisfaction. A user who completes a task but feels frustrated, confused, or disrespected along the way has a different experience than one who completes it smoothly.

### Applying HEART by Feature Type

| Feature type | Primary dimension | Secondary dimensions |
|-------------|------------------|---------------------|
| Core workflow (checkout, file creation, messaging) | Task success | Happiness, Engagement |
| Onboarding | Adoption | Task success, Retention (day-1) |
| Social features | Engagement | Retention, Happiness |
| Content / discovery | Engagement | Happiness, Adoption (new content areas) |
| Settings / configuration | Task success | Happiness |
| Monetization | Adoption (conversion) | Retention (renewal), Happiness |
| Support / help | Task success (resolution) | Happiness (satisfaction) |

---

## Goal-Signal-Metric (GSM) Mapping

HEART tells you what dimensions to measure. GSM tells you how to operationalize each dimension into specific, trackable metrics. Developed as part of the HEART framework at Google.

### The Three Layers

**Goal:** What do you want to accomplish? Articulate in terms of user outcomes, not business outputs. "Users can quickly find relevant content" not "increase pageviews."

**Signal:** What user behavior would indicate the goal is being met (or not met)? Signals are observable behaviors that correlate with goal achievement. "Users successfully find what they're looking for on the first search" is a signal. Signals can be positive (success indicators) or negative (failure indicators).

**Metric:** How do you measure the signal at scale? The metric is the specific, quantifiable measurement that tracks the signal. "Percentage of search sessions where the user clicks a result on the first results page" is a metric.

### GSM Example: Search Feature

| Layer | Content |
|-------|---------|
| **Goal** | Users can quickly find relevant content |
| **Signals (positive)** | User clicks a result, user's session continues after search, user doesn't refine the same query multiple times |
| **Signals (negative)** | User abandons search without clicking, user immediately searches again with different terms, user contacts support after searching |
| **Metrics** | Search success rate (% of searches with a result click), refinement rate (% of searches followed by a query change), time to first click, support tickets mentioning "can't find" |

### Common GSM Mistakes

**Starting with metrics instead of goals.** "We should track daily active users" is not a goal. Why do you want to track DAU? What user outcome would a change in DAU indicate? Start with the user goal, then derive the metric.

**Signals that don't actually signal the goal.** Time on page could mean the user is engaged — or it could mean they're lost. Clicks could mean interest — or they could mean the user is hunting for the right link. Always ask: what are the alternative explanations for this signal?

**Metrics without baselines.** "We improved search success rate to 73%" means nothing without knowing the previous rate. "We improved search success rate from 58% to 73% over 6 weeks" tells a story.

**Vanity metrics.** Total registered users, total page views, total downloads — numbers that go up over time regardless of product quality. Prefer rates (completion rate, retention rate, error rate) and per-user metrics (sessions per week, actions per session) that reflect actual experience quality.

---

## Statistical Literacy for Designers

You don't need to be a statistician. You need to know enough to ask the right questions, catch obvious errors, and have informed conversations with data scientists and analysts.

### Sample Size

**Why it matters:** A test with too few users can't detect real differences. A test that runs too long wastes time testing something that's already conclusive. Sample size determines the reliability of your conclusions.

**Rules of thumb for qualitative research:**
- Usability testing: 5 users per round (Nielsen). Catches ~85% of major issues. Run multiple rounds, not bigger rounds.
- Interviews: 12-20 for thematic saturation in a homogeneous group (Guest et al., 2006). More segments = more interviews.
- Card sorting: 15-20 for open sorts, 30+ for closed sorts with quantitative analysis.

**Rules of thumb for quantitative research:**
- Surveys: Minimum 30 for basic statistics, 100+ for segmentation, 400+ for population estimates.
- A/B tests: Use a sample size calculator. Inputs: baseline conversion rate, minimum detectable effect, significance level, power. Don't guess — calculate.

### Statistical Significance

**What it means:** The probability that the observed difference between variants is due to chance, not a real effect. Conventionally, p < 0.05 (less than 5% chance the difference is due to random variation).

**What it doesn't mean:** That the result is important, large, or meaningful. A 0.1% improvement in click rate can be statistically significant with a large enough sample. It's a real effect — but is it worth acting on?

**Common error:** Peeking at results before the test reaches its calculated sample size. This inflates the false positive rate dramatically. If you check daily, you'll see "significant" results that aren't real. Set a sample size target, wait until you reach it, then analyze.

### Confidence Intervals

**What they are:** A range that likely contains the true value. "Conversion rate: 4.2%, 95% CI [3.8%, 4.6%]" means we're 95% confident the true rate is between 3.8% and 4.6%.

**Why designers should care:** Confidence intervals communicate uncertainty. A conversion rate of "4.2%" feels precise. "Between 3.8% and 4.6%" communicates that there's a range of plausible values — and that range might overlap with the other variant's range, meaning the difference might not be real.

**Design implication:** When presenting data to stakeholders, include confidence intervals or some expression of uncertainty. "We believe the new design improves conversion by 1-3 percentage points" is more honest and more useful than "the new design improves conversion by 2.1%."

### Effect Size

**What it is:** The magnitude of the difference, independent of sample size. With enough users, you can detect arbitrarily small differences. Effect size tells you whether the difference is large enough to matter.

**For designers:** A statistically significant improvement that's smaller than the user would notice is technically real but practically irrelevant. Ask: would a user experience this difference? If not, the effect size is too small to justify the engineering effort to ship it.

---

## A/B Test Design

### Hypothesis Structure

Every A/B test should start with a written hypothesis, not "let's try this and see what happens."

**Format:** "We believe that [change] will cause [effect] because [reasoning]. We'll measure this by [metric] and consider it successful if [threshold]."

**Example:** "We believe that reducing the checkout flow from 5 steps to 3 steps will increase checkout completion rate because usability testing showed users abandoning at steps 3 and 4 due to form fatigue. We'll measure checkout completion rate and consider a 5% improvement (from 62% to 67%) as the minimum meaningful effect."

**Why the hypothesis matters:** Without it, you can't distinguish between "the test showed nothing" (null result) and "we didn't know what we were looking for" (undefined success criteria). The hypothesis also prevents post-hoc rationalization — deciding after the test what the "real" metric was.

### Minimum Detectable Effect (MDE)

Before running a test, decide: what's the smallest improvement that would be worth the effort to ship?

If your baseline conversion rate is 5% and you'd only act on a 10% relative improvement (from 5.0% to 5.5%), your MDE is 0.5 percentage points. This determines how long the test needs to run — smaller effects require larger samples.

**Common mistake:** Running tests to detect effects too small to matter. If you'd ship either variant regardless of a 0.1% difference, don't run a test that requires 500,000 users per variant to detect it. Decide what's actionable first, then calculate the test duration.

### Test Duration

Calculated from: baseline rate, MDE, significance level (typically 0.05), statistical power (typically 0.80), and daily traffic.

**Minimum duration:** One full business cycle (typically one week) even if sample size is reached earlier. Behavior varies by day of week, and a test that ran Monday-Wednesday may not generalize to weekends.

**Maximum duration:** If a test hasn't reached significance in 4-6 weeks, the effect is probably too small to matter. Call it, document the null result, and move on.

### What A/B Tests Cannot Tell You

- Why one variant won. The test shows what, not why. Pair with qualitative research for the why.
- Whether the change is good for users. A variant that increases purchases through manipulation "wins" the A/B test. Metrics don't have morals. You do.
- Long-term effects. A/B tests measure short-term behavior. A change that boosts conversion this week might erode trust over months.
- Effects on non-measured outcomes. If you optimize for click-through rate, you might be degrading satisfaction, support load, or long-term retention without knowing it.

---

## Ethical Measurement

Metrics are not neutral. The choice of what to measure shapes what gets built, and the wrong metrics can incentivize harmful design.

### Goodhart's Law

"When a measure becomes a target, it ceases to be a good measure." — Charles Goodhart (paraphrased by Marilyn Strathern)

**In practice:** If you set "time on page" as a KPI, teams will design to maximize time on page — through longer content, more friction, more steps, or autoplay. The metric goes up, but user experience may go down. The metric stopped measuring what you cared about (engagement) and started measuring what you incentivized (stickiness).

**The fix:** Use metric bundles, not single metrics. Pair every engagement metric with a satisfaction or task success metric. If time on page goes up but satisfaction goes down, you've found a Goodhart's Law violation. A metric that goes up while its paired check metric goes down is a signal that the optimization is working against users.

### Engagement vs. Wellbeing

The technology industry's default success metric — engagement — is structurally misaligned with user wellbeing in many product categories.

**When engagement aligns with wellbeing:** Productivity tools (more use = more work done), educational products (more use = more learning), health tracking (more use = more health awareness). In these cases, engagement is a reasonable proxy for value.

**When engagement conflicts with wellbeing:** Social media (more use often correlates with worse mental health outcomes, per Haidt & Twenge), entertainment (compulsive consumption doesn't equal enjoyment), news (doomscrolling is engagement without benefit), gaming (session length optimization can be harmful).

**Alternative metrics for wellbeing:**
- Session satisfaction (post-session survey: "Was that time well spent?")
- Intentional return rate (users who set out to use the product vs. users pulled in by notifications)
- Goal completion (did the user accomplish what they came for?)
- Mindful disengagement (did the user leave when they wanted to, or did they get stuck?)

### When Metrics Incentivize Bad UX

**Conversion rate optimization without guardrails:** Aggressive CRO can push toward manipulative patterns — darker buttons for the business-preferred option, harder-to-find decline buttons, urgency tactics. Add ethical guardrails: track complaint rates, return rates, and support contacts alongside conversion.

**Engagement maximization without bounds:** If the product team's bonus depends on DAU, the team will design for DAU — even at the cost of user wellbeing. Create an explicit tension metric: engagement PLUS user satisfaction, not engagement alone.

**Growth metrics without retention:** Tracking new sign-ups without tracking whether those users find value creates incentives to optimize top-of-funnel at the expense of the product experience. Always pair acquisition metrics with activation and retention metrics.

**Support deflection as success:** If you measure success by reducing support tickets, you might create products where users can't find help. Pair support deflection with resolution satisfaction — did the user's problem actually get solved, or did they just give up?

### Ethical Measurement Principles

1. **Measure outcomes, not just outputs.** Sign-ups are an output; successful task completion is an outcome. Pageviews are an output; finding the answer is an outcome.
2. **Pair every optimization metric with a check metric.** Conversion rate paired with return rate. Engagement paired with satisfaction. Growth paired with retention.
3. **Include the user's perspective.** At least one metric in every framework should reflect how the user feels, not just what they do. Behavior without sentiment is half the picture.
4. **Question who benefits from this metric.** If a metric going up benefits the business but not the user, it's a business metric, not a UX metric. Both are valid; don't confuse them.
5. **Make metric incentives transparent.** If the team's goals are tied to specific metrics, acknowledge the perverse incentives those metrics create. Awareness doesn't eliminate the bias, but it makes it manageable.
6. **Review metrics periodically.** Metrics that made sense at launch may not make sense at maturity. A startup optimizes for growth; a mature product optimizes for retention and satisfaction. Update your measurement framework as the product evolves.
