#!/usr/bin/env bash
# docker-entrypoint.sh — dispatcher for the serambi sandbox container.
#
#   verify-flow    static validation of flows/*.json  (no server needed)
#   verify-e2e     live MCP tools/list check           (needs langflow up)
#   bootstrap      import flow into langflow, write MCP URL
#   shell          interactive shell for inspection
set -uo pipefail
cd /workspace 2>/dev/null || cd /serambi 2>/dev/null || true

cmd="${1:-help}"

case "$cmd" in
  verify-flow)
    exec bash scripts/verify-flow.sh
    ;;
  verify-e2e)
    export LANGFLOW_BASE_URL="${LANGFLOW_BASE_URL:-http://langflow:7860}"
    export LANGFLOW_REWRITE_HOST=1
    exec bash scripts/verify-e2e.sh
    ;;
  bootstrap)
    export LANGFLOW_BASE_URL="${LANGFLOW_BASE_URL:-http://langflow:7860}"
    exec bash scripts/bootstrap-langflow.sh
    ;;
  shell|bash|sh)
    exec bash
    ;;
  *)
    cat <<'TXT'
serambi-ai sandbox — available commands

  verify-flow   static flow validation (jq, offline)
  verify-e2e    live MCP tools/list check (needs langflow service healthy)
  bootstrap     import flows/goal_decomposer.json into Langflow, print MCP URL
  shell         drop into a shell with the repo mounted at /workspace

Environment:
  LANGFLOW_BASE_URL    default http://langflow:7860 (in-compose) or localhost:7860
  LANGFLOW_API_KEY     Langflow API key (x-api-key)
  LANGFLOW_PROJECT_ID  project UUID, if you want the project-scoped MCP URL
TXT
    ;;
esac
