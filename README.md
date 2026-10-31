# Serambi.ai

**AI literacy for non-technical professionals in Indonesia.**

Serambi.ai helps teachers, small-business owners, accountants, doctors, administrators and other non-technical professionals learn AI in a way that fits their job, their hobbies and the free time they actually have.

- **Input:** profession, hobbies and free hours.
- **Target output:** a 6-week learning plan with 10 to 30 minute sessions, examples drawn from the learner's work, and analogies drawn from their hobbies.
- **App features (planned):** spaced repetition (days 1, 3, 7, 14, 30), short exercises, and an "Ask AI" companion.

[Bahasa Indonesia](README.id.md) · [Live prototype](https://serambi-ai.netlify.app) · [Docs](docs/README.md)

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

> *Serambi* is the Indonesian word for the front porch of a house, where conversations begin.

## Project status

Be clear about what exists before reading further.

| Component | Status |
|---|---|
| `goal_decomposer` Langflow flow (Goal Agent) | In the repo. Verified end to end earlier. Today it outputs a **12-week** roadmap; the product target is **6 weeks** (ISS-25) |
| Static prototype (`apps/prototype/`) | Live on Netlify. A UI mockup with sample data: no accounts, no database, no backend, and not connected to the flow |
| LLM provider | Flows run on an **OpenAI-compatible** endpoint. IBM watsonx is the intended provider and has **not** been run yet |
| Scheduler agent, Nuxt 4 PWA, Nitro backend, database | Future work |

## What the flow does today

`goal_decomposer` takes a short profile and returns a structured roadmap in Indonesian.

```json
// Input
{
  "profession": "guru",
  "hobbies": ["membaca", "fotografi"],
  "level": "pemula",
  "weekly_hours": 5
}

// Output (abridged)
{
  "profession": "guru",
  "level": "pemula",
  "weekly_hours": 5,
  "roadmap": [
    {
      "week": "1-2",
      "theme": "Dasar AI & Prompt Engineering untuk Guru",
      "objectives": ["Memahami LLM", "Membuat prompt efektif untuk tugas guru"],
      "key_concepts": ["LLM", "Prompt Engineering", "Zero-shot vs Few-shot"],
      "practice": "Buat 5 prompt untuk: rencana pelajaran, soal ujian, surat orang tua, feedback siswa, newsletter kelas",
      "resources": [
        {"title": "Panduan Prompt Engineering untuk Pendidik", "url": "https://belajar.kemdikbud.go.id/...", "type": "official"}
      ],
      "estimated_hours": 5
    }
    // ... remaining milestones
  ]
}
```

Verification:

```bash
bash scripts/verify-flow.sh    # exit 0: flow structure is valid
bash scripts/verify-e2e.sh     # exit 0 with a live Langflow; exit 2 if the server is unreachable
```

An exit code of 2 from `verify-e2e.sh` means no Langflow server could be reached. It does not mean the flow is broken.

## Problem and opportunity

Indonesia needs about 9 million digital-talent workers by 2030, and roughly a third of that need is currently met (Komdigi). It ranks among the heaviest users of AI but far lower in building it. In AWS research published in August 2025, 57% of Indonesian businesses named a lack of digital skills as a main barrier to growth.

Recent surveys point to the same gap on the worker side:

- Of Indonesian knowledge workers surveyed by Salesforce/YouGov (April 2026, 1,002 respondents), 37% want to know which AI skills to develop, and only 33% are being trained by their employer to use AI agents.
- AWS (August 2025) reports that 21% of businesses consider their workforce ready, while 48% of jobs require AI literacy.
- An ILO brief (July 2026) estimates that 21.7% of Indonesian workers are in occupations exposed to generative AI. The same brief notes that no major disruption is visible yet.

Three gaps Serambi.ai targets:

1. **Courses start from a curriculum, not from a profession.** Most AI courses are technical (coding, ML). Non-technical professionals need AI for their own work: a teacher generating exercises, a shop owner writing marketing copy, an exporter reading foreign-language documents.
2. **General AI assistants act as oracles.** They answer immediately, so the learner does less of the thinking. Fan et al. (BJET, 2024) describe this as *metacognitive laziness*.
3. **Reskilling products mostly serve companies.** An individual who wants to learn AI alone has few options built for them.

Competitor analysis (12 products): [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md).

## How it works

Each agent is one Langflow flow exposed as one named MCP tool. Spaced repetition, exercises and Ask AI are application features, not separate agents.

| # | Agent | MCP tool | Purpose | Status |
|---|---|---|---|---|
| 1 | **Goal Agent** | `goal_decomposer` | Profession, hobbies and schedule → learning plan with credible sources | In the repo (12 weeks today, 6-week target) |
| 2 | **Scheduler** | not named yet | Adaptive study schedule from free time or Google Calendar | Planned (ISS-26) |

Follow-up ideas, outside the prototype: `explain_concept` and `generate_quiz` (draft specs in [`agents/`](agents/)), `check_progress`, `send_reminder`, `check_wellbeing`.

## Architecture

One MCP contract, two callers. IBM Bob, a coding agent harness, builds and verifies the Langflow flows. In the target architecture a Nuxt Nitro backend calls the same MCP server as an MCP client.

![Serambi.ai system architecture](assets/diagrams/serambi-architecture.svg)

| Component | Role | Status |
|---|---|---|
| **IBM Bob** | Coding agent harness. Builds and verifies agents. Not a user interface | In use |
| **Langflow MCP server** | Flow engine. One flow is one named MCP tool, over streamable HTTP via `mcp-proxy` | In the repo (`goal_decomposer`) |
| **LLM provider** | Target: IBM watsonx. Today: OpenAI-compatible endpoint, temperature 0.3 | watsonx not yet run |
| **Static prototype** (`apps/prototype/`) | UI mockup on Netlify with sample data | Live |
| **Nuxt 4 PWA frontend** (`apps/web`) | End-user interface | Future work (scaffold only) |
| **Nuxt Nitro backend** | API and MCP client that calls the Langflow tools | Future work |
| **Database** | SQLite/libSQL or Postgres | Future work, undecided |

Decision records: [`docs/adr/`](docs/adr/README.md).

## Research grounding

| Decision | Source |
|---|---|
| Goal-to-skill mapping and efficient learning path | GenMentor, 2025. [DOI 10.1145/3701716.3715244](https://doi.org/10.1145/3701716.3715244) |
| Feynman technique over passive reading | Feynman Bot, IEEE TALE 2024. [arXiv 2506.09055](https://arxiv.org/abs/2506.09055) |
| Spaced repetition from a forgetting-curve model | Zaidi et al., AIED 2020. [arXiv 2004.11327](https://arxiv.org/abs/2004.11327) |
| Guide, do not answer (avoid cognitive offloading) | Fan et al., BJET 56(2), 2024. [DOI 10.1111/bjet.13544](https://doi.org/10.1111/bjet.13544) |
| Multi-agent tutoring with one learner model | IntelliCode |

Notes and abstracts: [`research/`](research/).

## Getting started

### Prerequisites

| Requirement | Version | Used for |
|---|---|---|
| IBM Bob | v2.0+ | Running agents through MCP |
| Langflow | v1.12+ | Flow engine (Docker recommended) |
| Node.js | v20+ | Bob |
| Python | 3.11+ | Bootstrap and verification scripts |
| `uvx` | `pip install uv` | Bob spawns `mcp-proxy` |
| `jq`, `curl` | any | `scripts/*.sh` parse JSON and call MCP |

### 1. Clone and configure

```bash
git clone https://github.com/mmuchsin/serambi-ai.git
cd serambi-ai
cp .env.example .env
# Edit .env and set LANGFLOW_API_KEY
```

### 2. Start Langflow

```bash
docker run -p 7860:7860 langflowai/langflow:1.12.2
```

Open http://localhost:7860, import `flows/goal_decomposer.json`, and set the Endpoint Name to `goal_decomposer`. The repo also ships a `compose.yaml` jury sandbox; its header comments describe the commands.

### 3. Load the API key

```bash
source ~/.bashrc   # or: export LANGFLOW_API_KEY=<your-key>
```

### 4. Open Bob

Bob loads `.bob/mcp.json` on start. The `lf-serambi_ai` server connects to Langflow over streamable HTTP, and every flow with an Endpoint Name becomes a named tool. No further setup is needed.

### 5. View the prototype (optional)

The static prototype has no build step. Open `apps/prototype/index.html` in a browser, or use the live version at https://serambi-ai.netlify.app. The Nuxt 4 app in `apps/web` is a scaffold and is not connected to Langflow.

## Usage

In Bob:

```
Saya guru SD, suka membaca, level pemula, 5 jam/minggu. Buatkan roadmap AI literacy.
```

Bob calls `goal_decomposer`, Langflow runs the flow, and the response is a structured roadmap (12 weeks today, 6-week target).

## Business model

Category: Education and Future of Work. This section describes hypotheses, not validated numbers.

**Unit economics.** AI products report gross margins of about 45% in 2025 and low 50s in 2026, against 60 to 80% for traditional SaaS (1752vc + ICONIQ, State of AI 2026). Inference cost grows with usage, so margin has to be managed per user. In Serambi.ai the cost per user is one plan generation per goal, plus review and Ask AI calls. The plan is usage-based or hybrid pricing from the start, and the North Star metric is learning progress rather than revenue.

**Willingness to pay.** The closest consumer reference is Astra AI at Rp 115,000 per month ([App Store ID](https://apps.apple.com/id/app/id6751030141)), aimed at school-exam preparation. Willingness to pay for AI literacy among working professionals has not been tested.

**Revenue paths, fastest first.**

| Path | Who pays | Notes |
|---|---|---|
| B2B white-label | Bootcamps, universities, reskilling programs | Fastest route to revenue. The flow already sits behind an MCP endpoint |
| Institutional licensing | Vocational schools and universities | Recurring per cohort. Needs multi-tenant work in Langflow |
| Consumer subscription | Individual professionals | Largest market and most competitive |

Business documents: [`north-star.md`](docs/business/north-star.md) · [`value-proposition.md`](docs/business/value-proposition.md) · [`competitive-analysis.md`](docs/business/competitive-analysis.md) · [`sdg-alignment.md`](docs/business/sdg-alignment.md)

## Guardrails

### Pedagogical (from the research)

| Constraint | Effect |
|---|---|
| Scaffold, not oracle | The agent guides instead of answering. A stuck learner gets the smallest useful hint |
| Graduated hinting | A hint escalates only after a smaller one has failed |
| Probing questions | "Why" and "how" questions expose gaps faster than explanations |
| No cognitive offloading | The agent does not do the learner's thinking |
| Goal-first | Every response points back to the learner's profession and context |

### Operational

- Each flow is verifiable on its own, and `verify-flow.sh` runs before every commit that touches a flow.
- Structured output at `temperature = 0.3` keeps the decomposition stable enough for downstream use.
- Node configuration follows the NIST AI RMF functions (govern, map, measure, manage) at prototype level.
- Indonesian regulatory context is tracked in [`docs/`](docs/), including the AI ethics circular (Kominfo, 2023) and the Komdigi National AI Roadmap consultation (August 2025).
- The research corpus is project material. The retrieval set holds no learner data and no paid content.

### Security and misuse prevention

Enforced today:

| Guardrail | Effect |
|---|---|
| Credentials stay out of the repo | API keys live in environment variables and are gitignored. The MCP endpoint rejects requests without `x-api-key` |
| Schema-validated output | Each agent returns JSON checked against a fixed schema. Model output is parsed as data and never executed |
| Learning-coach scope | The agent stays in a learning role and declines to hand over graded work |

Committed for the web app (not built yet):

- Free-text goals are treated as data inside a fixed system prompt, with length and content bounds against prompt injection.
- Public endpoints require authentication and rate limiting before any learner data is stored.
- Data minimization: only progress signals are stored, and forgetting-curve data is aggregated and anonymized before any secondary use.

## Roadmap

### Done

- `goal_decomposer` flow, verified end to end through Bob, MCP and Langflow (12-week output)
- Verification scripts with explicit exit codes
- Five ADRs covering the architecture
- Competitive analysis (12 competitors), value proposition and North Star metric
- 11-slide pitch deck with speaker notes
- Static prototype (landing page and `/app/`) in `apps/prototype/`, deployed to Netlify
- Nuxt 4 scaffold in `apps/web` (unused so far)

### Hackathon submission (deadline 31 October 2026)

- [x] Deploy the static prototype to Netlify
- [ ] Record a 3-minute demo video
- [ ] Submit the hackathon form

### After the hackathon

- Align the flow to a 6-week plan and run it on IBM watsonx (ISS-25)
- Scheduler agent with Google Calendar sync (ISS-26)
- Nuxt 4 PWA, Nitro backend (MCP client), authentication and database (ISS-27)
- Retrieval layer over `research/` (ISS-12)
- Follow-up agent ideas: `explain_concept`, `generate_quiz`, `check_progress`, `send_reminder`, `check_wellbeing`
- PWA work: offline support, push notifications, install prompt

## Repository structure

```
serambi-ai/
├── .bob/                  MCP config (mcp.json), hooks, settings, agent skills
├── flows/                 Langflow flow exports (goal_decomposer.json)
├── agents/                Agent specs and system prompts
├── apps/
│   ├── prototype/         Static prototype (live on Netlify)
│   └── web/               Nuxt 4 scaffold (future work)
├── packages/              Shared libraries (future)
├── materials/             Learning content by profession
├── resources/             Curated learning resource URLs (JSON)
├── docs/                  PRD, ISSUES, ADRs, business documents, submission draft
├── mcp/                   MCP integration details
├── research/              Research notes and paper abstracts
├── scripts/               verify-flow.sh, verify-e2e.sh, bootstrap-langflow.sh
├── slides/                Pitch deck (PPTX and PDF)
├── submission/            Screenshots for the submission form
├── assets/                Screenshots and diagrams (HTML sources included)
├── compose.yaml           Jury sandbox (Langflow plus verification)
├── DESIGN.md              Design system
└── AGENTS.md              Session rules, pedagogical constraints, MCP tool table
```

## MCP integration

Bob connects to Langflow through `mcp-proxy` over streamable HTTP. The configuration is in [`.bob/mcp.json`](.bob/mcp.json), and the API key is read from the environment and never committed. Every Langflow flow with an Endpoint Name becomes a callable tool, so `mcp__lf-serambi_ai__goal_decomposer` resolves to the live flow. Details and troubleshooting: [`mcp/README.md`](mcp/README.md).

## Agent skills

The project runs inside IBM Bob and loads skills on demand with `$skill-name`. There are more than 80 skills in [`.bob/skills/`](.bob/skills/), taken from [phuryn/pm-skills](https://github.com/phuryn/pm-skills), [mattpocock/skills](https://github.com/mattpocock/skills) and project-specific skills.

| Skill | Purpose |
|---|---|
| `diagram-design` | Architecture, flow and journey diagrams as HTML/SVG |
| `pitch-deck` | 11-slide pitch deck structure |
| `value-proposition` | Jobs-to-be-done template |
| `north-star` | North Star metric and input metrics |
| `competitive-analysis` | Competitor mapping and differentiation |
| `business-model` | Canvas-based business model |
| `plan-launch` | Go-to-market and beachhead segment |

## Development tools

IBM Bob handles agent orchestration, MCP tool calling and flow verification. One task sits outside its scope:

| Tool | Purpose |
|---|---|
| [pi agent](https://pi.dev/) with the [feynman extension](https://pi.dev/packages/@companion-ai/feynman) | Academic research and paper search |

## Maintainer

**M. Muchsin**, [github.com/mmuchsin](https://github.com/mmuchsin)

## License

Apache 2.0 © 2026 Serambi.ai Contributors. See [LICENSE](LICENSE).
