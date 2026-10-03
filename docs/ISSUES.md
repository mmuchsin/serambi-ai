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
- Tool `mcp__lf-lsa_ibm_hackathon__goal_decomposer` muncul dan dapat dipanggil dari Bob

---

### ISS-03 — End-to-end test: Bob → MCP → Langflow → response
**Status:** `[x]` DONE
**Scope:** 1 session

**What was done:**
- Bob memanggil tool `mcp__lf-lsa_ibm_hackathon__goal_decomposer` secara langsung
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
**Status:** `[ ]` pending (depends on ISS-03)  
**Scope:** 1 session, ≤ 30 turns  
**Rule:** Tulis SETELAH e2e terbukti — bukan spekulatif

**Contents README.md:**
- Project description (Serambi.ai)
- Quick start (setup, env, jalankan Langflow, jalankan Bob)
- Architecture diagram
- How it works (Bob → MCP → Langflow)

**Contents mcp/README.md:**
- MCP server config explanation
- Tool list (nama + deskripsi)
- How Bob uses tools

---

### ISS-07 — Submission form fill
**Status:** `[ ]` pending (depends on ISS-06)  
**Scope:** 1 session  
**Fields:** Lihat PRD.md bagian "Submission Requirements"

---

### ISS-08 — Pitch deck (11 slides)
**Status:** `[ ]` pending (dapat paralel dengan ISS-06)  
**Scope:** 1 session  
**Structure:** Cover → Problem → Solution → Target User → How It Works → AI & Technology → Key Features → Prototype/Demo → Impact/Value → Future Development → Team  
**Format:** Keynote / PowerPoint / Canva — simpan di `slides/`

---

## Notes & Decisions Log

| Date | Note |
|------|------|
| 2026-10-03 | ISS-01 complete. MCP config written di `.bob/mcp.json`. Global MCP config di `~/.bob/settings/mcp.json` dikosongkan. |
| 2026-10-03 | Brand dipilih: Serambi.ai. Jangan pakai EduFlow (nama contoh Team Aurora). |
| 2026-10-03 | PRD dan ISSUES dibuat untuk session continuity. |

---

## How to Start a New Session

1. Baca `HANDOFF.md` di root repo — 1 halaman, berisi status terkini + next action
2. Baca `docs/ISSUES.md` ini — cari issue `[-]` atau `[ ]` paling atas
3. Load skills yang relevan (lihat HANDOFF.md bagian "Skills")
4. Mulai dari step pertama issue tersebut
