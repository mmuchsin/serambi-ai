# PRD — Serambi.ai (Smart Learning Assistant)

**Project:** sla-ibm-hackathon
**Event:** IBM SkillsBuild University Education National Hackathon (Hacktiv8 + IBM + Komdigi)
**Deadline Stage 1:** 11 Oktober
**Status:** 🟢 Phase 7 — e2e verified, submission materials in progress

---

## Problem Statement

Career switchers yang belajar tech skills secara mandiri kehilangan arah dan burn out karena tidak ada tutor yang adaptif terhadap learning style mereka atau yang melacak progres ke arah career goal mereka — menyia-nyiakan waktu belajar dan menunda pencapaian target role.

**Market gap:** OECD (2024) mengidentifikasi kesenjangan yang terus melebar antara demand tech skills dan output institusi pendidikan tradisional — reskilling mandiri adalah solusi utama, tapi minim dukungan adaptif.

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

| # | Agent | Endpoint Name (Langflow) | MCP Tool ID (Bob) | Status |
|---|-------|--------------------------|-------------------|--------|
| 1 | Goal Agent | `goal_decomposer` | `mcp__lf-lsa_ibm_hackathon__goal_decomposer` | ✅ e2e verified |
| 2 | Tutor Agent | `explain_concept` | `mcp__lf-lsa_ibm_hackathon__explain_concept` | ⬜ Not started |
| 3 | Assessment Agent | `generate_quiz` | `mcp__lf-lsa_ibm_hackathon__generate_quiz` | ⬜ Not started |
| 4 | Progress Agent | `check_progress` | `mcp__lf-lsa_ibm_hackathon__check_progress` | ⬜ Not started |
| 5 | Motivator Agent | `send_reminder` | `mcp__lf-lsa_ibm_hackathon__send_reminder` | ⬜ Not started |
| 6 | Wellbeing Agent | `check_wellbeing` | `mcp__lf-lsa_ibm_hackathon__check_wellbeing` | ⬜ Not started |

> **MVP scope:** Agent 1 (Goal Agent) is tracer bullet — **e2e proven**. Agents 2-6 are stretch goals.

---

## Module Map (Monorepo)

Repo ini adalah **monorepo** — semua sub-proyek (agents, webapp, dll) akan ada di sini.

```
sla-ibm-hackathon/                    # monorepo root
├── .bob/
│   └── mcp.json                      # Project-scope MCP config (SSE → Langflow)
├── .env                              # LANGFLOW_API_KEY (gitignored)
├── .env.example
│
├── flows/                            # Langflow flow exports
│   └── goal_decomposer.json          # ✅ Agent 1 — e2e verified
│
├── agents/                           # Agent configs / system prompts (future)
│
├── apps/                             # future: webapp, mobile, etc.
│   └── web/                          # future: Next.js / React frontend
│
├── packages/                         # future: shared libs across apps
│
├── mcp/
│   └── README.md                     # MCP integration docs (ISS-06)
│
├── docs/
│   ├── PRD.md                        # this file
│   ├── ISSUES.md                     # issue tracker per session
│   └── research-papers-and-abstracts.md
│
├── slides/                           # pitch deck assets
│
└── assets/
    ├── screenshots/                  # demo screenshots for submission
    └── diagrams/
```

> **Konvensi monorepo:** Apps masuk `apps/`, shared packages masuk `packages/`, Langflow flows masuk `flows/`, agent configs masuk `agents/`. Setiap sub-proyek punya `README.md` sendiri.

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

## Research Grounding

Setiap agent Serambi.ai didukung oleh landasan riset:

| Agent | Landasan Riset | Sumber |
|-------|---------------|--------|
| Goal Agent | Goal-to-skill mapping; skill gap identification; efficient learning path scheduling | GenMentor (W4410636983, FWCI 47.3) |
| Tutor Agent | Feynman technique: explain → AI identifies gap → probing questions; 80%+ prefer over passive re-reading | Feynman Bot (arXiv 2506.09055) |
| Tutor Agent | Protégé effect: learners who teach a teachable agent learn more | Chase et al. 2009 (DOI 10.1007/s10956-009-9180-4) |
| Assessment Agent | Adaptive quiz + graduated hinting — bukan direct answer | IntelliCode (W7140122680, FWCI 23.5) |
| Progress Agent | Learner-specific forgetting curves; 15-20% improvement vs fixed-schedule spaced repetition | Zaidi et al. (arXiv 2004.11327) |
| All agents | LLMs paling efektif sebagai **adaptive scaffold**, bukan autonomous instructor | Role of LLMs in Personalized Learning (W4409189317, cited 142) |
| All agents | Hindari **cognitive offloading** — AI tidak langsung jawab, tapi pancing refleksi | Metacognitive Laziness (W4405211386, cited 694) |

**Arsitektur multi-agent** (centralized learner state + specialized agents) mengikuti pola IntelliCode (W7140122680) dan ITAS (W7157788799).

---

## Guardrails

- Setiap Langflow node/component harus bisa dijelaskan satu per satu
- Bob **harus** demonstrably memanggil Langflow tool via MCP (bukan jawab dari LLM sendiri)
- Jangan expand scope sebelum e2e terbukti bekerja
- Brand: **Serambi.ai** (preferred) — jangan pakai "EduFlow" (nama proyek contoh Team Aurora)
- README/docs: tulis SETELAH e2e proven, bukan spekulatif sebelumnya
- **Pedagogical constraint:** AI = adaptive scaffold, bukan oracle (dari riset) — hindari langsung jawab, gunakan graduated hinting + probing questions

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
