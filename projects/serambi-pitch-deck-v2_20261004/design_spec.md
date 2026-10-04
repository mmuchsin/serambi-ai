<!-- ppt-master-schema: design-spec/v1 -->
# Serambi Pitch Deck v2 - Design Spec

## I. Project Information

| Item | Value |
| --- | --- |
| Project Name | serambi-pitch-deck-v2 |
| Canvas Format | PPT 16:9 (1280×720) |
| Page Count | 11 |
| Primary Language | id |
| Target Audience | Juri Hacktiv8×IBM×Komdigi (5 orang, Komdigi & pihak terkait) dan investor |
| Communication Intent | Persuade — ide & bisnis (±60% bobot penilaian: problem, innovation, user impact) di depan, teknis sebagai bukti |
| Desired Audience Outcome | Juri/investor meminta demo langsung dan memeriksa repo publik |
| Core Message / Ask / Action | "Scaffold, bukan Oracle — AI yang memandu, bukan menjawab untuk learner" |
| Delivery Context | Pitch live 5–10 menit presenter-led + upload form submission (PPT ≤ 10 MB) |
| Artifact Afterlife | Upload submission (submission terakhir = final) + arsip repo publik |
| Reading Mode | balanced |
| Content Strategy | balanced default — setia pada deck sumber + narasi riset audit; fakta tetap bersumber |
| Design Style | Direction A "Jalan Serambi" — narrative × soft-rounded, rendering flat |
| AI Image Acquisition Path | not applicable (semua aset user-provided) |
| Generation Mode | continuous |
| Spec Refinement | disabled |
| Speaker Notes | enabled — kebijakan final Stage-2: catatan pembawa cerita, bahasa Indonesia conversational |
| Custom Animations | disabled — workflow default |
| Narration Audio | disabled — workflow default |
| Created Date | 2026-10-04 |

## II. Canvas Specification

| Property | Value |
| --- | --- |
| Format | PPT 16:9 |
| Dimensions | 1280 × 720 |
| viewBox | `0 0 1280 720` |
| Margins | 56 px aman di semua sisi |
| Content Area | 1168 × 608 (x 56–1224, y 56–664) |

## III. Visual Theme

### Theme Style

- **Mode**: narrative
- **Visual style**: soft-rounded
- **Theme**: Jalan Serambi — perjalanan dari chaos belajar mandiri menuju jalan yang terpetakan; IBM Blue penuh percaya diri, kartu rounded lembut, aksen amber hangat yang menyambung dengan ilustrasi flat yang sudah digenerate
- **Tone**: hangat, jelas, meyakinkan; bahasa Indonesia percakapan dengan istilah teknis minimal

### Color Scheme

| Role | HEX | Purpose |
| --- | --- | --- |
| Background | #FFFFFF | Kanvas utama |
| Secondary background | #EEF1F9 | Kartu tint, chip, zona lembut |
| Primary | #1E2761 | Cover, chapter band, heading, logo (IBM Blue) |
| Accent | #F2A93B | Angka kunci, status LIVE, echo ilustrasi (amber hangat) |
| Secondary accent | #4A5FC1 | Isi kartu sekunder, penekanan, ikon |
| Body text | #23283D | Teks tubuh |
| Secondary text | #5A6178 | Caption, anotasi, footnote |
| Divider | #D8DDEB | Hairline, border kartu |

## IV. Typography System

### Font Plan

| Role | Character (Reference) | Primary | English if non-English | Fallback tail |
| --- | --- | --- | --- | --- |
| Title | friendly humanist, confident | Trebuchet MS | Trebuchet MS | Arial |
| Body | neutral, readable | Calibri | Calibri | Arial |

- **Title stack**: Trebuchet MS, Arial
- **Body stack**: Calibri, Arial

### Font Size Hierarchy

| Purpose | Anchor Size (px) |
| --- | ---: |
| Body | 24 |
| Title | 42 |
| Subtitle | 32 |
| Annotation | 18 |
| Footnote | 16 |

## V. Layout Principles

### Deck-wide Direction

- **Hierarchy direction**: atas-ke-bawah lalu kiri-ke-kanan; assertion headline kiri-atas, bukti (bullet, angka, visual) di bawah/kanannya
- **Composition tendency**: zona kartu rounded di atas field tint; split 60/40 antara visual dan teks; hero number besar untuk angka kunci; 2×2 frame grid untuk screenshot
- **Cross-page continuity**: motif "stepping stones" — deret 5 kapsul rounded naik (turunan logo) sebagai progress motif di footer/header; chip nomor halaman kanan-bawah; chip logo kecil kanan-atas pada halaman tubuh
- **Spacing posture**: variable mengikuti rhythm — dense rapat, breathing lega
- **Spacing anchors**: page margin 56, block gap 32, column gutter 40, corner radius 20, body leading 34

## VI. Icon Usage Specification

- **Primary bundled library**: tabler-outline
- **Stroke Width**: 2
- **Brand-logo library**: simple-icons

| Icon Path | Suitable Scenarios |
| --- | --- |
| tabler-outline/target | goal karier, target role |
| tabler-outline/route | roadmap mingguan |
| tabler-outline/bulb | graduated hints, insight |
| tabler-outline/refresh | spaced repetition, review |
| tabler-outline/activity-heartbeat | wellbeing agent, burnout check |
| tabler-outline/brain | agent AI, multi-agent |
| tabler-outline/message | Feynman probing, dialog |
| tabler-outline/help-circle | assessment, kuis adaptif |
| tabler-outline/users | target pengguna |
| tabler-outline/coins | revenue stream, model bisnis |
| tabler-outline/building | B2B: bootcamp, kampus, program Komdigi |
| tabler-outline/chart-line | impact, north star |
| tabler-outline/shield | responsible AI, guardrail |
| tabler-outline/lock | privasi data |
| tabler-outline/check | e2e verified, MVP live |
| tabler-outline/rocket | roadmap 3–6 bulan, skala |
| simple-icons/ibm | brand IBM (Bob, Langflow) |
| simple-icons/python | stack Python/Langflow |

## VIII. Image Resource List

| Filename | Dimensions | Ratio | Purpose | Type | Image pattern | Crop Policy | Acquire Via | Status | Reference | text_policy | page_role |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| logo-blue.png | 1024×1024 | 1.00 | brand mark beside wordmark | mark | square mark di kiri wordmark, padding jelas | no-crop | user | existing | P01 | none | mark |
| logo-white.png | 1024×1024 | 1.00 | brand mark di band biru penutup | mark | mark putih di atas band biru closing | no-crop | user | existing | P11 | none | mark |
| cover-hero.png | 1536×864 | 1.78 | cover hero: maze → clear path | hero | full-width band atas cover di dalam kartu rounded | adaptive | user | existing | P01 | none | hero |
| problem-illustration.png | 1536×864 | 1.78 | problem: student di tengah chaos sumber belajar | panel | panel 60% kiri berhadapan dengan pain bullets | adaptive | user | existing | P02 | none | panel |
| solution-illustration.png | 1536×864 | 1.78 | solution: AI robot meletakkan stepping stones di sisi student | panel | visual penyeimbang sekuens 6 langkah | adaptive | user | existing | P03 | none | panel |
| learning-journey.png | 1202×472 | 2.55 | strip alur belajar end-to-end | strip | full-width strip di bawah 3 langkah user | adaptive | user | existing | P05 | none | strip |
| architecture-light.png | 1057×617 | 1.71 | arsitektur stack: Web App → MCP → Langflow → LLM | panel | visual utama kolom kanan, bullets kiri | adaptive | user | existing | P06 | none | panel |
| agent-flow.png | 820×671 | 1.22 | interaksi 6 agent | panel | visual persegi kolom kanan, fitur kiri | adaptive | user | existing | P07 | none | panel |
| 01-user-interface.png | 1850×1067 | 1.73 | screenshot: Bob TUI harness memanggil tool | frame | grid 2×2 screenshot berbingkai rounded, pos 1 | adaptive | user | existing | P08 | none | frame |
| 02-langflow-workflow.png | 1841×1069 | 1.72 | screenshot: canvas Langflow goal_decomposer | frame | grid 2×2 screenshot berbingkai rounded, pos 2 | adaptive | user | existing | P08 | none | frame |
| 03-langflow-endpoint.png | 1843×1070 | 1.72 | screenshot: endpoint Langflow terkonfigurasi | frame | grid 2×2 screenshot berbingkai rounded, pos 3 | adaptive | user | existing | P08 | none | frame |
| 04-output.png | 1610×787 | 2.05 | screenshot: output JSON roadmap 12 minggu | frame | grid 2×2 screenshot berbingkai rounded, pos 4 | adaptive | user | existing | P08 | none | frame |
| ibm-logo.png | 172×64 | 2.69 | partner logo IBM | mark | logo IBM di chip partners P01 | no-crop | user | existing | P01 | none | mark |
| hacktiv8-logo.png | 396×120 | 3.30 | partner logo Hacktiv8 | mark | logo Hacktiv8 di chip partners P01 | no-crop | user | existing | P01 | none | mark |
| komdigi-logo.png | 75×64 | 1.17 | partner logo Komdigi | mark | logo Komdigi di chip partners P01 | no-crop | user | existing | P01 | none | mark |

## IX. Content Outline

### Part 1: Hook (Problem → Solution)

#### Slide 01 - Cover

- **Audience move**: pendengar belum tahu apa pun → "deck ini menjawab masalah nyata career switcher Indonesia, dengan bukti"
- **Relationships**: brand → hook image → value assertion → konteks kompetisi, urutan atas-ke-bawah
- **Composition**: kartu rounded hero full-width (cover-hero) di atas, wordmark+logo kiri-atas, assertion besar tengah, chip konteks bawah
- **Title**: Serambi.ai
- **Core message**: Belajar mandiri, tapi nggak sendirian — scaffold, bukan Oracle
- **Content**:
  - Wordmark "Serambi.ai" + logo (logo-blue)
  - Assertion: "Scaffold, Bukan Oracle — AI yang memandu, bukan menjawab"
  - Subtitle: Adaptive Multi-Agent Learning Assistant untuk Career Switcher Indonesia
  - Tagline kecil: "Belajar mandiri, tapi nggak sendirian"
  - Chip konteks: IBM SkillsBuild University Education National Hackathon · Hacktiv8 × IBM × Komdigi
- **Images**: cover-hero.png (hero band), logo-blue.png (mark wordmark)
- **Cover impact**: hook = assertion "Scaffold, Bukan Oracle" di samping hero image maze→clear path; komposisi adaptable

#### Slide 02 - Problem

- **Audience move**: "masalah yang umum" → "ini masalah nyata, terukur, dan tidak terlayani pasar"
- **Relationships**: 4 pain point paralel di kanan → market gap sebagai sintesis di bawah (Problem Clarity, bobot 20%)
- **Composition**: panel ilustrasi 60% kiri, 4 pain bullets kanan, strip gap market full-width bawah
- **Title**: Belajar mandiri — dan banyak yang gagal di tengah jalan
- **Core message**: tidak ada yang memetakan jalan career switcher; AI generik justru mempercepat cognitive offloading
- **Content**:
  - Pain 1: tidak ada roadmap personal — materi acak (YouTube, Udemy, blog) tanpa peta ke target role
  - Pain 2: progres tidak terlacak — tidak ada jawaban "sudah sejauh mana, lanjut ke apa?"
  - Pain 3: AI generik memicu cognitive offloading — langsung dijawab, tanpa belajar aktif (BJET, 694× dikutip)
  - Pain 4: alternatif mahal — bootcamp & mentor privat tidak terjangkau; kursus online one-size-fits-all
  - Market gap: upskilling global tumbuh CAGR 11–14% — hampir seluruhnya B2B/korporasi; career switcher individu tidak terlayani
- **Fact IDs**: research-papers-and-abstracts.md (BJET cognitive offloading, 694× sitasi); audit-full-report-2026-10-04.md (CAGR 11–14% upskilling)
- **Images**: problem-illustration.png (panel kiri)

#### Slide 03 - Solution

- **Audience move**: "masalahnya berat" → "ada produk dengan prinsip yang jelas: memandu, bukan menjawab"
- **Relationships**: 1 assertion → 6 langkah agent berurutan (Innovation, bobot 20%)
- **Composition**: assertion besar atas, sekuens 6 langkah sebagai deret kartu nomor, ilustrasi solution membingkai
- **Title**: Scaffold, Bukan Oracle
- **Core message**: Serambi.ai memandu learner ke jawaban — tidak menjawab untuk mereka
- **Content**:
  - Assertion: asisten belajar adaptif berbasis multi-agent AI untuk career switcher Indonesia
  - Step 1: pengguna ketik goal — "jadi data analyst dalam 3 bulan"
  - Step 2: Goal Agent memecah goal → roadmap mingguan terstruktur
  - Step 3: Tutor Agent menjelaskan konsep dengan teknik Feynman
  - Step 4: Assessment Agent: kuis adaptif + graduated hints
  - Step 5: Progress Agent: review berbasis forgetting curve individual
  - Step 6: Wellbeing Agent: pantau motivasi, cegah burnout
  - Anchor pedagogis: GenMentor · IntelliCode · Feynman Bot · spaced repetition
- **Fact IDs**: research-papers-and-abstracts.md (GenMentor FWCI 47.3; IntelliCode FWCI 23.5; Feynman Bot arXiv 2506.09055)
- **Images**: solution-illustration.png

### Part 2: Who & How (Target, Flow, Tech, Features)

#### Slide 04 - Target Pengguna & Pasar

- **Audience move**: "untuk siapa?" → "beachhead jelas, JTBD tajam, jalan revenue masuk akal"
- **Relationships**: persona primer | sekunder | market | revenue stream — 4 zona paralel (User Impact, bobot 20%)
- **Composition**: kartu persona besar kiri, 3 kartu kecil kanan (sekunder, market, revenue), quote JTBD menonjol
- **Title**: Career switcher Indonesia: 22–35, non-tech, belajar mandiri
- **Core message**: individu yang tidak terlayani pasar B2B adalah beachhead; revenue via freemium + B2B
- **Content**:
  - Persona primer: profesional 22–35, background non-tech (admin, marketing, guru) → target data analyst / backend dev / ML engineer dalam 1–6 bulan; waktu terbatas, Bahasa Indonesia, anggaran terbatas
  - JTBD: "Saya mau jadi data analyst dalam 3 bulan — sudah mulai tapi tidak tahu harus ngapain selanjutnya"
  - Sekunder: tech worker naik level / pivot domain
  - Market: OECD (2024) — kesenjangan tech skills vs output pendidikan tradisional terus melebar; upskilling CAGR 11–14% (fokus B2B); sinyal willingness-to-pay: studi Politecnico
  - Revenue: freemium (roadmap gratis; pro = kuis adaptif + spaced repetition) + B2B whitelabel (bootcamp, kampus, program reskilling Komdigi)
- **Fact IDs**: submission-draft.md (persona, JTBD); audit-full-report-2026-10-04.md (CAGR, WTP Politecnico); serambi-pitch-deck.md (OECD 2024)
- **Data class: scenario** (struktur harga freemium & tier B2B = rencana bisnis, bukan fakta)

#### Slide 05 - Cara Kerja

- **Audience move**: "produknya seperti apa?" → "alurnya sederhana: ketik goal → dapat roadmap → belajar terpandu 6 agent"
- **Relationships**: 3 langkah user berurutan di atas → strip learning journey di bawah (visualisasi alur yang sama, skala lebih lebar)
- **Composition**: 3 kartu langkah horizontal atas, strip learning-journey full-width bawah, badge verified pojok
- **Title**: 3 langkah: goal → roadmap → belajar terpandu
- **Core message**: satu goal masuk, roadmap mingguan keluar — sudah e2e verified
- **Content**:
  - Step 1: ketik goal karier — "jadi data analyst dalam 3 bulan"
  - Step 2: Serambi.ai memecah → roadmap mingguan (deadline, milestones, first action)
  - Step 3: 6 agent mendampingi belajar — Feynman, kuis adaptif, spaced repetition, wellbeing
  - Badge verified: Bob → MCP goal_decomposer → JSON roadmap 12 minggu (e2e verified)
- **Images**: learning-journey.png (strip full-width)

#### Slide 06 - AI & Teknologi

- **Audience move**: "apakah ini nyata?" → "stack terbuka & terverifikasi — kontrak sama di dev dan produksi"
- **Relationships**: 4 layer stack berhierarki (harness → flow engine → bridge → LLM) + anchor riset di bawah (Technical Execution, bobot 15%)
- **Composition**: bullets stack kiri 40%, diagram architecture kanan 60%, baris riset penuh di bawah
- **Title**: IBM Bob × Langflow × MCP — kontrak yang sama di dev dan produksi
- **Core message**: setiap agent = 1 Langflow flow = 1 MCP tool; pemanggil bisa diganti tanpa ubah flow
- **Content**:
  - IBM Bob — agent harness: build, test, verifikasi agent e2e
  - IBM Langflow — flow execution engine (tiap flow = 1 MCP tool)
  - MCP (streamable HTTP) — bridge Bob ↔ Langflow; kontrak identik saat web app produksi
  - NaraRouter / longcat-2.5 — LLM backbone (temperature 0.3)
  - Anchor riset: GenMentor (FWCI 47.3) · IntelliCode (FWCI 23.5) · Feynman Bot (arXiv 2506.09055) · Zaidi et al. (arXiv 2004.11327) · BJET (694×)
- **Fact IDs**: serambi-pitch-deck.md (stack, temperature); research-papers-and-abstracts.md (FWCI, arXiv IDs)
- **Images**: architecture-light.png (panel kanan)

#### Slide 07 - Fitur Utama

- **Audience move**: "apa yang user dapatkan?" → "5 fitur, masing-masing punya dasar riset, 1 sudah live"
- **Relationships**: 5 fitur paralel, Goal ditandai LIVE e2e (status berbeda dari 4 lainnya)
- **Composition**: 5 baris fitur kiri 55% dengan ikon, visual agent-flow kanan 45%
- **Title**: 6 agent, 5 fitur — 1 sudah live e2e
- **Core message**: setiap fitur terhubung ke paper ber-citasi tinggi
- **Content**:
  - LIVE e2e — Goal Decomposer: goal → roadmap JSON mingguan (MCP tool goal_decomposer; verified Bob → Langflow → roadmap 12 minggu)
  - Tutor (Feynman): probing questions — AI tidak menjawab langsung, memancing refleksi
  - Assessment (graduated hinting): kuis adaptif; bila salah, hint terkecil dulu (IntelliCode)
  - Progress (spaced repetition): jadwal review berbasis forgetting curve individual — +15–20% retensi (Zaidi et al.)
  - Motivator & Wellbeing: nudge kontekstual + cek burnout berkala
- **Fact IDs**: research-papers-and-abstracts.md (Zaidi et al. +15–20%; IntelliCode graduated hints)
- **Images**: agent-flow.png (panel kanan)

### Part 3: Proof & Ask (Demo, Impact+Responsible AI, Roadmap, Team)

#### Slide 08 - Prototype & Demo

- **Audience move**: "buktinya?" → "ini eksekusi sungguhan — 4 screenshot nyata, bukan mockup"
- **Relationships**: 4 screenshot berurutan (harness → canvas → endpoint → output) + 1 kesimpulan di bawah
- **Composition**: grid 2×2 screenshot berbingkai rounded penuh area konten, baris kesimpulan bawah
- **Title**: Bukti, bukan janji: agent Langflow benar-benar dieksekusi
- **Core message**: Bob memanggil MCP tool → Langflow menjalankan flow → JSON roadmap 12 minggu kembali
- **Content**:
  - [01] Bob TUI — harness dev memanggil goal_decomposer
  - [02] Canvas Langflow — flow goal_decomposer (Chat Input → Prompt → LLM → Chat Output)
  - [03] Endpoint Langflow — nama flow + deskripsi agent terkonfigurasi
  - [04] Output nyata — JSON roadmap 12 minggu (goal: data analytics)
  - Kesimpulan: "Bukan dijawab LLM Bob — agent Langflow yang dieksekusi via MCP"
- **Images**: 01-user-interface.png, 02-langflow-workflow.png, 03-langflow-endpoint.png, 04-output.png (grid 2×2 berbingkai; 4 screenshot = memenuhi syarat submission 3–5)

#### Slide 09 - Dampak & AI yang Bertanggung Jawab

- **Audience move**: "berapa nilainya, dan apakah aman?" → "dampak terukur berbasis riset + 4 guardrail responsible AI"
- **Relationships**: zona kiri 5 angka impact paralel (User Impact, 20%) ↔ zona kanan 4 guardrail paralel (Responsible AI, 10%) — kontras nilai vs keamanan
- **Composition**: split dua zona kartu 50/50; angka kiri sebagai hero number besar, guardrail kanan ikon + 2 baris
- **Title**: Dampak terukur, AI yang bertanggung jawab
- **Core message**: scaffold by design = human-centered by design; setiap angka punya sumber
- **Content**:
  - North Star: Career Goal Progress Rate ≥ 15%/minggu per pengguna aktif (target)
  - Roadmap personal: 2–4 jam riset mandiri → < 1 menit (bukti demo e2e)
  - Retensi: +15–20% vs spaced repetition tetap (Zaidi et al., arXiv 2004.11327)
  - Meta-analisis AI pada self-regulated learning: g = 1.613 (32 studi, Frontiers in Education 2025)
  - Feynman Bot: 80%+ peserta memilih metode ini vs membaca pasif (arXiv 2506.09055)
  - Target: 1.000 pengguna/bulan pada bulan ke-6 (target)
  - Guardrail 1: privasi — data progres milik user, tanpa penjualan PII
  - Guardrail 2: human-in-loop — scaffold memaksa manusia berpikir (counter cognitive offloading, BJET)
  - Guardrail 3: wellbeing — deteksi burnout + rujukan manusia, bukan nasihat medis
  - Guardrail 4: transparansi — setiap pilihan pedagogis tertaut paper terpublikasi
- **Fact IDs**: research-papers-and-abstracts.md (Zaidi +15–20%; g=1.613 Frontiers in Education 2025; Feynman 80%+); serambi-pitch-deck.md (kuadran)
- **Data class: scenario** (North Star ≥ 15%/minggu dan 1.000 pengguna/bulan = target, bukan pengukuran)

#### Slide 10 - Pengembangan ke Depan

- **Audience move**: "sejauh mana, ke mana arahnya?" → "MVP live, roadmap 3–6 bulan jelas, jalur B2B terbuka"
- **Relationships**: selesai (kiri) vs 3–6 bulan (kanan) berbanding → strip skala & moat di bawah
- **Composition**: dua kolom kartu selesai/next dengan check vs kotak kosong, strip bawah untuk B2B + skala + moat
- **Title**: MVP live — 5 agent + web app dalam 3–6 bulan
- **Core message**: arsitektur modular — tiap agent bisa dirilis dan diverifikasi terpisah
- **Content**:
  - Selesai: Goal Agent e2e verified; infra MCP + Langflow + Bob; dokumentasi + submission draft; verification scripts (flow + e2e)
  - 3–6 bulan: Tutor (Feynman) · Assessment (hinting) · Progress (spaced rep) · Motivator + Wellbeing · Web App · WhatsApp bot surface
  - B2B roadmap: whitelabel untuk bootcamp, kampus, program reskilling Komdigi — satu instansi, ribuan peserta, biaya per pengguna rendah
  - Skala teknis: Langflow Cloud multi-tenant + analytics progres
  - Moat: model forgetting curve anonim per domain
- **Fact IDs**: serambi-pitch-deck.md (selesai & roadmap); AGENTS.md (rencana 6 agent)

#### Slide 11 - Tim & Penutup

- **Audience move**: "siapa di belakangnya?" → "founder yang bisa dibuktikan: riset + implementasi nyata — cek repo langsung"
- **Relationships**: profil founder → 4 bukti paralel → closing ask (repo) sebagai resolusi
- **Composition**: profil + 4 chip bukti di atas band biru closing; band berisi logo putih + phrase penutup + link repo besar
- **Title**: Dibangun dan dibuktikan oleh satu engineer
- **Core message**: repo publik = bukti hidup — juri bisa cek langsung
- **Content**:
  - M. Muchsin — Solo Founder & Engineer
  - S2 Informatika — Universitas Negeri Semarang (UNNES) · Riset: LLM Hallucination Reduction
  - Software Engineer: Vue / Nuxt / TypeScript, SvelteKit, agentic AI
  - Bukti 1: riset mendalam — 30+ paper (abstract + DOI); topik S2 = LLM hallucination reduction
  - Bukti 2: implementasi nyata — Goal Agent e2e verified, bukan mockup
  - Bukti 3: full-stack & agentic — paham stack produksi sampai infra agent
  - Bukti 4: pedagogi berbasis bukti — tiap fitur tertaut paper ber-FWCI tinggi
  - Ask: "Silakan cek langsung: github.com/mmuchsin/serambi-ai"
  - Phrase penutup: "Belajar mandiri, tapi nggak sendirian."
- **Images**: logo-white.png (band biru closing)
- **Closing impact**: takeaway nyata = klaim yang bisa diverifikasi via link repo, bukan ucapan terima kasih

## X. Speaker Notes Requirements

- **Generation**: enabled
- **Filename**: match each SVG filename under `notes/`
- **Content**: skrip presenter bahasa Indonesia conversational ~50–70 detik per halaman; berbasis fakta dari sources (serambi-pitch-deck.md, submission-draft.md, PRD.md, research-papers-and-abstracts.md, audit-full-report-2026-10-04.md); tidak menambahkan klaim baru tanpa sumber; P08 menyertakan cue transisi demo live; P01/P11 menyertakan arahan panggung (jeda, kontak mata, tunjuk screen)
- **Total duration**: 660 detik (~11 menit untuk 11 halaman)
- **Notes style**: conversational
- **Presentation purpose**: Persuade — juri dan investor meminta demo langsung dan memeriksa repo publik
