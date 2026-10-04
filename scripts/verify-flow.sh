#!/usr/bin/env bash
# verify-flow.sh — validasi statis Langflow flow exports (flows/*.json)
#
# Cek per file:
#   1. JSON valid
#   2. Field wajib: id, endpoint_name, data.nodes (array non-kosong)
#   3. endpoint_name unik antar flow
#
# Usage:  bash scripts/verify-flow.sh
# Exit:   0 = semua valid, 1 = ada error
set -uo pipefail
cd "$(dirname "$0")/.."

fail=0
declare -A seen

shopt -s nullglob
files=(flows/*.json)
if [ ${#files[@]} -eq 0 ]; then
  echo "FAIL: tidak ada flows/*.json"
  exit 1
fi

for f in "${files[@]}"; do
  name=$(basename "$f")

  if ! jq empty "$f" 2>/dev/null; then
    echo "✗ $name — JSON tidak valid"
    fail=1
    continue
  fi

  id=$(jq -r '.id // empty' "$f")
  ep=$(jq -r '.endpoint_name // empty' "$f")
  nodes=$(jq -r '.data.nodes | if type == "array" then length else -1 end' "$f")

  missing=""
  [ -n "$id" ] || missing="$missing id"
  [ -n "$ep" ] || missing="$missing endpoint_name"
  { [ "$nodes" -ge 0 ] && [ "$nodes" -gt 0 ]; } || missing="$missing data.nodes"

  if [ -n "$missing" ]; then
    echo "✗ $name — field wajib hilang:$missing"
    fail=1
    continue
  fi

  if [ -n "${seen[$ep]:-}" ]; then
    echo "✗ $name — endpoint_name '$ep' duplikat dengan ${seen[$ep]}"
    fail=1
    continue
  fi
  seen[$ep]="$name"
  echo "✓ $name — endpoint: $ep, nodes: $nodes"
done

if [ "$fail" -eq 0 ]; then
  echo "PASS: ${#files[@]} flow valid"
else
  echo "FAIL: lihat baris ✗ di atas"
  exit 1
fi
