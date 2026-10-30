# Agent: goal_decomposer

**MCP tool:** `mcp__lf-serambi_ai__goal_decomposer`  
**Langflow flow:** [`flows/goal_decomposer.json`](../flows/goal_decomposer.json)  
**Endpoint name:** `goal_decomposer`  
**Status:** ✅ e2e verified (ISS-01 → ISS-03) — updated for AI literacy pivot

---

## Persona

An AI learning coach helping non-technical professionals in Indonesia. Given the user's profession, hobbies, current AI understanding level, and weekly schedule, the agent creates a personalized weekly AI learning plan that fits their life.

The agent outputs **only valid JSON** — no prose, no markdown, no explanation. It is a structured decomposition tool, not a conversational tutor (that role belongs to the Tutor Agent, ISS-04).

---

## System Prompt

```
You are an AI learning coach helping non-technical professionals in Indonesia.
Given the user's profession, hobbies, current AI understanding level, and weekly schedule,
create a personalized weekly AI learning plan that fits their life.

User profile:
- Profession: {profession}
- Hobbies/Interests: {hobbies}
- Current AI understanding: {level}  (values: "pemula" | "sedikit tahu" | "cukup paham")
- Weekly learning hours available: {weekly_hours}
- Curated resources for this profession: {resources_json}

Respond ONLY with valid JSON in this exact format (no markdown, no explanation):
{
  "goal": "<cleaned goal statement in Bahasa Indonesia, e.g. 'Menguasai AI untuk mengajar sebagai guru SD'>",
  "deadline_weeks": <number, default 12>,
  "milestones": [
    { "week_range": "1-2", "focus": "<AI topic for this period>", "deliverable": "<concrete outcome>", "resources": ["<url1>", "<url2>"] },
    { "week_range": "3-4", "focus": "<AI topic>", "deliverable": "<concrete outcome>", "resources": ["<url1>", "<url2>"] },
    { "week_range": "5-6", "focus": "<AI topic>", "deliverable": "<concrete outcome>", "resources": ["<url1>", "<url2>"] },
    { "week_range": "7-8", "focus": "<AI topic>", "deliverable": "<concrete outcome>", "resources": ["<url1>", "<url2>"] },
    { "week_range": "9-10", "focus": "<AI topic>", "deliverable": "<concrete outcome>", "resources": ["<url1>", "<url2>"] },
    { "week_range": "11-12", "focus": "<AI topic>", "deliverable": "<concrete outcome>", "resources": ["<url1>", "<url2>"] }
  ],
  "first_action": "<one concrete thing the user can do TODAY to start learning AI>"
}
```

**LLM config:** provider = endpoint OpenAI-compatible · temperature = 0.3  
Base URL, nama model, dan API key diisi di environment saat runtime (lihat `docs/adr/0004-llm-providers.md`). Low temperature keeps decomposition output deterministic and structurally consistent across calls.

---

## Pedagogical Constraints

This agent applies the following project-wide guardrails (see [`AGENTS.md`](../AGENTS.md#pedagogical-constraints)):

| Constraint | How it applies here |
|---|---|
| **Goal-first** | Every milestone is anchored to the user's profession and AI application for that profession |
| **Scaffold, not oracle** | The roadmap gives structure with curated resources, not answers — learner still does the work |
| **No cognitive offloading** | Agent produces a plan with credible resource links, not completed work; learner must execute |

The other constraints (graduated hinting, probing questions) apply primarily to Tutor and Assessment agents.

---

## Input / Output Contract

### Input

| Parameter | Type | Description |
|---|---|---|
| `profession` | `string` | User's profession (e.g., "guru SD", "pemilik UMKM kuliner", "staff ekspor-impor", "dokter", "akuntan") |
| `hobbies` | `string` | User's hobbies or interests (e.g., "membaca, masak, travel") |
| `level` | `string` | Current AI understanding: `"pemula"` \| `"sedikit tahu"` \| `"cukup paham"` |
| `weekly_hours` | `integer` | Hours available per week for learning AI (1-40) |
| `resources_json` | `string` | Curated resources for the profession (injected by backend from `resources/ai-learning-resources.json`) |

**Example:**
```json
{
  "profession": "guru SD",
  "hobbies": "membaca",
  "level": "pemula",
  "weekly_hours": 5
}
```

### Output

JSON object with the following schema:

```json
{
  "goal": "string — cleaned goal statement in Bahasa Indonesia (e.g., 'Menguasai AI untuk mengajar sebagai guru SD')",
  "deadline_weeks": "integer — total weeks (default 12)",
  "milestones": [
    {
      "week_range": "string — e.g. '1-2'",
      "focus": "string — AI topic for this period",
      "deliverable": "string — concrete outcome the learner can produce",
      "resources": ["string — curated credible URLs from resources/ai-learning-resources.json"]
    }
  ],
  "first_action": "string — one concrete action the learner can take TODAY"
}
```

**Example output:**
```json
{
  "goal": "Menguasai AI untuk mengajar sebagai guru SD",
  "deadline_weeks": 12,
  "milestones": [
    { "week_range": "1-2", "focus": "Dasar AI & Prompt Engineering untuk guru", "deliverable": "Mampu membuat prompt lesson plan efektif", "resources": ["https://platform.openai.com/docs/guides/prompt-engineering", "https://www.promptingguide.ai/"] },
    { "week_range": "3-4", "focus": "AI untuk materi ajar & soal", "deliverable": "Membuat 1 set soal + kunci jawaban dengan AI", "resources": ["https://education.microsoft.com/en-us/resources/ai-in-education", "https://teachai.org/"] },
    { "week_range": "5-6", "focus": "AI untuk penilaian & diferensiasi", "deliverable": "Mampu membuat rubrik penilaian & soal diferensiasi", "resources": ["https://www.edutopia.org/article/ai-tools-formative-assessment", "https://www.iste.org/areas-of-focus/ai-in-education"] },
    { "week_range": "7-8", "focus": "AI untuk keterlibatan siswa", "deliverable": "Mendesain aktivitas kelas interaktif dengan AI", "resources": ["https://www.commonsense.org/education/ai-tools-for-student-engagement"] },
    { "week_range": "9-10", "focus": "AI untuk administrasi & efisiensi", "deliverable": "Mengotomatiskan laporan & administrasi guru", "resources": ["https://www.edsurge.com/news/2024-01-15-how-teachers-are-using-ai-to-save-time"] },
    { "week_range": "11-12", "focus": "Proyek integrasi AI penuh", "deliverable": "Mengimplementasikan AI di 1 mata pelajaran penuh", "resources": ["https://teachai.org/", "https://education.microsoft.com/en-us/resources/ai-in-education"] }
  ],
  "first_action": "Coba tanyakan ke AI: 'Buatkan lesson plan IPA kelas 3 tema tumbuhan, 45 menit, kurikulum merdeka'"
}
```

---

## Resource Credibility

Resources are sourced from [`resources/ai-learning-resources.json`](../resources/ai-learning-resources.json) — a curated mapping of profession → topic → verified URLs. Sources include:
- Official platform documentation (OpenAI, Microsoft Education, Google AI)
- Reputable educational organizations (ISTE, TeachAI, Edutopia, Common Sense Education)
- Industry-standard platforms (Canva, Shopify, Xero, Trade.gov, ICC)
- Academic/medical authorities (Nature, The Lancet, UptoDate, AMA, AICPA, CFA Institute)

The agent receives the relevant subset via `{resources_json}` and embeds appropriate URLs per milestone. This prevents hallucination and ensures credibility.

---

## Research Grounding

| Finding | Source | Implication for this agent |
|---|---|---|
| Goal-to-skill mapping + learning path scheduling improves career transition outcomes | GenMentor (W4410636983, FWCI 47.3) | Core rationale: structured decomposition from profession → AI skills roadmap |
| AI intervention on Self-Regulated Learning forethought/planning phase has largest effect (g = 1.613 across 32 studies) | SRL meta-analysis, Frontiers in Education 2025 | This agent operates entirely in the SRL forethought/planning phase — the phase with the highest measured impact |
| Structured weekly roadmap reduces cognitive load vs. open-ended self-study | OECD 2024 + market gap context | Professionals without a plan fail not from lack of effort but from lack of structure |
| Professionals need domain-specific AI applications, not generic AI courses | IBM SkillsBuild mentor feedback | This pivot targets "AI untuk profesi X" not "jadi AI engineer" |

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
| Chat Input | Input | Receives profession, hobbies, level, weekly_hours, resources_json from caller |
| Prompt Template | Prompt | Injects variables into system prompt; enforces JSON-only output with resources array |
| Language Model | LanguageModelComponent | endpoint OpenAI-compatible, temperature 0.3 |
| Chat Output | Output | Returns structured JSON roadmap to MCP caller |

---

## Prompt Variables (Prompt-GDA02)

| Variable | Source | Description |
|---|---|---|
| `profession` | Chat Input / MCP caller | User's profession |
| `hobbies` | Chat Input / MCP caller | User's hobbies/interests |
| `level` | Chat Input / MCP caller | AI understanding level (pemula/sedikit tahu/cukup paham) |
| `weekly_hours` | Chat Input / MCP caller | Available learning hours per week |
| `resources_json` | Backend injection | Curated resources subset for the profession |