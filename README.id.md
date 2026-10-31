# Serambi.ai

**Literasi AI untuk profesional non-teknis di Indonesia.**

Serambi.ai membantu guru, pemilik usaha kecil, akuntan, dokter, staf administrasi, dan profesional non-teknis lainnya belajar AI dengan cara yang sesuai pekerjaan, hobi, dan jam kosong mereka.

- **Input:** profesi, hobi, dan jam kosong.
- **Target keluaran:** rencana belajar 6 minggu dengan sesi 10 sampai 30 menit, contoh dari pekerjaan pengguna, dan analogi dari hobinya.
- **Fitur aplikasi (rencana):** spaced repetition (hari 1, 3, 7, 14, 30), latihan singkat, dan pendamping "Tanya AI".

[English](README.md) · [Prototipe live](https://serambi-ai.netlify.app) · [Dokumentasi](docs/README.md)

**IBM SkillsBuild University Education National Hackathon** · Hacktiv8 × IBM × Komdigi

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)

> *Serambi* adalah bagian depan rumah, tempat percakapan dimulai.

> Dokumen ini adalah terjemahan dari [`README.md`](README.md), yang menjadi acuan utama.

## Status proyek

Baca bagian ini lebih dulu agar jelas apa yang sudah ada.

| Komponen | Status |
|---|---|
| Flow Langflow `goal_decomposer` (Goal Agent) | Ada di repo. Pernah diverifikasi ujung ke ujung. Saat ini keluarannya roadmap **12 minggu**; target produk **6 minggu** (ISS-25) |
| Prototipe statis (`apps/prototype/`) | Live di Netlify. Mockup UI dengan data contoh: tanpa akun, database, atau backend, dan belum terhubung ke flow |
| Penyedia LLM | Flow berjalan di endpoint **OpenAI-compatible**. IBM watsonx adalah penyedia yang dituju dan **belum pernah** dijalankan |
| Agent Scheduler, Nuxt 4 PWA, backend Nitro, database | Pekerjaan lanjutan |

## Yang dilakukan flow saat ini

`goal_decomposer` menerima profil singkat dan mengembalikan roadmap terstruktur dalam bahasa Indonesia.

```json
// Input
{
  "profession": "guru",
  "hobbies": ["membaca", "fotografi"],
  "level": "pemula",
  "weekly_hours": 5
}

// Output (diringkas)
{
  "profession": "guru",
  "level": "pemula",
  "weekly_hours": 5,
  "roadmap": [
    {
      "week": "1-2",
      "theme": "Dasar AI & Prompt Engineering untuk Guru",
      "objectives": ["Memahami LLM", "Membuat prompt efektif untuk tugas guru"],
      "key_concepts": ["LLM", "Prompt Engineering", "Zero-shot vs Few-shot"],
      "practice": "Buat 5 prompt untuk: rencana pelajaran, soal ujian, surat orang tua, feedback siswa, newsletter kelas",
      "resources": [
        {"title": "Panduan Prompt Engineering untuk Pendidik", "url": "https://belajar.kemdikbud.go.id/...", "type": "official"}
      ],
      "estimated_hours": 5
    }
    // ... milestone berikutnya
  ]
}
```

Verifikasi:

```bash
bash scripts/verify-flow.sh    # exit 0: struktur flow valid
bash scripts/verify-e2e.sh     # exit 0 saat Langflow hidup; exit 2 saat server tidak terjangkau
```

Exit 2 dari `verify-e2e.sh` berarti tidak ada server Langflow yang terjangkau. Itu tidak berarti flow rusak.

## Masalah dan peluang

Indonesia membutuhkan sekitar 9 juta talenta digital sampai 2030, dan sekitar sepertiganya yang terpenuhi saat ini (Komdigi). Indonesia termasuk pengguna AI yang besar, tetapi jauh tertinggal dalam membangun AI. Dalam riset AWS yang terbit Agustus 2025, 57% pelaku usaha di Indonesia menyebut kurangnya keterampilan digital sebagai salah satu hambatan utama pertumbuhan.

Survei terbaru menunjukkan celah yang sama dari sisi pekerja:

- Dari pekerja berbasis pengetahuan di Indonesia yang disurvei Salesforce/YouGov (April 2026, 1.002 responden), 37% ingin tahu keterampilan AI apa yang perlu dikembangkan, dan hanya 33% yang dilatih perusahaannya memakai agen AI.
- AWS (Agustus 2025) melaporkan 21% usaha menilai tenaga kerjanya siap, sementara 48% pekerjaan membutuhkan literasi AI.
- Brief ILO (Juli 2026) memperkirakan 21,7% pekerja Indonesia berada di okupasi yang terpapar AI generatif. Brief yang sama mencatat belum ada disrupsi besar yang terlihat.

Tiga celah yang disasar Serambi.ai:

1. **Kursus berangkat dari kurikulum, bukan dari profesi.** Kebanyakan kursus AI bersifat teknis (coding, ML). Profesional non-teknis membutuhkan AI untuk pekerjaannya sendiri: guru membuat latihan soal, pemilik toko menulis materi pemasaran, eksportir membaca dokumen berbahasa asing.
2. **Asisten AI umum berperan sebagai oracle.** Ia langsung menjawab, sehingga pengguna lebih sedikit berpikir. Fan dkk. (BJET, 2024) menyebut gejala ini *metacognitive laziness*.
3. **Produk reskilling kebanyakan melayani perusahaan.** Individu yang ingin belajar AI sendiri punya sedikit pilihan yang dirancang untuknya.

Analisis kompetitor (12 produk): [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md).

## Cara kerja

Setiap agent adalah satu flow Langflow yang diekspos sebagai satu MCP tool bernama. Spaced repetition, latihan, dan Tanya AI adalah fitur aplikasi, bukan agent terpisah.

| # | Agent | MCP tool | Fungsi | Status |
|---|---|---|---|---|
| 1 | **Goal Agent** | `goal_decomposer` | Profesi, hobi, dan jadwal → rencana belajar dengan sumber kredibel | Ada di repo (saat ini 12 minggu, target 6 minggu) |
| 2 | **Scheduler** | belum dinamai | Jadwal belajar adaptif dari jam kosong atau Google Calendar | Rencana (ISS-26) |

Ide lanjutan di luar prototipe: `explain_concept` dan `generate_quiz` (draf spesifikasi di [`agents/`](agents/)), `check_progress`, `send_reminder`, `check_wellbeing`.

## Arsitektur

Satu kontrak MCP, dua pemanggil. IBM Bob, sebagai coding agent harness, membangun dan memverifikasi flow Langflow. Pada arsitektur target, backend Nuxt Nitro memanggil MCP server yang sama sebagai MCP client.

![Arsitektur sistem Serambi.ai](assets/diagrams/serambi-architecture.svg)

| Komponen | Peran | Status |
|---|---|---|
| **IBM Bob** | Coding agent harness. Membangun dan memverifikasi agent. Bukan antarmuka pengguna | Dipakai |
| **Langflow MCP server** | Flow engine. Satu flow adalah satu MCP tool bernama, lewat streamable HTTP melalui `mcp-proxy` | Ada di repo (`goal_decomposer`) |
| **Penyedia LLM** | Target: IBM watsonx. Saat ini: endpoint OpenAI-compatible, temperature 0.3 | watsonx belum dijalankan |
| **Prototipe statis** (`apps/prototype/`) | Mockup UI di Netlify dengan data contoh | Live |
| **Frontend Nuxt 4 PWA** (`apps/web`) | Antarmuka pengguna akhir | Pekerjaan lanjutan (baru scaffold) |
| **Backend Nuxt Nitro** | API dan MCP client yang memanggil tool Langflow | Pekerjaan lanjutan |
| **Database** | SQLite/libSQL atau Postgres | Pekerjaan lanjutan, belum diputuskan |

Catatan keputusan: [`docs/adr/`](docs/adr/README.md).

## Landasan riset

| Keputusan | Sumber |
|---|---|
| Pemetaan tujuan ke keterampilan dan jalur belajar yang efisien | GenMentor, 2025. [DOI 10.1145/3701716.3715244](https://doi.org/10.1145/3701716.3715244) |
| Teknik Feynman dibanding membaca pasif | Feynman Bot, IEEE TALE 2024. [arXiv 2506.09055](https://arxiv.org/abs/2506.09055) |
| Spaced repetition dari model kurva lupa | Zaidi dkk., AIED 2020. [arXiv 2004.11327](https://arxiv.org/abs/2004.11327) |
| Memandu, bukan menjawab (menghindari cognitive offloading) | Fan dkk., BJET 56(2), 2024. [DOI 10.1111/bjet.13544](https://doi.org/10.1111/bjet.13544) |
| Tutor multi-agent dengan satu model pembelajar | IntelliCode |

Catatan dan abstrak: [`research/`](research/).

## Memulai

### Prasyarat

| Kebutuhan | Versi | Kegunaan |
|---|---|---|
| IBM Bob | v2.0+ | Menjalankan agent lewat MCP |
| Langflow | v1.12+ | Flow engine (disarankan Docker) |
| Node.js | v20+ | Bob |
| Python | 3.11+ | Skrip bootstrap dan verifikasi |
| `uvx` | `pip install uv` | Bob menjalankan `mcp-proxy` |
| `jq`, `curl` | bebas | `scripts/*.sh` mem-parse JSON dan memanggil MCP |

### 1. Clone dan konfigurasi

```bash
git clone https://github.com/mmuchsin/serambi-ai.git
cd serambi-ai
cp .env.example .env
# Edit .env dan isi LANGFLOW_API_KEY
```

### 2. Jalankan Langflow

```bash
docker run -p 7860:7860 langflowai/langflow:1.12.2
```

Buka http://localhost:7860, impor `flows/goal_decomposer.json`, lalu isi Endpoint Name dengan `goal_decomposer`. Repo ini juga memuat sandbox juri di `compose.yaml`; komentar di bagian atasnya menjelaskan perintahnya.

### 3. Muat API key

```bash
source ~/.bashrc   # atau: export LANGFLOW_API_KEY=<kunci-anda>
```

### 4. Buka Bob

Bob memuat `.bob/mcp.json` saat start. Server `lf-serambi_ai` terhubung ke Langflow lewat streamable HTTP, dan setiap flow yang punya Endpoint Name menjadi tool bernama. Tidak ada setup tambahan.

### 5. Lihat prototipe (opsional)

Prototipe statis tidak memerlukan proses build. Buka `apps/prototype/index.html` di browser, atau pakai versi live di https://serambi-ai.netlify.app. Aplikasi Nuxt 4 di `apps/web` baru berupa scaffold dan belum terhubung ke Langflow.

## Penggunaan

Di Bob:

```
Saya guru SD, suka membaca, level pemula, 5 jam/minggu. Buatkan roadmap AI literacy.
```

Bob memanggil `goal_decomposer`, Langflow menjalankan flow, dan hasilnya roadmap terstruktur (saat ini 12 minggu, target 6 minggu).

## Model bisnis

Kategori: Education and Future of Work. Bagian ini berisi hipotesis, bukan angka yang sudah divalidasi.

**Unit economics.** Produk AI melaporkan gross margin sekitar 45% pada 2025 dan awal 50-an pada 2026, dibanding 60 sampai 80% untuk SaaS tradisional (1752vc + ICONIQ, State of AI 2026). Biaya inferensi naik seiring pemakaian, jadi margin perlu dikelola per pengguna. Di Serambi.ai, biaya per pengguna adalah satu kali pembuatan rencana per tujuan, ditambah panggilan review dan Tanya AI. Rencananya pricing berbasis pemakaian atau hibrida sejak awal, dan North Star metric adalah kemajuan belajar, bukan pendapatan.

**Kesediaan membayar.** Pembanding konsumen terdekat adalah Astra AI seharga Rp 115.000 per bulan ([App Store ID](https://apps.apple.com/id/app/id6751030141)), yang ditujukan untuk persiapan ujian sekolah. Kesediaan profesional bekerja membayar untuk literasi AI belum diuji.

**Jalur pendapatan, dari yang tercepat.**

| Jalur | Siapa membayar | Catatan |
|---|---|---|
| B2B white-label | Bootcamp, kampus, program reskilling | Paling cepat menghasilkan. Flow sudah berada di balik endpoint MCP |
| Lisensi institusional | Sekolah vokasi dan universitas | Berulang per angkatan. Perlu kerja multi-tenant di Langflow |
| Langganan konsumen | Profesional individu | Pasar terbesar dan paling kompetitif |

Dokumen bisnis: [`north-star.md`](docs/business/north-star.md) · [`value-proposition.md`](docs/business/value-proposition.md) · [`competitive-analysis.md`](docs/business/competitive-analysis.md) · [`sdg-alignment.md`](docs/business/sdg-alignment.md)

## Guardrail

### Pedagogi (dari riset)

| Batasan | Efek |
|---|---|
| Memandu, bukan menjawab | Agent memandu, bukan langsung menjawab. Pengguna yang macet mendapat petunjuk terkecil yang berguna |
| Petunjuk bertahap | Petunjuk naik tingkat hanya setelah petunjuk yang lebih kecil gagal |
| Pertanyaan pemancing | Pertanyaan "mengapa" dan "bagaimana" membuka celah pemahaman lebih cepat daripada penjelasan |
| Tanpa cognitive offloading | Agent tidak berpikir menggantikan pengguna |
| Goal-first | Setiap respons kembali merujuk ke profesi dan konteks pengguna |

### Operasional

- Setiap flow bisa diverifikasi sendiri, dan `verify-flow.sh` dijalankan sebelum setiap commit yang menyentuh flow.
- Keluaran terstruktur dengan `temperature = 0.3` menjaga dekomposisi cukup stabil untuk dipakai di hilir.
- Konfigurasi node mengikuti fungsi NIST AI RMF (govern, map, measure, manage) pada tingkat prototipe.
- Konteks regulasi Indonesia dicatat di [`docs/`](docs/), termasuk Surat Edaran Etika AI (Kominfo, 2023) dan konsultasi publik Roadmap AI Nasional Komdigi (Agustus 2025).
- Korpus riset adalah materi proyek. Retrieval set tidak berisi data pengguna maupun konten berbayar.

### Keamanan dan pencegahan penyalahgunaan

Berlaku saat ini:

| Guardrail | Efek |
|---|---|
| Kredensial tidak masuk repo | API key disimpan di environment variable dan di-gitignore. Endpoint MCP menolak permintaan tanpa `x-api-key` |
| Keluaran tervalidasi skema | Setiap agent mengembalikan JSON yang diperiksa terhadap skema tetap. Keluaran model diperlakukan sebagai data dan tidak pernah dieksekusi |
| Cakupan sebagai pelatih belajar | Agent tetap berperan sebagai pelatih belajar dan menolak menyerahkan pekerjaan yang dinilai |

Dijanjikan untuk web app (belum dibangun):

- Tujuan yang ditulis bebas diperlakukan sebagai data di dalam system prompt tetap, dengan batas panjang dan isi untuk menahan prompt injection.
- Endpoint publik memerlukan autentikasi dan rate limiting sebelum data pengguna disimpan.
- Minimalisasi data: hanya sinyal kemajuan yang disimpan, dan data kurva lupa diagregasi serta dianonimkan sebelum dipakai untuk keperluan lain.

## Roadmap

### Selesai

- Flow `goal_decomposer`, terverifikasi ujung ke ujung lewat Bob, MCP, dan Langflow (keluaran 12 minggu)
- Skrip verifikasi dengan kode exit yang eksplisit
- Lima ADR yang menjelaskan arsitektur
- Analisis kompetitor (12 kompetitor), value proposition, dan North Star metric
- Pitch deck 11 slide dengan speaker notes
- Prototipe statis (landing page dan `/app/`) di `apps/prototype/`, dideploy ke Netlify
- Scaffold Nuxt 4 di `apps/web` (belum dipakai)

### Submission hackathon (tenggat 31 Oktober 2026)

- [x] Deploy prototipe statis ke Netlify
- [ ] Rekam video demo 3 menit
- [ ] Kirim formulir hackathon

### Setelah hackathon

- Selaraskan flow ke rencana 6 minggu dan jalankan dengan IBM watsonx (ISS-25)
- Agent Scheduler dengan sinkronisasi Google Calendar (ISS-26)
- Nuxt 4 PWA, backend Nitro (MCP client), autentikasi, dan database (ISS-27)
- Lapisan retrieval di atas `research/` (ISS-12)
- Ide agent lanjutan: `explain_concept`, `generate_quiz`, `check_progress`, `send_reminder`, `check_wellbeing`
- Pekerjaan PWA: dukungan offline, push notification, install prompt

## Struktur repo

```
serambi-ai/
├── .bob/                  Konfigurasi MCP (mcp.json), hook, pengaturan, agent skill
├── flows/                 Ekspor flow Langflow (goal_decomposer.json)
├── agents/                Spesifikasi agent dan system prompt
├── apps/
│   ├── prototype/         Prototipe statis (live di Netlify)
│   └── web/               Scaffold Nuxt 4 (pekerjaan lanjutan)
├── packages/              Library bersama (rencana)
├── materials/             Materi belajar per profesi
├── resources/             Daftar URL sumber belajar terkurasi (JSON)
├── docs/                  PRD, ISSUES, ADR, dokumen bisnis, draf submission
├── mcp/                   Detail integrasi MCP
├── research/              Catatan riset dan abstrak paper
├── scripts/               verify-flow.sh, verify-e2e.sh, bootstrap-langflow.sh
├── slides/                Pitch deck (PPTX dan PDF)
├── submission/            Tangkapan layar untuk formulir submission
├── assets/                Tangkapan layar dan diagram (termasuk sumber HTML)
├── compose.yaml           Sandbox juri (Langflow dan verifikasi)
├── DESIGN.md              Design system
└── AGENTS.md              Aturan sesi, batasan pedagogis, tabel MCP tool
```

## Integrasi MCP

Bob terhubung ke Langflow melalui `mcp-proxy` dengan streamable HTTP. Konfigurasinya ada di [`.bob/mcp.json`](.bob/mcp.json); API key dibaca dari environment dan tidak pernah masuk repo. Setiap flow Langflow yang punya Endpoint Name menjadi tool yang bisa dipanggil, sehingga `mcp__lf-serambi_ai__goal_decomposer` merujuk ke flow yang hidup. Detail dan pemecahan masalah: [`mcp/README.md`](mcp/README.md).

## Skill agent

Proyek ini berjalan di dalam IBM Bob dan memuat skill sesuai kebutuhan dengan `$nama-skill`. Ada lebih dari 80 skill di [`.bob/skills/`](.bob/skills/), berasal dari [phuryn/pm-skills](https://github.com/phuryn/pm-skills), [mattpocock/skills](https://github.com/mattpocock/skills), dan skill khusus proyek.

| Skill | Kegunaan |
|---|---|
| `diagram-design` | Diagram arsitektur, alur, dan perjalanan pengguna dalam HTML/SVG |
| `pitch-deck` | Struktur pitch deck 11 slide |
| `value-proposition` | Templat jobs-to-be-done |
| `north-star` | North Star metric dan input metric |
| `competitive-analysis` | Pemetaan kompetitor dan diferensiasi |
| `business-model` | Model bisnis berbasis canvas |
| `plan-launch` | Go-to-market dan segmen beachhead |

## Alat pengembangan

IBM Bob menangani orkestrasi agent, pemanggilan MCP tool, dan verifikasi flow. Satu tugas berada di luar cakupannya:

| Alat | Kegunaan |
|---|---|
| [pi agent](https://pi.dev/) dengan [feynman extension](https://pi.dev/packages/@companion-ai/feynman) | Riset akademik dan pencarian paper |

## Maintainer

**M. Muchsin**, [github.com/mmuchsin](https://github.com/mmuchsin)

## Lisensi

Apache 2.0 © 2026 Serambi.ai Contributors. Lihat [LICENSE](LICENSE).
