# Evaluasi 5 Skill Kandidat dari /tmp/claude-skills → Serambi.ai

## Tabel Hasil

| # | Skill | Ukuran | A (gap lokal) | B (nilai penyisihan IBM) | C (aksi hari ini) | D (ringkas/self-contained) | VERDICT | Alasan (1 kalimat) |
|---|-------|--------|------|------|-----|-----|---------|---------------------|
| 1 | `engineering/demo-video/skills/demo-video` | 20 KB | 5 | 5 | 3 | 4 | **ADOPT** | Repo nol kemampuan video, demo video adalah prioritas eksplisit user, dan mode manual tetap jalan hari ini karena ffmpeg sudah terpasang. |
| 2 | `c-level-advisor/executive-mentor/skills/board-prep` | 12 KB | 3 | 5 | 5 | 5 | **ADOPT** | Terkecil dan paling self-contained, langsung jadi "latihan tanya-jawab juri adversarial" Hacktiv8/IBM/Komdigi tanpa setup apa pun. |
| 3 | `c-level-advisor/skills/internal-narrative` | 40 KB | 4 | 4 | 5 | 3 | **ADOPT (shrink)** | Inti skill = satu narasi sumber-kebenaran + cek kontradiksi, cocok untuk merapikan 18 field submission/README/deck, tapi 60% isinya (all-hands, crisis comms) tak relevan. |
| 4 | `markdown-html/skills/md-slides` | 96 KB | 2 | 3 | 2 | 1 | **REJECT** | Deck sudah jadi PPTX native dengan speaker notes; skill ini pakai path repo-root yang patah saat disalin, punya dependensi antar-folder (md-document + design-system), 96 KB, dan gerbang "refuse without onboarding". |
| 5 | `product-team/skills/roadmap-communicator` | 32 KB | 3 | 3 | 5 | 4 | **REJECT** | Nilai marjinal terendah — roadmap Now/Next/Later sudah ada di slide 10 deck dan skill lokal `transform-roadmap`, sisa isinya changelog/release-notes yang tak dibutuhkan sebelum deadline. |

## Detail ADOPT

### 1. demo-video (20 KB) — ADOPT, copy penuh + drop bagian MCP-only
- **Ukuran folder:** `engineering/demo-video/skills/demo-video` = 20 KB; isi: `SKILL.md` (110 baris) + `references/scene-design-system.md` (61 baris: color language, timing, tipografi, layout 1920x1080).
- **Pemakaian konkret untuk Serambi.ai:** skrip demo 30–60 detik (Hook 3s → Problem 5s → Magic Moment 5s → Proof 15s → Social Proof 4s → Invite 4s) yang memakai 4 screenshot UI yang sudah ada di `submission/screenshots/` plus teks cerita agent-goal/chat; output `scenes/*.html` + `narration/*.txt` + `scenes.json` + `build.sh` persis sesuai template output skill. Ini mengisi gap terbesar user: "butuh menyiapkan demo video".
- **Edit/reduce sebelum disalin:** hapus tabel mode yang mengasumsikan playwright/edge-tts MCP selalu ada; ganti dengan bagian "Manual mode (verified)" karena hasil pemeriksaan tool: ffmpeg ADA (`/usr/bin/ffmpeg`, terverifikasi), playwright TIDAK terpasang (uji `npx --no-install playwright --version` gagal: "npm error npx canceled due to missing packages"), `edge_tts` Python TIDAK terpasang (`ModuleNotFoundError: No module named 'edge_tts'`). Sisakan fallback: tulis `narration/*.txt` untuk di-TTS manual, atau `pip install edge-tts` (instalasi pip ringan, tanpa unduh browser — opsional, bukan syarat).
- **Dependensi eksternal:** ffmpeg (tersedia); playwright MCP (TIDAK tersedia — narasi HTM harus di-screenshot manual, atau pakai 4 screenshot PNG yang sudah ada); edge-tts (TIDAK tersedia sebagai MCP). Tidak ada blocking: ffmpeg + HTML lokal sudah cukup menghasilkan MP4 dari screenshot PNG.

### 2. board-prep (12 KB) — ADOPT, shrink 30–40%
- **Ukuran Folder:** `c-level-advisor/executive-mentor/skills/board-prep` = 12 KB; satu file `SKILL.md` (~160 baris): Phase 1 Numbers Cold, Phase 2 Hard Questions per topik (revenue/runway/product/team/competition), Phase 3 Narrative dengan struktur "where we are (honest) → plan".
- **Pemakaian konkret:** ganti nama jadi latihan Q&A jury dengan heading yang sama: (a) daftar angka yang harus dihafal (tolok ukur submisi, 11 kompetitor, target user, status 5/6 agent), (b) 10–15 pertanyaan adversarial juri beserta jawaban singkat — dipakai md kecil di `docs/juri-prep.md`, (c) struktur narasi "jujur soal status" yang persis selaras dengan checklist `docs/submission-draft.md:415` ("jujur soal status: Goal Agent live, 5 agent lain dalam pengembangan").
- **Edit/reduce:** potong bagian finansial startup yang tidak berlaku (MRR/ARR, burn rate, runway, NRR, CAC/LTV, churn, headcount) → ganti dengan placeholder angka hackathon; sisakan Phase 2 (hard questions) dan Phase 3 (narrative) utuh.
- **Dependensi eksternal:** nol. Teks murni.

### 3. internal-narrative (40 KB) — ADOPT versi shrink
- **Ukuran folder:** 40 KB; `SKILL.md` + `references/narrative-frameworks.md` + `templates/all-hands-template.md`.
- **Pemakaian konkret:** (1) buat **Core Narrative** satu paragraf langsung potong-tempel ke field submission 3 (Deskripsi Singkat 150–300 kata), 4 (Problem Statement), 6, 17 (Apa yang membuat beda); (2) **Audience Translation Matrix** untuk memetakan: juri Hacktiv8 → aspek edukasi/skill-building, IBM → integrasi Langflow/Bob, Komdigi → dampak nasional/ketenagakerjaan — satu kebenaran, tiga frame; (3) **Contradiction Detection** sebelum submit: cek konsistensi angka antar README.md, README.id.md, deck v2, dan 18 field submission (risiko kontradiksi adalah klaim "all agents live" vs checklist jujur).
- **Edit/reduce:** hapus Step 4 (cadence all-hands/investor update), Step 5 (struktur all-hands + failure modes), Step 6 (crisis communication 4-hour rule) dan `templates/all-hands-template.md` → hemat ±60% ukuran. Sisakan Step 1 (core narrative template), Step 2 (audience matrix), Step 3 (contradiction check + daftar common contradictions).
- **Dependensi eksternal:** nol.

## Alasan REJECT

### 4. md-slides (96 KB)
- Terbesar dari lima kandidat dan paling boros: `SKILL.md` 96 KB total = 3 skrip Python + 3 referensi + 1 template HTML.
- **Dependensi lintas-folder:** `deck_html_renderer.py:54-58` menyisipkan `sys.path` ke `markdown-html/skills/md-document/scripts` (import `markdown_parser`) dan design-system `config_loader`. Saya uji pipeline: `slide_splitter.py` + `deck_html_renderer.py` berhasil menghasilkan 4-slide HTML 10.481 byte, TAPI renderer jalan fallback senyap jika `markdown_parser` tidak ditemukan — output HTML akan kehilangan parser body slide bila hanya folder `md-slides` yang disalin.
- **Command di SKILL.md memakai path repo-root** (`python3 markdown-html/skills/md-slides/scripts/slide_splitter.py ...`) yang akan rusak begitu skill disalin ke `.bob/skills/` proyek.
- **Gerbak penolakan internal:** refuse <100 baris input, refuse 1-slide, refuse tanpa "onboarding", `--strict-notes` menuntut 50% cakupan notes → friksi tinggi, bukan alat "hari ini".
- **Gap nilai minimal:** deck 11 slide **sudah selesai** (2026-10-04, PPTX native 4,1 MB + speaker notes, `projects/serambi-pitch-deck-v2_20261004/exports/serambi-pitch-deck-v2_20261004_212630.pptx`) dan `pitch-deck` + `ppt-master` lokal sudah menutupi kebutuhan; submission mewajibkan upload deck PPTX, bukan HTML.

### 5. roadmap-communicator (32 KB)
- Nilai B paling rendah: submission hanya butuh field 16 "Potensi Pengembangan & Skalabilitas" yang sudah dilayani oleh slide 10 deck ("Future Development — Roadmap, next 3-6 months") dan skill lokal `transform-roadmap`.
- Format Now/Next/Later dan template quarterly sudah sepenuhnya redundan dengan dua aset di atas (inferensi dari isi `references/roadmap-templates.md`, 44 baris).
- Sisanya — stakeholder update templates dan `scripts/changelog_generator.py` (151 baris, baca git log + conventional commits) — berguna untuk tim software, bukan untuk menang penyisihan hackathon hari ini.
- Prioritas user eksplisit bisnis > teknis dan deadline 23:00: dua ADOPT lain (demo-video, board-prep) memberi pengembalian jauh lebih besar per jam.

## Coverage Status

**Diverifikasi langsung:**
- Kelima SKILL.md dibaca (jumlah baris & isi folder terdaftar di atas); ukuran KB diambil dengan `du -sk`.
- Ketersediaan tool: `ffmpeg` ADA di `/usr/bin`; playwright ABSEN (`npx --no-install` gagal); `edge_tts` Python ABSEN; `node` v24.21.0, `python3`, `uv`, `uvx` tersedia — karena itu dimensi (C) demo-video sudah setepatnya dinilai pada mode manual.
- Pipeline md-slides benar-benar dijalankan pada input uji 4 slide: split exit 0 (boundary=hr), render exit 0, output 10.481 byte; temuan fallback-senyap parser diperiksa dari kode sumber (`deck_html_renderer.py:54-60`), bukan dari judul.
- Skill lokal dibandingkan satu per satu: 82 skill di `.bob/skills/`; `pitch-deck` (8 KB, single SKILL.md 11-slide) dan `ppt-master` entri kecil; `transform-roadmap`, `competitive-analysis`, `red-team-prd`, `battlecard`, `business-model`, `proofread` semuanya SKILL.md satu berkas 8–12 KB.
- Status deck & checklist submission dibaca dari `docs/submission-draft.md:408-417` (deck selesai 2026-10-04; kecjujuran status agent live adalah syarat submit).

**Belum diverifikasi / sisa ketidakpastian:**
- Isi lengkap `references/scene-design-system.md` demo-video hanya dibaca 30 baris pertama (warna + timing) — sisanya (voice options, pacing guide) belum, tapi cukup untuk menilai adopsi.
- `narrative-frameworks.md` (internal-narrative) tidak dibaca; penilaian berbasis SKILL.md yang sudah memuat 6 step + template inline.
- Apakah `edge-tts` bisa dipasang via pip di lingkungan ini (uji hanya cek import) — diasumsikan ringan, ditandai sebagai opsional, bukan prasyarat.
- Belum diuji apakah `pip install edge-tts` atau pengunduhan browser playwright masuk akal dalam sisa waktu sebelum 23:00.
