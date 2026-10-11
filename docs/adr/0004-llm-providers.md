# ADR-0004: LLM providers — OpenAI-compatible endpoint (flows) + Claude (Bob)

**Status:** Accepted (2026-10-03)
**Deciders:** user (dev solo, IBM Hacktiv8)

## Context

Dua layer butuh LLM: (1) node LLM di dalam Langflow flows, (2) Bob TUI untuk
reasoning/tool-calling. Keduanya bisa beda provider tanpa memengaruhi kontrak MCP.

## Decision

- **Langflow flows:** satu endpoint LLM **OpenAI-compatible** (base URL, nama model, dan
  API key diisi per lingkungan di node LLM di Langflow, tidak dikomit ke repo).
  Contoh deployment saat ini: `longcat-2.5` di sebuah router yang mengekspos
  `https://router.bynara.id/v1` dengan format OpenAI.
- **Bob TUI:** Claude 3.7 Sonnet (ditangani IBM Bob, tidak dikonfigurasi di repo).

Pemisahan ini disengaja: kualitas tool-calling reasoning (Bob) dan biaya/latensi
pengerjaan flow (Langflow) adalah kebutuhan berbeda. Karena kontraknya
OpenAI-compatible, siapa pun bisa menjalankan repo ini dengan provider lain
(proxy lokal, gateway kantor, atau API langsung) tanpa mengubah flow, prompt, atau
kontrak MCP.

## Alternatives

- **Satu provider untuk keduanya** — menyederhanakan konfigurasi, tapi Bob adalah
  harness IBM dengan model bawaan; memaksa provider sama berarti konfigurasi di
  luar repo yang tidak terdokumentasi.
- **Model lokal (ollama)** — gratis & private, tapi kualitas instruksi-following untuk
  pedagogical constraints (graduated hinting, anti-cognitive-offloading) lebih rendah;
  waktu setup lebih panjang untuk deadline hackathon.
- **OpenAI API direct** — kualitas baik, tapi butuh akun/billing terpisah; di
  lingkungan pengembangan repo ini sudah tersedia endpoint OpenAI-compatible.

## Consequences

- (+) Flow bisa diganti model hanya dengan edit node LLM di Langflow (tanpa commit).
- (+) Bob tetap harness standar IBM — reproducible untuk reviewer hackathon.
- (−) Dependensi eksternal: availability endpoint LLM → jika down, flow tidak bisa e2e;
  `scripts/verify-e2e.sh` akan gagal dengan pesan endpoint/auth yang jelas.
- (−) Nilai base URL, model, dan API key hidup di luar repo (environment), sehingga
  reviewer perlu mengisinya sendiri sebelum menjalankan e2e.
- (−) Output LLM non-deterministic → verifikasi perilaku agent tetap manual-review
  (pedagogical constraints), script hanya memverifikasi plumbing.
