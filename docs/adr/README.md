# ADR — Architecture Decision Records

Keputusan arsitektur mayor Serambi.ai. Format: Context → Decision → Alternatives → Consequences.
Referensi: "AI Coding for Real Engineers" §085 — ADR menjawab "why did you do it this way?",
pertanyaan yang tidak bisa dijawab agent hanya dari codebase.

| # | Keputusan | Status |
|---|-----------|--------|
| [0001](0001-langflow-as-flow-engine.md) | Langflow sebagai flow engine agent | Accepted |
| [0002](0002-mcp-streamablehttp-via-mcp-proxy.md) | MCP streamable HTTP via `mcp-proxy` | Accepted |
| [0003](0003-bob-tui-as-dev-harness.md) | Bob TUI sebagai dev harness (bukan UI akhir) | Accepted |
| [0004](0004-llm-providers.md) | LLM: longcat-2.5 via NaraRouter (flows), Claude (Bob) | Accepted |
| [0005](0005-project-decisions-log.md) | Keputusan proyek lain (brand, monorepo, skills) | Accepted |

**Aturan:** keputusan arsitektur baru → buat ADR baru (nomor berikutnya) SEBELUM implementasi.
Jangan mengubah ADR yang sudah Accepted tanpa ADR pengganti yang membatalkannya.
