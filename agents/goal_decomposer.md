# Agent: goal_decomposer

**MCP tool:** `mcp__lf-serambi_ai__goal_decomposer`  
**Langflow flow:** [`flows/goal_decomposer.json`](../flows/goal_decomposer.json)  
**Endpoint name:** `goal_decomposer`  
**Status:** ✅ e2e verified (ISS-01 → ISS-03)

---

## Persona

A structured learning goal coach for Indonesian career switchers. Given a freeform career goal in natural language, the agent extracts intent and produces a concrete, week-by-week roadmap with milestones and deliverables.

The agent outputs **only valid JSON** — no prose, no markdown, no explanation. It is a structured decomposition tool, not a conversational tutor (that role belongs to the Tutor Agent, ISS-04).

---

## System Prompt

```
You are a learning goal coach helping career switchers in Indonesia.
Given the user's career goal below, extract and structure it into a learning roadmap.

User goal: {user_goal}

Respond ONLY with valid JSON in this exact format (no markdown, no explanation):
{
  "goal": "<cleaned goal statement in Bahasa Indonesia>",
  "deadline_weeks": <number>,
  "milestones": [
    { "week_range": "1-2", "focus": "<topic>", "deliverable": "<what they can do after this>" },
    { "week_range": "3-4", "focus": "<topic>", "deliverable": "<what they can do after this>" },
    { "week_range": "5-6", "focus": "<topic>", "deliverable": "<what they can do after this>" },
    { "week_range": "7-8", "focus": "<topic>", "deliverable": "<what they can do after this>" },
    { "week_range": "9-10", "focus": "<topic>", "deliverable": "<what they can do after this>" },
    { "week_range": "11-12", "focus": "<topic>", "deliverable": "<what they can do after this>" }
  ],
  "first_action": "<one concrete thing the user can do TODAY to start>"
}
```

**LLM config:** provider = endpoint OpenAI-compatible · temperature = 0.3  
Base URL, nama model, dan API key diisi di environment saat runtime (lihat `docs/adr/0004-llm-providers.md`). Low temperature keeps decomposition output deterministic and structurally consistent across calls.

---

## Pedagogical Constraints

This agent applies the following project-wide guardrails (see [`AGENTS.md`](../AGENTS.md#pedagogical-constraints)):

| Constraint | How it applies here |
|---|---|
| **Goal-first** | Every milestone is anchored to the user's stated role and timeline |
| **Scaffold, not oracle** | The roadmap gives structure, not answers — learner still does the work |
| **No cognitive offloading** | Agent produces a plan, not completed work; learner must execute |

The other constraints (graduated hinting, probing questions) apply primarily to Tutor and Assessment agents.

---

## Input / Output Contract

### Input

| Parameter | Type | Description |
|---|---|---|
| `input_value` | `string` | Freeform career goal in natural language (Bahasa Indonesia or English) |

**Example:**
```
"Saya ingin jadi data analyst dalam 3 bulan"
```

### Output

JSON object with the following schema:

```json
{
  "goal": "string — cleaned goal statement in Bahasa Indonesia",
  "deadline_weeks": "integer — total weeks derived from goal",
  "milestones": [
    {
      "week_range": "string — e.g. '1-2'",
      "focus": "string — topic or skill area for this period",
      "deliverable": "string — what the learner can do or produce after this period"
    }
  ],
  "first_action": "string — one concrete action the learner can take today"
}
```

**Example output (verified e2e, ISS-03):**
```json
{
  "goal": "Menjadi data analyst dalam 3 bulan",
  "deadline_weeks": 12,
  "milestones": [
    { "week_range": "1-2", "focus": "Dasar-dasar Python dan pandas", "deliverable": "Mampu membersihkan dataset CSV sederhana" },
    { "week_range": "3-4", "focus": "SQL untuk analisis data", "deliverable": "Mampu menulis query JOIN dan agregasi di database nyata" },
    { "week_range": "5-6", "focus": "Visualisasi data (Matplotlib/Seaborn)", "deliverable": "Mampu membuat 3 jenis chart analitik dari data sendiri" },
    { "week_range": "7-8", "focus": "Statistik deskriptif dan inferensial", "deliverable": "Mampu menginterpretasikan distribusi dan uji hipotesis sederhana" },
    { "week_range": "9-10", "focus": "Proyek mini end-to-end", "deliverable": "Dataset publik → notebook analisis → ringkasan temuan" },
    { "week_range": "11-12", "focus": "Portfolio dan persiapan wawancara", "deliverable": "2 proyek portfolio di GitHub + berlatih 10 pertanyaan interview" }
  ],
  "first_action": "Install Anaconda dan selesaikan Python tutorial interaktif selama 1 jam hari ini"
}
```

---

## Research Grounding

| Finding | Source | Implication for this agent |
|---|---|---|
| Goal-to-skill mapping + learning path scheduling improves career transition outcomes | GenMentor (W4410636983, FWCI 47.3) | Core rationale: structured decomposition from goal → milestone is the first step of an effective learning system |
| AI intervention on Self-Regulated Learning forethought/planning phase has largest effect (g = 1.613 across 32 studies) | SRL meta-analysis, Frontiers in Education 2025 | This agent operates entirely in the SRL forethought/planning phase — the phase with the highest measured impact |
| Structured weekly roadmap reduces cognitive load vs. open-ended self-study | OECD 2024 + market gap context | Career switchers without a plan fail not from lack of effort but from lack of structure |

Full research library: [`research/research-papers-and-abstracts.md`](../research/research-papers-and-abstracts.md)

---

## Verification

```bash
# Static — always required before committing flows/goal_decomposer.json
bash scripts/verify-flow.sh

# Live — required if Langflow server is running
bash scripts/verify-e2e.sh
```

Both scripts were passing as of ISS-09 (commit `7409ccf`).

---

## Flow Nodes

| Node | Type | Role |
|---|---|---|
| Chat Input | Input | Receives `user_goal` string from caller |
| Prompt Template | Prompt | Injects `{user_goal}` into system prompt; enforces JSON-only output |
| Language Model | LanguageModelComponent | endpoint OpenAI-compatible, temperature 0.3 |
| Chat Output | Output | Returns structured JSON roadmap to MCP caller |
