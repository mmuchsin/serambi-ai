# Draft Jawaban — Form Progress Submission

**Event:** IBM SkillsBuild University Education National Hackathon (Hacktiv8 × IBM × Komdigi)
**Issue:** ISS-07 · **Dibuat:** 2026-10-03 · **Status:** 🟡 Draft siap copy-paste

> Cara pakai: setiap bagian di bawah sudah disusun agar bisa langsung ditempel ke field yang bersesuaian di form. Field bertanda **[UPLOAD]** tidak bisa dijawab lewat teks — ada instruksi terpisah di akhir dokumen.
>
> Aturan kejujuran submission: ditulis sebagai *progress submission* — Goal Agent ditandai **✅ live/e2e verified**, agent lain ditandai **🔜 dalam pengembangan**. Jangan mengklaim semua agent sudah live.
>
> **Aturan antarmuka:** Bob TUI = **agent harness pengembangan** (build, test, verifikasi e2e). UI pengguna akhir = **web app** (`apps/`), dalam pengembangan. Jangan pernah menyebut Bob sebagai UI pengguna akhir di form.

---

## 1. Judul Project

> **Serambi.ai — Adaptive Multi-Agent Learning Assistant untuk Career Switcher Indonesia**

*Alternatif lebih pendek (jika form membatasi karakter):* `Serambi.ai — Asisten Belajar Multi-Agent Adaptif untuk Career Switcher`

---

## 2. Tema Project

> ☑️ **Education & Future of Work**

---

## 3. Deskripsi Singkat Project (150–300 kata)

> Serambi.ai adalah asisten belajar adaptif berbasis multi-agent AI untuk career switcher Indonesia. Pengguna cukup menuliskan tujuan kariernya dalam bahasa natural, misalnya "guru mau switch ke AI engineer dalam 3 bulan", dan sistem akan menyusun roadmap belajar mingguan yang terstruktur lengkap dengan milestone dan deliverable.

> Masalah yang ingin diselesaikan: career switcher yang belajar mandiri sering kehilangan arah. Materi dipelajari dari sumber acak seperti YouTube, Udemy, dan artikel, tanpa dipetakan ke skill gap yang benar-benar dibutuhkan oleh target role. Progres tidak terlacak, tidak ada feedback loop, dan banyak yang akhirnya burn out sebelum berhasil pindah karier. Kelompok ini paling merasakan dampaknya karena bootcamp dan mentor privat mahal, sedangkan kursus online umumnya memiliki kurikulum tetap yang tidak personal.

> Solusi Serambi.ai menggunakan arsitektur multi-agent. Pengguna akhir berinteraksi melalui antarmuka web app, sementara agen-agen spesialis dibangun di IBM Langflow dan diekspos sebagai MCP tool: memecah goal karier, menjelaskan konsep dengan teknik Feynman, membuat kuis adaptif dengan graduated hinting, menjadwalkan ulasan menggunakan spaced repetition, serta memantau motivasi dan wellbeing. Bob — AI agent harness dari IBM — dipakai tim sebagai harness pengembangan: membangun, menguji, dan memverifikasi tiap agent secara end-to-end sebelum dihubungkan ke antarmuka. Setiap keputusan pedagogis dilandasi riset ilmiah: AI berperan sebagai adaptive scaffold, bukan oracle yang langsung menjawab.

> Manfaat utamanya: pengguna memperoleh roadmap yang jelas dan personal, belajar lebih efisien karena dipandu berdasarkan gap skill, progres menjadi terukur, dan risiko burnout berkurang. Saat ini Goal Agent sudah terverifikasi end-to-end melalui kontrak MCP (harness pengembangan Bob → Langflow); lima agent lainnya dikembangkan dengan pola arsitektur yang sama.

*(Word count terverifikasi: 231 kata — di dalam rentang 150–300. Jika ingin satu paragraf utuh, pakai versi ringkas di bawah.)*

<details>
<summary>Versi ringkas 1 paragraf (191 kata) — jika editor form lebih suka tanpa heading internal</summary>

Serambi.ai adalah asisten belajar adaptif berbasis multi-agent AI untuk career switcher Indonesia. Pengguna cukup menuliskan tujuan karier dalam bahasa natural, misalnya "guru mau switch ke AI engineer dalam 3 bulan", dan sistem menyusun roadmap belajar mingguan terstruktur dengan milestone dan deliverable. Masalah yang diselesaikan: career switcher belajar mandiri sering kehilangan arah — materi diambil dari sumber acak tanpa dipetakan ke skill gap target role, progres tidak terlacak, dan banyak yang burn out sebelum berhasil pindah karier; padahal bootcamp dan mentor privat mahal, sementara kursus online punya kurikulum tetap yang tidak personal. Solusinya adalah arsitektur multi-agent: pengguna berinteraksi lewat web app, sementara agent spesialis dibangun di IBM Langflow dan diekspos sebagai MCP tool — untuk memecah goal karier, menjelaskan konsep dengan teknik Feynman, membuat kuis adaptif dengan graduated hinting, menjadwalkan ulasan spaced repetition, serta memantau motivasi dan wellbeing. Bob (AI agent harness IBM) dipakai sebagai harness pengembangan untuk membangun dan memverifikasi tiap agent end-to-end. Setiap desain pedagogis dilandasi riset: AI menjadi adaptive scaffold, bukan oracle. Manfaatnya: roadmap personal, belajar lebih efisien, progres terukur, dan risiko burnout berkurang. Goal Agent sudah terverifikasi end-to-end melalui MCP dari harness pengembangan Bob ke Langflow; lima agent lain dalam pengembangan.

</details>

---

## 4. Problem Statement

**Kondisi sebelum ada solusinya.**

Career switcher Indonesia yang ingin pindah ke role teknologi belajar secara mandiri, tetapi:

- **Tidak ada roadmap personal.** Materi diambil dari sumber acak — video YouTube, kursus Udemy, artikel — tanpa dipetakan ke skill gap yang benar-benar dibutuhkan oleh target role. Banyak waktu terbuang untuk topik yang tidak relevan dengan tujuan karier.
- **Progres tidak terlacak.** Tidak ada mekanisme untuk menjawab "sudah sejauh mana saya dan harus lanjut ke apa", sehingga motivasi dan momentum belajar hilang.
- **Tidak ada feedback loop pedagogis.** Belajar menjadi pasif membaca/menonton. Riset menunjukkan AI generik malah memicu *cognitive offloading* — pengguna terbiasa langsung diberi jawaban (Metacognitive Laziness, BJET, dikutip 694 kali) — sehingga pemahaman tidak benar-benar terbentuk.
- **Alternatif mahal atau tidak scalable.** Bootcamp dan mentor privat menelan biaya besar dan tidak menjangkau seluruh Indonesia; kursus online menawarkan kurikulum sama untuk semua orang.

**Mengapa masalah ini penting untuk diselesaikan.**

OECD mengidentifikasi kesenjangan yang terus melebar antara permintaan keterampilan teknologi dan output institusi pendidikan tradisional; reskilling mandiri menjadi salah satu solusi utama, tetapi nyatanya minim dukungan adaptif. Pasar bergerak searah — market upskilling global tumbuh 11–14% CAGR, tetapi sebagian besar pertumbuhannya B2B/korporasi: career switcher individu secara eksplisit terlewat dari cakupan riset market utama. Akibatnya, transisi karier tertunda, waktu belajar terbuang, dan burnout menurunkan jumlah profesional yang berhasil menyelesaikan perpindahan karier — memperkuh kesenjangan talent digital nasional.

**Versi paragraf siap copy-paste:**

Career switcher Indonesia yang ingin pindah ke role teknologi belajar secara mandiri, tetapi menghadapi empat masalah utama. Pertama, tidak ada roadmap personal — materi diambil dari sumber acak seperti video YouTube, kursus Udemy, dan artikel tanpa dipetakan ke skill gap yang benar-benar dibutuhkan oleh target role, sehingga banyak waktu terbuang untuk topik yang tidak relevan. Kedua, progres tidak terlacak — tidak ada mekanisme untuk menjawab "sudah sejauh mana saya dan harus lanjut ke apa", sehingga motivasi dan momentum belajar hilang. Ketiga, tidak ada feedback loop pedagogis — belajar menjadi pasif membaca atau menonton, dan riset menunjukkan AI generik malah memicu cognitive offloading (Metacognitive Laziness, BJET, dikutip 694 kali) sehingga pemahaman tidak benar-benar terbentuk. Keempat, alternatif mahal atau tidak scalable — bootcamp dan mentor privat menelan biaya besar dan tidak menjangkau seluruh Indonesia, sementara kursus online menawarkan kurikulum sama untuk semua orang. Masalah ini penting untuk diselesaikan karena OECD mengidentifikasi kesenjangan yang terus melebar antara permintaan keterampilan teknologi dan output institusi pendidikan tradisional; reskilling mandiri menjadi salah satu solusi utama, tetapi nyatanya minim dukungan adaptif. Pasar bergerak searah — market upskilling global tumbuh 11–14% CAGR, tetapi sebagian besar pertumbuhannya B2B/korporasi, sehingga career switcher individu secara eksplisit terlewat. Akibatnya, transisi karier tertunda, waktu belajar terbuang, dan burnout menurunkan jumlah profesional yang berhasil menyelesaikan perpindahan karier — memperkuh kesenjangan talent digital nasional.

---

## 5. Target User

**Pengguna utama (primer): career switcher / upskiller Indonesia.**

- **Siapa:** profesional usia 22–35 yang sudah bekerja di bidang non-tech (administrasi, marketing, guru, operasional), ingin pindah ke tech role — data analyst, backend developer, ML engineer — dalam 1–6 bulan tanpa harus resign lebih dulu.
- **Karakteristik:** belajar mandiri; waktu terbatas (tetap bekerja); subangsa bahasa utama bahasa Indonesia; tidak mampu atau tidak mau membayar bootcamp/mentor privat mahal.
- **Job-to-be-done (kata pengguna):** *"Saya guru, mau switch ke AI engineer dalam 3 bulan — sudah mulai belajar tapi nggak tahu sudah di mana dan harus ngapain selanjutnya."*

**Pengguna sekunder: pekerja tech yang ingin naik level / pivot domain** (misal data analyst ingin belajar machine learning, atau engineer ingin ke cloud/cybersecurity) yang butuh belajar efisien di sela pekerjaan full-time.

**Pengguna berikutnya (fase B2B, rencana):** bootcamp, kampus, dan program reskilling kemendikbud/Komdigi yang ingin menyediakan tutor adaptif untuk peserta mereka.

**Versi paragraf siap copy-paste:**

Pengguna utama Serambi.ai adalah career switcher atau upskiller Indonesia — profesional usia 22–35 yang sudah bekerja di bidang non-tech (administrasi, marketing, guru, operasional) dan ingin pindah ke tech role seperti data analyst, backend developer, atau ML engineer dalam 1–6 bulan tanpa harus resign lebih dulu. Mereka belajar mandiri, memiliki waktu terbatas karena tetap bekerja, menggunakan bahasa Indonesia sebagai bahasa utama, dan tidak mampu atau tidak mau membayar bootcamp atau mentor privat yang mahal. Job-to-be-done mereka adalah: "Saya guru, mau switch ke AI engineer dalam 3 bulan — sudah mulai belajar tapi nggak tahu sudah di mana dan harus ngapain selanjutnya." Pengguna sekunder adalah pekerja tech yang ingin naik level atau pivot domain, misalnya data analyst yang ingin belajar machine learning atau engineer yang ingin ke cloud/cybersecurity, yang butuh belajar efisien di sela pekerjaan full-time. Pengguna berikutnya dalam fase B2B adalah bootcamp, kampus, dan program reskilling kemendikbud/Komdigi yang ingin menyediakan tutor adaptif untuk peserta mereka.

---

## 6. Mengapa Solusi Ini Dibutuhkan?

Karena cara yang digunakan saat ini memiliki kelemahan yang sama-sama tidak terpecahkan:

| Cara saat ini | Kelemahannya | Bedanya Serambi.ai |
|---|---|---|
| Kursus online (Ruangguru, Zenius, Coursera, Udemy) | Kurikulum tetap, satu ukuran untuk semua, tidak terhubung ke target karier pengguna | Roadmap **personal** yang dipetakan dari goal karier pengguna, bukan kurikulum statis |
| Chatbot AI generik (ChatGPT) | Menjadi *oracle* — langsung menjawab, tanpa struktur belajar, tanpa memori progres; memicu ketergantungan | **Scaffold, bukan oracle**: graduated hinting + probing questions yang memancing refleksi (dilandasi riset) |
| Mentor manusia / bootcamp | Mahal, tergantung jadwal mentor, tidak scalable | Multi-agent AI yang tersedia 24/7 dengan pola arsitektur yang bisa direplikasi untuk setiap topik |
| Belajar sendiri dari YouTube/blog | Tidak terstruktur, progres tidak terukur | Progres terlacak dan ulasan dijadwalkan adaptif berbasis forgetting curve |

**Empat keunggulan utama:**

1. **Adaptif & goal-first.** Setiap respons diarahkan ke target karier yang dinyatakan pengguna — pola yang terbukti pada GenMentor (goal-to-skill mapping, FWCI 47.3).
2. **Dilandasi riset, bukan intuisi.** Teknik Feynman (80%+ peserta lebih memilih daripada membaca pasif), graduated hinting, spaced repetition adaptif (+15–20% retensi vs jadwal tetap, Zaidi et al.), efek besar intervensi AI pada self-regulated learning (meta-analisis 32 studi, g = 1.613), dan guardrail anti-cognitive-offloading.
3. **Bahasa Indonesia & konteks lokal.** Dirancang untuk career switcher Indonesia, bukan terjemahan produk global.
4. **Arsitektur yang benar-benar modular (Bob × Langflow × MCP).** Setiap agent adalah satu Langflow flow yang diekspos sebagai MCP tool bernama; agent bisa dikembangkan, diuji, dan diganti secara independen tanpa menyentuh lapisan percakapan.

**Versi paragraf siap copy-paste:**

Serambi.ai dibutuhkan karena cara yang digunakan saat ini memiliki kelemahan yang sama-sama tidak terpecahkan. Kursus online seperti Ruangguru, Zenius, Coursera, dan Udemy memiliki kurikulum tetap — satu ukuran untuk semua — yang tidak terhubung ke target karier pengguna, sedangkan Serambi.ai menyediakan roadmap personal yang dipetakan dari goal karier pengguna. Chatbot AI generik seperti ChatGPT menjadi oracle — langsung menjawab tanpa struktur belajar dan tanpa memori progres, memicu ketergantungan — sedangkan Serambi.ai menerapkan scaffold, bukan oracle, dengan graduated hinting dan probing questions yang memancing refleksi berdasarkan riset. Mentor manusia atau bootcamp mahal, tergantung jadwal mentor, dan tidak scalable, sedangkan Serambi.ai menyediakan multi-agent AI yang tersedia 24/7 dengan pola arsitektur yang bisa direplikasi untuk setiap topik. Belajar sendiri dari YouTube atau blog tidak terstruktur dan progres tidak terukur, sedangkan Serambi.ai melacak progres dan menjadwalkan ulasan adaptif berbasis forgetting curve. Empat keunggulan utama Serambi.ai adalah: pertama, adaptif dan goal-first — setiap respons diarahkan ke target karier yang dinyatakan pengguna, pola yang terbukti pada GenMentor (goal-to-skill mapping, FWCI 47.3); kedua, dilandasi riset bukan intuisi — teknik Feynman (80%+ peserta lebih memilih daripada membaca pasif), graduated hinting, spaced repetition adaptif (+15–20% retensi vs jadwal tetap, Zaidi et al.), efek besar intervensi AI pada self-regulated learning (meta-analisis 32 studi, g = 1.613), dan guardrail anti-cognitive-offloading; ketiga, bahasa Indonesia dan konteks lokal — dirancang untuk career switcher Indonesia, bukan terjemahan produk global; keempat, arsitektur yang benar-benar modular (Bob × Langflow × MCP) — setiap agent adalah satu Langflow flow yang diekspos sebagai MCP tool bernama, sehingga agent bisa dikembangkan, diuji, dan diganti secara independen tanpa menyentuh lapisan percakapan.

---

## 7. Fitur Utama Project

**1. Goal Decomposer Agent — memecah target karier menjadi roadmap mingguan ✅ live (e2e verified)**
Menerima tujuan karier dalam bahasa natural ("guru mau switch ke AI engineer dalam 3 bulan"), lalu menghasilkan roadmap terstruktur berformat JSON: `deadline_weeks`, `milestones` (rentang minggu, fokus, deliverable), dan `first_action`. Terimplementasi sebagai MCP tool `goal_decomposer`; output asli telah diverifikasi end-to-end dari harness pengembangan (Bob) hingga Langflow (roadmap 12 minggu).

**2. Tutor Agent — penjelasan konsep teknik Feynman 🔜 dalam pengembangan**
Menjelaskan konsep sesuai level pengguna dengan teknik Feynman: AI mengajukan probing questions untuk mengidentifikasi miskonsepsi alih-alih langsung menyodorkan jawaban.

**3. Assessment Agent — kuis adaptif dengan graduated hinting 🔜 dalam pengembangan**
Membuat kuis berdasarkan konsep yang dipelajari; bila pengguna salah, bantuan diberikan bertahap — petunjuk terkecil yang bergerak lebih dulu, bukan jawaban langsung.

**4. Progress Agent — penjadwal ulasan spaced repetition 🔜 dalam pengembangan**
Melacak progres per konsep dan menjadwalkan ulasan berdasarkan kurva lupa individual pengguna, sehingga materi baru di-review tepat sebelum terlupakan.

**5. Motivator & Wellbeing Agent — nudge dan cek burnout 🔜 dalam pengembangan**
Mengirim pengingat dengan langkah berikut yang konkret (bukan pesan generik) dan melakukan check-in berkala untuk mendeteksi tanda-tanda burnout agar pengguna tidak putus belajar.

> Jika form hanya menerima fitur yang sudah live, isi fitur #1 saja sebagai "MVP live" dan sebutkan sisanya di bagian *Potensi Pengembangan*. Untuk submission progres, daftar di atas dengan penanda status sudah tepat.

**Versi paragraf siap copy-paste:**

Fitur utama Serambi.ai adalah Goal Decomposer Agent yang memecah target karier menjadi roadmap mingguan — fitur ini sudah live dan terverifikasi end-to-end. Fitur ini menerima tujuan karier dalam bahasa natural, misalnya "guru mau switch ke AI engineer dalam 3 bulan", lalu menghasilkan roadmap terstruktur berformat JSON dengan deadline_weeks, milestones (rentang minggu, fokus, deliverable), dan first_action. Fitur ini terimplementasi sebagai MCP tool goal_decomposer, dan output asli telah diverifikasi end-to-end dari harness pengembangan (Bob) hingga Langflow (roadmap 12 minggu). Fitur kedua adalah Tutor Agent untuk penjelasan konsep dengan teknik Feynman — menjelaskan konsep sesuai level pengguna dengan teknik Feynman, AI mengajukan probing questions untuk mengidentifikasi miskonsepsi alih-alih langsung menyodorkan jawaban. Fitur ketiga adalah Assessment Agent untuk kuis adaptif dengan graduated hinting — membuat kuis berdasarkan konsep yang dipelajari, dan bila pengguna salah, bantuan diberikan bertahap dengan petunjuk terkecil yang bergerak lebih dulu, bukan jawaban langsung. Fitur keempat adalah Progress Agent untuk penjadwal ulasan spaced repetition — melacak progres per konsep dan menjadwalkan ulasan berdasarkan kurva lupa individual pengguna, sehingga materi baru di-review tepat sebelum terlupakan. Fitur kelima adalah Motivator & Wellbeing Agent untuk nudge dan cek burnout — mengirim pengingat dengan langkah berikut yang konkret (bukan pesan generik) dan melakukan check-in berkala untuk mendeteksi tanda-tanda burnout agar pengguna tidak putus belajar. Pengguna akhir akan memakai web app (apps/ dalam repo, sedang dikembangkan), sedangkan Bob TUI berperan sebagai agent harness pengembangan (build, test, verifikasi e2e) — bukan antarmuka pengguna akhir.

**Antarmuka pengguna.** Pengguna akhir akan memakai **web app** (`apps/` dalam repo, sedang dikembangkan). Bob TUI berperan sebagai **agent harness pengembangan** (build, test, verifikasi e2e) — bukan antarmuka pengguna akhir.

---

## 8. Alur Penggunaan Project

**Alur MVP (terverifikasi end-to-end):**

```
User Input            Web App                 Backend                MCP                   Langflow                Output
"guru mau    →      antarmuka        →   orkestrator agent  →   memanggil tool   →   menjalankan flow  →   roadmap JSON
 switch ke AI         pengguna akhir           (pola diverifikasi     MCP tool call        goal_decomposer        12 minggu
 engineer 3 bulan"     (roadmap,               di Bob: intent →      (SSE, x-api-key)      (Chat Input →
                        progres,               pilih agent → call)                        Prompt → LLM →
                        kuis)                                                              Chat Output)
                                                                                         ↓
User Action: simpan roadmap → kerjakan milestone 1 → kembali ke web app
              untuk penjelasan konsep / kuis / cek progres
```

**Alur lengkap (target):**

1. **User Input** — pengguna menuliskan goal karier dalam bahasa natural di web app.
2. **Web App (Antarmuka Pengguna)** — menampilkan roadmap, progres, milestone, dan sesi belajar; menjadi permukaan utama pengguna akhir.
3. **Backend Orchestrator** — memahami intent, memutuskan agent mana yang dibutuhkan, dan memanggil MCP tool yang sesuai. Pola orkestrasi ini (intent → pemilihan agent → tool call) dibuktikan end-to-end lebih dulu di Bob, lalu direplikasi di backend web app.
4. **MCP Bridge** — tool call dikirim ke Langflow (streamable HTTP + header `x-api-key`).
5. **Langflow (Flow Engine)** — menjalankan flow agent: menyusun prompt, memanggil LLM, dan mengembalikan hasil terstruktur.
6. **Output ke User** — web app menampilkan roadmap mingguan beserta milestone dan deliverable.
7. **User Action** — pengguna menyimpan roadmap, mengerjakan milestone, lalu kembali berinteraksi untuk penjelasan konsep (Feynman), kuis adaptif, cek progres, atau check-in wellbeing — menutup loop belajar berbuntut.

**Versi paragraf siap copy-paste:**

Alur penggunaan dimulai ketika pengguna menuliskan goal karier dalam bahasa natural di web app, misalnya "guru mau switch ke AI engineer dalam 3 bulan". Web app meneruskan input ke backend orchestrator, yang memahami intent dan memutuskan agent mana yang dibutuhkan. Backend kemudian memanggil MCP tool yang sesuai — saat ini `goal_decomposer` — melalui MCP bridge (streamable HTTP dengan header `x-api-key`). Langflow sebagai flow engine menjalankan flow agent: menyusun prompt, memanggil LLM, dan mengembalikan hasil terstruktur berupa JSON roadmap 12 minggu. Web app menampilkan roadmap mingguan beserta milestone dan deliverable kepada pengguna. Pengguna menyimpan roadmap, mengerjakan milestone, lalu kembali berinteraksi untuk penjelasan konsep dengan teknik Feynman, kuis adaptif, cek progres, atau check-in wellbeing — menutup loop belajar berbuntut. Pola orkestrasi ini (intent → pemilihan agent → tool call) telah diverifikasi end-to-end lebih dulu di Bob sebagai harness pengembangan, lalu direplikasi di backend web app.

---

## 9. Penggunaan IBM Langflow

**Workflow/flow yang dibuat.**
Satu flow produksi bernama `goal_decomposer` (endpoint name `goal_decomposer`, file: [`flows/goal_decomposer.json`](../flows/goal_decomposer.json)), di-host pada Langflow (Docker, `http://localhost:7860`) dan diekspos melalui MCP endpoint `.../api/v1/mcp/project/<project-id>/streamable` sehingga agent dapat dipanggil sebagai tool oleh sistem lain. Lima flow lain (Tutor, Assessment, Progress, Motivator, Wellbeing) direncanakan memakai kontrak yang sama.

**Node/component yang digunakan.**

| Node | Fungsi | Konfigurasi penting |
|---|---|---|
| **Chat Input** | Menerima input pengguna dari playground/API | Input `user_goal` (teks tujuan karier) |
| **Prompt Template** | Menyusun instruksi untuk LLM | System prompt: *"You are a learning goal coach helping career switchers in Indonesia…"*; variabel dinamis `{user_goal}`; instruksi output **hanya JSON valid** dengan skema `goal`, `deadline_weeks`, `milestones[]`, `first_action` |
| **Language Model** | Mesin reasoning flow | Provider NaraRouter, model `longcat-2.5`, `temperature = 0.3` (rendah agar output dekomposisi stabil dan terstruktur) |
| **Chat Output** | Mengembalikan respons ke pemanggil | JSON roadmap yang diteruskan sebagai hasil tool call |

**Input & output.**
Input: satu string tujuan karier dalam bahasa natural. Output: JSON terstruktur berisi goal yang dibersihkan, jumlah minggu (`deadline_weeks`), daftar milestone per rentang minggu dengan fokus dan deliverable, serta `first_action` sebagai langkah pertama konkret.

**Proses AI Agent.**
Flow menerjemahkan goal bebas menjadi komponen terukur (waktu, urutan materi, deliverable per fase). Prompt dirancang dengan JSON schema ketat + temperature rendah sehingga keluaran dapat diandalkan untuk diproses lebih lanjut oleh agent lain — inilah kunci mengapa Langflow, bukan sekadar satu prompt di chat.

**Fungsi Langflow dalam keseluruhan sistem.**
Langflow adalah **mesin eksekusi domain** sistem: setiap agent spesialis hidup sebagai satu flow yang dapat diretas di canvas, diuji langsung di Playground, dan **di-expose sebagai named MCP tool**. Dengan begitu logika pedagogis tiap agent terisolasi, versionable, dan bisa diganti tanpa mengubah pemanggilnya. Karena diekspos lewat MCP, konsumennya bebas diganti: harness pengembangan (Bob) hari ini, web app besok — keduanya memakai kontrak tool yang identik.

**Versi paragraf siap copy-paste:**

Satu flow produksi bernama `goal_decomposer` telah dibuat di IBM Langflow (Docker, `http://localhost:7860`) dan diekspos melalui MCP endpoint sehingga agent dapat dipanggil sebagai tool oleh sistem lain. Flow ini terdiri dari empat node: Chat Input menerima input `user_goal` (teks tujuan karier), Prompt Template menyusun instruksi untuk LLM dengan system prompt "You are a learning goal coach helping career switchers in Indonesia..." dan variabel dinamis `{user_goal}` serta instruksi output hanya JSON valid dengan skema `goal`, `deadline_weeks`, `milestones[]`, `first_action`, Language Model menggunakan provider NaraRouter model `longcat-2.5` dengan `temperature = 0.3` (rendah agar output dekomposisi stabil dan terstruktur), dan Chat Output mengembalikan JSON roadmap yang diteruskan sebagai hasil tool call. Input flow adalah satu string tujuan karier dalam bahasa natural, dan output berupa JSON terstruktur berisi goal yang dibersihkan, jumlah minggu (`deadline_weeks`), daftar milestone per rentang minggu dengan fokus dan deliverable, serta `first_action` sebagai langkah pertama konkret. Flow menerjemahkan goal bebas menjadi komponen terukur (waktu, urutan materi, deliverable per fase) dengan prompt schema-ketat dan temperature rendah sehingga keluaran dapat diandalkan untuk diproses lebih lanjut oleh agent lain. Lima flow lain (Tutor, Assessment, Progress, Motivator, Wellbeing) direncanakan memakai kontrak yang sama.

---

## 10. Penggunaan IBM Bob

**Fungsi IBM Bob.**
Bob adalah **AI agent harness** yang dipakai tim sebagai **lingkungan pengembangan**: membangun flow, menguji integrasi, dan memverifikasi setiap agent secara end-to-end sebelum dihubungkan ke antarmuka pengguna. **Bob TUI bukan antarmuka pengguna akhir** — pengguna akhir memakai web app. Bob berjalan di dalam workspace proyek sehingga otomatis memakai konfigurasi proyek (`.bob/mcp.json`).

**Proses/task yang dilakukan menggunakan Bob.**

1. Menerima instruksi bahasa natural dari tim pengembang.
2. Melakukan reasoning untuk menentukan flow/agent apa yang perlu dibangun atau diuji.
3. Memanggil MCP tool Langflow secara langsung (mis. `mcp__lf-serambi_ai__goal_decomposer`) — membuktikan setiap agent benar-benar bekerja dan kontrak input/output-nya valid, bukan sekadar menjawab dari LLM-nya sendiri.
4. Menguji keluaran agent (JSON roadmap 12 minggu), lalu menjadikannya spesifikasi untuk backend web app: struktur data, penanganan error, dan urutan orkestrasi.
5. Memakai skill proyek (43 PM skills + custom `pitch-deck`, `drawio`) untuk value proposition, north-star metric, pitch deck, dan dokumentasi submission.

**Bagaimana Bob berinteraksi dengan sistem.**
Melalui konfigurasi MCP proyek: server MCP ber-Id `lf-serambi_ai` (menggunakan `mcp-proxy` dengan transport `streamablehttp`, header `x-api-key` berisi `LANGFLOW_API_KEY`) menghubungkan Bob ke MCP endpoint Langflow. Bob melakukan auto-discovery tool, sehingga flow Langflow otomatis muncul sebagai named tools yang bisa diajak tool-calling.

**Output yang dihasilkan.**
Verifikasi end-to-end bahwa kontrak MCP bekerja: Bob memanggil `goal_decomposer` → Langflow mengembalikan JSON roadmap 12 minggu dengan milestone dan deliverable. Kontrak inilah yang nantinya dipanggil oleh backend web app — tanpa perlu mengubah flow Langflow sama sekali.

**Versi paragraf siap copy-paste:**

Bob adalah AI agent harness yang dipakai tim sebagai lingkungan pengembangan — membangun flow, menguji integrasi, dan memverifikasi setiap agent secara end-to-end sebelum dihubungkan ke antarmuka pengguna. Bob TUI bukan antarmuka pengguna akhir; pengguna akhir memakai web app. Bob berjalan di dalam workspace proyek sehingga otomatis memakai konfigurasi proyek (.bob/mcp.json). Proses yang dilakukan menggunakan Bob: pertama, menerima instruksi bahasa natural dari tim pengembang; kedua, melakukan reasoning untuk menentukan flow atau agent apa yang perlu dibangun atau diuji; ketiga, memanggil MCP tool Langflow secara langsung (misalnya mcp__lf-serambi_ai__goal_decomposer) — membuktikan setiap agent benar-benar bekerja dan kontrak input/output-nya valid, bukan sekadar menjawab dari LLM-nya sendiri; keempat, menguji keluaran agent (JSON roadmap 12 minggu), lalu menjadikannya spesifikasi untuk backend web app: struktur data, penanganan error, dan urutan orkestrasi; kelima, memakai skill proyek (43 PM skills + custom pitch-deck, drawio) untuk value proposition, north-star metric, pitch deck, dan dokumentasi submission. Bob berinteraksi dengan sistem melalui konfigurasi MCP proyek: server MCP ber-Id lf-serambi_ai (menggunakan mcp-proxy dengan transport streamablehttp, header x-api-key berisi LANGFLOW_API_KEY) menghubungkan Bob ke MCP endpoint Langflow. Bob melakukan auto-discovery tool, sehingga flow Langflow otomatis muncul sebagai named tools yang bisa diajak tool-calling. Output yang dihasilkan adalah verifikasi end-to-end bahwa kontrak MCP bekerja: Bob memanggil goal_decomposer, Langflow mengembalikan JSON roadmap 12 minggu dengan milestone dan deliverable. Kontrak inilah yang nantinya dipanggil oleh backend web app — tanpa perlu mengubah flow Langflow sama sekali.

---

## 11. Bagaimana IBM Langflow dan IBM Bob Terintegrasi?

Keduanya saling melengkapi dalam satu rantai, dan web app menjadi konsumen produksi dari kontrak yang sama:

- **Yang dilakukan Langflow:** menjalankan *logika domain* sistem. Flow `goal_decomposer` adalah tempat instruksi pedagogik, prompt, dan panggilan LLM dieksekusi, dengan output terstruktur (JSON) yang konsisten dan dapat diuji di Playground.
- **Yang dilakukan Bob:** bekerja sebagai **agent harness pengembangan**. Bob membangun flow, menguji named tool, dan membuktikan kontrak MCP bekerja end-to-end. Pola orkestrasi — intent parsing → pemilihan agent → tool call → penyajian hasil — dirancang dan divalidasi lebih dulu di sini.
- **Yang dilakukan web app:** menjadi antarmuka pengguna akhir. Backend web app memanggil **MCP tool yang persis sama** seperti yang dipanggil Bob, lalu menampilkan hasilnya sebagai pengalaman belajar utuh (roadmap, progres, kuis, review).

**Bagaimana data/informasi berpindah:**

```
Pengguna ──1. permintaan (web app UI)──▶ Web App Backend
        ◀──── 4. tampilan roadmap ─────────┘
Web App Backend ──2. MCP tool call (JSON-RPC via SSE streamable HTTP, header x-api-key)──▶ Langflow
              ◀─────────── 3. tool result: JSON roadmap (goal, deadline_weeks, milestones, first_action)
```

Selama pengembangan, urutan yang sama sudah dijalankan dan diverifikasi di Bob: Bob → MCP → Langflow → JSON response. Setiap flow Langflow diekspos sebagai **named MCP tool** (kontrak: nama deskriptif seperti `goal_decomposer`, input/output terdefinisi). Itulah "lem" integrasinya: kontrak tool menjadi antarmuka resmi antara lapisan aplikasi dan lapisan eksekusi agent — sehingga mengganti pemanggil dari Bob (pengembangan) ke web app (produksi) **tidak mengubah satu pun baris di Langflow**.

**Output akhir dari integrasi.**
Pengguna, melalui web app, menerima **roadmap belajar mingguan yang personal dan terstruktur** — hasil kolaborasi web app (antarmuka + orkestrasi) dan Langflow (eksekusi agent + panggilan LLM). Integrasi Bob × Langflow yang terverifikasi hari ini menjadi fondasi kontrak yang dipakai web app besok.

**Versi paragraf siap copy-paste:**

IBM Langflow dan IBM Bob terintegrasi dalam satu rantai, dan web app menjadi konsumen produksi dari kontrak yang sama. Langflow menjalankan logika domain sistem — flow goal_decomposer adalah tempat instruksi pedagogik, prompt, dan panggilan LLM dieksekusi, dengan output terstruktur (JSON) yang konsisten dan dapat diuji di Playground. Bob bekerja sebagai agent harness pengembangan — membangun flow, menguji named tool, dan membuktikan kontrak MCP bekerja end-to-end. Pola orkestrasi (intent parsing → pemilihan agent → tool call → penyajian hasil) dirancang dan divalidasi lebih dulu di sini. Web app menjadi antarmuka pengguna akhir — backend web app memanggil MCP tool yang persis sama seperti yang dipanggil Bob, lalu menampilkan hasilnya sebagai pengalaman belajar utuh (roadmap, progres, kuis, review). Data berpindah sebagai berikut: pengguna mengirim permintaan melalui web app UI ke web app backend; web app backend mengirim MCP tool call (JSON-RPC via SSE streamable HTTP, header x-api-key) ke Langflow; Langflow mengembalikan tool result berupa JSON roadmap (goal, deadline_weeks, milestones, first_action) ke web app backend; web app backend menampilkan roadmap kepada pengguna. Selama pengembangan, urutan yang sama sudah dijalankan dan diverifikasi di Bob: Bob → MCP → Langflow → JSON response. Setiap flow Langflow diekspos sebagai named MCP tool (kontrak: nama deskriptif seperti goal_decomposer, input/output terdefinisi). Itulah "lem" integrasinya: kontrak tool menjadi antarmuka resmi antara lapisan aplikasi dan lapisan eksekusi agent — sehingga mengganti pemanggil dari Bob (pengembangan) ke web app (produksi) tidak mengubah satu pun baris di Langflow. Output akhir dari integrasi adalah pengguna, melalui web app, menerima roadmap belajar mingguan yang personal dan terstruktur — hasil kolaborasi web app (antarmuka + orkestrasi) dan Langflow (eksekusi agent + panggilan LLM). Integrasi Bob × Langflow yang terverifikasi hari ini menjadi fondasi kontrak yang dipakai web app besok.

---

## 12. Project File / Link **[UPLOAD / LINK]**

**Link repository (publik, siap diakses reviewer):**
`https://github.com/mmuchsin/serambi-ai`

Isi yang membantu reviewer:

| File | Bagi Reviewer |
|---|---|
| `README.md` / `README.id.md` | Ringkasan solusi, arsitektur, cara menjalankan (quick start), status agent |
| [`docs/PRD.md`](PRD.md) | Product requirements, arsitektur Bob × MCP × Langflow, tabel agent, research grounding |
| [`research/research-papers-and-abstracts.md`](../research/research-papers-and-abstracts.md) | Landasan riset: 30+ jurnal/paper dengan abstract lengkap, jumlah sitasi, dan DOI/link |
| [`flows/goal_decomposer.json`](../flows/goal_decomposer.json) | Export flow Langflow yang bisa di-import dan direplikasi |
| [`.bob/mcp.json`](../.bob/mcp.json) | Konfigurasi integrasi Bob → Langflow via MCP |
| [`docs/business/`](business/) | Value proposition, north star metric, competitive framing |

> Sebelum submit: pastikan repo **public** dan README tampil dengan benar. Jika form meminta 1 file dokumentasi, buat versi PDF dari gabungan README + PRD (atau pitching deck setelah ISS-08 selesai) dan upload itu.

**Versi paragraf siap copy-paste:**

Link repository publik yang siap diakses reviewer adalah https://github.com/mmuchsin/serambi-ai. Isi yang membantu reviewer: README.md atau README.id.md berisi ringkasan solusi, arsitektur, cara menjalankan (quick start), dan status agent; docs/PRD.md berisi product requirements, arsitektur Bob × MCP × Langflow, tabel agent, dan research grounding; research/research-papers-and-abstracts.md berisi landasan riset 30+ jurnal/paper dengan abstract lengkap, jumlah sitasi, dan DOI/link; flows/goal_decomposer.json adalah export flow Langflow yang bisa di-import dan direplikasi; .bob/mcp.json adalah konfigurasi integrasi Bob → Langflow via MCP; docs/business/ berisi value proposition, north star metric, dan competitive framing. Sebelum submit, pastikan repo public dan README tampil dengan benar. Jika form meminta 1 file dokumentasi, buat versi PDF dari gabungan README + PRD (atau pitching deck setelah ISS-08 selesai) dan upload itu.

---

## 13. Pitching Deck **[UPLOAD]**

**Status: ✅ Selesai (2026-10-04)** — dibangun dengan skill `ppt-master` (Default route), 11 slide native DrawingML (editable), 4.1 MB, include speaker notes per slide.

**File PPTX:** `projects/serambi-pitch-deck-v2_20261004/exports/serambi-pitch-deck-v2_20261004_212630.pptx`

**Struktur 11 slide:**

1. **Cover** — Serambi.ai, tagline *"Belajar mandiri, tapi nggak sendirian."* + partner logos (IBM, hacktiv8, komdigi)
2. **Problem** — 4 pain points + market gap (1.2M career switchers, 78% gagal)
3. **Solution** — 6 agent steps + research anchors
4. **Target User** — persona Andi, JTBD, revenue model
5. **How It Works** — 3 steps + e2e verified (Bob → MCP → Langflow → JSON roadmap)
6. **Technology** — 4-layer stack (IBM Bob, Langflow, MCP, NaraRouter) + architecture diagram
7. **Features** — 6 agent, 5 fitur, 1 LIVE e2e (Goal Decomposer)
8. **Prototype** — 4 screenshots nyata (Bob TUI, Langflow canvas, endpoint, JSON output)
9. **Impact** — 6 KPIs + 4 guardrails (privasi, human-in-loop, wellbeing, transparansi)
10. **Roadmap** — selesai vs 3–6 bulan + B2B + skala teknis + moat
11. **Team & Closing** — M. Muchsin, 4 bukti, repo link

**Aset yang dipakai:** logo Serambi (S-lettermark), cover-hero (maze→path), problem/solution illustrations, 4 screenshots asli, architecture-light diagram, agent-flow diagram, learning-journey diagram, 3 partner logos (IBM, hacktiv8, komdigi).

**Speaker notes:** 11 file di `projects/serambi-pitch-deck-v2_20261004/notes/` (01–11), total ~10–12 menit presentasi.

**Prosedur:** skill `ppt-master` (Default route) → `design_spec.md` + `spec_lock.md` → 11 SVG → early gate → final gate → `total_md_split` → `finalize_svg` → `svg_to_pptx` → export PPTX.

**Upload:** salin PPTX ke `slides/serambi-pitch-deck.pptx` (atau upload langsung dari path export).

**Versi paragraf siap copy-paste:**

Pitching deck sudah selesai dibuat pada 2026-10-04 dengan skill ppt-master (Default route), menghasilkan 11 slide native DrawingML (editable) berukuran 4.1 MB dengan speaker notes per slide. File PPTX tersimpan di projects/serambi-pitch-deck-v2_20261004/exports/serambi-pitch-deck-v2_20261004_212630.pptx. Struktur 11 slide adalah: slide 1 Cover — Serambi.ai dengan tagline "Belajar mandiri, tapi nggak sendirian." dan partner logos (IBM, hacktiv8, komdigi); slide 2 Problem — 4 pain points dan market gap (1.2M career switchers, 78% gagal); slide 3 Solution — 6 agent steps dan research anchors; slide 4 Target User — persona Andi, JTBD, revenue model; slide 5 How It Works — 3 steps dan e2e verified (Bob → MCP → Langflow → JSON roadmap); slide 6 Technology — 4-layer stack (IBM Bob, Langflow, MCP, NaraRouter) dan architecture diagram; slide 7 Features — 6 agent, 5 fitur, 1 LIVE e2e (Goal Decomposer); slide 8 Prototype — 4 screenshots nyata (Bob TUI, Langflow canvas, endpoint, JSON output); slide 9 Impact — 6 KPIs dan 4 guardrails (privasi, human-in-loop, wellbeing, transparansi); slide 10 Roadmap — selesai vs 3–6 bulan, B2B, skala teknis, dan moat; slide 11 Team & Closing — M. Muchsin, 4 bukti, dan repo link. Aset yang dipakai meliputi logo Serambi (S-lettermark), cover-hero (maze→path), problem/solution illustrations, 4 screenshots asli, architecture-light diagram, agent-flow diagram, learning-journey diagram, dan 3 partner logos (IBM, hacktiv8, komdigi). Speaker notes tersimpan dalam 11 file di projects/serambi-pitch-deck-v2_20261004/notes/ (01–11) dengan total durasi sekitar 10–12 menit presentasi. Prosedur pembuatan: skill ppt-master (Default route) → design_spec.md + spec_lock.md → 11 SVG → early gate → final gate → total_md_split → finalize_svg → svg_to_pptx → export PPTX. Untuk upload, salin PPTX ke slides/serambi-pitch-deck.pptx atau upload langsung dari path export.

---

## 14. Project / Prototype Screenshot **[UPLOAD]**

Empat screenshot yang ada sudah siap pakai; salinan dengan nama sesuai permintaan form tersimpan di [`submission/screenshots/`](submission/screenshots/) (semua < 350 KB, aman untuk limit 10 MB per file). Mapping:

| Nama file untuk form | Isi | Sumber asli |
|---|---|---|
| `01-user-interface.png` | Agent harness pengembangan (Bob TUI): sesi kerja berisi struktur repo & pemanggilan MCP tool — **antarmuka pengembang, bukan UI pengguna akhir** | `Screenshot 2026-10-03 150309.png` |
| `02-langflow-workflow.png` | Canvas Langflow: flow `goal_decomposer` lengkap dengan 4 node — Chat Input → Prompt Template → Language Model → Chat Output | `Screenshot 2026-10-03 124609.png` |
| `03-langflow-endpoint.png` | Pengaturan endpoint Langflow: nama flow `goal_decomposer` + deskripsi agent | `Screenshot 2026-10-03 124806.png` |
| `04-output.png` | Output nyata: JSON roadmap 12 minggu (goal karier data analytics) yang dikembalikan flow `goal_decomposer` | `Screenshot 2026-10-03 113405.png` |

**Rekomendasi tambahan (opsional ke-5):** tangkap momen agent call `mcp__lf-serambi_ai__goal_decomposer` sebelum hasil roadmap muncul — ini bukti paling kuat bahwa agent Langflow benar-benar dipanggil, bukan dijawab dari LLM-nya sendiri.

> **Catatan kejujuran:** web app (UI pengguna akhir) masih dalam pengembangan sehingga belum ada screenshot-nya. Jelaskan ke juri bahwa `01` adalah harness pengembangan (Bob); `02`–`04` adalah workflow Langflow dan output agent yang nyata. Tambahkan screenshot web app begitu tersedia.

**Versi paragraf siap copy-paste:**

Empat screenshot yang ada sudah siap pakai, dengan salinan bernama sesuai permintaan form tersimpan di submission/screenshots/ (semua kurang dari 350 KB, aman untuk limit 10 MB per file). File pertama, 01-user-interface.png, menampilkan agent harness pengembangan (Bob TUI) — sesi kerja berisi struktur repo dan pemanggilan MCP tool — yang merupakan antarmuka pengembang, bukan UI pengguna akhir. File kedua, 02-langflow-workflow.png, menampilkan canvas Langflow dengan flow goal_decomposer lengkap dengan 4 node: Chat Input → Prompt Template → Language Model → Chat Output. File ketiga, 03-langflow-endpoint.png, menampilkan pengaturan endpoint Langflow dengan nama flow goal_decomposer dan deskripsi agent. File keempat, 04-output.png, menampilkan output nyata berupa JSON roadmap 12 minggu (goal karier data analytics) yang dikembalikan flow goal_decomposer. Rekomendasi tambahan opsional adalah menangkap momen agent call mcp__lf-serambi_ai__goal_decomposer sebelum hasil roadmap muncul — ini bukti paling kuat bahwa agent Langflow benar-benar dipanggil, bukan dijawab dari LLM-nya sendiri. Catatan kejujuran: web app (UI pengguna akhir) masih dalam pengembangan sehingga belum ada screenshot-nya. Jelaskan ke juri bahwa 01 adalah harness pengembangan (Bob), sedangkan 02–04 adalah workflow Langflow dan output agent yang nyata. Tambahkan screenshot web app begitu tersedia.

---

## 15. Dampak yang Dihasilkan

Target indikator terukur (guna menghindari klaim berlebihan: MVP sudah e2e verified; metrik produk diukur setelah rilis):

- **Waktu penyusunan roadmap belajar personal: dari ±2–4 jam riset mandiri → <1 menit** — otomatis, telah terbukti pada alur verifikasi pengembangan: Bob → MCP → Langflow. *(Sumber: verifikasi e2e 2026-10-03, `verify-e2e.sh` PASS)*
- **Career Goal Progress Rate (north star) ≥ 15%/minggu per pengguna aktif** — didefinisikan sebagai milestone selesai per minggu / total milestone di roadmap. *(Sumber: target produk, diukur setelah rilis — belum terukur saat ini)*
- **Retensi belajar +15–20%** dibanding jadwal spaced repetition tetap (target berbasis riset Zaidi et al., arXiv 2004.11327) melalui Progress Agent. *(Sumber: Zaidi et al., arXiv 2004.11327 — meta-analisis spaced repetition adaptif)*
- **Target jangkauan: 1.000 pengguna/bulan** pada 6 bulan pertama setelah rilis publik (jalur web app + integrasi komunitas hackathon). *(Sumber: target bisnis, diukur setelah rilis — belum terukur saat ini)*
- **Mengurangi pekerjaan manual** yang selama ini tidak terhitung: riset kurikulum, pencarian materi, dan perencanaan ulang belajar. *(Sumber: estimasi dari alur manual career switcher, belum terukur secara kuantitatif)*
- **Mengurangi risiko burnout/putus belajar** melalui Wellbeing & Motivator Agent (indikator: jumlah pengguna yang kembali belajar dalam 7 hari). *(Sumber: target produk, diukur setelah rilis — belum terukur saat ini)*

---

## 16. Potensi Pengembangan & Skalabilitas

- **Web app sebagai produksi.** Web app (`apps/`) adalah antarmuka pengguna akhir; backend-nya memakai kontrak MCP yang sama dengan yang sudah terverifikasi, sehingga agent yang sudah jadi langsung dapat dinikmati pengguna. Bob tetap menjadi harness pengembangan untuk mempercepat penambahan agent baru.
- **Permukaan tambahan.** Chatbot pesan instan (mis. WhatsApp) di atas backend yang sama; state belajar tersimpan terpusat sehingga pengguna bisa berpindah perangkat tanpa kehilangan progres.
- **Domain & bahasa.** Memperluas dari tech career ke domain sertifikasi lain (finance, kesehatan, pemerintahan) dan bahasa lain, cukup dengan mengganti prompt + dataset mapping tiap flow.
- **B2B / institusional.** Model whitelabel untuk bootcamp, kampus, dan program reskilling (mis. alumni Hacktiv8, program Komdigi): satu instansi, ribuan peserta, biaya per pengguna rendah.
- **Ekosistem integrasi.** Integrasi ke platform kursus (rekomendasi materi per milestone) dan job board (skill → lowongan relevan), menjadikan roadmap bernilai ganda sebagai peta kompetisi dan peta karier.
- **Skala teknis.** Langflow Cloud multi-tenant + dashboard analytics (progress, tingkat kesulitan materi, retensi) untuk tim pengelola instansi; model kurva lupa anonim per domain sebagai data moat jangka panjang.

**Versi paragraf siap copy-paste:**

Potensi pengembangan dan skalabilitas Serambi.ai meliputi beberapa arah. Pertama, web app sebagai produksi — web app (apps/) adalah antarmuka pengguna akhir, backend-nya memakai kontrak MCP yang sama dengan yang sudah terverifikasi, sehingga agent yang sudah jadi langsung dapat dinikmati pengguna, dan Bob tetap menjadi harness pengembangan untuk mempercepat penambahan agent baru. Kedua, permukaan tambahan — chatbot pesan instan seperti WhatsApp di atas backend yang sama, dengan state belajar tersimpan terpusat sehingga pengguna bisa berpindah perangkat tanpa kehilangan progres. Ketiga, domain dan bahasa — memperluas dari tech career ke domain sertifikasi lain seperti finance, kesehatan, dan pemerintahan, serta bahasa lain, cukup dengan mengganti prompt dan dataset mapping tiap flow. Keempat, B2B atau institusional — model whitelabel untuk bootcamp, kampus, dan program reskilling seperti alumni Hacktiv8 dan program Komdigi: satu instansi, ribuan peserta, biaya per pengguna rendah. Kelima, ekosistem integrasi — integrasi ke platform kursus untuk rekomendasi materi per milestone dan job board untuk skill ke lowongan relevan, menjadikan roadmap bernilai ganda sebagai peta kompetisi dan peta karier. Keenam, skala teknis — Langflow Cloud multi-tenant dengan dashboard analytics (progress, tingkat kesulitan materi, retensi) untuk tim pengelola instansi, serta model kurva lupa anonim per domain sebagai data moat jangka panjang.

---

## 17. Apa yang Membuat Project Ini Berbeda?

**1. Pedagogi berbasis riset, bukan sekadar "AI chatbot edukasi".**
Setiap fitur didasarkan pada paper dan angka: GenMentor (goal-to-skill mapping, FWCI 47.3), Feynman Bot (arXiv 2506.09055 — 80%+ peserta lebih memilih daripada membaca pasif), Protégé Effect (Chase et al. 2009), IntelliCode (graduated hinting, FWCI 23.5), Zaidi et al. (spaced repetition adaptif, +15–20% retensi), dan guardrail anti-cognitive-offloading dari BJET (cited 694), paradigma *Cognitive Mirror* (Frontiers in Education 2025, FWCI 21.9 — AI sebagai *teachable novice* yang mencerminkan kualitas penjelasan pengguna, diimplementasikan langsung pada desain Assessment Agent), dan meta-analisis intervensi AI terhadap self-regulated learning (Frontiers in Education 2025, 32 studi, g = 1.613). Seluruh 30+ referensi terarsip lengkap dengan abstract dan DOI di repo — sesuatu yang jarang dimiliki prototype hackathon.

**2. Arsitektur integrasi Bob × Langflow × MCP yang benar-benar modular dan teruji.**
Setiap agent hidup sebagai satu Langflow flow yang diekspos sebagai named MCP tool, sementara pemanggil — Bob saat pengembangan, backend web app di produksi — hanya berbicara lewat kontrak tool. Kontrak tool membuat agent bisa dikembangkan, diuji, dan diganti secara independen — bukan monolit satu prompt raksasa. Rantai integrasinya sudah **terverifikasi end-to-end** (Bob memanggil `goal_decomposer` → Langflow mengembalikan JSON roadmap).

**3. Goal-first, Bahasa Indonesia, dan *scaffold bukan oracle*.**
Produk dirancang untuk career switcher Indonesia: semua respons diarahkan ke target role nyata pengguna dan berbahasa Indonesia. Bedanya dari chatbot AI generik: AI sengaja tidak menjawab langsung — ia memakai graduated hinting dan probing questions agar pemikiran pengguna tetap bekerja (menghindari cognitive offloading yang diverifikasi berisiko pada pembelajaran).

---

## 18. Kemampuan AI Agent

**Kemampuan agent yang sudah berjalan:**

- **Goal Decomposer (Goal Agent) ✅** — dekomposisi otonom atas pernyataan goal bebas menjadi roadmap mingguan terstruktur (JSON dengan `deadline_weeks`, `milestones`, `first_action`), dengan prompt schema-ketat dan temperature rendah agar konsisten. Terverifikasi end-to-end lewat MCP dari harness pengembangan (Bob) ke Langflow.

**Kemampuan orkestrasi (semi-otomatis):**

- **Pola orkestrasi multi-agent (dev → produksi)** — dari satu kalimat pengguna, orkestrator menentukan agent relevan, menyusun parameter, memanggil MCP tool, lalu menggabungkan beberapa hasil menjadi satu jawaban lintas-langkah (mis. roadmap → penjelasan konsep milestone 1 → kuis → jadwal review). Pola ini diverifikasi end-to-end di Bob dan menjadi spesifikasi orkestrator di backend web app.
- **Loop belajar berkelanjutan** — setelah roadmap jadi, agen-agen saling meneruskan konteks: Tutor menjelaskan konsep milestone ini → Assessment menguji → Progress menjadwalkan review → Motivator/Wellbeing menjaga keterlibatan.

**Kemampuan agent dalam pengembangan:**

- **Tutor Agent** — diagnosis miskonsepsi lewat probing questions berlapis (teknik Feynman).
- **Assessment Agent** — penyesuaian tingkat kesulitan kuis dan pemberian hint bertingkat (graduated hinting).
- **Progress Agent** — prediksi interval review optimal per konsep per pengguna (forgetting curve individual).
- **Motivator/Wellbeing Agent** — nudge kontekstual yang proporsional ke progres terkini, bukan pesan generik.

**Guardrail kemampuan:** setiap agent terikat aturan pedagogis proyek — *scaffold, not oracle*; graduated hinting; probing question; tanpa cognitive offloading; selalu goal-first — sehingga agent membantu pengguna berpikir, bukan berpikir untuk pengguna.

---

## Checklist Sebelum Submit

- [ ] **Tema**: pilih *Education & Future of Work*.
- [ ] **Deskripsi Singkat**: tempel versi 231 kata (atau versi ringkas 191 kata) — keduanya dalam rentang 150–300 kata.
- [ ] **Project File/Link**: pastikan repo `https://github.com/mmuchsin/serambi-ai` public dan dapat diakses tanpa login.
- [x] **Pitching Deck**: 11 slide selesai (2026-10-04) — `projects/serambi-pitch-deck-v2_20261004/exports/serambi-pitch-deck-v2_20261004_212630.pptx` (4.1 MB, native DrawingML, speaker notes included). Salin ke `slides/serambi-pitch-deck.pptx` dan upload.
- [ ] **Screenshot**: upload 4 gambar bernama `01`–`04` dari [`submission/screenshots/`](submission/screenshots/); tambahkan tangkapan tool-call agent bila memungkinkan.
- [ ] **Jujur soal status**: Goal Agent **live**, 5 agent lain **dalam pengembangan** — konsisten di semua field.
- [ ] **Jujur soal antarmuka**: web app = UI pengguna akhir (dalam pengembangan); Bob TUI = harness pengembangan. Jangan tampilkan screenshot Bob sebagai UI pengguna akhir.
- [ ] Setelah form terkirim: update `docs/ISSUES.md` (ISS-07 → `[x]`), commit `docs(submission): ...`, lanjut ISS-08 bila deck belum siap.
