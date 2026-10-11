# HANDOFF — Serambi.ai

> **Baca file ini di awal setiap session baru.** 1 halaman — status terkini + next action.

---

## Status Sekarang

**Phase:** 7 — Submission Materials ✅ DONE (ISS-07 + ISS-08 + competitive analysis v4 + submission assets synced)
**Last commit:** `09a2c15` — `fix(docs): sync deck/screenshots for submission + Astra AI competitive intel`
**Completed this session:**
- Deck v2 (4,4 MB, 11 slide native DrawingML + speaker notes) tersinkron ke `slides/serambi-pitch-deck.pptx` + `slides/serambi-pitch-deck.pdf` (736 KB)
- `submission/screenshots/` terisi 4 capture nyata (Bob TUI, Langflow canvas, endpoint, JSON output) — semua < 350 KB
- Competitive analysis **v4** ✅ — 11 kompetitor (9 direct + 2 indirect), tambah **Astra AI** (15,2 juta pelajar, 37+ bahasa, rating 4,9/5 App Store ID, harga riil Plus Rp 115rb/bln & Sigma Rp 385rb/bln) + battlecard + positioning map v4
- Klaim riset dikoreksi jadi traceable: GenMentor DOI 10.1145/3701716.3715244 (ganti FWCI 47.3 yang salah), Feynman Bot arXiv 2506.09055 ("learning gains vs passive re-reading", bukan "80%+ lebih memilih"), Zaidi arXiv 2004.11327 ("forgetting-curve model"; angka +15–20% dilabeli target produk, bukan angka paper), BJET cited 722 (bukan 694 stale), SRL meta-analysis DOI 10.3389/feduc.2025.1738751
- `submission-draft.md` §13 deskripsi slide disamakan dengan isi deck riil (hapus klaim tidak terverifikasi "revenue model" di slide 4, "6 KPIs + 4 guardrails" di slide 9, "1.2M/78% gagal" di slide 2)
- README EN + ID: seksi "Why This Is Different / Kenapa Ini Berbeda", anchor riset jujur, struktur repo update (83 skills, deck v2, PDF, screenshots)
- AGENTS.md + ADR 0005: jumlah skill 43 → 83 (fakta riil `.bob/skills/`)
- verify-flow.sh ✅ PASS (exit 0) · verify-e2e.sh ⛔ exit 2 (server Langflow mati — jalankan `uv run langflow run` dulu, baru re-verify sebelum klaim live)

**User actions still pending:**
- Paste jawaban `docs/submission-draft.md` ke form submission
- Upload deck (`slides/serambi-pitch-deck.pptx`) + 4 screenshot dari `submission/screenshots/`
- Pastikan repo `https://github.com/mmuchsin/serambi-ai` public (sudah public) — **push commit lokal: masih 11 commit belum ter-push**
- Rotasi `BOB_API_KEY` di `.envrc` setelah hackathon selesai

**Session infra:** Turn counter hook aktif — lihat `.bob/hooks/turn-counter.mjs` + `.bob/settings.json`.
**Reset counter** saat mulai session baru: hapus `.bob/turn-counter.json`.

---

## Next Action

**Submission assets selesai — tinggal paste + upload:**
1. Paste `docs/submission-draft.md` ke form (18 field, semua terisi)
2. Upload deck: `slides/serambi-pitch-deck.pptx` (4,4 MB) + PDF `slides/serambi-pitch-deck.pdf`
3. Upload 4 screenshot dari `submission/screenshots/` (nama sudah sesuai permintaan form)
4. Push commit lokal ke remote (`git push origin main` — remote masih tertinggal 11 commit)

Setelah form terkirim → buka ISS-04 (Tutor Agent / `explain_concept`).

**Bila Langflow dinyalakan** (`uv run langflow run` pada port 7860): jalankan `bash scripts/verify-e2e.sh` untuk memverifikasi round-trip MCP live sebelum klaim "verified" di form — deadline sudah dekat, verifikasi ini yang paling bernilai.

---

## Files Penting

| File | Isi |
|------|-----|
| [`docs/PRD.md`](docs/PRD.md) | Product requirements, architecture, research grounding, submission checklist |
| [`docs/ISSUES.md`](docs/ISSUES.md) | Issue tracker — cari status `[-]` atau `[ ]` teratas |
| [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md) | 11 kompetitor (9 direct + 2 indirect): Dicoding, Boot.dev, DataCamp, Astra AI + battlecard + positioning map |
| [`docs/submission-draft.md`](docs/submission-draft.md) | 18 jawaban form submission siap paste |
| [`slides/serambi-pitch-deck.pptx`](slides/serambi-pitch-deck.pptx) | Deck 11 slide (4,4 MB) + `.pdf` pendamping — sudah sinkron dengan deck v2 |
| [`submission/screenshots/`](submission/screenshots/) | 4 screenshot nyata untuk form (Bob TUI, Langflow canvas, endpoint, JSON output) |
| [`research/research-papers-and-abstracts.md`](research/research-papers-and-abstracts.md) | 30+ papers: research grounding tiap agent |
| [`flows/goal_decomposer.json`](flows/goal_decomposer.json) | Langflow flow Agent 1 (e2e verified) |
| [`.bob/mcp.json`](.bob/mcp.json) | MCP config: `lf-serambi_ai` streamable HTTP bridge |
| [`.bob/skills/`](.bob/skills/) | 83 agent skills (PM phuryn/pm-skills + engineering + diagram + custom pitch-deck) — gitignored, ter-install lokal |
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
