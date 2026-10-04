# ISSUES — Serambi.ai Work Tracker

Setiap issue dirancang untuk **1 context window / 1 session** (≤ 100 turns).
Format: `[STATUS] ISS-XX — Judul`

Status legend:
- `[ ]` pending
- `[-]` in progress
- `[x]` done
- `[~]` blocked (lihat note)
- `[>]` deferred / stretch goal

---

## Phase 6 — Implementation

### ISS-01 — Verify Langflow goal_decomposer flow ✅
**Status:** `[x]` DONE  
**Scope:** 1 session  
**What was done:**
- Rebuilt flow dengan Langflow 1.12 compatible format
- Fix escape curly braces di prompt JSON example
- Register `user_goal` sebagai explicit Prompt template variable
- Verified output: structured JSON roadmap di Playground

**Commits:**
```
f25c10e fix(flow): register user_goal as explicit Prompt template variable
e0552ab fix(flow): escape curly braces in prompt JSON example
97ac0f8 feat(flow): rebuild goal_decomposer with Langflow 1.12 compatible format
bb5670a chore(repo): initial commit — project scaffold and goal_decomposer flow
```

---

### ISS-02 — Set Langflow Endpoint Name + verify MCP tool discovery
**Status:** `[x]` DONE
**Scope:** ~5 turns

**What was done:**
- Endpoint Name `goal_decomposer` berhasil di-set di Langflow UI
- Verified via API: `curl /api/v1/flows/` → `endpoint=goal_decomposer`
- MCP endpoint `http://localhost:7860/api/v1/mcp/project/.../streamable` merespons HTTP 406 (benar — perlu SSE header)
- Tool `mcp__lf-serambi_ai__goal_decomposer` muncul dan dapat dipanggil dari Bob

---

### ISS-03 — End-to-end test: Bob → MCP → Langflow → response
**Status:** `[x]` DONE
**Scope:** 1 session

**What was done:**
- Bob memanggil tool `mcp__lf-serambi_ai__goal_decomposer` secara langsung
- Langflow merespons dengan structured JSON roadmap 12 minggu (data analytics)
- e2e terbukti bekerja: Bob → MCP (mcp-proxy SSE) → Langflow → JSON response

**Commit:** `feat(mcp): verified langflow mcp integration with goal_decomposer`

---

### ISS-04 — Tutor Agent (`explain_concept`) — Langflow flow
**Status:** `[>]` deferred — setelah ISS-03 done  
**Scope:** 1 session  
**Description:** Flow yang menerima `concept` dan `user_level`, output penjelasan Feynman-style dalam Bahasa Indonesia.

---

### ISS-05 — Assessment Agent (`generate_quiz`) — Langflow flow
**Status:** `[>]` deferred — setelah ISS-04 done  
**Scope:** 1 session  
**Description:** Flow yang generate adaptive quiz berdasarkan concept yang sudah dipelajari, output pertanyaan + jawaban + penjelasan.

---

## Phase 7 — Submission Materials

### ISS-06 — README.md + mcp/README.md
**Status:** `[x]` DONE
**Scope:** 1 session

**What was done:**
- `README.md` (English) — quick start, architecture, agents, repo structure
- `README.id.md` (Bahasa Indonesia) — full translation
- `mcp/README.md` — config detail, tools table, env setup, troubleshooting
- `flows/README.md` — flow export convention, endpoint name guide
- `agents/README.md` — planned system prompts, pedagogical constraints
- `apps/README.md` — monorepo surfaces, web placeholder
- `packages/README.md` — shared lib conventions
- `docs/README.md` — reading order + research summary table
- `assets/README.md` — screenshot inventory + diagram suggestions
- `slides/README.md` — 11-slide structure + generate guide
- `AGENTS.md` — lean agent harness guide with PM skills section
- `docs/PRD.md` — added Research Grounding table + monorepo module map

---

### ISS-07 — Submission form fill
**Status:** `[x]` DONE (draft siap; upload ke form = aksi user)
**Scope:** 1 session

**What was done:**
- Seluruh field form dijawab (17 field teks) dan disimpan ke [`submission-draft.md`](submission-draft.md) — Bahasa Indonesia, siap copy-paste
- Deskripsi Singkat: 2 versi (231 kata / 191 kata) — keduanya di dalam rentang 150–300 kata
- Semua klaim teknis diverifikasi ke repo: flow `goal_decomposer` (Chat Input → Prompt → LLM → Chat Output), MCP server `lf-serambi_ai`, tool `goal_decomposer`, angka riset (GenMentor FWCI 47.3, Feynman 80%+, Zaidi +15–20%, BJET cited 694)
- Screenshot disalin ke `assets/screenshots/` dengan nama sesuai form: `01-user-interface.png`, `02-langflow-workflow.png`, `03-langflow-endpoint.png`, `04-output.png`
- Checklist sebelum submit ditambahkan di akhir draft

**Remaining user actions (bukan issue):** paste jawaban ke form, pastikan repo public, selesaikan pitch deck (ISS-08), upload deck + screenshot

**Commit:**
```
docs: add hackathon submission form draft (ISS-07)
```

---

### ISS-08 — Pitch deck (11 slides)
**Status:** `[ ]` pending
**Scope:** 1 session
**Structure:** Cover → Problem → Solution → Target User → How It Works → AI & Technology → Key Features → Prototype/Demo → Impact/Value → Future Development → Team
**Format:** PowerPoint/Keynote/PDF — simpan di `slides/`

**Suggested workflow:**
1. `$pitch-deck` → generate 11-slide outline
2. `$competitive-analysis` → isi slide Diferensiasi
3. Fill content dari research papers (lihat `docs/research-papers-and-abstracts.md`)
4. Export ke `slides/serambi-pitch-deck.pptx` + `slides/serambi-pitch-deck.pdf`

---

### ISS-09 — Verification scripts (flow + e2e)
**Status:** `[x]` DONE
**Scope:** 1 session
**Motivation:** audit `docs/audit-ai-engineering-best-practices.md` P0-1 — feedback loop (046–054) tidak ada; "e2e verified" sebelumnya hanya klaim manual

**What was done:**
- `scripts/verify-flow.sh` — validasi statis `flows/*.json`: JSON valid, field wajib (`id`, `endpoint_name`, `data.nodes` non-kosong), `endpoint_name` unik antar flow
- `scripts/verify-e2e.sh` — cek live: MCP streamable endpoint terjangkau + auth valid (JSON-RPC `tools/list`), lalu assert tiap `endpoint_name` di `flows/*` terekspos sebagai MCP tool; URL dibaca dari `.bob/mcp.json` (single source of truth)
- 2026-10-04: kedua script PASS (Langflow 1.12 live, tool `goal_decomposer` terekspos)
- Steering rule ditambahkan ke `AGENTS.md` §Session Rules

**Definition of Done (terpenuhi):**
- [x] `bash scripts/verify-flow.sh` exit 0
- [x] `bash scripts/verify-e2e.sh` exit 0 (dengan Langflow hidup)
- [x] Rule verifikasi ada di AGENTS.md

**Commit:**
```
chore(repo): add flow + e2e verification scripts (ISS-09)
```

---

### ISS-10 — ADRs untuk keputusan arsitektur mayor
**Status:** `[x]` DONE
**Scope:** 1 session
**Motivation:** audit P0-2 — keputusan "kenapa Langflow/MCP/Bob/NaraRouter" tidak terdokumentasi (framework §085)

**What was done:**
- `docs/adr/README.md` — index + aturan penulisan ADR
- `docs/adr/0001-langflow-as-flow-engine.md`
- `docs/adr/0002-mcp-streamablehttp-via-mcp-proxy.md`
- `docs/adr/0003-bob-tui-as-dev-harness.md`
- `docs/adr/0004-llm-providers.md`
- `docs/adr/0005-project-decisions-log.md` — keputusan non-arsitektur (brand, monorepo, skills, tooling), dipindah dari tabel lama di file ini
- Tabel Notes & Decisions Log di file ini diganti link ke `docs/adr/`

**Commit:**
```
docs(adr): add architecture decision records 0001-0005 (ISS-10)
```

---

## Notes & Decisions Log

> Dipindah ke [`docs/adr/0005-project-decisions-log.md`](adr/0005-project-decisions-log.md) (2026-10-04, ISS-10).
> Keputusan arsitektur mayor: [`docs/adr/`](adr/README.md).

---

## How to Start a New Session

1. Baca `HANDOFF.md` di root repo — 1 halaman, berisi status terkini + next action
2. Baca `docs/ISSUES.md` ini — cari issue `[-]` atau `[ ]` paling atas
3. Load skills yang relevan (lihat HANDOFF.md bagian "Skills")
4. Mulai dari step pertama issue tersebut
