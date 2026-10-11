# Serambi.ai — Asisten Belajar Multi-Agent yang Adaptif

> *Serambi* — ruang terbuka di depan rumah: tempat yang nyaman untuk memulai belajar.

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

---

## Apa Itu Serambi.ai

Serambi.ai adalah sistem tutoring AI adaptif untuk career switcher Indonesia. Ceritakan tujuanmu ("jadi data analyst dalam 3 bulan") dan Serambi.ai akan membuatkan roadmap mingguan yang personal, menjelaskan konsep dengan teknik Feynman, memberikan kuis dengan petunjuk bertahap, dan melacak progresmu menggunakan spaced repetition — semuanya melalui antarmuka percakapan yang ditenagai IBM Bob.

**Didukung riset ilmiah:**
- 📚 Goal-to-skill mapping (GenMentor, 2025 — DOI 10.1145/3701716.3715244)
- 🧠 Teknik Feynman + Protégé Effect — learning gains vs passive learners (Feynman Bot, IEEE TALE 2024 — arXiv 2506.09055)
- 🔁 Spaced repetition adaptif via forgetting-curve model (Zaidi et al., AIED 2020 — arXiv 2004.11327)
- 🚫 Anti-cognitive-offloading: AI membimbing, bukan menjawab langsung (Fan et al., BJET 2024 — cited 700+)

**Sudah terverifikasi live hari ini:** `goal_decomposer` — sebutkan tujuan karier, dapat roadmap mingguan dalam Bahasa Indonesia. Flow terverifikasi end-to-end (`bash scripts/verify-flow.sh` → exit 0); round-trip MCP live terverifikasi saat server Langflow menyala (`bash scripts/verify-e2e.sh`).

---

## Kenapa Ini Berbeda (posisi kompetitif)

AI tutor di Indonesia kuat di **ujian sekolah**, platform lokal kuat di **kurikulum tetap** — tidak ada yang mulai dari **goal karier**.

| Lanskap | Mulai dari | Bahasa Indonesia | Adaptif ke goal karier |
|---------|-----------|:----------------:|:----------------------:|
| Dicoding (1,3 juta dev, 843 ribu aktif) | Katalog kursus | ✅ | ❌ jalur tetap |
| Ruangguru / Zenius | Kurikulum sekolah | ✅ | ❌ |
| Astra AI (15,2 juta pelajar, Rp 115rb/bln) | Catatan & ujian sekolah | ✅ | ❌ |
| Boot.dev / DataCamp | Kurikulum tetap | ❌ | ❌ |
| ChatGPT | Apa pun yang kamu tanya | ⚠️ | ❌ oracle — justru merusak retensi |
| **Serambi.ai** | **Goal karier kamu** | ✅ | ✅ roadmap mingguan dari bahasa natural |

Dua keunggulan struktural: (1) **scaffold, bukan oracle** — AI menolak menyerahkan jawaban langsung (Boots di Boot.dev dan Solver Mode di Astra akhirnya menyerah; Astra malah menawarkan mode Socratic *dan* Solver sekaligus); (2) **agent modular via MCP** — setiap agent adalah flow independen, sehingga lapisan adaptif bisa white-label di dalam platform existing (bootcamp, kampus, Komdigi).

Analisis lengkap: [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md) (11 kompetitor, battlecard, positioning map) · metrik: [`docs/business/north-star.md`](docs/business/north-star.md) · positioning: [`docs/business/value-proposition.md`](docs/business/value-proposition.md)

```
┌── Development (now) ────────┐   ┌── Production (target) ──────┐
Bob TUI = agent harness       │   Pengguna                  │
    │ bahasa natural           │   │ bahasa natural             │
    ▼                          │   ▼                           ▼
Bob — reasoning + tool-calling ┐   Web App Backend — orkestrasi
    │  panggilan MCP (by tool name)│   │  panggilan MCP (named tools yang sama)
    └──────────────┬───────────┘       │
                   └──── kontrak MCP yang sama ─┘
                   ▼
Langflow (SSE MCP endpoint) ── mesin eksekusi flow
                   │
                   ▼
longcat-2.5 via NaraRouter ── LLM provider
```

Bob TUI adalah **harness pengembangan** (build/test/verifikasi agent), bukan
antarmuka pengguna akhir. Web app (`apps/`) adalah UI pengguna akhir dan
memanggil MCP tool yang sama — tanpa mengubah Langflow.

| Layer | Peran |
|-------|-------|
| **Web App** | UI pengguna akhir (`apps/web`, dalam pengembangan) — memanggil MCP tool yang sama |
| **Bob** | AI agent harness — **pengembangan**: reasoning, tool-calling, verifikasi agent |
| **MCP** | Jembatan — pemanggil apa pun (Bob atau backend web) memanggil Langflow flows sebagai named tools |
| **Langflow** | Mesin eksekusi flow — setiap flow = satu agent spesialis |

---

## Agent

| Agent | Nama Tool | Status |
|-------|-----------|--------|
| Goal Agent | `goal_decomposer` | ✅ Live |
| Tutor Agent | `explain_concept` | 🔜 Planned |
| Assessment Agent | `generate_quiz` | 🔜 Planned |
| Progress Agent | `check_progress` | 🔜 Planned |
| Motivator Agent | `send_reminder` | 🔜 Planned |
| Wellbeing Agent | `check_wellbeing` | 🔜 Planned |

---

## Cara Mulai

### Prasyarat

- [IBM Bob](https://www.ibm.com/products/bob) v2.0+
- [Langflow](https://langflow.org) v1.12+ (disarankan via Docker)
- Node.js v20+, Python 3.11+, `uvx` (`pip install uv`)

### 1. Clone & konfigurasi

```bash
git clone https://github.com/mmuchsin/serambi-ai.git
cd serambi-ai
cp .env.example .env
# Edit .env: isi LANGFLOW_API_KEY
```

### 2. Jalankan Langflow

```bash
docker run -p 7860:7860 langflowai/langflow:1.12.2
```

Buka http://localhost:7860, import `flows/goal_decomposer.json`, lalu set **Endpoint Name**-nya menjadi `goal_decomposer`.

### 3. Load API key

```bash
source ~/.bashrc   # atau: export LANGFLOW_API_KEY=<api-key-kamu>
```

### 4. Buka Bob di workspace ini  *(verifikasi pengembangan)*

Bob otomatis membaca `.bob/mcp.json` — server MCP `lf-serambi_ai` langsung terhubung ke Langflow. Tidak perlu setup tambahan. Ini *harness pengembangan*: setiap agent diverifikasi sebagai named MCP tool di sini sebelum dikonsumsi web app.

### 5. Coba sekarang

Di Bob, ketik:

```
Bantu saya buat roadmap belajar data analyst dalam 3 bulan
```

Bob akan memanggil tool `goal_decomposer` dan mengembalikan roadmap 12 minggu terstruktur dari Langflow.

---

## Struktur Repository

```
serambi-ai/                monorepo root
├── .bob/
│   ├── mcp.json            Konfigurasi MCP server
│   └── skills/             83 agent skills (PM + engineering + diagram + custom pitch-deck)
├── flows/                  Export flow Langflow
├── agents/                 Konfigurasi agent / system prompt
├── apps/web/               Future: frontend web (target UI pengguna akhir)
├── packages/               Future: shared library
├── mcp/README.md           Detail integrasi MCP
├── docs/
│   ├── PRD.md
│   ├── ISSUES.md
│   ├── business/           Competitive analysis, north-star, value proposition
│   └── adr/                ADR 0001–0005
├── research/               Riset: papers (multi-agent tutoring, feedback loop)
│   ├── research-papers-and-abstracts.md
│   └── feedback-loop-papers-additional.md
├── slides/                 Pitch deck (deck v2 native 11 slides + PDF di `projects/serambi-pitch-deck-v2_20261004/exports/`)
└── assets/screenshots/     Screenshot demo (01–04: UI, Langflow workflow, endpoint, output)
```

---

## Integrasi MCP

Lihat [`mcp/README.md`](mcp/README.md) untuk detail bagaimana Bob terhubung ke Langflow via Model Context Protocol.

---

## Alat Pengembangan

**Bob** menangani orkestrasi agent, tool-calling MCP, dan verifikasi flow Langflow. Untuk tugas yang tidak dicover Bob — riset dan generation aset gambar — proyek ini juga menggunakan:

| Tool | Tujuan | Model / Sumber |
|------|---------|----------------|
| [pi agent](https://pi.dev/) + [feynman extension](https://pi.dev/packages/@companion-ai/feynman) | Riset akademik, pencarian paper, literature grounding | — |
| Qwen3.8-27B-UD-Q6_K_XL | Reasoning riset | [unsloth/Qwen3.8-27B-GGUF](https://huggingface.co/unsloth/Qwen3.8-27B-GGUF) |
| Qwen-Image-2.1 | Generation aset gambar (slides, diagram, ilustrasi) | [unsloth/Qwen-Image-2.1](https://huggingface.co/unsloth/Qwen-Image-2.1) |

---

## Lisensi

Apache 2.0 © 2026 Tim Serambi.ai

---

*Also available in: [English](README.md)*
