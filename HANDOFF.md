# HANDOFF — Serambi.ai

> **Baca file ini di awal setiap session baru.** 1 halaman — status terkini + next action.

---

## Status Sekarang

**Phase:** 6c → 7 (e2e DONE, masuk submission materials)
**Current issue:** ISS-06 `[ ]` README.md + mcp/README.md
**Completed this session:** ISS-02 ✅ + ISS-03 ✅ (e2e verified — Bob → MCP → Langflow works)

**Session infra (baru):** Turn counter hook aktif — lihat `.bob/hooks/turn-counter.mjs` + `.bob/settings.json`.
**Reset counter** saat mulai session baru: hapus `.bob/turn-counter.json`.

---

## Next Action (1 langkah)

**ISS-06 — Tulis README.md + mcp/README.md:**
1. Buat `README.md` di root: deskripsi proyek, quick start, architecture, how it works
2. Buat `mcp/README.md`: penjelasan MCP server config, tool list, cara Bob pakai tools
3. Commit: `docs: add README and mcp/README for submission`

Setelah ISS-06 done → ISS-08 (pitch deck) paralel dengan ISS-07 (submission form).

---

## Files Penting

| File | Isi |
|------|-----|
| [`docs/PRD.md`](docs/PRD.md) | Product requirements, architecture, submission checklist |
| [`docs/ISSUES.md`](docs/ISSUES.md) | Issue tracker — cari status `[-]` atau `[ ]` teratas |
| [`flows/goal_decomposer.json`](flows/goal_decomposer.json) | Langflow flow Agent 1 (e2e verified) |
| [`.bob/mcp.json`](.bob/mcp.json) | MCP config: `lf-lsa_ibm_hackathon` SSE + `drawio` stdio |
| [`.env.example`](.env.example) | Template env — copy ke `.env`, isi `LANGFLOW_API_KEY` |
| `apps/` | Monorepo: future webapp (Next.js / React) |
| `packages/` | Monorepo: future shared libs |

---

## Skills untuk Session Ini

```
use_skill configure-mcp      # jika MCP troubleshooting
use_skill conventional-commits  # sebelum commit apapun
```

Jangan load: `grilling`, `prototype`, `research` — fase itu sudah selesai.

---

## Constraints

- Turn limit: **100 turns/session** — 1 issue per session
- Context window: issues di [`docs/ISSUES.md`](docs/ISSUES.md) dirancang agar fit dalam 1 window
- Jangan expand scope ke Agent 2-6 sebelum ISS-03 (e2e) done
- Commit: atomic conventional commits, batch small fixes

---

## Update Template

Saat session selesai, update bagian **"Status Sekarang"** dan **"Next Action"** di file ini, lalu commit:
```
chore(docs): update handoff — ISS-XX done, next: ISS-YY
```
