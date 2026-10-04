# Serambi.ai — Full Engineering Workflow & Research Audit + Project Structure Assessment

**Tanggal:** 2026-10-04 · **Status:** final
**Sumber kriteria:** (1) `docs/ai-engineering-best-practices.md` — "AI Coding for Real Engineers" (Matt Pocock), ref §027/035/040/046–054/079/085 · (2) `research/research-papers-and-abstracts.md` + `research/feedback-loop-papers-additional.md` (~90 papers) · (3) repo state: 29 commits, 76+ file tracked

> Laporan ini menggabungkan audit 1 (engineering workflow), audit 2 (research grounding),
> dan penilaian struktur proyek. File audit lain (`.audit/audit-ai-engineering-best-practices.md`,
> `.audit/audit-research-grounding.md`) tetap ada sebagai detail per-domain; file ini = sumber ringkasan tunggal.
>
> **Update 2026-10-04 (setelah remediation P0):** P0-1 (ISS-09), P0-2 (ISS-10), P0-3 (ISS-11) selesai;
> papers research pindah ke `research/` (root); audit reports pindah ke `.audit/` (gitignored);
> ADR tetap di `docs/adr/` mengikuti konvensi skill domain-modeling/improve-codebase-architecture.

---

## 1. Executive Summary

Serambi.ai dieksekusi dengan **disiplin proses yang jauh di atas rata-rata** proyek hackathon:
7-phase workflow (Grill → Research → PRD → Issues → Implementation → Review) dijalankan
terstruktur, tracer bullet (Agent 1 e2e) dibuktikan SEBELUM expand, dan setelah remediasi
P0 hari ini (2026-10-04) gap engineering-terbesar sudah tertutup: feedback loop ada
(`scripts/verify-*.sh`), ADR lengkap (0001–0005), docs stale diperbaiki.

**Yang masih terbuka** (urutan dampak untuk penilaian juri):
1. Narasi riset belum maksimal — 4 dari 10 theme core papers dan 5 implikasi feedback-loop **tidak masuk** PRD/submission (Cognitive Mirror, SRL g=1.613, CAGR/willingness-to-pay/UGM, loop closure).
2. Seam `agents/` kosong — Module Map menjanjikan system prompts per agent.
3. Struktur: 1 reorganisasi semantic dilakukan 2026-10-04 (`research/` dibuat; ADR + papers pindah dari `docs/`).
4. Diagram (ISS-12) dan deck (ISS-08) belum — ini item deadline-terdekat.

---

## 2. Engineering Workflow Audit (vs "AI Coding for Real Engineers")

### 2.1 Scorecard

| Area | Ref | Status |
|---|---|---|
| 7-Phase Process | §003/083 | ✅ Kuat — Phase 1–3 selesai, 6 berjalan |
| PRD + Plan (2 docs) | §035/043 | ✅ Kuat — `docs/PRD.md` destination, `docs/ISSUES.md` journey, ≤1 session/issue |
| Tracer Bullets | §040/041 | ✅ Kuat — Agent 1 e2e proven (ISS-01→03) sebelum expand |
| AGENTS.md / Progressive Disclosure | §027/030 | ✅ Baik — lean, 1-liner, link ke detail; drift layout minor (P1) |
| Session/HITL discipline | §021/068 | ✅ Kuat — turn counter hook, HANDOFF.md, one-issue-per-session |
| **Feedback Loops** | §046–054 | ✅ **Sudah diperbaiki (ISS-09, 2026-10-04)** — sebelum: ❌ kosong total |
| Deep Modules / Module Awareness | §079/082 | ⚠️ Interface MCP sudah deep; Module Map ada; output schema belum dikontrakkan (P2) |
| ADR | §085 | ✅ **Sudah dibuat (ISS-10)** — sebelum: ❌ keputusan mayor tak terdokumentasi |
| Glossary / CONTEXT.md | §085 | ❌ Belum ada (P2 — buat saat ISS-04) |
| Git Hygiene | §052 | ✅ Baik sejak remediasi — commit scoped konsisten; pre-commit hook ditunda (P2) |
| Monorepo Layout | §027 | ✅ Baik — README per direktori; dirombak semantic 2026-10-04 (§5) |

### 2.2 Remediasi yang SUDAH diselesaikan (2026-10-04)

| Commit | Isi |
|---|---|
| `7409ccf` (ISS-09) | `scripts/verify-flow.sh` (statis: JSON valid, field wajib, endpoint unik) + `scripts/verify-e2e.sh` (live: MCP tools/list, assert semua flow terekspos). **Kedua-duanya PASS live.** Steering rule masuk AGENTS.md §Session Rules |
| `3e2f793` (ISS-10) | `research/adr/` 0001–0005 (Langflow, MCP streamablehttp, Bob dev harness, LLM providers, decisions log) |
| `3a000ac` (ISS-11) | `mcp/README.md` — "SSE"→"streamable HTTP", server `drawio` didokumentasikan, seksi Verification |
| `15ce3cd`, `67c0513` | `.gitignore`: report audit local tidak masuk repo |

### 2.3 Sisa temuan (belum dikerjakan)

| Pri | Temuan | Aksi |
|---|---|---|
| P1 | Issue terbuka (ISS-04/05/08) tanpa Definition of Done eksplisit, padahal AGENTS.md mewajibkan | Tambah blok DoD per issue |
| P1 | Pre-commit hooks (JSON check `flows/*.json`) + commit scope enforcement | `setup-pre-commit` skill; saat apps/web mulai |
| P1 | AGENTS.md Monorepo Layout drift dari Module Map PRD (`packages/`, `slides/`, `assets/`) | Sinkronkan keduanya |
| P2 | Output schema agent tidak terdokumentasi sebagai kontrak (web app akan depend) | `mcp/schemas/<agent>.json` + doc per flow |
| P2 | `CONTEXT.md` glossary (Serambi, flow, endpoint, roadmap, scaffolding, …) | Saat ISS-04 (2 agent → istilah perlu presisi) |
| P2 | CI + AFK gate | Saat `apps/web` punya kode |

---

## 3. Research Grounding Audit

### 3.1 Coverage matrix

**`research-papers-and-abstracts.md` (10 key themes):**

| # | Theme | PRD | Submission | Status |
|---|---|---|---|---|
| 1 | Goal-Oriented Learning (GenMentor, FWCI 47.3) | ✅ | ✅ | Baik |
| 2 | Multi-Agent (IntelliCode + ITAS) | ✅ | ✅ | Baik |
| 3 | Spaced Repetition (Zaidi, +15–20%) | ✅ | ✅ | Baik |
| 4 | Feynman + Protégé (Chase et al. 2009, DOI) | ✅ | ✅ | Baik |
| 5 | Metacognitive Laziness (BJET, cited 694) | ✅ | ✅ | Baik (guardrail) |
| 6 | **Cognitive Mirror** (Frontiers 2025) | ❌ | ❌ | **Diferensiator terbuang** — Assessment Agent = implementasi parsial-nya, framework tak dinamakan |
| 7 | **SRL meta-analysis (g = 1.613)** | ❌ | ❌ | Bukti kuantitatif terbesar — hilang |
| 8 | Business Gap (CAGR 11–14%) | ⚠️ | ⚠️ | Hanya OECD (2024) kualitatif; angka + "career switcher excluded dari research utama" tak masuk |
| 9 | **Willingness-to-Pay (Politecnico)** | ❌ | ❌ | Support monetization freemium + pay-per-goal — hilang |
| 10 | **Local Context (UGM thesis)** | ❌ | ❌ | Konteks EdTech Indonesia; relevansi ganda untuk juri — hilang |

**`feedback-loop-papers-additional.md` (5 themes + 5 implikasi):**

| # | Theme | PRD | Submission | Status |
|---|---|---|---|---|
| T1 | Loop closure (Boud & Molloy; Daumiller & Meyer) | ❌ | ❌ | Implikasi #1 "Design for Loop Closure" tidak terdesain di `check_progress`/`send_reminder` |
| T2 | AI Feedback at Scale | ⚠️ | ⚠️ | Tersirat, tidak eksplisit |
| T3 | Multimodal & Real-Time | ❌ | ❌ | Boleh out-of-scope — tapi harus disebut **conscious exclusion** di Future Development |
| T4 | **Blind Loop risk (Komarica 2024)** | ❌ | ❌ | Persis domain `check_progress`+`send_reminder` — tak terdesain |
| T5 | Iterative & Dialogic (Willis 2020; AI-EDL 2025) | ⚠️ | ⚠️ | "Scaffold, not oracle" menangkap setengahnya |
| — | File ini di-link dari dokumen proyek? | ❌ | ❌ | **0 link** di PRD/submission/ISSUES/HANDOFF — research "dibeli tapi tidak dipakai" |

**Skor: core 6/10 · feedback-loop ~1.5/5.**

### 3.2 Rekomendasi riset (belum dikerjakan — urutan sebelum ISS-08)

1. **P0** PRD §Research Grounding +2–3 baris: T1/T4 → `check_progress`+`send_reminder` (loop closure, Komarica 2024, Willis 2020); T5 → semua agent (dialogic iterative); Cognitive Mirror → Assessment Agent; SRL (g=1.613) → sistem (fase forethought/planning); + link kedua file research; T3 → Future Development sebagai conscious exclusion.
2. **P0** Submission: Cognitive Mirror + SRL 1 kalimat (bagian AI & Technology).
3. **P1** Submission Problem/Impact + Future Development: CAGR 11–14%, willingness-to-pay (Politecnico), konteks lokal (UGM).
4. **P2** Setelah narasi jadi: `$red-team-prd` stress-test sebelum submit.

---

## 4. Temuan Cross-Cutting

- **Konsistensi dokumen** adalah kekuatan: PRD ↔ submission ↔ AGENTS.md ↔ ADR saling selaras; tidak ada klaim yang tidak punya jejak.
- **Kelemahan terbesar untuk juri** bukan engineering (sudah solid) tapi **kedalaman narasi riset** (§3) — 90 paper dikumpulkan, ~40% temen-nya belum menghasilkan dampak ke dokumen yang dinilai juri.
- **Deadline risk:** ISS-08 (deck) adalah item deliverable terbesar tersisa; diagram (ISS-12) adalah input-nya.

---

## 5. Project Structure Assessment

### 5.1 Prinsip (kapan struktur perlu "lebih semantic")
Nama direktori harus menjawab *"apa isinya?"*, bukan *"tool mana yang menulisnya?"*; jumlah top-level idealnya ≤ 9 agar navigable oleh manusia DAN agent; setiap direktori = satu domain yang bisa dijelaskan dalam satu baris di Module Map.

### 5.2 Sebelum (masalah)
```
docs/   ← mencampur 3 domain: produk (PRD, ISSUES, submission) + research (2 file papers 700 baris) + decisions (adr/)
```
`adr/` bukan "docs" — ia adalah knowledge/decision layer yang berdiri sendiri. Papers research 700 baris juga bukan "dokumentasi proyek", ia adalah library riset.

### 5.3 Sesudah (dilakukan 2026-10-04)
```
serambi-ai/
├── AGENTS.md, HANDOFF.md, README.md, .gitignore, LICENSE
├── .bob/            # dev harness (Bob TUI): mcp.json, skills, hooks
├── agents/          # system prompts per agent (1 agent per file) — seam terisi bertahap
├── apps/            # production surfaces (web/ — target UI end user)
├── assets/          # screenshots/ + diagrams/ (output visual, tracked)
├── docs/            # produk & submission: PRD.md, ISSUES.md, submission-draft.md
├── flows/           # Langflow flow exports (1 file = 1 agent)
├── mcp/             # MCP integration docs (kontrak tool untuk semua caller)
├── research/        # Riset & keputusan: papers (2 file) + adr/ (0001–0005)  ← BARU
├── scripts/         # verifikasi: verify-flow.sh, verify-e2e.sh
├── slides/          # output deck (ISS-08)
└── packages/        # shared libraries (masa depan)
```
**Mapping:** `docs/adr/` → `research/adr/` · `docs/research-papers-and-abstracts.md` → `research/` · `docs/feedback-loop-papers-additional.md` → `research/`. Semuanya `git mv` (history dipertahankan). Referensi di PRD/AGENTS/ISSUES/HANDOFF/README diperbarui; `scripts/verify-*.sh` PASS pasca-restrukturisasi.

### 5.4 Verdict — perlu improve struktur?
**Ya, sekali saja (sudah dilakukan).** Tidak perlu struktur tambahan lain:
- `slides/`, `assets/diagrams/`, `packages/` sudah bernama benar dan punya README.
- **Jangan** memecah `docs/` lebih lanjut (hanya 3 file tersisa — over-structuring).
- **Jangan** bikin `prompts/` terpisah dari `agents/` — system prompt BUAAT agent, satu direktori.
- Output schema agent nanti masuk `mcp/schemas/` (kontrak, bukan docs) — bukan struktur baru, sub-folder dari domain yang sudah ada.

**Aturan ke depan:** setiap menambah direktori top-level baru → harus bisa di-justify dalam 1 baris di Module Map PRD.

---

## 6. Roadmap Terpadu (sesudah remediasi 2026-10-04)

| Urut | Item | Effort | Catatan |
|---|---|---|---|
| 1 | Narasi riset P0+P1 (§3.2) | 30–60 mnt | **sebelum ISS-08** supaya deck pakai narasi final |
| 2 | ISS-12: diagrams drawio (3: architecture, learner journey, flow goal_decomposer) + `agents/goal_decomposer.md` | 1 session | input deck + isi seam `agents/` |
| 3 | ISS-08: pitch deck 11 slides (`$pitch-deck`, `$competitive-analysis`) | 1 session | deadline |
| 4 | `$red-team-prd` sebelum submit | 1 session | stress-test narasi |
| 5 | DoD per issue terbuka + sinkron layout AGENTS.md↔PRD | 30 mnt | sekalian saat buka ISS-04 |
| 6 | P2: `mcp/schemas/`, `CONTEXT.md`, pre-commit, CI/AFK | bertahap | saat `apps/web` hidup |
