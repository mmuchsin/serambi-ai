# ADR-0004: LLM providers — longcat-2.5 via NaraRouter (flows) + Claude (Bob)

**Status:** Accepted (2026-10-03)
**Deciders:** user (dev solo, IBM Hacktiv8)

## Context

Dua layer butuh LLM: (1) node LLM di dalam Langflow flows, (2) Bob TUI untuk
reasoning/tool-calling. Keduanya bisa beda provider tanpa memengaruhi kontrak MCP.

## Decision

- **Langflow flows:** `longcat-2.5` via **NaraRouter** (`https://router.bynara.id/v1`,
  OpenAI-compatible endpoint).
- **Bob TUI:** Claude 3.7 Sonnet (ditangani IBM Bob, tidak dikonfigurasi di repo).

Pemisahan ini disengaja: kualitas tool-calling reasoning (Bob) dan biaya/latensi
pengerjaan flow (Langflow) adalah kebutuhan berbeda.

## Alternatives

- **Satu provider untuk keduanya (mis. semua via NaraRouter)** — menyederhanakan
  konfigurasi, tapi Bob adalah harness IBM dengan model bawaan; memaksa provider sama
  berarti konfigurasi di luar repo yang tidak terdokumentasi.
- **Model lokal (ollama)** — gratis & private, tapi kualitas instruksi-following untuk
  pedagogical constraints (graduated hinting, anti-cognitive-offloading) lebih rendah;
  waktu setup lebih panjang untuk deadline hackathon.
- **OpenAI API direct** — kualitas baik, tapi butuh akun/billing terpisah; NaraRouter
  sudah tersedia di lingkungan kerja.

## Consequences

- (+) Flow bisa diganti model hanya dengan edit node LLM di Langflow (tanpa commit).
- (+) Bob tetap harness standar IBM — reproducible untuk reviewer hackathon.
- (−) Dependensi eksternal: NaraRouter availability → jika down, flow tidak bisa e2e;
  `scripts/verify-e2e.sh` akan gagal dengan pesan endpoint/auth yang jelas.
- (−) Output LLM non-deterministic → verifikasi perilaku agent tetap manual-review
  (pedagogical constraints), script hanya memverifikasi plumbing.
