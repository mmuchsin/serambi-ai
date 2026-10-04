# ADR-0003: Bob TUI sebagai dev harness (bukan UI pengguna akhir)

**Status:** Accepted (2026-10-03)
**Deciders:** user (dev solo, IBM Hacktiv8)

## Context

Serambi.ai punya dua konsumen: developer (build & verify agents) dan end user
(career switchers Indonesia). Membangun web app di awal akan memperlambat iterasi
agent, dan demo hackathon butuh cara cepat membuktikan setiap agent bekerja e2e.

## Decision

**IBM Bob TUI v2.0.5** adalah *development harness*: membangun, menguji, dan memverifikasi
agent lewat natural language + MCP tool calling. UI pengguna akhir adalah web app di
`apps/web/` (production target) yang memanggil **kontrak MCP tool yang identik** —
tidak ada perubahan Langflow saat web app dibangun.

## Alternatives

- **Langsung develop di web app** — UI harus siap sebelum agent bisa diuji; iterasi lambat,
  feedback loop panjang (build UI → deploy → test agent).
- **Langflow Playground saja** — tanpa reasoning layer; tidak bisa memverifikasi perilaku
  agent dalam konteks conversational (tool selection, multi-turn).
- **Jupyter notebook** — kontrol penuh tapi tanpa harness skill/handoff discipline;
  setup per-session.

## Consequences

- (+) Iterasi agent cepat: prompt natural language → tool call → verify output, dalam satu session.
- (+) Kontrak MCP = seam antara dev dan production: web app tidak mengubah apa pun di Langflow.
- (+) Disiplin sesi (one-issue-per-session, turn counter, HANDOFF) menjaga context window sehat.
- (−) Bob tidak tersedia untuk end user → web app tetap harus dibangun sebelum launch.
- (−) Perilaku "e2e verified" terikat pada tool-calling behavior Bob → mitigasi:
  `scripts/verify-e2e.sh` memverifikasi sisi MCP independen dari Bob.
