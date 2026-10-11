#!/usr/bin/env bash
# bootstrap-langflow.sh — import the flow into a *clean* Langflow and print
# the MCP URL that Bob (or any MCP client) should use.
#
# Why this exists:
#   .bob/mcp.json ships to the jury with a project UUID that only exists in
#   the author's Langflow instance. On a fresh container that UUID means a
#   404/400 and the MCP tool never appears. This script removes that local
#   anchor: it imports the flow via the Langflow REST API, reads back the
#   *real* project ID of the instance it just bootstrapped, and emits an
#   .bob/mcp.json pointed at that instance.
#
# Usage:
#   LANGFLOW_API_KEY=... bash scripts/bootstrap-langflow.sh [--print-url-only]
#
# Optional model wiring (recommended for a live run):
#   SERAMBI_MODEL    model name on any OpenAI-compatible endpoint
#   SERAMBI_API_KEY  key for that endpoint
#   SERAMBI_BASE_URL endpoint base URL, default https://api.openai.com/v1
#
# Exit: 0 = imported + URL printed, 1 = failure (message on stderr)
set -uo pipefail
cd "$(dirname "$0")/.."

BASE="${LANGFLOW_BASE_URL:-http://localhost:7860}"
FLOW="flows/goal_decomposer.json"
OUT=".bob/mcp.json"
PRINT_ONLY=0
[ "${1:-}" = "--print-url-only" ] && PRINT_ONLY=1

# --- Preconditions ---------------------------------------------------------
if [ -z "${LANGFLOW_API_KEY:-}" ] && [ -f .env ]; then
  val=$(grep -E '^LANGFLOW_API_KEY=' .env | head -1 | cut -d= -f2-)
  [ -n "$val" ] && export LANGFLOW_API_KEY="$val"
fi
if [ -z "${LANGFLOW_API_KEY:-}" ]; then
  echo "bootstrap: FAIL — LANGFLOW_API_KEY not set (env or .env)." >&2
  echo "  In the docker sandbox this key comes from LANGFLOW_SUPERUSER_PASSWORD:" >&2
  echo "  log in at ${BASE} once, then create an API key in Settings." >&2
  exit 1
fi
command -v python3 >/dev/null || { echo "bootstrap: FAIL — python3 required" >&2; exit 1; }

# --- Import the flow -------------------------------------------------------
# FlowCreate = the export minus its local id. endpoint_name is preserved, and
# Langflow 1.12.2 keeps that value (verified: POST /api/v1/flows/ -> 201 with
# endpoint_name intact).
python3 - "$FLOW" > /tmp/_sf_flowcreate.json <<'PY'
import json, sys
d = json.load(open(sys.argv[1]))
body = {k: v for k, v in d.items() if k != "id"}
body.setdefault("name", "serambi-goal-decomposer")
# A freshly imported flow has mcp_enabled=false, which hides it from the
# project-scoped MCP endpoint (verified on Langflow 1.12.2). Ship the flag
# on at import time so the tool is reachable the moment the flow lands.
body["mcp_enabled"] = True
# The export carries an empty Language Model node (model=''), so the flow
# fails at runtime with "A model selection is required" on a clean instance.
# Fill it from the jury's own OpenAI-compatible provider if one is supplied.
# Optional: without these the flow still imports, verifies, and lists fine.
model = "${SERAMBI_MODEL:-}"
if model:
    for n in body.get("data", {}).get("nodes", []):
        tpl = (n.get("data", {}).get("node", {}) or {}).get("template", {})
        if "model" in tpl and "provider" in tpl:
            tpl["model"]["value"] = [{
                "name": model, "icon": "Plug",
                "provider": "OpenAI Compatible",
                "metadata": {
                    "context_length": 128000, "model_class": "ChatOpenAI",
                    "model_name_param": "model", "api_key_param": "api_key",
                    "base_url_param": "base_url",
                },
            }]
            tpl["api_key"]["value"] = "${SERAMBI_API_KEY:-}"
json.dump(body, sys.stdout)
PY

resp=$(curl -sS -m 40 -X POST "$BASE/api/v1/flows/" \
  -H "x-api-key: $LANGFLOW_API_KEY" \
  -H "Content-Type: application/json" \
  --data-binary @/tmp/_sf_flowcreate.json 2>/dev/null) || {
  echo "bootstrap: FAIL — cannot import flow (is Langflow running at $BASE?)" >&2
  rm -f /tmp/_sf_flowcreate.json; exit 1
}
rm -f /tmp/_sf_flowcreate.json

FLOW_ID=$(printf '%s' "$resp" | jq -r '.id // empty' 2>/dev/null)
if [ -z "$FLOW_ID" ]; then
  echo "bootstrap: FAIL — import returned no flow id." >&2
  echo "  response preview: $(printf '%s' "$resp" | head -c 200)" >&2
  exit 1
fi

# --- Resolve the project that now owns the flow ----------------------------
PROJECT_ID="${LANGFLOW_PROJECT_ID:-}"
if [ -z "$PROJECT_ID" ]; then
  # Langflow 1.12.2 exposes projects at /api/v1/projects/; the default project
  # is the first one. Fall back to the UUID already present in mcp.json.
  PROJECT_ID=$(curl -sS -m 20 -H "x-api-key: $LANGFLOW_API_KEY" \
    "$BASE/api/v1/projects/" 2>/dev/null \
    | jq -r 'if type=="array" then .[0].id else (.projects[0].id? // empty) end' 2>/dev/null)
fi
if [ -z "$PROJECT_ID" ]; then
  PROJECT_ID=$(jq -r '.mcpServers["lf-serambi_ai"].args[-1] // empty' "$OUT" 2>/dev/null \
    | grep -oP '(?<=/mcp/project/)[0-9a-f-]+')
fi

echo "✓ flow imported: $FLOW_ID"

# --- Turn the MCP exposure on -----------------------------------------------
# VERIFIED on a clean Langflow 1.12.2 container: an imported flow keeps its
# endpoint_name but ships with mcp_enabled=false, and a project-scoped MCP
# endpoint then reports tools: []. Patch the flag, or the jury sees an empty
# tool list and concludes the agent does not exist.
patch=$(curl -sS -m 20 -X PATCH "$BASE/api/v1/flows/$FLOW_ID" \
  -H "x-api-key: $LANGFLOW_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"mcp_enabled":true}' 2>/dev/null)
if printf '%s' "$patch" | jq -e '.mcp_enabled == true' >/dev/null 2>&1; then
  echo "✓ mcp_enabled=true (tool now exposes to MCP)"
else
  echo "! warning: could not confirm mcp_enabled — check the flow in the Langflow UI" >&2
fi
[ -z "$PROJECT_ID" ] && echo "! project id not resolved — MCP URL will use the generic /api/v1/mcp/streamable path"

# --- Emit the MCP config for THIS instance ---------------------------------
URL="$BASE/api/v1/mcp/streamable"
if [ -n "$PROJECT_ID" ]; then
  URL="$BASE/api/v1/mcp/project/$PROJECT_ID/streamable"
fi

if [ "$PRINT_ONLY" = "1" ]; then
  echo "$URL"; exit 0
fi

cat > "$OUT" <<JSON
{
  "mcpServers": {
    "lf-serambi_ai": {
      "command": "uvx",
      "args": [
        "--with", "mcp<2.0.0",
        "mcp-proxy",
        "--transport", "streamablehttp",
        "--headers", "x-api-key", "\${env:LANGFLOW_API_KEY}",
        "$URL"
      ]
    }
  }
}
JSON
echo "✓ wrote $OUT -> $URL"
echo "  next: bash scripts/verify-e2e.sh"
