# Serambi.ai — Adaptive Multi-Agent Learning Assistant

> *Serambi* (Indonesian) — a veranda or front porch: an open, welcoming space where learning begins.

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

---

## What It Does

Serambi.ai is an adaptive AI tutoring system for Indonesian career switchers. Tell it your goal ("become a data analyst in 3 months") and it builds a personalized weekly roadmap, explains concepts Feynman-style, quizzes you with graduated hints, and tracks your progress using spaced repetition — all through a conversational interface powered by IBM Bob.

**Research-backed design:**
- 📚 Goal-to-skill mapping (GenMentor, FWCI 47.3)
- 🧠 Feynman technique + Protégé Effect (80%+ prefer over passive re-reading)
- 🔁 Adaptive spaced repetition (15-20% retention improvement vs fixed schedule)
- 🚫 Anti-cognitive-offloading: AI guides, not answers (BJET, cited 694)

---

## Architecture

```
User (natural language)
    │
    ▼
Bob (IBM AI agent harness) ── reasoning + tool-calling
    │  MCP calls (by tool name)
    ▼
Langflow (SSE MCP endpoint) ── flow execution engine
    │
    ▼
longcat-2.5 via NaraRouter ── LLM provider
```

| Layer | Role |
|-------|------|
| **Bob** | AI agent harness — conversation, reasoning, MCP tool dispatch |
| **MCP** | Bridge — Bob invokes Langflow flows as named tools |
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
git clone https://github.com/<your-org>/sla-ibm-hackathon.git
cd sla-ibm-hackathon
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

### 4. Open Bob in this workspace

Bob auto-loads `.bob/mcp.json` — the `lf-lsa_ibm_hackathon` MCP server connects to Langflow. No extra setup needed.

### 5. Try it

In Bob, type:

```
Bantu saya buat roadmap belajar data analyst dalam 3 bulan
```

Bob will call the `goal_decomposer` tool and return a structured 12-week roadmap from Langflow.

---

## Repository Structure

```
sla-ibm-hackathon/          monorepo root
├── .bob/
│   ├── mcp.json            MCP server config
│   └── skills/             43 PM skills (pm-skills + custom pitch-deck)
├── flows/                  Langflow flow exports
├── agents/                 Agent configs / system prompts
├── apps/web/               Future: web frontend
├── packages/               Future: shared libraries
├── mcp/README.md           MCP integration details
├── docs/
│   ├── PRD.md
│   ├── ISSUES.md
│   └── research-papers-and-abstracts.md
├── slides/                 Pitch deck
└── assets/screenshots/     Demo screenshots
```

---

## MCP Integration

See [`mcp/README.md`](mcp/README.md) for full details on how Bob connects to Langflow via Model Context Protocol.

---

## AI Agent Skills

This project uses **Bob** (IBM AI Agent Harness) with structured skills that guide the agent through specific tasks. Skills are Markdown instruction files loaded on-demand via `use_skill <name>`.

### Engineering Workflow Skills
> Source: [Matt Pocock — AI Coding for Real Engineers](https://ai.hero.dev)

| Skill | Purpose |
|-------|---------|
| `ai-engineering-workflow` | Orchestrates the full 7-phase engineering workflow (Grill → Research → Prototype → PRD → Issues → Implement → Review) |
| `ai-agent-workflow` | Patterns for executing work with AI agents — Do Work loop, tracer bullets, AFK agents |
| `ai-coding-best-practices` | Deep modules, TDD/red-green-refactor, feedback loops, module awareness |

### Product Management Skills
> Source: [phuryn/pm-skills](https://github.com/phuryn/pm-skills) — 43 PM skills

| Skill | Purpose |
|-------|---------|
| `value-proposition` | 6-part JTBD template — Who, Why, What Before/After, Alternatives |
| `north-star` | Define the North Star Metric and input metrics |
| `competitive-analysis` | Map competitors, find differentiation opportunities |
| `business-model` | Lean Canvas, Business Model Canvas, Startup Canvas |
| `pitch-deck` | 11-slide pitch deck outline *(custom skill for this project)* |
| `plan-launch` | Go-to-market strategy and beachhead segment |
| `write-prd` | Product Requirements Document from feature idea |

> Full skill list: `.bob/skills/` · Skills follow the [Bob Skill spec](https://www.ibm.com/products/bob)

---

## License

Apache 2.0 © 2025 Serambi.ai Contributors — see [LICENSE](LICENSE)

---

*Also available in: [Bahasa Indonesia](README.id.md)*
