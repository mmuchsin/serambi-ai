# HANDOFF — Serambi.ai

> **Baca file ini di awal setiap session baru.** 1 halaman — status terkini + next action.

---

## Status Sekarang

**Phase:** 6b → 6c (MCP wired, e2e belum ditest)
**Current issue:** ISS-02 `[~]` BLOCKED — butuh manual step di Langflow UI
**Next issue after unblock:** ISS-03 — e2e test Bob → MCP → Langflow

**Session infra (baru):** Turn counter hook aktif — lihat `.bob/hooks/turn-counter.mjs` + `.bob/settings.json`.
**Reset counter** saat mulai session baru: hapus `.bob/turn-counter.json`.

---

## Next Action (1 langkah)

**ISS-02 — Set Langflow Endpoint Name (manual):**
1. Buka http://localhost:7860 → open flow `goal_decomposer`
2. Klik settings flow → set **Endpoint Name** = `goal_decomposer` → Save
3. `source ~/.bashrc` → restart Bob di workspace ini
4. Cek MCP panel: server `langflow` + tool `decompose_learning_goal` muncul

Setelah ISS-02 done → lanjut ISS-03 (e2e test Bob → MCP → Langflow → screenshot).

---

## Files Penting

| File | Isi |
|------|-----|
| [`docs/PRD.md`](docs/PRD.md) | Product requirements, architecture, submission checklist |
| [`docs/ISSUES.md`](docs/ISSUES.md) | Issue tracker — cari status `[-]` atau `[ ]` teratas |
| [`flows/goal_decomposer.json`](flows/goal_decomposer.json) | Langflow flow Agent 1 (verified) |
| [`.bob/mcp.json`](.bob/mcp.json) | MCP config: `langflow` SSE + `drawio` stdio |
| [`.env.example`](.env.example) | Template env — copy ke `.env`, isi `LANGFLOW_API_KEY` |

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
