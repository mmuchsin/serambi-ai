# Serambi.ai — Adaptive Multi-Agent Learning Assistant

> *Serambi* (Indonesian) — a veranda or front porch: an open, welcoming space where learning begins.

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

---

## What It Does

Serambi.ai is an adaptive AI tutoring system for Indonesian career switchers. Tell it your goal ("become a data analyst in 3 months") and it builds a personalized weekly roadmap, explains concepts Feynman-style, quizzes you with graduated hints, and tracks your progress using spaced repetition — all through a conversational interface powered by IBM Bob.

**Research-backed design:**
- 📚 Goal-to-skill mapping (GenMentor, 2025 — DOI 10.1145/3701716.3715244)
- 🧠 Feynman technique + Protégé Effect — learning gains vs passive learners (Feynman Bot, IEEE TALE 2024 — arXiv 2506.09055)
- 🔁 Adaptive spaced repetition via forgetting-curve model (Zaidi et al., AIED 2020 — arXiv 2004.11327)
- 🚫 Anti-cognitive-offloading: AI guides, not answers (Fan et al., BJET 2024 — cited 700+)

**Verified live today:** `goal_decomposer` — set a career goal, get a weekly roadmap in Bahasa Indonesia. Flow verified end-to-end (`bash scripts/verify-flow.sh` → exit 0); live MCP round-trip verified when a Langflow server is running (`bash scripts/verify-e2e.sh`).

---

## Why This Is Different (competitive position)

Indonesian AI tutors are strong at **school exams** and local platforms are strong at **fixed curriculum** — nobody starts from a **career goal**.

| Landscape | Where they start | Bahasa Indonesia | Adaptive to a career goal |
|-----------|------------------|:----------------:|:-------------------------:|
| Dicoding (1,3M dev, 843K aktif) | Course catalog | ✅ | ❌ fixed paths |
| Ruangguru / Zenius | Kurikulum sekolah | ✅ | ❌ |
| Astra AI (15,2 juta pelajar, Rp 115rb/bln) | Catatan & ujian sekolah | ✅ | ❌ |
| Boot.dev / DataCamp | Kurikulum tetap | ❌ | ❌ |
| ChatGPT | Apa pun yang kamu tanya | ⚠️ | ❌ oracle — justru merusak retensi |
| **Serambi.ai** | **Goal karier kamu** | ✅ | ✅ roadmap mingguan dari natural language |

Two structural advantages: (1) **scaffold, not oracle** — the AI refuses to hand over answers (Boot.dev's Boots and Astra's Solver Mode both eventually cave; Astra offers both Socratic *and* Solver mode); (2) **modular agents via MCP** — each agent is an independent flow, so the adaptive layer can white-label inside existing platforms (bootcamp, kampus, Komdigi).

Full analysis: [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md) (11 competitors, battlecards, positioning map) · metrics: [`docs/business/north-star.md`](docs/business/north-star.md) · positioning: [`docs/business/value-proposition.md`](docs/business/value-proposition.md)


```
┌── Development (now) ────────┐   ┌── Production (target) ──────┐
Bob TUI = agent harness       │   User                      │
    │ natural language         │   │ natural language           │
    ▼                          │   ▼                           ▼
Bob — reasoning + tool-calling ┐   Web App Backend — orkestrasi
    │  MCP calls (by tool name)│       │  MCP calls (same named tools)
    └──────────────┬───────────┘       │
                   └──── same MCP contract ─┘
                   ▼
Langflow (SSE MCP endpoint) ── flow execution engine
                   │
                   ▼
longcat-2.5 via NaraRouter ── LLM provider
```

Bob TUI is a **development harness** (build/test/verify agents), not the
end-user UI. The web app (`apps/`) is the production user interface and
calls the same MCP tools — no Langflow changes needed.

| Layer | Role |
|-------|------|
| **Web App** | End-user UI (`apps/web`, in progress) — calls the same MCP tools |
| **Bob** | AI agent harness — **development**: reasoning, tool-calling, agent verification |
| **MCP** | Bridge — any caller (Bob or web backend) invokes Langflow flows as named tools |
| **Langflow** | Flow execution engine — each flow = one specialized agent |

---

## Agents

| Agent | Tool Name | Status |
|-------|-----------|--------|
| Goal Agent | `goal_decomposer` | ✅ Live |
| Tutor Agent | `explain_concept` | 🔜 Planned |
| Assessment Agent | `generate_quiz` | 🔜 Planned |
| Progress Agent | `check_progress` | 🔜 Planned |
| Motivator Agent | `send_reminder` | 🔜 Planned |
| Wellbeing Agent | `check_wellbeing` | 🔜 Planned |

---

## Quick Start

### Prerequisites

- [IBM Bob](https://www.ibm.com/products/bob) v2.0+
- [Langflow](https://langflow.org) v1.12+ (Docker recommended)
- Node.js v20+, Python 3.11+, `uvx` (`pip install uv`)

### 1. Clone & configure

```bash
git clone https://github.com/mmuchsin/serambi-ai.git
cd serambi-ai
cp .env.example .env
# Edit .env: set LANGFLOW_API_KEY
```

### 2. Start Langflow

```bash
docker run -p 7860:7860 langflowai/langflow:1.12.2
```

Open http://localhost:7860, import `flows/goal_decomposer.json`, and set its **Endpoint Name** to `goal_decomposer`.

### 3. Load the API key

```bash
source ~/.bashrc   # or: export LANGFLOW_API_KEY=<your-key>
```

### 4. Open Bob in this workspace  *(development verification)*

Bob auto-loads `.bob/mcp.json` — the `lf-serambi_ai` MCP server connects to Langflow. No extra setup needed. This is the *development harness*: every agent is verified as a named MCP tool here before the web app consumes it.

### 5. Try it

In Bob, type:

```
Bantu saya buat roadmap belajar data analyst dalam 3 bulan
```

Bob will call the `goal_decomposer` tool and return a structured 12-week roadmap from Langflow.

---

## Repository Structure

```
serambi-ai/                monorepo root
├── .bob/
│   ├── mcp.json            MCP server config
│   ├── settings.json      Turn-counter hook (session discipline)
│   └── skills/             83 agent skills (PM + engineering + diagram + custom pitch-deck)
├── flows/                  Langflow flow exports
├── agents/                 Agent configs / system prompts
├── apps/web/               Future: web frontend (target UI pengguna akhir)
├── packages/               Future: shared libraries
├── mcp/README.md           MCP integration details
├── docs/
│   ├── PRD.md
│   ├── ISSUES.md
│   ├── business/           Competitive analysis, north-star, value proposition
│   └── adr/                Architecture decision records (0001–0005)
├── research/               Riset: papers (multi-agent tutoring, feedback loop)
│   ├── research-papers-and-abstracts.md
│   └── feedback-loop-papers-additional.md
├── slides/                 Pitch deck (v2: 11 native DrawingML slides + speaker notes)
├── projects/serambi-pitch-deck-v2_20261004/exports/   Pitch deck v2 build artifacts (PPTX 4.4MB + PDF 750KB)
└── assets/screenshots/     Demo screenshots (01 UI · 02 Langflow workflow · 03 Langflow endpoint · 04 output)
```

---

## MCP Integration

See [`mcp/README.md`](mcp/README.md) for full details on how Bob connects to Langflow via Model Context Protocol.

---

## AI Agent Skills

This project uses **Bob** (IBM AI Agent Harness) with structured skills that guide the agent through specific tasks. Skills are invoked on-demand via `$skill-name` (e.g. `$pitch-deck`).

### Engineering Workflow Skills
> **Custom skills** built to implement the [Matt Pocock](https://github.com/mattpocock/skills) AI Engineering Workflow. Upstream skill catalog: [docs/engineering](https://github.com/mattpocock/skills/tree/main/docs/engineering) (20 skills) + [docs/productivity](https://github.com/mattpocock/skills/tree/main/docs/productivity) (7 skills).

| Skill | Purpose |
|-------|---------|
| `ai-engineering-workflow` | Orchestrates the full 7-phase engineering workflow (Grill → Research → Prototype → PRD → Issues → Implement → Review) |
| `ai-agent-workflow` | Patterns for executing work with AI agents — Do Work loop, tracer bullets, AFK agents |
| `ai-coding-best-practices` | Deep modules, TDD/red-green-refactor, feedback loops, module awareness |

### Product Management Skills
> Source: [phuryn/pm-skills](https://github.com/phuryn/pm-skills) (subset) + project skills — **83 skills total** tersedia di `.bob/skills/`

| Skill | Purpose |
|-------|---------|
| `value-proposition` | 6-part JTBD template — Who, Why, What Before/After, Alternatives |
| `north-star` | Define the North Star Metric and input metrics |
| `competitive-analysis` | Map competitors, find differentiation opportunities |
| `business-model` | Lean Canvas, Business Model Canvas, Startup Canvas |
| `pitch-deck` | 11-slide pitch deck outline *(custom skill for this project)* |
| `plan-launch` | Go-to-market strategy and beachhead segment |
| `write-prd` | Product Requirements Document from feature idea |

### Diagram Skills
> Source: [Agents365-ai/drawio-skill](https://github.com/Agents365-ai/drawio-skill)

| Skill | Purpose |
|-------|---------|
| `drawio-skill` | Create and edit draw.io architecture, UML, BPMN, network, and swimlane diagrams as editable `.drawio` files |

> Full skill list: `.bob/skills/` and `.agents/skills/` · Skills follow the [Bob Skill spec](https://www.ibm.com/products/bob)

---

## Development Tools

**Bob** handles agent orchestration, MCP tool-calling, and Langflow flow verification. For tasks Bob doesn't cover — research and image asset generation — this project also uses:

| Tool | Purpose | Model / Source |
|------|---------|----------------|
| [pi agent](https://pi.dev/) + [feynman extension](https://pi.dev/packages/@companion-ai/feynman) | Academic research, paper search, literature grounding | — |
| Qwen3.8-27B-UD-Q6_K_XL | Research reasoning | [unsloth/Qwen3.8-27B-GGUF](https://huggingface.co/unsloth/Qwen3.8-27B-GGUF) |
| Qwen-Image-2.1 | Image asset generation (slides, diagrams, illustrations) | [unsloth/Qwen-Image-2.1](https://huggingface.co/unsloth/Qwen-Image-2.1) |

---

## License

Apache 2.0 © 2026 Serambi.ai Contributors — see [LICENSE](LICENSE)

---

*Also available in: [Bahasa Indonesia](README.id.md)*
