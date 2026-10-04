# ADR-0002: MCP streamable HTTP via `mcp-proxy`

**Status:** Accepted (2026-10-03)
**Deciders:** user (dev solo, IBM Hacktiv8)

## Context

Bob (TUI agent harness) memanggil agent sebagai **named MCP tools**
(`mcp__lf-serambi_ai__goal_decomposer`). Langflow 1.12 expose MCP endpoint
streamable HTTP di `http://localhost:7860/api/v1/mcp/project/<PROJECT_ID>/streamable`,
tapi Bob butuh server MCP lokal (stdio) di config `.bob/mcp.json`.

## Decision

Bridging via **`uvx mcp-proxy`** (stdio → streamable HTTP):

```json
{
  "mcpServers": {
    "lf-serambi_ai": {
      "command": "uvx",
      "args": ["--with", "mcp<2.0.0", "mcp-proxy", "--transport", "streamablehttp",
               "--headers", "x-api-key", "${env:LANGFLOW_API_KEY}",
               "http://localhost:7860/api/v1/mcp/project/77726bb2-9137-4e8d-8491-c8daa87f9192/streamable"]
    }
  }
}
```

Key hanya dari environment (`LANGFLOW_API_KEY` di `~/.bashrc` / `.env`), tidak pernah
disimpan di file. Config project-scope di `.bob/mcp.json` (config global Bob dikosongkan).

## Alternatives

- **Native SSE transport** — endpoint lama Langflow; sudah diganti streamable HTTP di 1.12,
  dan mcp-proxy mendukungnya (`--transport streamablehttp`).
- **Direct REST API Langflow** — bypass MCP; tapi Bob kehilangan named-tool calling yang
  konsisten dengan kontrak produksi (web app memanggil tool yang sama).
- **MCP server Python custom** — kontrol penuh, tapi memelihara bridge manual untuk sesuatu
  yang `mcp-proxy` sudah kerjakan.

## Consequences

- (+) Kontrak satu: caller apa pun (Bob dev, web app production) memanggil named tools yang sama.
- (+) Key tidak pernah masuk repo (`.env` gitignored, `.env.example` template).
- (−) Tambah satu proses di runtime (`uvx` harus terinstall) → troubleshooting di `mcp/README.md`.
- (−) URL project-specific → `scripts/verify-e2e.sh` membaca URL dari `.bob/mcp.json`
  (single source of truth), tidak hardcode.
