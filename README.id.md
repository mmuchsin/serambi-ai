# Serambi.ai — Asisten Belajar Multi-Agent yang Adaptif

> *Serambi* — ruang terbuka di depan rumah: tempat yang nyaman untuk memulai belajar.

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

---

## Apa Itu Serambi.ai

Serambi.ai adalah sistem tutoring AI adaptif untuk career switcher Indonesia. Ceritakan tujuanmu ("jadi data analyst dalam 3 bulan") dan Serambi.ai akan membuatkan roadmap mingguan yang personal, menjelaskan konsep dengan teknik Feynman, memberikan kuis dengan petunjuk bertahap, dan melacak progresmu menggunakan spaced repetition — semuanya melalui antarmuka percakapan yang ditenagai IBM Bob.

**Didukung riset ilmiah:**
- 📚 Goal-to-skill mapping (GenMentor, FWCI 47.3)
- 🧠 Teknik Feynman + Protégé Effect (80%+ lebih efektif dari membaca pasif)
- 🔁 Spaced repetition adaptif (meningkatkan retensi 15-20% vs jadwal tetap)
- 🚫 Anti-cognitive-offloading: AI membimbing, bukan menjawab langsung (BJET, cited 694)

---

## Arsitektur

```
Pengguna (bahasa natural)
    │
    ▼
Bob (IBM AI agent harness) ── reasoning + tool-calling
    │  panggilan MCP (by tool name)
    ▼
Langflow (SSE MCP endpoint) ── mesin eksekusi flow
    │
    ▼
longcat-2.5 via NaraRouter ── LLM provider
```

| Layer | Peran |
|-------|-------|
| **Bob** | AI agent harness — percakapan, reasoning, dispatch tool MCP |
| **MCP** | Jembatan — Bob memanggil Langflow flows sebagai named tools |
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
git clone https://github.com/<your-org>/sla-ibm-hackathon.git
cd sla-ibm-hackathon
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

### 4. Buka Bob di workspace ini

Bob otomatis membaca `.bob/mcp.json` — server MCP `lf-lsa_ibm_hackathon` langsung terhubung ke Langflow. Tidak perlu setup tambahan.

### 5. Coba sekarang

Di Bob, ketik:

```
Bantu saya buat roadmap belajar data analyst dalam 3 bulan
```

Bob akan memanggil tool `goal_decomposer` dan mengembalikan roadmap 12 minggu terstruktur dari Langflow.

---

## Struktur Repository

```
sla-ibm-hackathon/          monorepo root
├── .bob/
│   ├── mcp.json            Konfigurasi MCP server
│   └── skills/             43 PM skills (pm-skills + custom pitch-deck)
├── flows/                  Export flow Langflow
├── agents/                 Konfigurasi agent / system prompt
├── apps/web/               Future: frontend web
├── packages/               Future: shared library
├── mcp/README.md           Detail integrasi MCP
├── docs/
│   ├── PRD.md
│   ├── ISSUES.md
│   └── research-papers-and-abstracts.md
├── slides/                 Pitch deck
└── assets/screenshots/     Screenshot demo
```

---

## Integrasi MCP

Lihat [`mcp/README.md`](mcp/README.md) untuk detail bagaimana Bob terhubung ke Langflow via Model Context Protocol.

---

## Lisensi

MIT © 2026 Tim Serambi.ai

---

*Also available in: [English](README.md)*
