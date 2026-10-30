# serambi-pitch-deck (v2 — AI Literacy Pivot)

- Source: `serambi-pitch-deck.pptx`
- Total slides: 11

## Slide 1

Serambi.ai

Navigasi AI Literacy Adaptif untuk Profesi Indonesia

Adaptive Multi-Agent AI Literacy Navigator — Professional Non-Teknis

IBM SkillsBuild University Education National Hackathon · Hacktiv8 × IBM × Komdigi

### Speaker Notes

Slide 1 — Cover. Serambi.ai: navigasi AI literacy adaptif untuk profesional non-teknis Indonesia (guru, UMKM, dokter, akuntan, admin, HR, content creator, digital marketing, aparatur, freelancer). Tagline: navigasi AI literacy adaptif untuk profesi Indonesia. Stack: IBM Bob × Langflow × MCP.

## Slide 2

02

Masalah: Profesional Non-Teknis Bingung Belajar AI untuk Profesi Mereka

Jutaan profesional Indonesia sudah pakai AI (ChatGPT, Copilot, Gemini) — tapi ad-hoc, tanpa struktur, tanpa evaluasi kredibilitas, tanpa etika, tanpa integrasi ke workflow profesi.

- ✗ **Tidak ada roadmap AI literacy personal** — materi AI acak (YouTube, media sosial) tanpa peta ke kebutuhan profesi spesifik
- ✗ **Progres AI literacy tidak terlacak** — tidak ada jawaban: sudah sejauh mana adopsi AI untuk profesi saya? harus belajar apa lagi?
- ✗ **AI generik memicu cognitive offloading** — langsung dijawab, tanpa belajar aktif. (BJET, 694× dikutip)
- ✗ **Alternatif tidak relevan** — kursus AI tooling (ailene.id), AI untuk ujian (Astra AI), coding course (Dicoding), bukan AI literacy untuk profesi existing

📈 **Market opportunity:** 28% UMKM sudah adopsi AI (AWS 2025, naik 47% YoY) — tapi 57% bilang *skill gap* adalah hambatan utama ekspansi. Indonesia #1 AI users, tapi bukan AI producers (Komdigi). **Ini gap AI literacy massal yang diselesaikan Serambi.ai.**

### Speaker Notes

Slide 2 -- Problem. 4 hambatan: (1) tidak ada roadmap AI literacy personal per profesi, (2) progres AI literacy tidak terlacak, (3) cognitive offloading (BJET 694 sitasi), (4) alternatif tidak relevan (tooling/ujian/coding). Market data: 28% UMKM adopsi AI (AWS 2025), 57% skill gap barrier, Indonesia #1 AI users bukan producers. Gap = structured AI literacy adoption per profesi.

## Slide 3

03

Solusi: Scaffold, Bukan Oracle — AI Literacy Navigator

Serambi.ai memandu profesional non-teknis adopt AI untuk profesi mereka — **bukan menjawab untuk mereka, tapi memfasilitasi belajar aktif**.

1. **Pengguna isi screening 4 langkah:** profesi + hobi + level AI + jam belajar/minggu
2. **Goal Agent** memecah → roadmap AI literacy 12 minggu **personal per profesi** (JSON)
3. **Tutor Agent** menjelaskan konsep AI dengan **teknik Feynman** (probing questions, bukan jawaban langsung)
4. **Assessment Agent:** kuis adaptif + **graduated hinting** (hint terkecil dulu)
5. **Progress Agent:** review berbasis **forgetting curve individual** (spaced repetition)
6. **Motivator & Wellbeing Agent:** nudge kontekstual + cek burnout berkala

📚 **Landasan riset tiap agent:** GenMentor (FWCI 47.3) · IntelliCode (FWCI 23.5) · Feynman Bot (80%+ prefer Feynman) · Zaidi et al. (arXiv 2004.11327, +15-20% retensi) · BJET (694×, cognitive offloading) · SRL meta-analisis g=1.613 (32 studi, Frontiers in Education 2025)

### Speaker Notes

Slide 3 -- Solution. Core insight: AI harus scaffold, bukan oracle. Desain pedagogis: Feynman technique, graduated hinting, spaced repetition, wellbeing. 6 agents = 6 Langflow flows = 6 MCP tools. Goal Agent sudah e2e verified.

## Slide 4

04

Target Pengguna: 10 Profesi Non-Teknis Prioritas

| Profesi | Jumlah (Est.) | Pain Point AI Literacy | Contoh Use Case Roadmap |
|---------|---------------|------------------------|-------------------------|
| **Guru** | ~4,8 juta | Mandat Kemendikbud AI literacy; administrasi, RPP, evaluasi | AI untuk RPP diferensiasi, penilaian formatif, materi pembelajaran |
| **UMKM / Ekspor-Impor** | ~18 juta | Mandat Kominfo digitalisasi; marketing, ekspor, keuangan, ops | AI untuk marketing digital ekspor, deskripsi produk, laporan keuangan |
| **Dokter / Tenaga Kesehatan** | ~600 rb | Anamnesis, literatur review, edukasi pasien | AI untuk ringkasan jurnal, anamnesis terstruktur, edukasi pasien |
| **Akuntan / Keuangan** | ~200 rb+ | Rekonsiliasi, audit, pajak, pelaporan | AI untuk rekonsiliasi otomatis, analisis anomali, ringkasan peraturan |
| **Admin / Sekretaris** | ~2 juta+ | Manajemen dokumen, jadwal, komunikasi | AI untuk ringkasan rapat, drafting surat, otomatisasi formulir |
| **HR / Rekrutmen** | ~500 rb+ | JD writing, screening CV, employer branding | AI untuk job description inklusif, screening CV, onboarding otomatis |
| **Content Creator** | ~1 juta+ | Ide konten, script, editing, distribusi | AI untuk riset topik, script video, caption SEO, repurpose konten |
| **Digital Marketing** | ~800 rb+ | Copywriting, analisis kampanye, SEO, ads | AI untuk copy A/B test, analisis kompetitor, keyword research |
| **Aparatur Publik** | ~4 juta+ | Surat resmi, kebijakan, pelayanan publik | AI untuk drafting peraturan, ringkasan laporan, chatbot pelayanan |
| **Freelancer Kreatif** | ~500 rb+ | Proposal, kontrak, portofolio, manajemen proyek | AI untuk proposal klien, estimasi biaya, manajemen timeline |

**JTBD Utama:** *"Saya butuh roadmap AI literacy 12 minggu untuk profesi saya — dalam 1 menit, Bahasa Indonesia, gratis untuk profesi pertama."*

### Speaker Notes

Slide 4 -- Target User. 10 profesi non-teknis prioritas (total ~30+ juta). Beachhead Phase 1: Guru + UMKM (22.8 juta). JTBD: roadmap AI literacy personal per profesi, <1 menit, Bahasa Indonesia, gratis profesi pertama.

## Slide 5

05

Cara Kerja Serambi.ai

✅ **Alur MVP — terverifikasi end-to-end:**

Web App (PWA) → MCP tool → Langflow agent flow → LLM → **Roadmap AI Literacy 12 Minggu per Profesi**

- **Stack integrasi:**
  - **IBM Bob** → MCP (streamable HTTP) → **Langflow** flow engine → **LLM provider OpenAI-compatible**
  - Kontrak MCP identik saat dev (Bob) dan produksi (Web App Nitro backend) — tanpa ubah flow Langflow.
  - **Named MCP tool per agent** — pemanggil bisa diganti tanpa ubah flow.

✅ **VERIFIED:** Bob → `goal_decomposer` MCP tool → **JSON roadmap AI literacy 12 minggu per profesi**

### Speaker Notes

Slide 5 -- How It Works. Tiga layer: Web App PWA (UI), MCP bridge (named tools), Langflow (flow execution). Kontrak MCP identik antara dev harness (Bob) dan backend web app produksi (Nitro). Goal Agent sudah e2e verified untuk AI literacy roadmap.

## Slide 6

06

AI & Teknologi

**Stack Utama:**

- **IBM Bob** — AI agent harness: build, test, verifikasi agent e2e
- **IBM Langflow** — Flow execution engine: setiap agent = 1 flow = 1 MCP tool
- **MCP (Model Context Protocol)** — Bridge pemanggil ↔ agent Langflow
- **LLM provider OpenAI-compatible** — LLM backbone (temperature 0.3 untuk deterministik)
- **Arsitektur:** Web App PWA (Nuxt 4) → [MCP streamable HTTP] → Langflow → LLM
- **Named MCP tool per agent** — pemanggil bisa diganti tanpa ubah flow.

**📚 Landasan riset (30+ paper, abstract + DOI):**
- GenMentor (FWCI 47.3) — goal decomposition ke milestones
- IntelliCode (FWCI 23.5) — graduated hinting outperforms direct answers
- Feynman Bot (arXiv 2506.09055) — 80%+ prefer Feynman over passive reading
- Zaidi et al. (arXiv 2004.11327) — adaptive spaced repetition +15-20% retensi
- BJET (DOI 10.1111/bjet.13544, 694×) — cognitive offloading risk, scaffold > oracle
- SRL meta-analisis (Frontiers in Education 2025) — AI intervention g=1.613 (32 studi)

### Speaker Notes

Slide 6 -- AI & Technology. Stack: Bob (harness), Langflow (flow engine), MCP (bridge), LLM provider OpenAI-compatible. 6 agents = 6 flows = 6 MCP tools. Setiap keputusan dilandasi paper FWCI tinggi.

## Slide 7

07

Fitur Utama: 6 Agent AI Literacy

| Agent | Status | Fungsi Kunci | Pedagogi |
|-------|--------|--------------|----------|
| ✅ **Goal Decomposer** | **LIVE e2e** | Screening 4 langkah → roadmap AI literacy 12 minggu JSON personal per profesi | Profession decomposition + curated resources |
| 🔧 **Tutor (Feynman)** | Dev | Konsep AI: probing questions, analogi profesi, self-explanation | Feynman technique + Protégé Effect |
| 🔧 **Assessment (Hinting)** | Dev | Kuis adaptif per topik AI; **graduated hinting** (hint terkecil dulu) | IntelliCode graduated hinting |
| 🔧 **Progress (Spaced Rep)** | Dev | Review schedule berbasis **forgetting curve individual** per konsep AI | Zaidi et al. adaptive spaced repetition |
| 🔧 **Motivator** | Dev | Nudge kontekstual berbasis progress + jadwal belajar | SRL support + implementation intentions |
| 🔧 **Wellbeing** | Dev | Cek burnout berkala + rekomendasi pacing | Burnout prevention, sustainable adoption |

**Setiap agent = 1 Langflow flow = 1 MCP tool** — kontrak I/O terdefinisi, terverifikasi via `verify-flow.sh` + `verify-e2e.sh`

### Speaker Notes

Slide 7 -- Key Features. 6 agents dengan status jelas. Goal Agent live e2e verified. Tutor pakai Feynman, Assessment pakai graduated hinting, Progress pakai spaced repetition. Semua agent MCP-native.

## Slide 8

08

Prototype & Demo

**Alur Demo (Goal Agent — e2e verified untuk AI Literacy):**

1. **[Screenshot 01]** Bob TUI — harness pengembangan memanggil tool `goal_decomposer`
2. **[Screenshot 02]** Canvas Langflow: flow `goal_decomposer` (Chat Input → Prompt → LLM → Chat Output)
3. **[Screenshot 03]** Endpoint Langflow: nama flow + deskripsi agent dikonfigurasi
4. **[Screenshot 04]** Output nyata: **JSON roadmap AI literacy 12 minggu (profesi: Guru / UMKM)**

- [ Sisipkan 4 screenshot di sini: 01-user-interface.png, 02-langflow-workflow.png, 03-langflow-endpoint.png, 04-output.png ]
- File ada di: `submission/screenshots/`

**Bukti integrasi:** Bob memanggil MCP tool → Langflow menjalankan flow → JSON roadmap AI literacy dikembalikan.
**Bukan dijawab dari LLM Bob sendiri** — agent Langflow benar-benar dieksekusi via MCP.

### Speaker Notes

Slide 8 -- Demo. Tunjukkan 4 screenshot: Bob TUI (harness dev), Langflow canvas, Langflow endpoint config, JSON output roadmap AI literacy untuk Guru/UMKM. Tekankan: ini agent Langflow yang benar-benar dipanggil lewat MCP, bukan LLM Bob menjawab sendiri.

## Slide 9

09

Dampak & Nilai: AI Literacy Adoption

⭐ **North Star: AI Literacy Adoption Rate ≥ 15%/minggu per pengguna aktif**
*(Definisi: % milestone AI literacy selesai / total milestone di roadmap profesi)*

- ⚡ **Roadmap AI literacy personal:** 2–4 jam riset mandiri → **< 1 menit** — terbukti demo e2e
- 📈 **Retensi konsep AI:** +15–20% vs spaced repetition tetap (Zaidi et al., arXiv 2004.11327)
- 🎯 **Target adopsi:** 1.000 pengguna aktif/bulan pada bulan ke-6 (Guru + UMKM beachhead)
- 🔬 **Meta-analisis AI pada self-regulated learning:** g = 1.613 (32 studi, Frontiers in Education 2025)
- 💡 **Feynman Bot:** 80%+ peserta lebih pilih daripada membaca pasif (arXiv 2506.09055)
- 🧠 **Cognitive offloading prevention:** Scaffold design (BJET 694×) — Feynman check memastikan pemahaman nyata

**Diferensiasi Kuadran Unclaimed: High Adaptivity × Bahasa Indonesia × Per Profesi**

| | ChatGPT / Copilot | Dicoding / Ruangguru / Cakap | ailene.id / Astra AI | **Serambi.ai** |
|--|------------------|-----------------------------|---------------------|----------------|
| **Adaptivity** | ✗ Oracle | ✗ Fixed curriculum | △ Level-based | ✅ **Personal per profesi + hobi + level + jadwal** |
| **Bahasa** | △ Campur | ✅ Indonesia | ✅ Indonesia | ✅ **Indonesia native** |
| **Pedagogi** | ✗ Offloading | △ Passive | △ Tooling-focused | ✅ **Feynman + Hinting + Spaced Rep + Wellbeing** |
| **Scope** | General | Coding / Sekolah / Bahasa | AI Tooling / Ujian | ✅ **AI Literacy 10+ Profesi Non-Teknis** |

### Speaker Notes

Slide 9 -- Impact. North Star: AI Literacy Adoption Rate ≥15%/minggu. Angka kunci: <1 menit roadmap, +15-20% retensi, g=1.613, 80%+ Feynman. Diferensiasi: High Adaptivity × Bahasa Indonesia × Per Profesi. vs ChatGPT (oracle), Dicoding (fixed), ailene.id (tooling), Astra AI (ujian).

## Slide 10

10

Pengembangan & GTM: Phased Rollout

**Fase sekarang (MVP live):**
- ✅ Goal Agent AI Literacy — e2e verified
- ✅ Infra MCP + Langflow + Bob
- ✅ Dokumentasi + submission draft
- ✅ Verification scripts (flow + e2e)

**Phase 1 (Nov–Jan): B2C Beachhead — Guru + UMKM**
- ◻ Tutor Agent (Feynman) + Assessment (Hinting) + Progress (Spaced Rep) + Motivator + Wellbeing
- ◻ Web App PWA (Nuxt 4) — landing page per profesi, waitlist, auth, dashboard
- ◻ Cheap test: WA blast komunitas guru/UMKM → 1.000 waitlist → 200 pilot → 50 paid (Rp 39–79rb/bln)

**Phase 2 (Feb–Apr): B2B2C Komunitas Profesi**
- ◻ Pilot 3–5 komunitas: PGRI/IGI (guru), Hipmi/Kadin (UMKM), IAI (akuntan), IDI (dokter)
- ◻ Case study adoption rate per profesi → leverage ke institusi induk

**Phase 3 (May–Jul): B2B2C Institusi + Corporate**
- ◻ MoU Komdigi/Kemendikbud (guru), Kominfo (UMKM), Kemenkes (dokter)
- ◻ Pilot corporate: 1 BUMN/bank (50–100 karyawan non-teknis)

**Phase 4 (Aug+): Scale + ASEAN**
- ◻ Semua 10 profesi live, white-label platform, ekspansi ASEAN

**Moat Teknis:** Data forgetting curve anonim per domain profesi → adaptive spacing optimal per profesi.

### Speaker Notes

Slide 10 -- Future Development & GTM. Now: Goal Agent done. Phase 1: B2C Guru+UMKM beachhead (3 bulan). Phase 2: B2B2C komunitas profesi. Phase 3: Institusi + Corporate. Phase 4: Scale + ASEAN. Moat: forgetting curve data per profesi.

## Slide 11

11

Tim & Founder

M. Muchsin — Solo Founder & Engineer

- Software Engineer · Vue / Nuxt / TypeScript · SvelteKit · Agentic AI
- S2 Informatika — Universitas Negeri Semarang (UNNES) · Riset: LLM Hallucination Reduction

- Mengapa founder ini:
- 📄 **Riset mendalam** — 30+ paper (abstract + DOI); topik riset S2 langsung: LLM hallucination reduction
- ✅ **Implementasi nyata** — Goal Agent AI Literacy e2e verified; bukan mockup, bukan demo palsu
- 🔧 **Full-stack & agentic** — Vue/Nuxt/SvelteKit + agentic AI; paham stack produksi sampai infra agent
- 🎓 **Pedagogi berbasis bukti** — setiap fitur terhubung ke paper dengan FWCI tinggi

- 🔗 github.com/mmuchsin/serambi-ai
- Stack: IBM Bob × IBM Langflow × MCP × LLM provider OpenAI-compatible

### Speaker Notes

Slide 11 -- Team. Isi nama anggota tim. Highlight: riset mendalam (30+ paper), implementasi nyata (e2e verified), arsitektur modular (MCP contract). Closing: repo public, invite juri untuk cek langsung.