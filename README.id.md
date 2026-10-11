# Serambi.ai

Asisten belajar multi-agent yang adaptif untuk profesional Indonesia yang ingin pindah karier.

Pengguna menuliskan tujuan karier ("jadi data analyst dalam 3 bulan") dan Serambi.ai menyusun roadmap mingguan, lalu mendampingi eksekusinya: konsep dijelaskan ala Feynman, kuis adaptif dengan bertahap, review memakai spaced repetition, dan check-in untuk mendeteksi burnout. Antarmuka percakapan berbahasa Indonesia.

[Apa yang dilakukan](#apa-yang-dilakukan) · [Masalah dan peluang](#masalah-dan-peluang) · [Cara kerja](#cara-kerja) · [Arsitektur](#arsitektur) · [Agent](#agent) · [Instalasi](#instalasi) · [Penggunaan](#penggunaan) · [Model bisnis](#model-bisnis) · [Guardrail](#guardrail) · [Roadmap](#roadmap) · [Struktur repo](#struktur-repo) · [Integrasi MCP](#integrasi-mcp) · [Skill agent](#skill-agent) · [Alat pengembangan](#alat-pengembangan) · [Maintainer](#maintainer) · [Lisensi](#lisensi)

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

> *Serambi* (bahasa Indonesia): beranda rumah, tempat pembicaraan dimulai.

## Apa yang dilakukan

Satu flow sudah jalan ujung ke ujung sampai hari ini: `goal_decomposer`. Pengguna menulis tujuan karier dalam bahasa natural dan menerima roadmap mingguan terstruktur dalam bahasa Indonesia, lengkap dengan milestone dan aksi pertama yang konkret.

```
$ Bantu saya buat roadmap belajar data analyst dalam 3 bulan
→ {
    "goal": "Data analyst",
    "deadline_weeks": 12,
    "milestones": [ ... ],
    "first_action": "..."
  }
```

Verifikasi:

```bash
bash scripts/verify-flow.sh    # exit 0: struktur flow valid
bash scripts/verify-e2e.sh     # exit 0 saat server Langflow hidup; exit 2 saat server mati
```

**Landasan riset.** Setiap keputusan desain mengikuti publikasi, bukan intuisi:

| Keputusan | Sumber |
|---|---|
| Pemetaan goal ke skill | GenMentor, 2025. [DOI 10.1145/3701716.3715244](https://doi.org/10.1145/3701716.3715244) |
| Teknik Feynman, learning gains dibanding membaca pasif | Feynman Bot, IEEE TALE 2024. [arXiv 2506.09055](https://arxiv.org/abs/2506.09055) |
| Spaced repetition dari forgetting-curve model | Zaidi et al., AIED 2020. [arXiv 2004.11327](https://arxiv.org/abs/2004.11327) |
| Memandu, bukan menjawab (anti-offloading) | Fan et al., British Journal of Educational Technology 56(2), 2024. [DOI 10.1111/bjet.13544](https://doi.org/10.1111/bjet.13544), sitasi 700+ |
| Arsitektur multi-agent: satu learner model, agent terspesialisasi | IntelliCode (multi-agent tutoring) |

Rumusan lengkapnya ada di folder [`research/`](research/).

## Masalah dan peluang

Career switcher Indonesia adalah orang dewasa yang sudah kerja: staf administrasi pindah ke data analisis, guru pindah ke backend. Mereka belajar malam, anggarannya terbatas, bahasanya Bahasa Indonesia, dan tidak bisa menjawab "minggu ini belajar apa" dari katalog kursus.

Tiga celah, urut dari yang paling merugikan:

1. **Platform belajar berangkat dari kurikulum, bukan dari tujuan.** Dicoding, Ruangguru, dan Zenius sama-sama mengelompokkan berdasarkan mata pelajaran. Tidak ada yang menerima "saya ingin jadi data analyst dalam 6 bulan" lalu mengembalikan rencana per minggu.
2. **Tutor AI umum berperan sebagai oracle, dan itu justru masalahnya.** ChatGPT menjawab. Temuan metacognitive laziness di BJET ([DOI 10.1111/bjet.13544](https://doi.org/10.1111/bjet.13544), sitasi 700+) menunjukkan biayanya: ketika model berpikir untuk pengguna, pengguna menyerap lebih sedikit.
3. **Pasar upskilling tumbuh, tapi hampir seluruhnya korporasi.** Angka global 11–14% CAGR terkonsentrasi di program B2B dan korporat. Individu dewasa yang pindah karier terjepit di antara keduanya.

Analisis kompetitor lengkap, 11 kompetitor: [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md).

## Cara kerja

Enam agent, masing-masing sebuah Langflow flow independen yang diekspos sebagai MCP tool bernama.

```
Pengguna menulis tujuan
      │
      ▼
┌──────────────────────┐
│ 1. Goal Agent       │  goal → roadmap mingguan + aksi pertama
└──────────────────────┘
      │
      ▼
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│ 2. Tutor Agent      │────▶│ 3. Assessment Agent │────▶│ 4. Progress Agent    │
│ gaya Feynman,       │     │ kuis adaptif +       │     │ spaced repetition    │
│ pertanyaan memancing │     │ hint bertahap        │     │ dari forgetting curve│
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘
                                                                    │
                            ┌──────────────────────┐               │
                            │ 5. Motivator Agent   │◀──────────────┘
                            │ nudge sesuai konteks │
                            └──────────────────────┘
                                                                    │
                            ┌──────────────────────┐               │
                            │ 6. Wellbeing Agent   │◀──────────────┘
                            │ deteksi burnout      │
                            └──────────────────────┘
```

Loop inilah produknya. Pengguna yang putus di minggu 4 tidak pernah sampai ke milestone berikutnya, jadi agent Progress, Motivator, dan Wellbeing seberat agent Tutor.

## Arsitektur

Satu kontrak MCP, dua pemakai. IBM Bob adalah development harness tempat setiap agent dibangun dan diverifikasi ujung ke ujung. Web app adalah antarmuka produksi, dan ia memakai MCP tool bernama yang sama.

![Diagram arsitektur sistem Serambi.ai](assets/diagrams/serambi-architecture.svg)

| Komponen | Peran |
|---|---|
| IBM Bob | Development harness. Reasoning, tool-calling, verifikasi agent. Bukan UI pengguna akhir |
| Web app (`apps/web`) | Antarmuka pengguna produksi, masih dikembangkan. Memakai MCP tool yang sama |
| MCP | Jembatan melalui streamable HTTP. Pemakai mana pun bisa memetakan flow Langflow ke named tool |
| IBM Langflow | Flow execution engine. Satu flow adalah satu agent terspesialisasi |
| LLM provider | Endpoint OpenAI-compatible, temperature 0.3, supaya output terstruktur tetap stabil |

## Agent

| Agent | Nama Tool | Status |
|-------|-----------|--------|
| Goal Agent | `goal_decomposer` | Live, terverifikasi e2e |
| Tutor Agent | `explain_concept` | Planned |
| Assessment Agent | `generate_quiz` | Planned |
| Progress Agent | `check_progress` | Planned |
| Motivator Agent | `send_reminder` | Planned |
| Wellbeing Agent | `check_wellbeing` | Planned |

Agent 1 adalah tracer bullet dan sudah terbukti ujung ke ujung. Agent 2 sampai 6 adalah stretch goal fase ini.

**Stage 2, setelah enam agent jalan:** lapisan retrieval di atas korpus riset proyek sendiri (`research/`), supaya agent Tutor dan Assessment menjelaskan, memberi hint, dan menyusun soal berdasarkan bukti yang sudah dikutip, bukan dari ingatan model. Scope dan alasannya di [`docs/PRD.md`](docs/PRD.md), tercatat sebagai ISS-12.

## Instalasi

### Prasyarat

| Kebutuhan | Versi |
|---|---|
| IBM Bob | v2.0+ |
| Langflow | v1.12+ (disarankan Docker) |
| Node.js | v20+ |
| Python | 3.11+ |
| `uvx` | `pip install uv` |

### 1. Clone dan konfigurasi

```bash
git clone https://github.com/mmuchsin/serambi-ai.git
cd serambi-ai
cp .env.example .env
# edit .env: isi LANGFLOW_API_KEY
```

### 2. Jalankan Langflow

```bash
docker run -p 7860:7860 langflowai/langflow:1.12.2
```

Buka http://localhost:7860, impor `flows/goal_decomposer.json`, lalu isi Endpoint Name dengan `goal_decomposer`.

### 3. Load API key

```bash
source ~/.bashrc   # atau: export LANGFLOW_API_KEY=<kunci-kamu>
```

### 4. Buka Bob di workspace ini

Bob memuat `.bob/mcp.json` saat start. Server `lf-serambi_ai` terhubung ke Langflow melalui streamable HTTP, dan setiap Langflow flow yang punya Endpoint Name langsung muncul sebagai named tool. Tidak ada setup tambahan.

## Penggunaan

Di Bob:

```
Bantu saya buat roadmap belajar data analyst dalam 3 bulan
```

Bob memanggil `goal_decomposer`, Langflow menjalankan flow, dan hasilnya roadmap 12 minggu: deadline dalam hitungan minggu, milestone dengan fokus dan deliverable, plus aksi pertama.

Untuk verifikasi tanpa server hidup:

```bash
bash scripts/verify-flow.sh
```

Kode exit: 0 berarti struktur flow valid. Exit 2 dari `verify-e2e.sh` berarti tidak ada server Langflow yang terjangkau, bukan berarti flow rusak.

Referensi konfigurasi: [`mcp/README.md`](mcp/README.md).

## Model bisnis

Proyek ini masuk kategori Education and Future of Work. Ia harus jalan sebagai bisnis, bukan hanya sebagai demo, dan struktur biaya produk LLM yang menentukan kelayakannya.

### Kenapa unit economics perlu diputuskan dari awal

Angka terbit menaruh gross margin produk AI di sekitar 45% pada 2025, naik ke awal 50an pada 2026, dibanding 60–80% untuk SaaS tradisional ([1752vc + ICONIQ, State of AI 2026](https://www.iconiqcapital.com/insights/2026-state-of-ai)). Biaya inferensi ikut bertambah seiring pemakaian, jadi margin harus dikelola per pengguna dan diasumsikan naik begitu saja. Biaya per pengguna Serambi.ai satu kali dekomposisi per goal, ditambah panggilan review dan kuis, sehingga bagian roadmap singkat (satu siklus prompt) sementara bagian loop panjang. Rencana pricing usage-based atau hybrid sejak awal, dan North Star metric tetap dipatok pada kemajuan belajar daripada pendapatan, karena pendapatan menyusul beberapa bulan setelahnya.

### Kesediaan membayar

Pembanding konsumen terdekat adalah Astra AI di Rp 115.000 per bulan ([App Store ID](https://apps.apple.com/id/app/id6751030141)) untuk persiapan ujian sekolah. Pindah karier punya kesediaan membayar lebih tinggi daripada persiapan ujian: pembelinya membeli outcome, yaitu pekerjaan, bukan nilai ujian. Serambi.ai tidak mengejar harga segitu, tapi menjual outcome.

### Jalur pendapatan, urut dari yang tercepat menghasilkan

| Jalur | Siapa membayar | Ukuran pasar | Catatan |
|---|---|---|---|
| B2B white-label | Bootcamp, kampus, program reskilling Komdigi | Ribuan pengguna per institusi, biaya per pengguna rendah | Paling cepat menghasilkan. Flow sudah jalan di balik MCP endpoint |
| Lisensi institusional | Sekolah vokasi dan universitas | Berulang per angkatan | Perlu kerja multi-tenant di Langflow |
| Langganan konsumen | Individu career switcher | Pasar terbesar, paling kompetitif | Astra AI sudah menempati rentang harga ini |

Data forgetting curve anonim lintas pengguna jadi aset yang sulit ditiru: jadwal review agregat adalah moat-nya, sedangkan materi sumbernya tidak masuk produk.

Dokumen bisnis: [`docs/business/north-star.md`](docs/business/north-star.md) · [`docs/business/value-proposition.md`](docs/business/value-proposition.md) · [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md)

## Guardrail

Dua jenis berlaku: pedagogi dan operasional.

**Pedagogi, dari riset:**

| Batasan | Efeknya |
|---|---|
| Memandu, bukan memberi jawaban | Agent memandu, tidak menjawab seketika. Pengguna yang macet menerima hint terkecil yang berguna, bukan solusi |
| Hint bertahap | Hint naik level hanya setelah hint yang lebih kecil gagal |
| Pertanyaan pemancing | "Kenapa" dan "bagaimana" memperlihatkan kesenjangan lebih cepat daripada penjelasan |
| Tanpa cognitive offloading | Agent tidak berpikir untuk pengguna |
| Goal-first | Setiap respons menunjuk balik ke tujuan karier yang ditulis |

**Operasional:**

- Setiap flow bisa diverifikasi sendiri, dan `verify-flow.sh` dijalankan sebelum setiap commit.
- Output terstruktur dengan `temperature = 0.3` membuat dekomposisi cukup deterministik untuk diandalkan agent lain di hilirnya.
- Konfigurasi node mengikuti fungsi NIST AI Risk Management Framework (govern, map, measure, manage) pada level yang sesuai untuk prototipe.
- Konteks regulasi Indonesia tercatat di [`docs/`](docs/): Surat Edaran Etika AI Kominfo (2023) dan konsultasi publik Roadmap AI Nasional Komdigi (Agustus 2025). Serambi.ai menargetkan Indonesia lebih dulu.
- Korpus riset yang dipakai untuk grounding adalah materi proyek. Tidak ada data pengguna dan tidak ada konten berbayar di dalam retrieval set.

## Roadmap

### Sudah selesai

- Flow `goal_decomposer`, terverifikasi ujung ke ujung melalui Bob, MCP, dan Langflow
- Skrip verifikasi dengan kode exit yang eksplisit
- Lima ADR yang mengunci arsitektur
- Analisis kompetitor (11 kompetitor), value proposition, dan North Star metric
- Pitch deck 11 slide, dengan speaker notes

### Stage 1, sisa

- Agent 2, `explain_concept`: tutor gaya Feynman dengan pertanyaan pemancing
- Agent 3, `generate_quiz`: kuis adaptif dengan hint bertahap
- UI web app di [`apps/web`](apps/web) yang memakai MCP tool yang sama
- Demo video 2 sampai 3 menit

### Stage 2

- Agent 4 sampai 6: Progress, Motivator, Wellbeing
- Lapisan retrieval di atas `research/` untuk agent Tutor dan Assessment (ISS-12)
- Integrasi B2B white-label dengan satu bootcamp atau kampus
- Pelacakan pemakaian terhadap North Star metric: Career Goal Progress Rate, target 15% per minggu per pengguna aktif

Kalender hackathon (IBM SkillsBuild University Education National Hackathon, Hacktiv8 × IBM × Komdigi):

| Tanggal | Milestone |
|---|---|
| 4 Okt 2026 | Deadline submission Stage 1, diperpanjang panitia ke 11 Okt 2026 |
| 13 Okt 2026 | Pengumuman Top 25 semifinal |
| 14–31 Okt 2026 | Submission Stage 2 |
| 6 Nov 2026 | Pengumuman Top 7 final |
| 14 Nov 2026 | Final online dan awarding |
| Jan 2027 | IBM Day showcase |

## Struktur repo

```
serambi-ai/                          monorepo root
├── .bob/
│   ├── mcp.json                     Konfigurasi MCP server (lf-serambi_ai)
│   ├── settings.json                Hook turn-counter, disiplin sesi
│   └── skills/                      83 agent skill
├── flows/                          Ekspor flow Langflow
├── agents/                         Konfigurasi agent dan system prompt
├── apps/web/                       Web frontend, antarmuka pengguna target
├── packages/                       Shared library
├── docs/
│   ├── PRD.md                      Product requirement, termasuk RAG Stage 2
│   ├── ISSUES.md                   Issue tracker, ISS-01 sampai ISS-12
│   ├── business/                   Analisis kompetitor, north-star, value proposition
│   └── adr/                        Architecture decision record 0001–0005
├── mcp/README.md                   Detail integrasi MCP
├── research/                       Paper dan abstrak (multi-agent tutoring, feedback loop)
├── scripts/                        verify-flow.sh, verify-e2e.sh
├── slides/                         Pitch deck v2, 11 slide plus speaker notes
├── submission/                     Screenshot untuk form submission
└── assets/
    ├── screenshots/                Demo screenshot 01–04
    └── diagrams/                   Diagram arsitektur, termasuk source HTML
```

## Integrasi MCP

Bob terhubung ke Langflow melalui mcp-proxy dengan streamable HTTP. Konfigurasi di [`.bob/mcp.json`](.bob/mcp.json); API key dibaca dari environment dan tidak pernah masuk repo. Setiap Langflow flow yang punya Endpoint Name langsung menjadi tool yang bisa dipanggil, sehingga `mcp__lf-serambi_ai__goal_decomposer` merujuk ke flow yang hidup. Detail dan troubleshooting: [`mcp/README.md`](mcp/README.md).

## Skill agent

Proyek ini berjalan di dalam IBM Bob dan memakai skill yang dimuat sesuai permintaan dengan `$nama-skill`.

| Skill | Tujuan |
|---|---|
| `diagram-design` | Diagram arsitektur, flow, journey, dan grafik sebagai HTML/SVG |
| `pitch-deck` | Struktur pitch deck 11 slide (custom skill proyek ini) |
| `value-proposition` | Templat Jobs-to-be-Done |
| `north-star` | North Star metric dan input metric |
| `competitive-analysis` | Pemetaan kompetitor dan diferensiasi |
| `business-model` | Penyusunan model bisnis berbasis canvas |
| `plan-launch` | Go-to-market dan beachhead segment |
| `ai-engineering-workflow` | Workflow engineering tujuh fase |
| `ai-coding-best-practices` | Deep module, TDD, feedback loop |

Seluruhnya 83 skill. Sumber: [phuryn/pm-skills](https://github.com/phuryn/pm-skills), [mattpocock/skills](https://github.com/mattpocock/skills), dan custom skill proyek, semuanya ada di [`.bob/skills/`](.bob/skills/).

## Alat pengembangan

Bob menangani orkestrasi agent, MCP tool-calling, dan verifikasi flow. Dua tugas di luar cakupannya:

| Alat | Tujuan |
|---|---|
| [pi agent](https://pi.dev/) dengan [feynman extension](https://pi.dev/packages/@companion-ai/feynman) | Riset akademik dan pencarian paper |
| Qwen3.8-27B | Reasoning riset |
| Qwen-Image-2.1 | Aset gambar untuk slide dan diagram |

## Maintainer

**M. Muchsin**, [github.com/mmuchsin](https://github.com/mmuchsin)

## Lisensi

Apache 2.0 © 2026 Serambi.ai Contributors. Lihat [LICENSE](LICENSE).
