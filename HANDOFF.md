# HANDOFF — Serambi.ai

> **Baca file ini di awal setiap session baru.** 1 halaman — status terkini + next action.

---

## Status Sekarang

**Phase:** 7 — Submission Materials (ISS-07 draft ✅ done, next: ISS-08 + user submits form)
**Current issue:** ISS-08 `[ ]` Pitch deck 11 slides
**Completed this session:** ISS-07 ✅ — submission-draft.md (17 field) + screenshots 01–04
**User actions pending:** paste jawaban ke form, pastikan repo `https://github.com/mmuchsin/serambi-ai` public, upload deck + screenshot

**Session infra:** Turn counter hook aktif — lihat `.bob/hooks/turn-counter.mjs` + `.bob/settings.json`.
**Reset counter** saat mulai session baru: hapus `.bob/turn-counter.json`.

---

## Next Action (1 langkah)

**ISS-08 — Pitch deck (11 slides):**
1. `use_skill pitch-deck` → generate 11-slide outline
2. `use_skill competitive-analysis` → isi slide Diferensiasi (bahan: `docs/submission-draft.md` §17)
3. Export ke `slides/serambi-pitch-deck.pptx` + `.pdf`

Setelah deck selesai + user submit form → ISS-04 (Tutor Agent) bisa dibuka.

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
