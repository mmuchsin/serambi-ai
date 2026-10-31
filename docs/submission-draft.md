# Draft Jawaban — Form Progress Submission

**Event:** IBM SkillsBuild University Education National Hackathon (Hacktiv8 × IBM × Komdigi)
**Issue:** ISS-07 · **Dibuat:** 2026-10-03 · **Updated:** 2026-10-30 (AI Literacy Pivot) · **Status:** 🟡 Draft siap copy-paste

> Cara pakai: setiap bagian di bawah sudah disusun agar bisa langsung ditempel ke field yang bersesuaian di form. Field bertanda **[UPLOAD]** tidak bisa dijawab lewat teks — ada instruksi terpisah di akhir dokumen.
>
> Aturan kejujuran submission: ditulis sebagai *progress submission* — Goal Agent ditandai **✅ live/e2e verified**, agent lain ditandai **🔜 dalam pengembangan**. Jangan mengklaim semua agent sudah live.
>
> **Aturan antarmuka:** Bob TUI = **agent harness pengembangan** (build, test, verifikasi e2e). UI pengguna akhir = **web app** (`apps/`), dalam pengembangan. Jangan pernah menyebut Bob sebagai UI pengguna akhir di form.

---

## 1. Judul Project

> **Serambi.ai — AI Literacy Navigator untuk Profesional Non-Teknis Indonesia**

*Alternatif lebih pendek (jika form membatasi karakter):* `Serambi.ai — Navigator AI Literacy untuk Profesional Non-Teknis`

---

## 2. Tema Project

> ☑️ **Education & Future of Work** / **AI for Social Good** / **Digital Skills & Reskilling**

---

## 3. Deskripsi Singkat Project (150–300 kata)

> Serambi.ai adalah asisten belajar adaptif berbasis multi-agent AI yang membantu profesional non-teknis Indonesia (guru, pemilik UMKM, staf ekspor-impor, dokter, akuntan, admin, HR, content creator, pemasaran digital, aparatur publik) mengadopsi AI untuk profesi mereka — **bukan** untuk beralih karier ke teknologi.
>
> Masalah yang diselesaikan: profesional non-teknis sadar AI penting tapi **bingung mau belajar apa dan mulai dari mana**. Kursus AI umumnya terlalu teknis (coding, ML), ChatGPT terlalu terbuka (oracle — langsung jawab tanpa struktur), dan tidak ada panduan personal yang menyesuaikan profesi + hobi + level + jadwal mereka. Akibatnya: waktu terbuang, progres tidak terlacak, banyak yang menyerah sebelum merasakan manfaat AI di kerja nyata.
>
> Solusi Serambi.ai menggunakan arsitektur multi-agent. Pengguna menjawab 4 pertanyaan singkat (profesi, hobi, level, jam belajar/minggu) dan menerima **roadmap AI literacy 12 minggu personal** dengan sumber kredibel per milestone. Agent spesialis dibangun di IBM Langflow dan diekspos sebagai MCP tool: Goal Decomposer (roadmap), Tutor (Feynman + analogi profesi), Assessment (quiz adaptif + graduated hinting), Progress (spaced repetition), Motivator (nudge personal), Wellbeing (burnout check-in). Bob — AI agent harness IBM — dipakai tim sebagai harness pengembangan: membangun, menguji, verifikasi e2e. Setiap desain pedagogis dilandasi riset: AI = adaptive scaffold, bukan oracle.
>
> Manfaat: roadmap personal & actionable, belajar efisien karena disesuaikan konteks kerja, progres terukur, risiko burnout berkurang. Saat ini Goal Agent sudah terverifikasi end-to-end via MCP (Bob → Langflow); 5 agent lain dalam pengembangan.

*(Word count terverifikasi: ~240 kata — di dalam rentang 150–300.)*

---

## 4. Problem Statement

**Kondisi sebelum ada solusinya.**

Profesional non-teknis Indonesia yang ingin mengadopsi AI untuk profesi mereka menghadapi:

- **Tidak ada roadmap personal.** Kursus AI umumnya teknis (coding, ML, data science). Guru butuh tahu cara buat soal otomatis & kurikulum; UMKM butuh tahu cara buat konten marketing & analisis pelanggan; ekspor-impor butuh tahu cara baca dokumen bahasa asing & cek regulasi. Materi diambil dari sumber acak tanpa dipetakan ke kebutuhan profesi spesifik.
- **Progres tidak terlacak.** Tidak ada mekanisme untuk menjawab "sudah sejauh mana saya dan harus lanjut ke apa", sehingga motivasi dan momentum belajar hilang.
- **Tidak ada feedback loop pedagogis.** Belajar menjadi pasif membaca/menonton. Riset menunjukkan AI generik malah memicu *cognitive offloading* — pengguna terbiasa langsung diberi jawaban (Metacognitive Laziness, BJET, DOI 10.1111/bjet.13544, dikutip 700+ kali) — sehingga pemahaman dan keterampilan tidak benar-benar terbentuk.
- **Alternatif tidak cocok.** Bootcamp AI mahal & teknis; kursus online kurikulum tetap; ChatGPT jadi oracle tanpa struktur belajar.

**Mengapa masalah ini penting untuk diselesaikan.**

Indonesia top dunia **pengguna AI** tapi jauh tertinggal **pengembang AI** (Jakarta Post, Juli 2025). Kementerian Komunikasi dan Digital memproyeksikan kebutuhan 9 juta talenta digital sampai 2030, baru ~30% terpenuhi. Hambatan utama: **kurang keterampilan digital** (57% pelaku usaha, AWS Agustus 2025). Talenta AI tumbuh dari ~28.000 (2019) ke 96.000 (2024, Kompas), target Peta Jalan AI Nasional: 100.000/tahun. Riset AWS: adopsi AI bisnis naik 47% YoY ke 28% pelaku usaha (18 juta). Kesenjangan bukan minat, tapi kemampuan — profesional non-teknis mayoritas, tapi minim dukungan adaptif untuk adopsi AI di kerja nyata. Serambi.ai menempati sisi *supply* skill: AI literacy personal per profesi.

**Versi paragraf siap copy-paste:**

Profesional non-teknis Indonesia yang ingin mengadopsi AI untuk profesi mereka menghadapi empat masalah utama. Pertama, tidak ada roadmap personal — kursus AI umumnya teknis (coding, ML), padahal guru butuh buat soal otomatis, UMKM butuh konten marketing, ekspor-impor butuh baca dokumen bahasa asing; materi diambil dari sumber acak tanpa dipetakan ke kebutuhan profesi spesifik. Kedua, progres tidak terlacak — tidak ada mekanisme untuk menjawab "sudah sejauh mana saya dan harus lanjut ke apa", sehingga motivasi dan momentum belajar hilang. Ketiga, tidak ada feedback loop pedagogis — belajar menjadi pasif, dan riset menunjukkan AI generik memicu cognitive offloading (Metacognitive Laziness, BJET, dikutip 700+ kali) sehingga pemahaman dan keterampilan tidak benar-benar terbentuk. Keempat, alternatif tidak cocok — bootcamp AI mahal & teknis; kursus online kurikulum tetap; ChatGPT jadi oracle tanpa struktur belajar. Masalah ini penting karena Indonesia top dunia pengguna AI tapi jauh tertinggal pengembang AI (Jakarta Post, Juli 2025). Komdigi proyeksikan kebutuhan 9 juta talenta digital 2030, baru ~30% terpenuhi. Hambatan utama: kurang keterampilan digital (57% pelaku usaha, AWS Agustus 2025). Talenta AI tumbuh dari ~28.000 (2019) ke 96.000 (2024), target 100.000/tahun. Adopsi AI bisnis naik 47% YoY ke 28% pelaku usaha (18 juta). Kesenjangan bukan minat, tapi kemampuan — profesional non-teknis mayoritas, tapi minim dukungan adaptif untuk adopsi AI di kerja nyata. Serambi.ai menempati sisi supply skill: AI literacy personal per profesi.

---

## 5. Target User

**Pengguna utama (primer): profesional non-teknis Indonesia yang mau adopsi AI untuk profesi mereka.**

- **Profesi:** guru, pemilik UMKM, staf ekspor-impor, dokter/paramedik, akuntan/keuangan, admin/sekretaris, HR/rekrutmen, content creator, pemasaran digital, aparatur publik
- **Usia:** 25–50
- **Teknis:** minimal (bisa pakai WhatsApp, email, browser)
- **Bahasa:** Indonesia (native)
- **Device:** mobile-first (HP Android/iOS), kadang laptop kantor
- **Waktu:** 3–10 jam/minggu di luar jam kerja
- **Motivasi:** efisiensi kerja, tidak ketinggalan, naik gaji/jabatan, mengurangi beban manual
- **Job-to-be-done (kata pengguna):** *"Saya guru SD, suka membaca, level pemula, 5 jam/minggu. Bantu saya belajar AI untuk bikin soal otomatis, rencana pelajaran, dan newsletter kelas — nggak mau coding, mau yang langsung pakai di kerja."*

**Pengguna sekunder: pekerja entry-level tech yang ingin AI literacy** (misal junior developer mau paham AI untuk fitur produk) — butuh belajar efisien di sela full-time.

**Pengguna berikutnya (fase B2B):** kampus, bootcamp, program reskilling Komdigi/Kemendikbud, perusahaan yang mau upskill karyawan non-teknis massal.

**Versi paragraf siap copy-paste:**

Pengguna utama Serambi.ai adalah profesional non-teknis Indonesia — guru, pemilik UMKM, staf ekspor-impor, dokter, akuntan, admin, HR, content creator, pemasaran digital, aparatur publik — usia 25–50, teknis minimal, mobile-first, waktu 3–10 jam/minggu, motivasi efisiensi kerja dan naik gaji/jabatan. Job-to-be-done: "Saya guru SD, suka membaca, level pemula, 5 jam/minggu. Bantu saya belajar AI untuk bikin soal otomatis, rencana pelajaran, dan newsletter kelas — nggak mau coding, mau yang langsung pakai di kerja." Pengguna sekunder adalah pekerja entry-level tech yang ingin AI literacy untuk fitur produk. Pengguna berikutnya fase B2B adalah kampus, bootcamp, program reskilling Komdigi/Kemendikbud, dan perusahaan yang mau upskill karyawan non-teknis massal.

---

## 6. Mengapa Solusi Ini Dibutuhkan?

| Cara saat ini | Kelemahannya | Bedanya Serambi.ai |
|---|---|---|
| Kursus AI teknis (Dicoding, bootcamp AI, Coursera ML) | Terlalu teknis (coding, model training), tidak relevan untuk non-teknis | Roadmap **personal non-teknis** yang dipetakan dari profesi + hobi + level + jadwal |
| Chatbot AI generik (ChatGPT, Gemini, Copilot) | Menjadi *oracle* — langsung jawab, tanpa struktur belajar, tanpa memori progres, memicu ketergantungan | **Scaffold, bukan oracle**: graduated hinting + probing questions memancing refleksi (dilandasi riset) |
| Belajar sendiri YouTube/blog/artikel | Tidak terstruktur, progres tidak terukur, sumber tidak terverifikasi kredibilitasnya | Progres terlacak, ulasan dijadwalkan adaptif, **sumber kredibel curated per profesi** |
| Workshop 1-2 hari / webinar | Terlalu singkat, tidak ada follow-up, tidak personal | Pendampingan 12 minggu berkelanjutan dengan agent specialist |

**Empat keunggulan utama:**

1. **Adaptif & profession-first.** Setiap respons diarahkan ke profesi + konteks kerja user — bukan goal switching carrière. Pola goal-anchored terbukti GenMentor (goal-to-skill mapping, 2025 — DOI 10.1145/3701716.3715244).
2. **Dilandasi riset, bukan intuisi.** Teknik Feynman (learning gains vs passive re-reading; Feynman Bot, IEEE TALE 2024), graduated hinting (IntelliCode FWCI 23.5), spaced repetition adaptif (forgetting-curve model, Zaidi et al., AIED 2020 — arXiv 2004.11327), anti-cognitive-offloading (BJET 2024, cited 700+).
3. **Bahasa Indonesia & konteks lokal kerja.** Sumber curated dari resmi (Kemdikbud, Kominfo, bank sentral, asosiasi profesi) + komunitas terpercaya.
4. **Arsitektur modular (Bob × Langflow × MCP).** Setiap agent = 1 Langflow flow → 1 named MCP tool. Dikembangkan, diuji, diganti independen. Harness dev (Bob) → production (web app) same contract.

**Versi paragraf siap copy-paste:**

Serambi.ai dibutuhkan karena cara yang digunakan saat ini memiliki kelemahan yang sama-sama tidak terpecahkan. Kursus AI teknis (Dicoding, bootcamp AI, Coursera ML) terlalu teknis — coding, model training — tidak relevan untuk non-teknis, sedangkan Serambi.ai menyediakan roadmap personal non-teknis yang dipetakan dari profesi + hobi + level + jadwal. Chatbot AI generik (ChatGPT, Gemini, Copilot) menjadi oracle — langsung jawab tanpa struktur belajar dan tanpa memori progres, memicu ketergantungan — sedangkan Serambi.ai menerapkan scaffold, bukan oracle, dengan graduated hinting dan probing questions yang memancing refleksi berdasarkan riset. Belajar sendiri dari YouTube/blog/artikel tidak terstruktur, progres tidak terukur, sumber tidak terverifikasi, sedangkan Serambi.ai melacak progres, menjadwalkan ulasan adaptif, dan menyediakan sumber kredibel curated per profesi. Workshop 1-2 hari/webinar terlalu singkat, tidak ada follow-up, tidak personal, sedangkan Serambi.ai mendampingi 12 minggu berkelanjutan dengan agent specialist. Empat keunggulan utama: pertama, adaptif dan profession-first — setiap respons diarahkan ke profesi + konteks kerja user, pola goal-anchored terbukti GenMentor (goal-to-skill mapping, 2025 — DOI 10.1145/3701716.3715244); kedua, dilandasi riset — teknik Feynman (Feynman Bot, IEEE TALE 2024), graduated hinting (IntelliCode FWCI 23.5), spaced repetition adaptif (forgetting-curve model, Zaidi et al., AIED 2020 — arXiv 2004.11327), anti-cognitive-offloading (BJET 2024, cited 700+); ketiga, bahasa Indonesia & konteks lokal kerja — sumber curated dari resmi (Kemdikbud, Kominfo, bank sentral, asosiasi profesi) + komunitas terpercaya; keempat, arsitektur modular (Bob × Langflow × MCP) — setiap agent 1 Langflow flow → 1 named MCP tool, dikembangkan/diuji/diganti independen, harness dev (Bob) → production (web app) kontrak sama.

---

## 7. Fitur Utama Project

**1. Goal Decomposer Agent — memecah profesi + konteks → roadmap AI literacy 12 minggu ✅ live (e2e verified)**
Menerima: `profession` (guru/umkm/ekspor_impor/dll), `hobbies[]`, `level` (pemula/menengah/mahir), `weekly_hours` (1-20). Menghasilkan roadmap JSON 12 minggu: `theme`, `objectives[]`, `key_concepts[]`, `practice`, `resources[]` (title, url, type, credibility), `estimated_hours` per milestone. Terimplementasi MCP tool `goal_decomposer`; diverifikasi end-to-end Bob → Langflow.

**2. Tutor Agent — penjelasan konsep teknik Feynman + analogi profesi 🔜 dalam pengembangan**
Jelaskan konsep AI sesuai level user dengan teknik Feynman: AI ajukan probing questions untuk identifikasi miskonsepsi, berikan analogi dari profesi user (contoh: "prompt engineering itu kayak bikin rencana pelajaran yang detail buat siswa"), bukan langsung jawab.

**3. Assessment Agent — kuis adaptif dengan graduated hinting 🔜 dalam pengembangan**
Buat kuis per milestone; kalau salah, hint bertahap — petunjuk terkecil dulu (misal: "coba perhatikan kata kunci di prompt"), bukan jawaban langsung. Self-assessment confidence rating per soal.

**4. Progress Agent — penjadwal ulasan spaced repetition 🔜 dalam pengembangan**
Lacak progres per konsep, jadwal ulasan berbasis forgetting curve individual. Materi baru di-review tepat sebelum terlupakan.

**5. Motivator Agent — nudge personal berbasis jadwal & progres 🔜 dalam pengembangan**
Kirim pengingat dengan next action konkret (bukan pesan generik "semangat belajar!"), timing disesuaikan jadwal user.

**6. Wellbeing Agent — burnout/engagement check-in mingguan 🔜 dalam pengembangan**
Check-in singkat mingguan, adjust beban belajar kalau tanda burnout terdeteksi.

> Jika form hanya menerima fitur live, isi fitur #1 saja sebagai "MVP live" dan sebut sisanya di *Potensi Pengembangan*.

**Versi paragraf siap copy-paste:**

Fitur utama Serambi.ai adalah Goal Decomposer Agent yang memecah profesi + konteks personal menjadi roadmap AI literacy 12 minggu — fitur ini sudah live dan terverifikasi end-to-end. Fitur ini menerima: profession (guru/umkm/ekspor_impor/dll), hobbies[], level (pemula/menengah/mahir), weekly_hours (1-20). Menghasilkan roadmap JSON 12 minggu dengan theme, objectives[], key_concepts[], practice, resources[] (title, url, type, credibility), estimated_hours per milestone. Terimplementasi MCP tool goal_decomposer, diverifikasi end-to-end Bob → Langflow. Fitur kedua: Tutor Agent — penjelasan konsep teknik Feynman + analogi profesi, AI ajukan probing questions identifikasi miskonsepsi, berikan analogi dari profesi user (contoh: "prompt engineering kayak bikin rencana pelajaran detail buat siswa"), bukan langsung jawab. Fitur ketiga: Assessment Agent — kuis adaptif per milestone, graduated hinting (petunjuk terkecil dulu, bukan jawaban langsung), self-assessment confidence. Fitur keempat: Progress Agent — penjadwal ulasan spaced repetition berbasis forgetting curve individual. Fitur kelima: Motivator Agent — nudge personal dengan next action konkret, timing disesuaikan jadwal user. Fitur keenam: Wellbeing Agent — burnout/engagement check-in mingguan, adjust beban belajar kalau tanda burnout terdeteksi. Pengguna akhir memakai web app (apps/, dalam pengembangan); Bob TUI = agent harness pengembangan (build, test, verifikasi e2e) — bukan antarmuka pengguna akhir.

---

## 8. Alur Penggunaan Project

**Alur MVP (terverifikasi end-to-end):**

```
User Input (4 pertanyaan)  →  Web App (Nuxt 4 PWA)  →  Backend Orchestrator  →  MCP Bridge  →  Langflow  →  Output
"Saya guru,      →   antarmuka         →  intent → pilih agent →  streamable HTTP  →  menjalankan flow  →  roadmap JSON
 suka membaca,              pengguna akhir     call MCP tool       (x-api-key)       goal_decomposer      12 minggu
 level pemula,                                       (goal_decomposer)                       (Chat Input →
 5 jam/minggu"                                                               Prompt → LLM →
                                                                             Chat Output)
                                                                              ↓
User Action: simpan roadmap → kerjakan milestone 1 → kembali ke web app
             untuk penjelasan konsep / kuis / cek progres / check-in wellbeing
```

**Alur lengkap (target):**

1. **User Input** — user jawab 4 pertanyaan (profesi, hobi, level, jam/minggu) di web app.
2. **Web App** — Nuxt 4 PWA, menampilkan roadmap, progres, milestone, sesi belajar.
3. **Backend Orchestrator** — parse intent, pilih agent, call MCP tool. Pola (intent → agent → tool call) diverifikasi di Bob dulu, lalu direplikasi.
4. **MCP Bridge** — tool call ke Langflow (streamable HTTP + header `x-api-key`).
5. **Langflow** — jalankan flow agent: susun prompt, panggil LLM, return hasil terstruktur.
6. **Output ke User** — web app tampilkan roadmap 12 minggu + resources kredibel.
7. **User Action** — simpan roadmap, kerjakan milestone, balik interaksi: Feynman explain, quiz, progress review, wellbeing check-in — close learning loop.

**Versi paragraf siap copy-paste:**

Alur penggunaan dimulai ketika pengguna menjawab 4 pertanyaan (profesi, hobi, level, jam/minggu) di web app Nuxt 4 PWA, misalnya "Saya guru, suka membaca, level pemula, 5 jam/minggu". Web app meneruskan ke backend orchestrator yang memahami intent dan memanggil MCP tool `goal_decomposer` via MCP bridge (streamable HTTP, header `x-api-key`). Langflow menjalankan flow: susun prompt, panggil LLM, kembalikan JSON roadmap 12 minggu terstruktur. Web app menampilkan roadmap beserta sumber kredibel per milestone. Pengguna menyimpan roadmap, mengerjakan milestone, lalu kembali berinteraksi untuk penjelasan konsep Feynman, kuis adaptif, cek progres, atau check-in wellbeing — menutup loop belajar. Pola orkestrasi (intent → agent → tool call) diverifikasi end-to-end di Bob sebagai harness pengembangan, lalu direplikasi di backend web app.

---

## 9. Penggunaan IBM Langflow

**Flow produksi:** `goal_decomposer` (endpoint name `goal_decomposer`, file: [`flows/goal_decomposer.json`](../flows/goal_decomposer.json)), di-host Langflow Docker `http://localhost:7860`, diekspos via MCP endpoint `.../api/v1/mcp/project/<project-id>/streamable` sebagai named tool. 5 flow lain direncanakan kontrak sama.

**Node/component:**

| Node | Fungsi | Konfigurasi penting |
|---|---|---|
| **Chat Input** | Terima input user dari playground/API | Input `profession`, `hobbies`, `level`, `weekly_hours` |
| **Prompt Template** | Susun instruksi LLM | System prompt: *"You are an AI Learning Navigator helping non-technical professionals in Indonesia..."*; variabel `{profession}`, `{hobbies}`, `{level}`, `{weekly_hours}`, `{resources_json}`; instruksi output **hanya JSON valid** schema roadmap 12 minggu + `resources[]` dari JSON curated |
| **Language Model** | Mesin reasoning | OpenAI-compatible endpoint, `temperature = 0.3` (stabilkan structured output) |
| **Chat Output** | Kembalikan respons ke pemanggil | JSON roadmap diteruskan sebagai tool result |

**Input & output:**
Input: 4 field (profesi, hobi, level, jam/minggu). Output: JSON roadmap 12 minggu + `resources[]` dari curated JSON.

**Proses AI Agent:**
Flow terjemahkan profesi + konteks → komponen terukur (minggu, urutan materi, deliverable, sumber). Prompt JSON schema ketat + temperature rendah → keluaran reliable untuk downstream agent.

**Fungsi Langflow:**
Mesin eksekusi domain: tiap agent spesialis = 1 flow di canvas, testable di Playground, **di-expose sebagai named MCP tool**. Logika pedagogis terisolasi, versionable, ganti tanpa ubah pemanggil. Karena MCP, konsumen bebas: Bob (dev) hari ini, web app (prod) besok — kontrak identik.

**Versi paragraf siap copy-paste:**

Satu flow produksi `goal_decomposer` dibuat di IBM Langflow (Docker, `http://localhost:7860`) dan diekspos via MCP endpoint sebagai tool bernama. Flow 4 node: Chat Input terima `profession`, `hobbies`, `level`, `weekly_hours`; Prompt Template susun instruksi LLM dengan system prompt "You are an AI Learning Navigator helping non-technical professionals in Indonesia..." dan variabel `{profession}`, `{hobbies}`, `{level}`, `{weekly_hours}`, `{resources_json}` serta instruksi output hanya JSON valid schema roadmap 12 minggu + `resources[]` dari curated JSON; Language Model pakai endpoint OpenAI-compatible `temperature = 0.3` (base URL, model, API key di env); Chat Output kembalikan JSON roadmap sebagai tool result. Input: 4 field profesi+hobi+level+jam. Output: JSON roadmap 12 minggu + resources[] dari curated JSON. Flow terjemahkan profesi+konteks → komponen terukur dengan prompt schema-ketat + temperature rendah agar reliable untuk downstream agent. 5 flow lain (Tutor, Assessment, Progress, Motivator, Wellbeing) rencana kontrak sama.

---

## 10. Penggunaan IBM Bob

**Fungsi:** Bob = **AI agent harness** untuk **lingkungan pengembangan**: bangun flow, uji integrasi, verifikasi e2e tiap agent sebelum connect ke UI user. **Bob TUI bukan antarmuka pengguna akhir** — user pakai web app. Bob jalan di workspace proyek → auto pakai config `.bob/mcp.json`.

**Proses via Bob:**
1. Terima instruksi natural dari tim pengembang
2. Reasoning tentukan flow/agent butuh dibangun/diuji
3. Call MCP tool Langflow langsung (`mcp__lf-serambi_ai__goal_decomposer`) — buktiin agent benar-benar jalan & kontrak I/O valid, bukan jawab dari LLM Bob sendiri
4. Uji output agent (JSON roadmap 12 minggu), jadikan spec untuk backend web app: struktur data, error handling, urutan orkestrasi
5. Pakai 83 skill proyek (PM: phuryn/pm-skills, engineering, `diagram-design`, custom `pitch-deck`) untuk value prop, north-star, pitch deck, submission docs

**Interaksi Bob + sistem:**
Via config MCP proyek: server `lf-serambi_ai` (mcp-proxy, transport `streamablehttp`, header `x-api-key` = `LANGFLOW_API_KEY`) connect Bob ke Langflow MCP. Bob auto-discovery tool → flow Langflow jadi named tools callable.

**Output:** Verifikasi e2e kontrak MCP: Bob call `goal_decomposer` → Langflow return JSON roadmap 12 minggu. Kontrak ini dipakai backend web app — tanpa ubah flow Langflow.

**Versi paragraf siap copy-paste:**

Bob adalah AI agent harness untuk lingkungan pengembangan — bangun flow, uji integrasi, verifikasi e2e tiap agent sebelum connect ke UI user. Bob TUI bukan antarmuka pengguna akhir; user pakai web app. Bob jalan di workspace proyek → auto pakai config .bob/mcp.json. Proses: 1) terima instruksi natural tim; 2) reasoning tentukan flow/agent; 3) call MCP tool Langflow langsung (mcp__lf-serambi_ai__goal_decomposer) — buktiin agent jalan & kontrak I/O valid; 4) uji output (JSON roadmap 12 minggu), jadikan spec backend web app (struktur data, error handling, orkestrasi); 5) pakai 83 skill proyek (PM phuryn/pm-skills, engineering, diagram-design, custom pitch-deck) untuk value prop, north-star, pitch deck, submission. Bob interaksi via config MCP: server lf-serambi_ai (mcp-proxy streamablehttp, header x-api-key = LANGFLOW_API_KEY) connect Bob ke Langflow. Bob auto-discovery tool → flow Langflow jadi named tools callable. Output: verifikasi e2e kontrak MCP — Bob call goal_decomposer, Langflow return JSON roadmap 12 minggu. Kontrak ini dipakai backend web app tanpa ubah flow Langflow.

---

## 11. Bagaimana IBM Langflow dan IBM Bob Terintegrasi?

**Peran masing-masing:**
- **Langflow:** jalanin *logika domain*. Flow `goal_decomposer` = tempat instruksi pedagogik, prompt, panggilan LLM dieksekusi, output terstruktur (JSON) konsisten, testable di Playground.
- **Bob:** **agent harness pengembangan**. Bangun flow, uji named tool, buktiin kontrak MCP e2e. Pola orkestrasi (intent parsing → pilih agent → tool call → presentasi) dirancang & divalidasi di sini dulu.
- **Web app:** antarmuka user akhir. Backend call **MCP tool yang persis sama** seperti Bob, tampilkan hasil sebagai pengalaman belajar utuh.

**Data flow:**

```
User ──1. request (web app UI)──▶ Web App Backend
    ◀──── 4. tampil roadmap ────────┘
Web App Backend ──2. MCP tool call (JSON-RPC streamable HTTP, x-api-key)──▶ Langflow
              ◀─────────── 3. tool result: JSON roadmap (profession, roadmap[12], resources[])
```

Sama di Bob saat dev: Bob → MCP → Langflow → JSON response. Setiap flow = **named MCP tool** (kontrak: nama deskriptif, I/O terdefinisi). Itu "lem" integrasinya: kontrak tool = antarmuka resmi antara lapisan aplikasi & eksekusi agent → ganti pemanggil Bob → web app **tanpa ubah 1 baris pun di Langflow**.

**Output akhir:** User via web app terima **roadmap AI literacy 12 minggu personal + sumber kredibel** — hasil kolaborasi web app (UI + orkestrasi) + Langflow (eksekusi agent + LLM). Integrasi Bob × Langflow terverifikasi hari ini = fondasi kontrak web app besok.

**Versi paragraf siap copy-paste:**

IBM Langflow dan IBM Bob terintegrasi dalam satu rantai, web app jadi konsumen produksi kontrak yang sama. Langflow jalanin logika domain — flow goal_decomposer tempat instruksi pedagogik, prompt, panggilan LLM dieksekusi, output terstruktur JSON konsisten testable di Playground. Bob = agent harness pengembangan — bangun flow, uji named tool, buktiin kontrak MCP e2e. Pola orkestrasi (intent parsing → pilih agent → tool call → presentasi) dirancang divalidasi di sini. Web app = antarmuka user akhir — backend call MCP tool persis sama seperti Bob, tampilkan hasil sebagai pengalaman belajar utuh. Data flow: user kirim request web app UI → web app backend → MCP tool call (streamable HTTP, x-api-key) → Langflow → tool result JSON roadmap → web app backend → tampilkan ke user. Saat dev, urutan sama diverifikasi di Bob: Bob → MCP → Langflow → JSON. Setiap flow = named MCP tool (kontrak: nama deskriptif, I/O terdefinisi). Itu "lem" integrasinya: kontrak tool jadi antarmuka resmi antara lapisan aplikasi & eksekusi agent — ganti pemanggil Bob ke web app tidak ubah 1 baris pun di Langflow. Output akhir: user via web app terima roadmap AI literacy 12 minggu personal + sumber kredibel — kolaborasi web app (antarmuka + orkestrasi) + Langflow (eksekusi agent + LLM). Integrasi Bob × Langflow terverifikasi hari ini jadi fondasi kontrak web app besok.

---

## 12. Project File / Link **[UPLOAD / LINK]**

**Repository publik:** `https://github.com/mmuchsin/serambi-ai`

| File | Bagi Reviewer |
|---|---|
| `README.md` | Ringkasan solusi, arsitektur, quick start, status agent |
| `docs/PRD.md` | Product requirements v2.0 (AI literacy pivot), arsitektur, tabel agent, research grounding |
| `research/research-papers-and-abstracts.md` | 30+ paper dengan abstract, sitasi, DOI/link |
| `flows/goal_decomposer.json` | Export flow Langflow importable & replicable |
| `.bob/mcp.json` | Konfigurasi Bob → Langflow via MCP |
| `docs/business/` | Value proposition, north-star, competitive, GTM, SDG |
| `apps/web/` | Nuxt 4 PWA source code |
| `resources/ai-learning-resources.json` | Curated credible URLs per profesi/topic |

> Sebelum submit: pastikan repo **public**, README tampil benar. Jika form minta 1 file docs, buat PDF gabungan README + PRD (atau pitch deck) dan upload.

---

## 13. Pitching Deck **[UPLOAD]**

**Status: ✅ Selesai (2026-10-30 updated for AI literacy pivot)** — dibangun dengan skill `ppt-master` (Default route), 11 slide native DrawingML (editable), include speaker notes.

**File:** `slides/serambi-pitch-deck.pptx` + `slides/serambi-pitch-deck.pdf`

**Struktur 11 slide (updated for pivot):**

1. **Cover** — Serambi.ai, tagline *"AI Literacy untuk Profesi Anda"* + partner logos (IBM, hacktiv8, komdigi)
2. **Problem** — 4 pain points: kursus AI terlalu teknis, ChatGPT jadi oracle, belajar sendiri tidak terstruktur, workshop terlalu singkat + market gap (Indonesia top AI use, bottom AI dev; 9jt talenta butuh, 30% terpenuhi; 57% keluh keterampilan digital)
3. **Solution** — 6 agent steps + research anchors (GenMentor, Feynman Bot, IntelliCode, Zaidi, BJET)
4. **Target User** — 10 profesi non-teknis (guru, UMKM, ekspor-impor, dokter, akuntan, admin, HR, content creator, digital marketing, aparatur), JTBD, B2B segmen (kampus, bootcamp, Komdigi, korporat)
5. **How It Works** — 4 pertanyaan → roadmap 12 minggu + sumber kredibel → 5 agent pendamping → e2e verified
6. **Technology** — 4-layer stack (Bob, Langflow, MCP, LLM provider) + architecture diagram
7. **Features** — 6 agent, Goal Decomposer LIVE e2e, 5 planned
8. **Prototype** — 4 screenshots (Bob TUI, Langflow canvas, endpoint, JSON output) + web app preview
9. **Impact** — North Star: AI Literacy Adoption Rate ≥15%/minggu; 5 angka dampak; positioning vs Astra AI, ailene.id, Ruangguru, ChatGPT, Coursera
10. **Roadmap** — Stage 1 (hackathon): Goal Agent live, web app deploy, demo video; Stage 2: 5 agent + RAG + B2B whitelabel + PWA polish
11. **Team & Closing** — M. Muchsin, 4 bukti kredibilitas, repo link

**Speaker notes:** 11 file di `projects/serambi-pitch-deck-v2_20261004/notes/` (01–11), total ~10–12 menit.

---

## 14. Project / Prototype Screenshot **[UPLOAD]**

Empat screenshot siap pakai; salinan nama form di `submission/screenshots/` (semua < 350 KB, aman limit 10 MB):

| Nama file form | Isi | Sumber asli |
|---|---|---|
| `01-user-interface.png` | Agent harness pengembangan (Bob TUI): sesi kerja struktur repo & pemanggilan MCP tool — **antarmuka pengembang, bukan UI user akhir** | `Screenshot 2026-10-03 150309.png` |
| `02-langflow-workflow.png` | Canvas Langflow: flow `goal_decomposer` 4 node — Chat Input → Prompt Template → Language Model → Chat Output | `Screenshot 2026-10-03 124609.png` |
| `03-langflow-endpoint.png` | Pengaturan endpoint Langflow: nama flow `goal_decomposer` + deskripsi agent | `Screenshot 2026-10-03 124806.png` |
| `04-output.png` | Output nyata: JSON roadmap 12 minggu AI literacy (profesi guru) dari flow `goal_decomposer` | `Screenshot 2026-10-03 113405.png` |

**Rekomendasi opsional ke-5:** tangkap momen agent call `mcp__lf-serambi_ai__goal_decomposer` sebelum hasil muncul — bukti kuat agent Langflow benar-benar dipanggil.

> **Catatan kejujuran:** web app (UI user akhir) masih dalam pengembangan. Jelaskan ke juri: `01` = harness pengembangan (Bob); `02`–`04` = workflow Langflow & output agent nyata. Tambah screenshot web app begitu tersedia.

---

## 15. Dampak yang Dihasilkan

Target indikator terukur (MVP e2e verified; metrik produk diukur setelah rilis):

- **Waktu penyusunan roadmap AI literacy personal: dari ±2–4 jam riset mandiri → <1 menit** — otomatis, terbukti verifikasi e2e: Bob → MCP → Langflow. *(Sumber: e2e verification 2026-10-03, `verify-e2e.sh` PASS)*
- **AI Literacy Adoption Rate (North Star) ≥ 15%/minggu per pengguna aktif** — didefinisikan: milestone selesai per minggu / total milestone di roadmap. *(Target produk, diukur setelah rilis)*
- **Retensi belajar +15–20%** vs jadwal spaced repetition tetap (target berbasis Zaidi et al., arXiv 2004.11327) via Progress Agent. *(Catatan jujur: angka target produk, bukan angka paper)*
- **Target jangkauan: 1.000 pengguna/bulan** pada 6 bulan pertama pasca rilis (web app + komunitas hackathon). *(Target bisnis, diukur pasca rilis)*
- **Mengurangi pekerjaan manual** tak terhitung: riset kurikulum, cari materi, perencanaan ulang belajar. *(Estimasi alur manual professional non-teknis)*
- **Mengurangi risiko burnout/putus belajar** via Wellbeing & Motivator Agent (indikator: user kembali belajar dalam 7 hari). *(Target produk, diukur pasca rilis)*
- **Keterkaitan agenda nasional.** Memetakan ke SDG target 4.3 (pendidikan teknis/vokasi terjangkau non-formal), 4.4 (keterampilan teknis relevan), 8.2 (produktivitas), 8.6 (kurangi NEET) — Indonesia review di Voluntary National Review 2025. *(Catatan jujur: metrik produk bukan indikator statistik resmi SDG; pengukuran SDG tugas negara. Detail: `docs/business/sdg-alignment.md`)*

---

## 16. Potensi Pengembangan & Skalabilitas

- **Web app sebagai produksi.** `apps/web` = UI user akhir; backend pakai kontrak MCP sama yg terverifikasi → agent siap dipakai user. Bob tetap harness dev untuk agent baru.
- **Permukaan tambahan.** Chatbot WhatsApp di atas backend sama; state belajar terpusat → user pindah device tanpa kehilangan progres.
- **Domain & bahasa.** Perluas ke sertifikasi lain (finance, kesehatan, pemerintahan) & bahasa lain — cukup ganti prompt + dataset mapping per flow.
- **B2B / institusional.** Whitelabel untuk bootcamp, kampus, program reskilling (alumni Hacktiv8, Komdigi): 1 instansi, ribuan peserta, cost/learner rendah.
- **Ekosistem integrasi.** Integrasi ke platform kursus (rekomendasi materi per milestone) & job board (skill → lowongan relevan) — roadmap jadi peta kompetisi & karier.
- **Skala teknis.** Langflow Cloud multi-tenant + dashboard analytics (progress, tingkat kesulitan, retensi) untuk pengelola instansi; model kurva lupa anonim per domain = data moat jangka panjang.

**Versi paragraf siap copy-paste:**

Web app (apps/) adalah antarmuka pengguna akhir; backend memakai kontrak MCP yang sama dengan yang sudah terverifikasi, sehingga agent yang sudah jadi langsung dapat dinikmati pengguna. Bob tetap menjadi harness pengembangan untuk mempercepat penambahan agent baru. Permukaan tambahan: chatbot pesan instan (mis. WhatsApp) di atas backend yang sama; state belajar tersimpan terpusat sehingga pengguna bisa berpindah perangkat tanpa kehilangan progres. Domain & bahasa: memperluas dari AI literacy non-teknis ke domain sertifikasi lain (finance, kesehatan, pemerintahan) dan bahasa lain, cukup dengan mengganti prompt + dataset mapping tiap flow. B2B / institusional: model whitelabel untuk bootcamp, kampus, dan program reskilling (mis. alumni Hacktiv8, program Komdigi): satu instansi, ribuan peserta, biaya per pengguna rendah. Ekosistem integrasi: integrasi ke platform kursus (rekomendasi materi per milestone) dan job board (skill → lowongan relevan), menjadikan roadmap bernilai ganda sebagai peta kompetisi dan peta karier. Skala teknis: Langflow Cloud multi-tenant + dashboard analytics (progress, tingkat kesulitan materi, retensi) untuk tim pengelola instansi; model kurva lupa anonim per domain sebagai data moat jangka panjang.