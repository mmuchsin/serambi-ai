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
**Status:** `[~]` BLOCKED — manual step required  
**Blocker:** Endpoint Name harus di-set manual di Langflow UI  
**Scope:** ~5 turns  
**Pre-condition:** Langflow running di http://localhost:7860

**Steps:**
1. Buka Langflow → open flow `goal_decomposer`
2. Klik flow name / settings → set **Endpoint Name** = `goal_decomposer` → Save
3. Di terminal: `source ~/.bashrc` (pastikan `LANGFLOW_API_KEY` ter-load)
4. Restart Bob di workspace ini
5. Cek MCP panel → server `langflow` muncul dengan tool `decompose_learning_goal`

**Definition of Done:** MCP panel Bob menampilkan server `langflow` dengan tool dari goal_decomposer.

---

### ISS-03 — End-to-end test: Bob → MCP → Langflow → response
**Status:** `[ ]` pending (depends on ISS-02)  
**Scope:** 1 session, ≤ 20 turns  
**Pre-condition:** ISS-02 done

**Steps:**
1. Di Bob, kirim prompt: _"Bantu saya buat roadmap belajar data analyst dalam 3 bulan"_
2. Verifikasi Bob memanggil tool `decompose_learning_goal` (bukan menjawab dari LLM sendiri)
3. Lihat response — harus structured JSON roadmap dari Langflow
4. Capture screenshot: (a) Bob calling tool, (b) response ke user
5. Commit: `feat(mcp): verified langflow mcp integration with goal_decomposer`

**Definition of Done:** Screenshot tersimpan di `assets/screenshots/`, e2e terbukti bekerja.

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
