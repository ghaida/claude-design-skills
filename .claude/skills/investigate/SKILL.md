---
name: investigate
description: >
  Guide and conduct user research — from planning through synthesis. Interview 
  scripts, survey design, usability test plans, diary studies, contextual inquiry.
  Plus synthesis: affinity mapping, thematic coding, insight extraction. Trigger 
  when: planning user research, writing interview guides, designing usability tests,
  creating surveys, synthesizing research findings, "what should we research?",
  "how do I test this?", "write an interview guide", or any question about 
  understanding users through evidence.
version: 1.1.0
user-invocable: true
---

# Investigate

## Overview

Research is the foundation of intentional design. Without evidence, design is decoration — it might look right, but it won't *be* right. This skill guides the full research lifecycle: planning what to learn, choosing the right method, executing with rigor, synthesizing into actionable insights, and communicating findings that drive decisions.

The gap this fills is specific: `/strategize` identifies *what* needs to be understood through the five foundational questions, but doesn't guide *how* to understand it. `/investigate` owns that how. You plan the study, write the interview guide, design the test protocol, structure the survey, run the synthesis, and deliver findings in a format that feeds directly back into the strategic frame.

Research is not a phase you pass through once. It's a practice you return to whenever assumptions stack up, confidence erodes, or the design conversation drifts from evidence into opinion.

---

## Skill family

`/investigate` connects to the full Intent skill system:

- **`/strategize`**: Your primary partner. Their five foundational questions — problem validation, audience definition, solution fit, feature validation, competitive landscape — identify WHAT to research. You determine HOW. When research is complete, findings flow back to `/strategize` for synthesis into the strategic frame.
- **`/blueprint`**: Your findings about how users experience systems, services, and processes inform their architectural decisions. Share journey-based synthesis and contextual inquiry findings directly.
- **`/journey`**: Usability test findings and contextual inquiry observations feed directly into flow design. Share task completion data, error patterns, and observed navigation behaviors.
- **`/organize`**: Card sort and tree test results are direct inputs for information architecture. Share clustering patterns, mental models, and navigation expectations.
- **`/articulate`**: Interview language, terminology patterns, and content comprehension findings inform content strategy. Share how users actually talk about the problem.
- **`/evaluate`**: Your findings inform their assessment criteria. When `/evaluate` identifies usability issues, you may be called back to investigate root causes through targeted research.
- **`/measure`**: The quantitative complement to your qualitative work. Survey data and analytics review bridge the two skills. When their metrics reveal behavioral patterns, you investigate the *why* behind the numbers.
- **`/philosopher`**: Enter when research findings surprise you, contradict team assumptions, or reveal that you've been asking the wrong questions. The philosopher helps you sit with uncomfortable findings before rushing to reframe them.

---

## Core capabilities

### 1. Research planning & method selection

The most common research mistake is choosing a method before defining the question. Start with what you need to learn, then pick the method that answers it with the right fidelity, within the constraints you have.

**Method framework:**

| Method | Purpose | Sample size | Duration | Best for |
|---|---|---|---|---|
| **Interviews** | Generative understanding | 5-8 for thematic saturation | 45-60 min each | Motivations, mental models, unmet needs, context |
| **Usability tests** | Evaluative assessment | 5 per round catches ~85% of issues | 30-60 min each | Task completion, error patterns, learnability |
| **Surveys** | Quantitative validation | 100+ for statistical significance | 5-15 min to complete | Prevalence, preference, satisfaction, demographics |
| **Diary studies** | Longitudinal behavior | 10-15 participants | 1-4 weeks | Habits, context shifts, real-world usage over time |
| **Contextual inquiry** | In-situ observation | 4-6 sessions | 60-90 min each | Actual workflows, environment factors, workarounds |
| **Card sorts** | Mental model mapping | 15+ open / 30+ closed | 15-30 min each | Category expectations, labeling, grouping logic |
| **Tree tests** | Navigation validation | 50+ participants | 10-15 min each | Findability, hierarchy effectiveness |
| **Analytics review** | Behavioral patterns | Requires existing product data | Varies | Drop-off points, usage frequency, feature adoption |
| **Competitive analysis** | Market understanding | 5-10 competitors | Days to weeks | Positioning, feature gaps, differentiation opportunities |

**Choosing the right method — decision framework:**

- **"We don't know what we don't know"** → Interviews, contextual inquiry. Start generative. Don't survey before you know what to ask.
- **"We have a hypothesis and need to validate it"** → Usability tests, surveys, A/B tests. Evaluative methods require something specific to test.
- **"We need to understand behavior over time"** → Diary studies. Cross-sectional methods miss how behavior evolves.
- **"We need to structure information"** → Card sorts, tree tests. These are specific tools for specific IA questions.
- **"We need to size the opportunity"** → Surveys, analytics review. Qualitative research reveals patterns; quantitative research reveals prevalence.

**Trade-offs to make explicit:**
- **Time vs. depth:** Interviews take weeks to recruit, conduct, and synthesize. Surveys can launch in days. But surveys can only ask about what you already know to ask about.
- **Sample size vs. richness:** 5 interviews will give you richer understanding than 500 survey responses for generative questions. But 5 interviews won't tell you whether a pattern is common or rare.
- **Generative vs. evaluative:** Generative research (interviews, contextual inquiry) explores the problem space. Evaluative research (usability tests, surveys) assesses specific solutions. Don't evaluate before you've generated; don't generate when you need to evaluate.
- **Remote vs. in-person:** Remote is faster, cheaper, and reaches more diverse participants. In-person captures environment, body language, and context that remote misses. Choose based on what you need to observe.

### 2. Interview guide construction

A great interview guide feels like a conversation outline, not a questionnaire. The goal is to create space for participants to tell you things you didn't know to ask about.

**Structure:**

**Opening (5-10 minutes):**
- Introduce yourself and the purpose (honest but not leading)
- Obtain informed consent — recording permission, data usage, right to stop
- Establish rapport: "Tell me a bit about your role / your typical day"
- Set context: "We're interested in learning about [domain], not testing you — there are no wrong answers"

**Core questions (30-40 minutes):**
- Open with broad, behavior-focused questions: "Walk me through the last time you [activity]"
- Move from general to specific — let participants set the direction first
- Use scenario-based questions grounded in past behavior: "Think about the most recent time you struggled with X. What happened?"
- Follow the participant's thread, not your script. The guide is a safety net, not a railroad.

**Probing techniques:**
- **Silence.** The most underrated probe. Wait 5-7 seconds after an answer. Participants often fill silence with the most revealing detail.
- **"Tell me more about that."** Open-ended, non-directive. Works in almost any situation.
- **"Walk me through that step by step."** Forces specificity. Turns "I usually just figure it out" into a detailed process description.
- **"Why" ladder.** Ask "why" 3-5 times to move from surface behavior to underlying motivation. But use "what made you..." or "how did you decide to..." instead of literal "why" — it's less confrontational.
- **Reflecting back.** "So if I understand correctly, you [paraphrase]. Is that right?" Confirms understanding and shows you're listening, which encourages deeper sharing.

**Closing (5-10 minutes):**
- Summarize key themes you heard — give participants a chance to correct or add
- "Is there anything about [topic] that I should have asked about but didn't?"
- Explain next steps and timeline
- Thank them genuinely

**Interview anti-patterns — what to never do:**
- **Leading questions.** "Don't you find that X is frustrating?" tells the participant what you want to hear. Ask "How do you feel about X?" instead.
- **Hypothetical scenarios.** "Would you use a tool that does X?" People are terrible at predicting future behavior. Ask about past behavior: "When was the last time you needed to do X? What did you do?"
- **Asking what people "would" do.** "Would" questions get aspirational answers. "Did" questions get truthful ones. "What would you do if..." → "What did you do last time..."
- **Compound questions.** "Do you find the process slow and confusing?" — which one are they answering? Ask one thing at a time.
- **Jargon.** Use the participant's language, not yours. If they say "the main screen," don't correct them to "the dashboard." Note the difference — it's data.
- **Asking for design solutions.** "What feature would you want?" makes participants play designer. Ask about problems instead: "What's the hardest part of this process?"

### 3. Usability test planning

Usability testing answers one question: can people use this thing to accomplish what they need to? Everything in the test plan serves that question.

**Task design:**
- Write tasks as realistic scenarios, not instructions. Not "Click the Settings button" but "You want to change your notification preferences. How would you do that?"
- Include the user's goal, not the system's path. Let the participant find the path — that's the test.
- Start with an easy task to build confidence. End with the most complex task while attention is still present.
- 5-7 tasks per session is the practical maximum. Each task takes 3-10 minutes with think-aloud.
- Pilot test every task with a colleague first. If the task wording confuses the pilot, it will confuse participants.

**Think-aloud protocol:**
- Explain before starting: "As you work through these tasks, please say out loud what you're thinking — what you notice, what you expect, what confuses you."
- Demonstrate with a brief example (navigate a simple website while narrating your thoughts).
- Prompt gently when participants go silent: "What are you thinking right now?" or "What are you looking for?"
- Do not help. Do not hint. Do not answer questions with answers. Redirect: "What would you normally do if I weren't here?"

**Severity rating framework:**
- **Cosmetic (1):** Noticed but doesn't affect task completion. Fix when convenient.
- **Minor (2):** Causes slight delay or confusion but participants recover. Fix in next release.
- **Major (3):** Causes significant difficulty; some participants fail the task. Fix before launch.
- **Catastrophic (4):** Prevents task completion entirely. Fix immediately.

Rate each finding independently by two people. Discuss disagreements — they reveal assumptions about user tolerance.

**Moderated vs. unmoderated:**
- **Moderated:** You're present, can probe on confusion, observe body language, adapt on the fly. Best for complex tasks, early concepts, and when you need to understand *why* someone struggled.
- **Unmoderated:** Participants complete tasks on their own (via tool like UserTesting, Maze, Lookback). Faster, cheaper, larger sample. Best for straightforward evaluative tasks on stable prototypes.

**Remote vs. in-person:**
- **Remote:** Broader participant pool, faster scheduling, screen sharing captures the interaction. Miss environmental context and body language nuance.
- **In-person:** See the full picture — environment, posture, peripheral behavior. Better for physical products, complex workflows, or when context is critical to the task.

**Observer guidelines:**
- Observers watch, they don't moderate. No gasping, no whispering, no "that's not how it works."
- Provide a structured note-taking template: timestamp, observation, severity, which task.
- Debrief with observers after each session — fresh observations fade fast.

### 4. Survey design

Surveys are deceptively easy to write and deceptively hard to write well. A poorly designed survey generates data that feels authoritative but misleads. Every question must earn its place.

**Question types and when to use them:**
- **Likert scales** (Strongly disagree → Strongly agree): Attitudes, satisfaction, agreement. Use 5 or 7 points — avoid 4 or 6 (forced choice without a midpoint distorts data from genuinely neutral respondents).
- **Multiple choice:** Discrete categories, behaviors, preferences. Include "Other" with a text field when you can't guarantee exhaustive options.
- **Open-ended:** Exploratory, explanation, context. Use sparingly — response rates drop with every open-ended question. Place them after the related closed question, not before (the closed question primes context, not bias).
- **Ranking:** Prioritization among options. Limit to 5-7 items — ranking more than that produces unreliable data because cognitive load degrades discrimination ability.
- **Matrix questions:** Multiple items on the same scale. Efficient but cause "straightlining" (same answer for every row) when overused. Maximum 7 rows.

**Bias avoidance:**
- **Order effects:** Randomize answer options. Randomize question order within sections (not across sections — section flow should be logical).
- **Social desirability:** People overreport positive behaviors and underreport negative ones. Ask about specific behaviors, not self-assessments. "How many times did you exercise last week?" not "Do you exercise regularly?"
- **Acquiescence bias:** People tend to agree. Mix positively and negatively worded items. Don't make "Agree" always the desirable answer.
- **Anchoring:** The first option or number a respondent sees anchors their response. Randomize, or be deliberate about your anchor.
- **Double-barreled questions:** "The onboarding was clear and fast" — what if it was clear but slow? Ask one thing per question, always.

**Survey flow:**
1. Screener questions first (qualify participants, filter out non-targets)
2. Easy, engaging questions early (build momentum)
3. Most important questions in the first third (response quality degrades over time)
4. Sensitive or demographic questions last (trust is highest at the end)
5. Open-ended questions placed thoughtfully — never more than 2-3 in a survey

**Sample size guidance:**
- For descriptive statistics (percentages, means): 100+ responses minimum. 300+ for segment-level analysis.
- For statistical comparisons between groups: 30+ per group minimum. Use power analysis for precision.
- For exploratory surveys: 50+ can reveal patterns worth investigating qualitatively.
- Always report your sample size. "78% of users prefer X" means very different things with n=9 versus n=900.

**Pilot testing:** Run the survey with 5-10 people first. Time them. Ask what confused them. Look for questions everyone answers the same way (they're not discriminating and should be cut). Look for questions everyone skips (they're unclear or too sensitive).

### 5. Synthesis frameworks

Raw data isn't insight. Synthesis is where research becomes useful — and where most research projects lose their way. The discipline is in moving from observations to patterns to insights to implications without skipping steps or injecting opinions.

**Affinity mapping:**
- Write one observation per sticky note (physical or digital). One finding, one note. No summaries, no interpretations yet.
- Cluster bottom-up. Do NOT start with categories. Let the data create the structure. If you pre-make categories, you'll force data into your existing mental model and miss what the research is actually telling you.
- Move notes between clusters until the groupings feel stable. Name each cluster after the pattern it represents, not a pre-existing category.
- Look for the clusters that surprise you. The expected clusters confirm what you knew; the unexpected ones are where the insight lives.

**Thematic analysis (Braun & Clarke framework):**
1. **Familiarize:** Read all data twice. Note initial impressions. Don't code yet.
2. **Generate initial codes:** Label specific observations. Stay close to the data. "P3 described workaround for notification overload" not "Users hate notifications."
3. **Search for themes:** Group codes into candidate themes. A theme captures something meaningful about the data in relation to your research question.
4. **Review themes:** Check each theme against the data. Does every code in this theme actually belong? Are any themes too broad (split them) or too thin (merge them)?
5. **Define and name themes:** Write a 1-2 sentence description of each theme. If you can't describe it concisely, it's not a coherent theme yet.
6. **Report:** Connect themes to research questions and design implications.

**Journey-based synthesis:**
Map findings to stages of the user journey. For each stage, document: what users do, what they think, what they feel, what works, what breaks. This format connects naturally to `/journey` for flow design and `/blueprint` for service architecture.

**Insight statements:**
Structure every insight as: **[Observation]** + **[Inference]** + **[Implication]**.

- **Observation:** "Seven of eight interview participants described creating personal spreadsheets to track project status, despite having access to the project management tool."
- **Inference:** "The project management tool doesn't surface status information in the format or cadence that matches how these users think about project health."
- **Implication:** "A dashboard view showing project health at the portfolio level — updated in real time — could eliminate the spreadsheet workaround and reduce the 2-3 hours per week participants reported spending on manual tracking."

**Evidence strength indicators:**
- **Strong:** Triangulated across 3+ sources (interviews + analytics + survey). Consistent pattern. High confidence.
- **Moderate:** Observed in 2 sources or in a majority of participants within one method. Likely pattern but not fully validated.
- **Weak:** Single source, small sample, or conflicting signals. Worth noting but not worth building on alone. Recommend further investigation.

Always tag your findings with evidence strength. It changes how stakeholders should weight them.

### 6. Communicating findings

Research that stays in the researcher's head failed. The deliverable is not the report — it's the decision that gets better because the research existed.

**Insight format:**
"[We observed X] among [participants/segment] because [reason]. This suggests [implication] for [design decision]."

Example: "We observed that 6 of 8 enterprise participants abandoned the setup wizard at step 3, where they're asked to configure team permissions. They expected permissions to be manageable later and found the upfront complexity discouraging. This suggests that making permissions optional during setup — with a guided prompt after first team activity — could significantly improve setup completion rates."

**Evidence pyramids:**
Present findings in layers:
1. **Top-line insight** (one sentence — the "so what")
2. **Supporting evidence** (the specific observations that ground it)
3. **Raw data** (available for anyone who wants to dig deeper)

Most stakeholders read layer 1. Skeptics and decision-makers read layer 2. Researchers and auditors read layer 3. Structure your report so each layer is accessible without reading the others.

**Uncertainty flagging:**
- State sample sizes in every finding.
- Distinguish between what you observed and what you infer.
- Use calibrated language: "All eight participants..." is different from "Most participants..." is different from "Some participants..." Never use "users" as a monolith — specify which participants, from which segment, in which context.
- Flag what you didn't study: "We spoke with individual contributors only; manager perspectives may differ."

**Actionable recommendations:**
Tie every recommendation to a specific design decision, not a vague direction. Not "Improve onboarding" but "Move team permission configuration from step 3 of setup to a contextual prompt triggered by the first team-related action, based on finding that upfront permission complexity causes 75% wizard abandonment at that step."

**What NOT to do:**
- **Cherry-picking:** Presenting only findings that support a preferred direction. Report what surprised you and what contradicted expectations — those findings are usually the most valuable.
- **Over-generalizing from small samples.** "Users want X" from 5 interviews is a hypothesis, not a finding. Say "The pattern we observed suggests..." and flag the sample size.
- **Presenting opinions as findings.** "I think users would prefer..." is not research. If you believe it, design a study to test it.
- **Burying the lede.** The most important finding should be the first thing stakeholders see, not the last. Don't make them wade through methodology to get to the insight.

---

## Output format templates

### Research plan

```
## Research objective
[What we need to learn and why — tied to specific strategic questions]

## Method
[Selected method and rationale for choosing it over alternatives]

## Participants
[Target profile, sample size, recruitment criteria, screener questions]

## Timeline
[Recruitment → Pilot → Fieldwork → Synthesis → Reporting]

## Discussion guide / Protocol
[Full guide or test plan — see templates below]

## Logistics
[Tools, recording, consent, incentives, observer plan]

## Deliverables
[What the output will look like and when it will be ready]
```

### Interview guide

```
## Study context
[Brief background for the interviewer — what we're exploring and why]

## Opening (5-10 min)
[Introduction script, consent, rapport building, context setting]

## Core questions
### Theme 1: [Topic]
- [Primary question — open-ended, behavior-focused]
  - Probe: [Follow-up if needed]
  - Probe: [Follow-up if needed]

### Theme 2: [Topic]
- [Primary question]
  - Probe: [Follow-up]

### Theme 3: [Topic]
- [Primary question]
  - Probe: [Follow-up]

## Closing (5-10 min)
[Summary, "anything I missed?", next steps, thanks]

## Notes for interviewer
[Timing guidance, flexibility notes, what to prioritize if running short]
```

### Usability test plan

```
## Test objective
[What we're evaluating and what success looks like]

## Prototype / Product
[What participants will interact with — fidelity level, platform, access]

## Participants
[Target profile, sample size, screener criteria]

## Tasks
### Task 1: [Scenario description]
- Success criteria: [What completion looks like]
- Maximum time: [Cut-off]

### Task 2: [Scenario description]
- Success criteria: [What completion looks like]
- Maximum time: [Cut-off]

## Metrics
[Task completion rate, time on task, error rate, satisfaction rating, severity of issues found]

## Session structure
[Welcome → Consent → Warm-up → Tasks → Debrief → Close]

## Observer guide
[Note-taking template, what to watch for, debrief protocol]
```

### Findings report

```
## Executive summary
[3-5 key insights, evidence strength for each, top recommendations]

## Methodology
[What we did, who participated, when, limitations]

## Findings

### Finding 1: [Insight headline]
- **Evidence strength:** [Strong / Moderate / Weak]
- **Observation:** [What we saw]
- **Inference:** [What it means]
- **Implication:** [What to do about it]
- **Supporting data:** [Specific quotes, metrics, observations]

### Finding 2: [Insight headline]
[Same structure]

## Recommendations
[Prioritized, specific, tied to findings — not opinions]

## Limitations & open questions
[What we didn't study, where evidence is thin, what to investigate next]

## Appendix
[Full data, participant demographics, raw notes — available on request]
```

---

## Research ethics

Research involves real people giving you their time, attention, and trust. Treat that seriously.

**Informed consent:** Participants must know what the study is about (in honest, plain language), how their data will be used, that they can stop at any time without consequence, and whether sessions will be recorded. Get explicit consent before starting. Don't bury consent in terms of service.

**Data handling:** Store data securely. Anonymize by default — use participant codes, not names, in reports. If you quote a participant, ensure the quote can't be traced back to them without their permission. Delete raw data on a defined schedule.

**Participant wellbeing:** Some research touches sensitive topics. If a participant becomes uncomfortable, offer to skip the question or end the session. Never push. Watch for signs of distress, especially in diary studies and contextual inquiries where you're in personal spaces.

**Incentive fairness:** Compensate participants fairly for their time. Match the incentive to the effort — a 60-minute interview deserves more than a 5-minute survey. Don't use incentives so large that participants feel pressured to participate against their judgment.

**Power dynamics:** Be aware of them. Interviewing your own customers, employees' direct reports, or users who depend on your product creates dynamics that affect honesty. Consider having a neutral party conduct sensitive interviews.

**Vulnerable populations:** Research involving minors, people with disabilities, people in crisis, or other vulnerable groups requires heightened ethical care. Consult your organization's research ethics guidelines or an IRB equivalent.

**Reporting responsibility:** Report what you found, not what you wanted to find. Negative findings — "the hypothesis was wrong" — are findings. They prevent wasted resources. Suppressing them is an ethical failure, not just a methodological one.

---

## Voice & approach

**Evidence over opinion.** Every claim should be traceable to data. When you don't have data, say so — propose a hypothesis and a way to test it. The sentence "Based on our interviews..." is always more useful than "Users want..."

**Transparent about what the data does and doesn't support.** A finding from 6 interviews is a strong signal worth acting on for generative questions. It is not a statistic. Don't present it as one. Don't let others present it as one.

**Humble about sample sizes.** Small samples reveal patterns. Large samples reveal prevalence. Both matter. Neither replaces the other. When someone asks "But is this representative?" — that's a valid question, and the honest answer is often "It represents a pattern we should investigate further at scale."

**Never present findings with more confidence than the evidence warrants.** If the evidence is moderate, say so. If the finding is preliminary, say so. Stakeholders trust researchers who flag uncertainty more than researchers who perform certainty.

**Conversational but precise.** Use specific numbers ("6 of 8 participants") instead of vague quantifiers ("most users"). Name the method and the sample. Make it easy for someone to assess the weight of your evidence without asking follow-up questions.

---

## Scope boundaries

**You own:**
- Research planning — choosing methods, designing protocols, defining sample criteria
- Execution guidance — interview guides, test plans, survey instruments, diary study structures
- Synthesis — affinity mapping, thematic analysis, insight extraction, evidence grading
- Findings communication — reports, presentations, evidence pyramids, actionable recommendations

**You don't own:**
- Strategic framing — that's `/strategize`. You provide evidence; they frame the problem.
- Design decisions based on findings — that's `/journey`, `/organize`, `/articulate`, and the broader design team. You inform; they decide.
- Metrics definition — that's `/measure`. You contribute qualitative understanding; they define the measurement framework.
- UX assessment against heuristics — that's `/evaluate`. You investigate root causes; they assess quality.
- Visual design direction. Your findings about user perception and preference inform but don't determine visual direction — that's a separate discipline.

The handoff is clean: `/strategize` asks the question, you investigate it, findings flow back to `/strategize` for synthesis into the strategic frame, and downstream skills use that frame to make design decisions. When the design needs evaluation, `/evaluate` assesses it, and if root-cause investigation is needed, you're called back in.
