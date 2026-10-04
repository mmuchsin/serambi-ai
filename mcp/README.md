# MCP Integration — Serambi.ai

How IBM Bob connects to Langflow via Model Context Protocol (MCP).

---

## Overview

Serambi.ai uses MCP to bridge Bob (AI agent harness) and Langflow (flow execution engine). Each Langflow flow with a named endpoint becomes a callable tool in Bob.

```
Bob ──MCP (streamable HTTP, via uvx mcp-proxy)──► Langflow project endpoint
                                        │
                                        ├── goal_decomposer  (tool 1)
                                        ├── explain_concept  (tool 2, planned)
                                        └── ...
```

---

## Configuration

File: [`.bob/mcp.json`](../.bob/mcp.json)

```json
{
  "mcpServers": {
    "lf-serambi_ai": {
      "command": "uvx",
      "args": [
        "--with", "mcp<2.0.0",
        "mcp-proxy",
        "--transport", "streamablehttp",
        "--headers", "x-api-key", "${env:LANGFLOW_API_KEY}",
        "http://localhost:7860/api/v1/mcp/project/<PROJECT_ID>/streamable"
      ]
    }
  }
}
```

**How it works:**
- `uvx mcp-proxy` spawns a local stdio MCP process that bridges to Langflow's **streamable HTTP** MCP endpoint (Langflow 1.12+)
- `${env:LANGFLOW_API_KEY}` is read from the shell environment — never stored in the file
- All Langflow flows in the project with an Endpoint Name set are exposed as MCP tools

> The same file also defines a second, unrelated server: `drawio`
> (`npx -y @drawio/mcp`, stdio) — a diagramming tool for agent sessions, not
> part of the Serambi.ai flow bridge.

---

## Tools

| MCP Tool ID | Langflow Endpoint Name | Status |
|-------------|----------------------|--------|
| `mcp__lf-serambi_ai__goal_decomposer` | `goal_decomposer` | ✅ Live |
| `mcp__lf-serambi_ai__explain_concept` | `explain_concept` | 🔜 Planned |
| `mcp__lf-serambi_ai__generate_quiz` | `generate_quiz` | 🔜 Planned |
| `mcp__lf-serambi_ai__check_progress` | `check_progress` | 🔜 Planned |
| `mcp__lf-serambi_ai__send_reminder` | `send_reminder` | 🔜 Planned |
| `mcp__lf-serambi_ai__check_wellbeing` | `check_wellbeing` | 🔜 Planned |

---

## Adding a New Tool

1. Build and verify the flow in Langflow Playground
2. Open flow settings → set **Endpoint Name** (e.g. `explain_concept`) → Save
3. The tool is immediately available as `mcp__lf-serambi_ai__explain_concept` in Bob
4. No changes needed to `.bob/mcp.json` — project-level endpoint auto-discovers all flows

---

## Verification (feedback loop)

```bash
bash scripts/verify-flow.sh   # statis: flows/*.json valid, field wajib, endpoint_name unik
bash scripts/verify-e2e.sh    # live: MCP tools/list — tiap flow terekspos sebagai tool
```

`verify-e2e.sh` exit codes: `0` OK · `1` tool tidak terekspos (set Endpoint Name di Langflow UI) · `2` endpoint/auth tidak terjangkau (Langflow tidak hidup, atau key salah). URL dibaca dari `.bob/mcp.json` (single source of truth).

---

## Environment Setup

```bash
# Required: add to ~/.bashrc
export LANGFLOW_API_KEY=sk-...

# Reload
source ~/.bashrc
```

Verify the endpoint is reachable:
```bash
curl -s --compressed "http://localhost:7860/api/v1/flows/" \
  -H "x-api-key: $LANGFLOW_API_KEY" | python3 -c \
  "import sys,json; [print(f['name'],'→',f.get('endpoint_name')) for f in json.load(sys.stdin)]"
```

---

## Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| Tool not appearing in Bob | Endpoint Name not set in Langflow | Open flow → Settings → set Endpoint Name → Save |
| `406 Not Acceptable` from curl | Expected — curl tidak mengirim header Accept streamable HTTP yang benar | Use Bob (mcp-proxy handles streamable HTTP) atau `scripts/verify-e2e.sh`, bukan curl langsung |
| `Authentication error` | `LANGFLOW_API_KEY` not loaded | `source ~/.bashrc` then restart Bob |
| `uvx: command not found` | uv not installed | `pip install uv` |

For deeper MCP issues: `$configure-mcp` in Bob.
