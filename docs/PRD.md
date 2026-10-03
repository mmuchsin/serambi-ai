# PRD — Serambi.ai (Smart Learning Assistant)

**Project:** sla-ibm-hackathon  
**Event:** IBM SkillsBuild University Education National Hackathon (Hacktiv8 + IBM + Komdigi)  
**Deadline Stage 1:** 11 Oktober  
**Status:** 🟡 Phase 6b — MCP wired, e2e belum ditest

---

## Problem Statement

Career switchers yang belajar tech skills secara mandiri kehilangan arah dan burn out karena tidak ada tutor yang adaptif terhadap learning style mereka atau yang melacak progres ke arah career goal mereka — menyia-nyiakan waktu belajar dan menunda pencapaian target role.

## Target User

Career switchers / upskillers Indonesia (contoh: "jadi data analyst dalam 3 bulan")

---

## Architecture

```
User (Bob TUI)
    │  natural language
    ▼
Bob (AI agent harness)  ←── reasoning + tool-calling
    │  MCP calls (by tool name)
    ▼
Langflow (via SSE MCP)  ←── flow execution engine
    │
    ▼
NaraRouter / longcat-2.5  ←── LLM provider
```

| Layer    | Role                                                      |
|----------|-----------------------------------------------------------|
| Bob      | AI agent harness — reasoning, tool-calling, user interaction |
| MCP      | Bridge: Bob calls Langflow flows sebagai named tools      |
| Langflow | Flow execution engine — setiap flow = 1 MCP tool          |

**Key rule:** MCP tool names harus spesifik & deskriptif (e.g., `decompose_learning_goal`, bukan "Flow 1").

---

## Agents (Langflow flows = MCP tools)

| # | Agent | MCP Tool Name | Status |
|---|-------|--------------|--------|
| 1 | Goal Agent | `decompose_learning_goal` | ✅ Flow verified |
| 2 | Tutor Agent | `explain_concept` | ⬜ Not started |
| 3 | Assessment Agent | `generate_quiz` | ⬜ Not started |
| 4 | Progress Agent | `check_progress` | ⬜ Not started |
| 5 | Motivator Agent | `send_reminder` | ⬜ Not started |
| 6 | Wellbeing Agent | `check_wellbeing` | ⬜ Not started |

> **MVP scope:** Agent 1 (Goal Agent) is tracer bullet. Agents 2-6 are stretch goals — build **only after e2e is proven**.

---

## Module Map

```
sla-ibm-hackathon/
├── .bob/
│   └── mcp.json              # Project-scope MCP config (SSE → Langflow)
├── .env                      # LANGFLOW_API_KEY (gitignored)
├── .env.example
├── flows/
│   └── goal_decomposer.json  # ✅ Agent 1 — verified in Langflow Playground
├── agents/                   # future: agent configs / system prompts
├── mcp/
│   └── README.md             # planned: MCP integration docs for submission
├── docs/
│   ├── PRD.md                # this file
│   └── ISSUES.md             # issue tracker per session
├── slides/                   # pitch deck assets
└── assets/
    ├── screenshots/          # demo screenshots for submission
    └── diagrams/
```

---

## Submission Requirements (Form fields to fill)

- [ ] Judul
- [ ] Tema
- [ ] Deskripsi Singkat (150-300 kata)
- [ ] Problem Statement
- [ ] Target User
- [ ] Mengapa Solusi Dibutuhkan
- [ ] Fitur Utama (2-5)
- [ ] Alur Penggunaan
- [ ] Penggunaan Langflow
- [ ] Penggunaan Bob
- [ ] Integrasi Langflow-Bob ← kritis: harus jelaskan Bob memanggil tool via MCP
- [ ] Project File / Link
- [ ] Pitching Deck
- [ ] Screenshot (3-5): Langflow Playground output, Bob calling MCP tool, output ke user
- [ ] Dampak
- [ ] Potensi Pengembangan
- [ ] Diferensiasi (2-3)
- [ ] Kemampuan AI Agent

## Pitch Deck Structure (11 slides)

Cover → Problem → Solution → Target User → How It Works → AI & Technology → Key Features → Prototype/Demo → Impact/Value → Future Development → Team

---

## Guardrails

- Setiap Langflow node/component harus bisa dijelaskan satu per satu
- Bob **harus** demonstrably memanggil Langflow tool via MCP (bukan jawab dari LLM sendiri)
- Jangan expand scope sebelum e2e terbukti bekerja
- Brand: **Serambi.ai** (preferred) — jangan pakai "EduFlow" (nama proyek contoh Team Aurora)
- README/docs: tulis SETELAH e2e proven, bukan spekulatif sebelumnya

---

## Commit Scopes

| Scope | Untuk |
|-------|-------|
| `chore(repo):` | Struktur repo, gitignore, tooling |
| `feat(flow):` | Langflow flow files |
| `feat(mcp):` | MCP config, integration |
| `feat(agent):` | Agent logic |
| `docs:` | README, docs, submission materials |

---

## Environment

| Item | Value |
|------|-------|
| OS | Linux WSL2 |
| Node | v24.21.0 |
| Langflow | v1.12.2 via Docker, http://localhost:7860 |
| Bob | IBM Bob TUI v2.0.5 |
| LLM (Bob) | Claude 3.7 Sonnet via IBM Bob |
| LLM (Langflow) | longcat-2.5 via NaraRouter (https://router.bynara.id/v1) |
| API Key | `LANGFLOW_API_KEY` di `~/.bashrc` — source sebelum start Bob |
