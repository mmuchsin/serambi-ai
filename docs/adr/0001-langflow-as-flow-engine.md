# ADR-0001: Langflow sebagai flow engine agent

**Status:** Accepted (2026-10-03)
**Deciders:** user (dev solo, IBM Hacktiv8)

## Context

Setiap agent Serambi.ai (Goal, Tutor, Assessment, Progress, Motivator, Wellbeing) butuh:
prompt engineering iteratif, struktur multi-node (input → prompt → LLM → output), dan
kemudahan diekspor sebagai artifact yang bisa masuk git.

## Decision

Pakai **Langflow v1.12.2** (Docker, `http://localhost:7860`) sebagai flow engine.
Satu flow = satu agent; export JSON disimpan di `flows/<endpoint_name>.json`.
Setiap flow diberi **Endpoint Name** supaya terekspos sebagai MCP tool.

## Alternatives

- **n8n** — lebih umum untuk automation, tapi integrasi MCP tool-per-flow tidak se-native;
  fokusnya workflow automation, bukan LLM agent building.
- **Dify** — kuat untuk app RAG/chatbot, tapi unit-nya "application", bukan modular
  tool-per-agent yang bisa dipanggil independen via MCP.
- **Custom Python (LangChain/direct API)** — kontrol penuh, tapi tanpa editor visual;
  iterasi prompt jadi lambat dan tidak ada artifact portable untuk hackathon demo.

## Consequences

- (+) Editor visual → iterasi prompt cepat; demo hackathon mudah (screenshot Playground).
- (+) Langflow 1.12 native expose flow sebagai MCP tool via Endpoint Name.
- (+) Flow export = JSON → masuk git, diff-able, versioned per commit `feat(flow):`.
- (−) Format JSON berubah antar versi Langflow (terbukti: rebuild untuk 1.12,
  commit `97ac0f8`) → mitigasi: `scripts/verify-flow.sh` + field `last_tested_version`.
- (−) File flow besar (71 KB) → mitigasi: doc per flow + skema output (audit P2-1).
