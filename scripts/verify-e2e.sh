#!/usr/bin/env bash
# verify-e2e.sh — verifikasi end-to-end (live) Bob → MCP → Langflow
#
# Cek:
#   1. MCP streamable endpoint Langflow terjangkau + auth valid (JSON-RPC tools/list)
#   2. Setiap endpoint_name di flows/*.json terekspos sebagai MCP tool
#
# URL diambil dari .bob/mcp.json (single source of truth), API key dari
# env LANGFLOW_API_KEY atau fallback .env.
#
# Usage:  bash scripts/verify-e2e.sh
# Exit:   0 = OK, 1 = ada tool tidak terekspos, 2 = endpoint/auth masalah
set -uo pipefail
cd "$(dirname "$0")/.."

# --- API key ---
if [ -z "${LANGFLOW_API_KEY:-}" ] && [ -f .env ]; then
  val=$(grep -E '^LANGFLOW_API_KEY=' .env | head -1 | cut -d= -f2-)
  [ -n "$val" ] && export LANGFLOW_API_KEY="$val"
fi
if [ -z "${LANGFLOW_API_KEY:-}" ]; then
  echo "FAIL: LANGFLOW_API_KEY tidak ditemukan (env atau .env)"
  exit 2
fi

# --- URL MCP streamable dari .bob/mcp.json ---
url=$(jq -r '.mcpServers["lf-serambi_ai"].args[-1] // empty' .bob/mcp.json)
if [ -z "$url" ]; then
  echo "FAIL: URL MCP tidak ditemukan di .bob/mcp.json (mcpServers.lf-serambi_ai)"
  exit 2
fi

# --- JSON-RPC tools/list ---
body=$(curl -sS -m 15 -X POST "$url" \
  -H "Authorization: Bearer $LANGFLOW_API_KEY" \
  -H "x-api-key: $LANGFLOW_API_KEY" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json, text/event-stream" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}' 2>/dev/null) || {
  echo "FAIL: endpoint tidak terjangkau ($url) — Langflow sedang jalan?"
  exit 2
}

# Response bisa application/json atau SSE (baris "data: ...")
if printf '%s\n' "$body" | head -1 | grep -q '^data:'; then
  body=$(printf '%s\n' "$body" | grep '^data:' | sed 's/^data://')
fi

if ! printf '%s' "$body" | grep -q 'tools'; then
  echo "FAIL: respons bukan tools/list (auth ditolak atau endpoint berubah?)"
  echo "      preview: $(printf '%s' "$body" | head -c 200)"
  exit 2
fi
echo "✓ MCP endpoint merespons: $url"

# --- Setiap endpoint_name flows/* harus ada di tools/list ---
shopt -s nullglob
missing=0
for f in flows/*.json; do
  ep=$(jq -r '.endpoint_name // empty' "$f")
  [ -n "$ep" ] || continue
  if printf '%s' "$body" | grep -q "$ep"; then
    echo "✓ tool '$ep' terekspos"
  else
    echo "✗ tool '$ep' TIDAK muncul di tools/list"
    missing=1
  fi
done

if [ "$missing" -eq 0 ]; then
  echo "PASS: e2e MCP OK"
else
  echo "FAIL: ada endpoint tidak terekspos — set Endpoint Name di Langflow UI lalu simpan"
  exit 1
fi
