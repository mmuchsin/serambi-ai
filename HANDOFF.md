# HANDOFF — Serambi.ai

> **Baca file ini di awal setiap session baru.** 1 halaman — status terkini + next action.

---

## Status Sekarang

**Phase:** 7 — Submission Materials (ISS-06 ✅ done, next: ISS-07 + ISS-08)
**Current issue:** ISS-07 `[ ]` Submission form fill  
**Completed this session:** ISS-02, ISS-03, ISS-06 ✅ — e2e verified + semua README + PM skills installed

**Session infra:** Turn counter hook aktif — lihat `.bob/hooks/turn-counter.mjs` + `.bob/settings.json`.
**Reset counter** saat mulai session baru: hapus `.bob/turn-counter.json`.

---

## Next Action (1 langkah)

**ISS-07 + ISS-08 (dapat paralel) — Submission form + Pitch deck:**

ISS-07 (submission form):
1. `use_skill value-proposition` → draft "Mengapa Solusi Dibutuhkan" + "Diferensiasi"
2. `use_skill north-star` → draft "Dampak" + "Fitur Utama"
3. `use_skill plan-launch` → draft "Target User" + "Alur Penggunaan"
4. Save ke `docs/submission-draft.md`

ISS-08 (pitch deck):
1. `use_skill pitch-deck` → generate 11-slide outline
2. `use_skill competitive-analysis` → isi slide Diferensiasi
3. Export ke `slides/serambi-pitch-deck.pptx`

---

## Files Penting

| File | Isi |
|------|-----|
| [`docs/PRD.md`](docs/PRD.md) | Product requirements, architecture, research grounding, submission checklist |
| [`docs/ISSUES.md`](docs/ISSUES.md) | Issue tracker — cari status `[-]` atau `[ ]` teratas |
| [`docs/research-papers-and-abstracts.md`](docs/research-papers-and-abstracts.md) | 30+ papers: research grounding tiap agent |
| [`flows/goal_decomposer.json`](flows/goal_decomposer.json) | Langflow flow Agent 1 (e2e verified) |
| [`.bob/mcp.json`](.bob/mcp.json) | MCP config: `lf-lsa_ibm_hackathon` SSE + `drawio` stdio |
| [`.bob/skills/`](.bob/skills/) | 43 PM skills (pm-skills + custom pitch-deck) |
| [`AGENTS.md`](AGENTS.md) | Agent harness guide — tools, constraints, session rules |

---

## Skills untuk Session Ini

```
use_skill value-proposition    # submission form: why this solution
use_skill north-star           # impact metrics
use_skill pitch-deck           # 11-slide outline
use_skill competitive-analysis # diferensiasi vs kompetitor
use_skill plan-launch          # GTM / target user
use_skill conventional-commits # sebelum commit apapun
```

Jangan load: `grilling`, `prototype`, `research` — fase itu sudah selesai.

---

## Constraints

- Turn limit: **100 turns/session** — 1 issue per session
- Context window: issues di [`docs/ISSUES.md`](docs/ISSUES.md) dirancang agar fit dalam 1 window
- ISS-03 (e2e) sudah done — boleh expand ke Agent 2-6 setelah ISS-07+ISS-08 selesai
- Commit: atomic conventional commits, batch small fixes
- Deadline Stage 1: **11 Oktober**

---

## Update Template

Saat session selesai, update bagian **"Status Sekarang"** dan **"Next Action"** di file ini, lalu commit:
```
chore(docs): update handoff — ISS-XX done, next: ISS-YY
```
