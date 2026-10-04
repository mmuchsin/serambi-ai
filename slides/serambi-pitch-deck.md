# serambi-pitch-deck

- Source: `serambi-pitch-deck.pptx`
- Total slides: 11

## Slide 1

Serambi.ai

Belajar mandiri, tapi nggak sendirian.

Adaptive Multi-Agent Learning Assistant untuk Career Switcher Indonesia

IBM SkillsBuild University Education National Hackathon · Hacktiv8 × IBM × Komdigi

### Speaker Notes

Slide 1 — Cover. Serambi.ai: asisten belajar multi-agent adaptif untuk career switcher Indonesia. Tagline: belajar mandiri, tapi nggak sendirian. Stack: IBM Bob × Langflow × MCP.

## Slide 2

02

Masalah yang Ingin Kami Selesaikan

Career switcher Indonesia belajar mandiri -- dan banyak yang gagal di tengah jalan.

- ✗ Tidak ada roadmap personal — materi acak (YouTube, Udemy, blog) tanpa peta ke target role.
- ✗ Progres tidak terlacak — tidak ada jawaban: sudah sejauh mana? harus lanjut ke apa?
- ✗ AI generik memicu cognitive offloading — langsung dijawab, tanpa belajar aktif. (BJET, 694× dikutip)
- ✗ Alternatif mahal — bootcamp & mentor privat tidak terjangkau; kursus online one-size-fits-all.

📈 Market upskilling global tumbuh 11–14% CAGR — tapi hampir seluruhnya B2B/korporasi. Career switcher individu tidak terlayani.

### Speaker Notes

Slide 2 -- Problem. Empat hambatan: (1) tidak ada roadmap personal, (2) progres tidak terlacak, (3) cognitive offloading (BJET 694 sitasi), (4) alternatif mahal. Market gap: upskilling growth B2B bukan individu.

## Slide 3

03

Solusi: Scaffold, Bukan Oracle

Serambi.ai adalah asisten belajar adaptif berbasis multi-agent AI yang memandu career switcher Indonesia -- bukan menjawab untuk mereka.

- 1 → Pengguna ketik goal karier: "jadi data analyst dalam 3 bulan"
- 2 → Serambi.ai memecah goal → roadmap mingguan terstruktur
- 3 → Agent Tutor menjelaskan konsep dengan teknik Feynman
- 4 → Agent Assessment: kuis adaptif + graduated hints
- 5 → Agent Progress: review berbasis forgetting curve
- 6 → Agent Wellbeing: pantau motivasi, cegah burnout

### Speaker Notes

Slide 3 -- Solution. Core insight: AI harus menjadi scaffold, bukan oracle. Desain pedagogis berbasis riset: GenMentor, IntelliCode, Feynman Bot, spaced repetition. Goal Agent sudah e2e verified.

## Slide 4

04

Target Pengguna

Pengguna Primer -- Career Switcher Indonesia

- → Profesional usia 22–35, bekerja di non-tech (admin, marketing, guru)
- → Target: data analyst, backend dev, ML engineer — dalam 1–6 bulan
- → Belajar mandiri, waktu terbatas, Bahasa Indonesia, anggaran terbatas
- → JTBD: "Saya mau jadi data analyst dalam 3 bulan — sudah mulai tapi tidak tahu harus ngapain selanjutnya"

- Sekunder: Tech worker naik level / pivot domain
- B2B (roadmap): bootcamp, kampus, program reskilling Komdigi

📊 OECD (2024): kesenjangan tech skills vs output pendidikan tradisional terus melebar — reskilling mandiri adalah solusi utama, tapi minim dukungan adaptif.

### Speaker Notes

Slide 4 -- Target User. Primer: career switcher 22-35, non-tech background, JTBD jelas. Sekunder: tech worker upskilling. B2B: bootcamp dan institusi pendidikan.

## Slide 5

05

Cara Kerja Serambi.ai

✅ Alur MVP — terverifikasi end-to-end:

Web App → MCP tool → Langflow agent flow → LLM → Roadmap Mingguan

- Stack integrasi:
- IBM Bob → MCP (streamable HTTP) → Langflow flow engine → NaraRouter / longcat-2.5
- Kontrak MCP identik saat dev (Bob) dan produksi (Web App backend) — tanpa ubah flow Langflow.

✅ VERIFIED: Bob → goal_decomposer MCP tool → JSON roadmap 12 minggu

### Speaker Notes

Slide 5 -- How It Works. Tiga layer: Web App (UI), MCP bridge (named tools), Langflow (flow execution). Kontrak MCP identik antara dev harness (Bob) dan backend web app produksi. Goal Agent sudah e2e verified.

## Slide 6

06

AI & Teknologi

Stack Utama:

- IBM Bob — AI agent harness: build, test, verifikasi agent e2e
- IBM Langflow — Flow execution engine: setiap agent = 1 flow = 1 MCP tool
- MCP (Model Context Protocol) — Bridge pemanggil ↔ agent Langflow
- NaraRouter / longcat-2.5 — LLM backbone (temperature 0.3)
- Arsitektur: Web App → [MCP streamable HTTP] → Langflow → LLM
- Named MCP tool per agent — pemanggil bisa diganti tanpa ubah flow.

📚 Landasan riset: GenMentor (FWCI 47.3) · IntelliCode (FWCI 23.5) · Feynman Bot (arXiv 2506.09055) · Zaidi et al. (arXiv 2004.11327) · BJET (694× dikutip)

### Speaker Notes

Slide 6 -- AI & Technology. Stack: Bob (harness), Langflow (flow engine), MCP (bridge), NaraRouter/longcat-2.5 (LLM). Setiap keputusan desain dilandasi paper dengan FWCI tinggi.

## Slide 7

07

Fitur Utama

- ✅ LIVE e2e — Goal Decomposer Agent
- → Ketik goal karier → roadmap JSON mingguan (deadline_weeks, milestones, first_action)
- → MCP tool: goal_decomposer | Verified: Bob → Langflow → roadmap 12 minggu

- 🔧 Dev — Tutor Agent (Feynman)
- → Probing questions: AI tidak menjawab langsung, memancing refleksi
- 🔧 Dev — Assessment Agent (Graduated Hinting)
- → Kuis adaptif; hint terkecil dulu bila salah (IntelliCode, FWCI 23.5)

- 🔧 Dev — Progress Agent (Spaced Repetition)
- → Jadwal review berbasis forgetting curve individual — +15–20% retensi (Zaidi et al.)
- 🔧 Dev — Motivator & Wellbeing Agent
- → Nudge kontekstual + cek burnout berkala

### Speaker Notes

Slide 7 -- Key Features. 6 agent: Goal (live), Tutor (Feynman), Assessment (hinting), Progress (spaced rep), Motivator, Wellbeing. Setiap agent = 1 Langflow flow = 1 MCP tool.

## Slide 8

08

Prototype & Demo

Alur Demo (Goal Agent -- e2e verified):

- [Screenshot 01] Bob TUI -- harness pengembangan memanggil tool goal_decomposer
- [Screenshot 02] Canvas Langflow: flow goal_decomposer (Chat Input -> Prompt -> LLM -> Chat Output)
- [Screenshot 03] Endpoint Langflow: nama flow + deskripsi agent dikonfigurasi
- [Screenshot 04] Output nyata: JSON roadmap 12 minggu (goal: data analytics)

- [ Sisipkan 4 screenshot di sini: 01-user-interface.png, 02-langflow-workflow.png, 03-langflow-endpoint.png, 04-output.png ]
- File ada di: submission/screenshots/

- Bukti integrasi: Bob memanggil MCP tool --> Langflow menjalankan flow --> JSON roadmap dikembalikan.
- Bukan dijawab dari LLM Bob sendiri -- agent Langflow benar-benar dieksekusi.

### Speaker Notes

Slide 8 -- Demo. Tunjukkan 4 screenshot: Bob TUI (harness dev), Langflow canvas, Langflow endpoint config, JSON output roadmap. Tekankan: ini bukan demo dari LLM Bob, ini agent Langflow yang benar-benar dipanggil lewat MCP.

## Slide 9

09

Dampak & Nilai

⭐ North Star: Career Goal Progress Rate ≥ 15%/minggu per pengguna aktif

- ⚡ Roadmap personal: 2–4 jam riset mandiri → < 1 menit — terbukti demo e2e
- 📈 Retensi belajar: +15–20% vs spaced repetition tetap (Zaidi et al., arXiv 2004.11327)
- 🎯 Target: 1.000 pengguna/bulan pada bulan ke-6 setelah rilis
- 🔬 Meta-analisis AI pada self-regulated learning: g = 1.613 (32 studi, Frontiers in Education 2025)
- 💡 Feynman Bot: 80%+ peserta lebih pilih daripada membaca pasif (arXiv 2506.09055)

- Kuadran unclaimed: High Adaptivity × Bahasa Indonesia — Serambi.ai = 'Learning OS'
- vs ChatGPT: oracle langsung jawab · vs Dicoding: kursus tetap (1,3 juta+ user, tapi tidak adaptif) · vs DataCamp: English-first, mahal · vs Boot.dev: backend-only + English · vs Bootcamp: jadwal mahal

### Speaker Notes

Slide 9 -- Impact. North star metric: Career Goal Progress Rate. Angka kunci: <1 menit roadmap, +15-20% retensi, g=1.613 meta-analisis AI, 80%+ Feynman Bot. Diferensiasi vs kursus online, ChatGPT, bootcamp.

## Slide 10

10

Pengembangan ke Depan

Fase sekarang (MVP live):

3-6 bulan ke depan:

- ✅ Goal Agent — e2e verified
- ✅ Infra MCP + Langflow + Bob
- ✅ Dokumentasi + submission draft
- ✅ Verification scripts (flow + e2e)

- ◻ Tutor Agent (Feynman)
- ◻ Assessment Agent (hinting)
- ◻ Progress Agent (spaced rep)
- ◻ Motivator + Wellbeing Agent
- ◻ Web App (antarmuka pengguna)
- ◻ WhatsApp bot surface

- Roadmap B2B: Whitelabel untuk bootcamp, kampus, program reskilling Komdigi
- Satu instansi — ribuan peserta — biaya per pengguna rendah

Skala teknis: Langflow Cloud multi-tenant + analytics progres · Moat: model forgetting curve anonim per domain

### Speaker Notes

Slide 10 -- Future Development. Now: Goal Agent done, infra solid. Next 3-6 bulan: 5 agent lain + web app. B2B: bootcamp/kampus whitelabel. Scale: Langflow Cloud + forgetting curve data moat.

## Slide 11

11

Tim & Founder

M. Muchsin — Solo Founder & Engineer

- Software Engineer · Vue / Nuxt / TypeScript · SvelteKit · Agentic AI
- S2 Informatika — Universitas Negeri Semarang (UNNES) · Riset: LLM Hallucination Reduction

- Mengapa founder ini:
- 📄 Riset mendalam — 30+ paper (abstract + DOI); topik riset S2 langsung: LLM hallucination reduction
- ✅ Implementasi nyata — Goal Agent e2e verified; bukan mockup, bukan demo palsu
- 🔧 Full-stack & agentic — Vue/Nuxt/SvelteKit + agentic AI; paham stack produksi sampai infra agent
- 🎓 Pedagogi berbasis bukti — setiap fitur terhubung ke paper dengan FWCI tinggi

- 🔗 github.com/mmuchsin/serambi-ai
- Stack: IBM Bob × IBM Langflow × MCP × NaraRouter

### Speaker Notes

Slide 11 -- Team. Isi nama anggota tim. Highlight: riset mendalam (30+ paper), implementasi nyata (e2e verified), arsitektur modular (MCP contract). Closing: repo public, invite juri untuk cek langsung.
