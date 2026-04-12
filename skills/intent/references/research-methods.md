# Research Methods

## Method Selection Matrix

Choosing the right research method depends on what you need to learn, how much time and budget you have, and where you are in the design process. There is no universal "best method" — there's the right method for the question you're asking right now.

### Generative Methods (What should we build?)

**Contextual Inquiry**
- What it is: Observe users in their natural environment while they perform real tasks. Ask questions as they work.
- When to use: Early exploration. You don't understand the problem space well enough to ask good survey questions yet.
- Sample size: 4-8 participants per user segment.
- Time/cost: High. 1-2 hours per session, plus travel. Analysis is intensive.
- What it reveals: Workarounds, environmental constraints, unspoken needs, the gap between what people say and what they do.
- Trade-offs: Small samples, not generalizable, observer effect can alter behavior. But the depth of insight is unmatched.

**Semi-Structured Interviews**
- What it is: One-on-one conversations guided by a topic framework, not a rigid script. Follow interesting threads.
- When to use: When you need to understand motivations, mental models, and experiences in depth. Works at any stage.
- Sample size: 5-8 for pattern identification, 12-20 for saturation (Guest, Bunce & Johnson, 2006).
- Time/cost: Moderate. 45-60 minutes per session. Analysis takes roughly 3x the interview time.
- What it reveals: User motivations, pain points, mental models, emotional responses, workarounds.
- Trade-offs: Self-reported behavior differs from actual behavior. Users are not reliable predictors of their own future actions. But interviews surface the "why" that behavioral data can't.

**Diary Studies**
- What it is: Participants record experiences over time (days to weeks), logging entries when specific events occur.
- When to use: When behavior unfolds over time and can't be observed in a single session. Habit formation, recurring tasks, infrequent events.
- Sample size: 10-15 participants minimum (high dropout expected — recruit 20-30% more).
- Time/cost: Study runs 1-4 weeks. Setup is moderate; analysis is substantial.
- What it reveals: Temporal patterns, context shifts, emotional changes over time, frequency and triggers of behavior.
- Trade-offs: High participant burden, significant dropout, entries are self-reported and often incomplete. But nothing else captures real behavior over time.

**Surveys**
- What it is: Structured questionnaires distributed to a sample population. Quantitative or mixed-method.
- When to use: When you have specific hypotheses to validate, when you need quantitative data at scale, or when you need to measure attitudes/preferences across a population.
- Sample size: 30 minimum for basic statistics, 100+ for segmentation, 400+ for population estimates with reasonable confidence intervals.
- Time/cost: Low per-respondent. Design is the hard part — a bad survey produces confidently wrong data.
- What it reveals: Prevalence of behaviors, attitudes, preferences, and demographics across a population.
- Trade-offs: You only learn what you ask about. Question design bias is pervasive and hard to detect. Response rates are falling across all channels. Self-report limitations apply. But surveys are the only practical way to quantify patterns at scale.

### Evaluative Methods (Is this working?)

**Usability Testing (Moderated)**
- What it is: Observe users attempting tasks with a prototype or product while thinking aloud. Facilitator guides the session.
- When to use: Whenever you have something testable — wireframes, prototypes, live products. The single most valuable evaluative method.
- Sample size: 5 participants catch approximately 85% of major usability issues (Nielsen & Landauer, 1993). Run 5 per round, iterate, test again.
- Time/cost: Moderate. 30-60 minutes per session. Can be done remotely to reduce logistics.
- What it reveals: Where users succeed, fail, hesitate, and get confused. Task completion rates, error frequencies, and recovery patterns.
- Trade-offs: Small sample, not statistically generalizable, facilitator skill matters enormously. But 5 users finding the same problem is a signal, not a sample size issue.

**Usability Testing (Unmoderated)**
- What it is: Users complete tasks independently, recorded by software. No facilitator present.
- When to use: When you need more participants, faster turnaround, or lower cost. Good for benchmarking and A/B comparison.
- Sample size: 10-20 for qualitative patterns, 50+ for quantitative benchmarking.
- Time/cost: Low per-session. Platform costs (UserTesting, Maze, Lookback). No facilitator time.
- What it reveals: Task completion rates, time on task, click paths, self-reported satisfaction.
- Trade-offs: No ability to probe "why." Users may abandon without explanation. Technical issues go unnoticed. Thinking aloud without a facilitator is less natural and less revealing.

**A/B Testing**
- What it is: Randomly assign users to different versions of a design and measure behavioral differences.
- When to use: When you have enough traffic for statistical significance (typically 1000+ users per variant), a clear metric to optimize, and a hypothesis to test.
- Sample size: Depends on baseline conversion rate and minimum detectable effect. Use a sample size calculator — guessing is how you get inconclusive results.
- Time/cost: Low marginal cost per user. Setup requires engineering. Run time depends on traffic and effect size.
- What it reveals: Which variant performs better on specific metrics. Causal, not correlational.
- Trade-offs: Only measures what you track. Can incentivize local optimization. Requires significant traffic. Doesn't explain why one variant wins. Ethical considerations when variants differ in user protection.

**Heuristic Evaluation**
- What it is: Expert reviewers assess a design against established usability principles (Nielsen's heuristics, Shneiderman's rules, or custom criteria).
- When to use: When you need fast, low-cost feedback. Good for catching obvious issues before usability testing. Not a substitute for testing with real users.
- Sample size: 3-5 expert reviewers. One expert finds ~35% of issues; five find ~75% (Nielsen, 1994).
- Time/cost: Low. Hours, not days. But requires evaluators with genuine expertise.
- What it reveals: Violation of established design principles, consistency issues, missing affordances, accessibility gaps.
- Trade-offs: Expert blindness — evaluators may miss issues that real users encounter, and may flag issues that don't actually bother real users. Always validate heuristic findings with user testing.

### Structural Methods (How should we organize this?)

**Card Sorting (Open)**
- What it is: Participants organize content items into groups and name the groups. Reveals how users mentally categorize information.
- When to use: When designing or redesigning information architecture. When you don't know what categories make sense to users.
- Sample size: 15-20 for open sorts (Tullis & Wood, 2004). Can be done remotely.
- Time/cost: Low to moderate. 15-30 minutes per participant. Analysis requires dendrogram or similarity matrix generation.
- What it reveals: Mental models for categorization, expected groupings, natural vocabulary for labels.
- Trade-offs: Only reveals grouping — not hierarchy, navigation preferences, or findability. Results can be messy — people categorize differently and that's the point.

**Card Sorting (Closed)**
- What it is: Participants sort content items into pre-defined categories. Tests whether your proposed structure matches user expectations.
- When to use: When validating a proposed information architecture. After open sorts have informed the category structure.
- Sample size: 15-30 participants.
- What it reveals: Whether your categories make sense to users. Which items are ambiguous or misplaced.
- Trade-offs: Only tests the categories you provide. Can't discover missing categories. Gives false confidence if the categories themselves are wrong.

**Tree Testing**
- What it is: Participants find items in a text-only hierarchy (no visual design, no navigation UI). Tests whether the structure itself works.
- When to use: After card sorting has informed the structure. Before building navigation UI. The purest test of information architecture.
- Sample size: 50+ for quantitative results (each task needs enough data to identify patterns).
- Time/cost: Low. 10-15 minutes per participant. Fully remote.
- What it reveals: Findability scores per item, path analysis (where users go wrong), which branches cause confusion.
- Trade-offs: Text-only — doesn't test the experience of navigating a real interface. Structure works ≠ navigation works.

**Analytics Review**
- What it is: Analyze existing behavioral data — page views, click paths, search queries, drop-off funnels, error logs.
- When to use: When you have a live product with traffic. As a complement to qualitative research, not a replacement.
- Sample size: Depends on traffic. More is better for funnel analysis.
- What it reveals: What users actually do (not what they say they do), where they drop off, what they search for, which paths they take.
- Trade-offs: Shows behavior, not motivation. You know users left at step 3, but not why. Analytics alone is one eye open — pair with qualitative research for both eyes.

---

## Bias Avoidance in Research

Every research method is susceptible to bias. Knowing the biases doesn't eliminate them, but it makes them manageable.

### In question design

**Leading questions** steer respondents toward a particular answer. "How much did you enjoy using our new feature?" presupposes enjoyment. Better: "Describe your experience using the feature."

**Double-barreled questions** ask two things at once. "Was the checkout fast and easy?" — what if it was fast but confusing? Split into separate questions.

**Social desirability bias** causes people to answer in ways that make them look good. People overreport privacy concerns, underreport engagement with addictive features, and claim to read terms of service. Mitigate by asking about behaviors, not attitudes: "When did you last review your privacy settings?" not "How important is privacy to you?"

**Acquiescence bias** is the tendency to agree with statements regardless of content. Avoid agree/disagree scales when possible. Use forced-choice or behavioral questions instead.

### In sampling

**Survivorship bias** means you're only talking to people who stuck around. Your users aren't representative of all the people who tried your product — they're the ones who didn't leave. Interview churned users, abandoned signups, and support-ticket authors to get the full picture.

**Convenience sampling** means you're testing with whoever is easiest to recruit. Your colleagues, your social network, and respondents on a user testing platform all skew toward specific demographics, tech literacy levels, and behavioral patterns. Document who you're missing.

**Selection bias** in A/B tests occurs when the randomization isn't truly random, or when early results cause you to stop the test prematurely. Let tests run to calculated sample sizes. Don't peek and decide.

### In analysis

**Confirmation bias** is the tendency to weight evidence that supports your hypothesis and discount evidence that challenges it. Counter by actively looking for disconfirming evidence. Assign a team member to argue the opposite interpretation.

**Narrative bias** is the tendency to construct a coherent story from scattered data. Real user behavior is messy and contradictory. If your findings tell a clean, simple story, ask what you're leaving out.

**Anchoring** occurs when early data points disproportionately influence interpretation. If the first two interviews tell the same story, you'll hear that story in the remaining eight. Randomize analysis order. Code transcripts independently before discussing.

---

## Synthesis Techniques

Raw research data is not insight. Synthesis is the process of turning observations into understanding.

### Affinity Mapping

Take individual observations (quotes, behaviors, notes) and cluster them by similarity. Bottom-up — don't start with categories, let them emerge.

**Process:** Write each observation on a separate note. Group similar observations. Name the groups. Look for relationships between groups. The group names become your themes.

**When it works:** When you have diverse, unstructured data from interviews or contextual inquiry. When you need the team to build shared understanding.

**When it fails:** When one person does it alone and loses the benefit of multiple perspectives. When groups are too broad ("users want it to be better") or too specific ("user 3 wants blue buttons").

### Thematic Analysis (Braun & Clarke, 2006)

A systematic method for identifying, analyzing, and reporting patterns across qualitative data.

**Six phases:**
1. **Familiarize** — Read and re-read the data. Note initial impressions.
2. **Code** — Generate initial codes from the data. Codes are labels for interesting features.
3. **Search** — Collate codes into candidate themes. A theme captures something important about the data in relation to the research question.
4. **Review** — Check themes against coded data and the full dataset. Do they hold up?
5. **Define** — Name and define each theme. What story does each tell?
6. **Report** — Select compelling examples, relate themes to research questions.

**Key distinction:** Themes don't "emerge from the data" passively. The researcher makes active choices about what to code, how to group, and what to name. Be transparent about those choices.

### Journey-Based Synthesis

Organize findings around the user's journey rather than by theme. Especially useful when research reveals temporal patterns or when the output needs to feed into flow design.

**Process:** Map the user's journey stages from research data. For each stage, collect: what users are doing, thinking, and feeling; what's working and what isn't; what tools and channels they're using; where the breakdowns occur. The synthesis output is a research-grounded journey map, not a hypothetical one.

---

## Communicating Findings

Research that doesn't change decisions is wasted research. Communication is the last mile.

### Evidence Strength Indicators

Not all findings carry equal weight. Be explicit about confidence levels:

| Indicator | Meaning | Example |
|-----------|---------|---------|
| **Strong evidence** | Multiple sources, multiple methods, consistent pattern | "7 of 8 participants failed to complete checkout. Analytics show 62% drop-off at the same step." |
| **Moderate evidence** | Single method with clear pattern, or multiple methods with partial agreement | "Interview participants consistently mentioned confusion with pricing tiers. We haven't tested this quantitatively." |
| **Directional evidence** | Small sample or single source, but worth noting | "Two participants mentioned this pain point. It's not a pattern yet, but it's worth monitoring." |
| **Hypothesis** | Researcher interpretation, not directly observed | "Based on the drop-off data and interview themes, we believe the root cause is X. This needs validation." |

### Findings Format

Structure findings for decision-making:

1. **What we observed** — Factual description of the finding. No interpretation yet.
2. **What it means** — Interpretation. What does this observation tell us about user needs, behaviors, or the design?
3. **How confident we are** — Evidence strength indicator. How much weight should this finding carry?
4. **What we recommend** — Actionable recommendation tied to the finding.
5. **What we still need to learn** — Open questions that this finding raises.

### Common Communication Failures

- **Burying the lead.** Start with the most important finding, not the methodology section. Decision-makers need the "so what" first.
- **Cherry-picking quotes.** One vivid quote is not a pattern. Always state the prevalence: "5 of 8 participants" is evidence; "one participant memorably said..." is an anecdote.
- **Conflating correlation and causation.** "Users who completed onboarding retained better" does not mean onboarding caused retention. Maybe motivated users complete both onboarding and retention.
- **Presenting findings without recommendations.** Research that says "users are confused" without saying "here's what to do about it" creates frustration, not action.
- **Overstating confidence.** Five interviews do not represent "users" as a monolith. They represent five people who share some characteristics with your users. Language matters: "participants in our study" vs. "our users."
