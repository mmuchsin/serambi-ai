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
1. `use_skill pitch-deck` → generate 11-slide outline
2. `use_skill competitive-analysis` → isi slide Diferensiasi
3. Fill content dari research papers (lihat `docs/research-papers-and-abstracts.md`)
4. Export ke `slides/serambi-pitch-deck.pptx` + `slides/serambi-pitch-deck.pdf`

---

## Notes & Decisions Log

| Date | Note |
|------|------|
| 2026-10-03 | ISS-01 complete. MCP config written di `.bob/mcp.json`. Global MCP config di `~/.bob/settings/mcp.json` dikosongkan. |
| 2026-10-03 | Brand dipilih: Serambi.ai. Jangan pakai EduFlow (nama contoh Team Aurora). |
| 2026-10-03 | PRD dan ISSUES dibuat untuk session continuity. |
| 2026-10-03 | Monorepo structure diadopsi: `apps/`, `packages/`. ISS-06 complete — semua dir punya README. |
| 2026-10-03 | 43 PM skills dari phuryn/pm-skills diinstall ke `.bob/skills/` (format SKILL.md per dir). |
| 2026-10-03 | Custom `pitch-deck` skill dibuat karena tidak ada di pm-skills. |
| 2026-10-03 | ISS-07 complete — `docs/submission-draft.md` berisi jawaban lengkap 17 field form + `assets/screenshots/` (file 01–04 siap upload). Next: ISS-08 pitch deck. |

---

## How to Start a New Session

1. Baca `HANDOFF.md` di root repo — 1 halaman, berisi status terkini + next action
2. Baca `docs/ISSUES.md` ini — cari issue `[-]` atau `[ ]` paling atas
3. Load skills yang relevan (lihat HANDOFF.md bagian "Skills")
4. Mulai dari step pertama issue tersebut
