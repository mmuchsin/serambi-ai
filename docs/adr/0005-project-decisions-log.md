# ADR-0005: Keputusan proyek lain (brand, monorepo, skills, tooling)

**Status:** Accepted (2026-10-03)
**Sumber:** dipindahkan dari `docs/ISSUES.md` §Notes & Decisions Log (audit P0-2, 2026-10-04).
Catatan status per-issue ("ISS-XX complete") tidak dipindah — sudah tercatat di
masing-masing issue §What was done.

## Decision

| Keputusan | Rationale | Alternatif yang dilepas |
|-----------|-----------|-------------------------|
| Brand: **Serambi.ai** | Nama unik, tidak bentrok dengan contoh materi hackathon | "EduFlow" (nama proyek contoh Team Aurora) |
| `docs/PRD.md` + `docs/ISSUES.md` sebagai sistem planning | Session continuity untuk agent: PRD = destination, ISSUES = journey (pola "AI Coding for Real Engineers" §035) | Planning hanya di memori session |
| Monorepo: `apps/`, `packages/`, `flows/`, `agents/`, `mcp/`, `docs/` | Semua sub-proyek satu repo; README per direktori; AGENTS.md root + link (progressive disclosure) | Multi-repo (overkill untuk 1 dev + 6 agent) |
| 43 PM skills dari phuryn/pm-skills di `.bob/skills/` | Skill = progressive disclosure untuk tugas PM (pitch deck, competitive analysis, dll) | Menulis prompt PM dari nol tiap session |
| Skill custom `pitch-deck` | Tidak ada di pm-skills; struktur 11-slide sudah di-require di PRD | — |
| Config MCP project-scope (`.bob/mcp.json`), config global Bob dikosongkan | Isolation: repo self-contained; tidak memengaruhi proyek lain di mesin yang sama | Config global (berisiko konflik antar proyek) |
| Turn counter hook (`.bob/hooks/turn-counter.mjs`) | Feedback loop untuk limit 100 turn/session (pola context visibility §021) | Hitung manual |
| `.bob/turn-counter.json` & `.handoff*` gitignored | File state lokal, bukan source of truth | Track (noise di git) |
