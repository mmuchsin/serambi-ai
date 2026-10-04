# HANDOFF — Serambi.ai

> **Baca file ini di awal setiap session baru.** 1 halaman — status terkini + next action.

---

## Status Sekarang

**Phase:** 7 — Submission Materials ✅ DONE (ISS-07 + ISS-08 + competitive analysis v3)
**Last commit:** `8fcfaf9` — `docs(business): update competitive analysis v3 with verified data — Dicoding 1.3M+, Boot.dev Socratic AI`
**Completed this session:**
- ISS-08 ✅ — 11-slide PPTX, 3 draw.io diagrams, 4 PNGs exported
- Competitive analysis v3 ✅ — Dicoding 1,327,000+ (verified from scraped page), Boot.dev "Avoid AI" + Socratic Boots chatbot documented
- Pitch deck slide 09 ✅ — updated Dicoding 1.3M+ + Boot.dev Socratic angle
- verify-flow.sh ✅ | verify-e2e.sh ✅

**User actions still pending:**
- Isi nama tim di slide 11 (`slides/serambi-pitch-deck.pptx`)
- Insert 4 screenshot ke slide 08 (dari `assets/screenshots/`)
- Export PDF: File → Export as PDF → `slides/serambi-pitch-deck.pdf`
- Paste jawaban ke form, pastikan repo `https://github.com/mmuchsin/serambi-ai` public
- Upload deck + screenshot ke form

**Session infra:** Turn counter hook aktif — lihat `.bob/hooks/turn-counter.mjs` + `.bob/settings.json`.
**Reset counter** saat mulai session baru: hapus `.bob/turn-counter.json`.

---

## Next Action

**Submission Materials selesai — saatnya submit:**
1. Buka `slides/serambi-pitch-deck.pptx` → isi nama tim di slide 11
2. Insert 4 screenshot (dari `assets/screenshots/`) ke slide 08
3. Export PDF → `slides/serambi-pitch-deck.pdf`
4. Paste `docs/submission-draft.md` ke form, upload deck + screenshots
5. Pastikan repo public: `https://github.com/mmuchsin/serambi-ai`

Setelah form terkirim → buka ISS-04 (Tutor Agent / `explain_concept`).

---

## Files Penting

| File | Isi |
|------|-----|
| [`docs/PRD.md`](docs/PRD.md) | Product requirements, architecture, research grounding, submission checklist |
| [`docs/ISSUES.md`](docs/ISSUES.md) | Issue tracker — cari status `[-]` atau `[ ]` teratas |
| [`research/research-papers-and-abstracts.md`](research/research-papers-and-abstracts.md) | 30+ papers: research grounding tiap agent |
| [`flows/goal_decomposer.json`](flows/goal_decomposer.json) | Langflow flow Agent 1 (e2e verified) |
| [`.bob/mcp.json`](.bob/mcp.json) | MCP config: `lf-serambi_ai` SSE + `drawio` stdio |
| [`.bob/skills/`](.bob/skills/) | 43 PM skills (pm-skills + custom pitch-deck) |
| [`AGENTS.md`](AGENTS.md) | Agent harness guide — tools, constraints, session rules |

---

## Skills untuk Session Ini

```
$value-proposition    # submission form: why this solution
$north-star           # impact metrics
$pitch-deck           # 11-slide outline
$competitive-analysis # diferensiasi vs kompetitor
$plan-launch          # GTM / target user
$conventional-commits # sebelum commit apapun
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
