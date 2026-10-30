# North Star Metric — Serambi.ai

**Tanggal:** 2026-10-30 (v2 — AI Literacy Pivot)  
**Framework:** North Star + Input Metrics

---

## Business Game Classification

**Game:** **Productivity** (SaaS / EdTech tool)  
Pengguna membayar (atau didanai) karena Serambi.ai membantu mereka mencapai outcome nyata — **adopsi AI yang efektif untuk profesi mereka** — lebih cepat dan lebih efisien. Revenue berasal dari value delivered (AI literacy tercapai), bukan waktu yang dihabiskan di platform.

> ⚠️ Bukan "Attention" (kita tidak ingin user scroll lama), bukan "Transaction" (tidak ada jual beli satu kali).

---

## North Star Metric

### Kandidat

| # | Kandidat | Reasoning |
|---|----------|-----------|
| A | **Weekly Learning Sessions Completed** | Mengukur engagement, tapi tidak capture apakah belajar efektif |
| B | **Milestones Achieved per User per Month** | Lebih dekat ke outcome, tapi milestone bisa di-game |
| **C** | **AI Literacy Adoption Rate** (% roadmap AI literacy completed per profesi) | ✅ Paling dekat ke value nyata — apakah user maju menuju AI literacy untuk profesi mereka? |

### Rekomendasi: **AI Literacy Adoption Rate**

**Definisi:**  
`(AI Literacy Milestones completed this week / Total milestones in profession-specific roadmap) × 100`  
Dilaporkan per user per minggu, dirata-ratakan. Milestone = modul AI literacy yang diselesaikan dengan mastery (quiz + Feynman explanation + spaced repetition review).

**Target awal (hackathon):** N/A — MVP belum produksi  
**Target 3 bulan post-launch:** Rata-rata adoption rate ≥ 15%/minggu per active user

---

## Validasi North Star

| Kriteria | Pass? | Catatan |
|----------|-------|---------|
| Mengekspresikan value ke user | ✅ | User maju menuju AI literacy untuk profesi mereka — ini yang mereka butuhkan |
| Leading indicator revenue | ✅ | User yang adoption tinggi → lebih mungkin berlangganan, refer teman, B2B upsell |
| Measurable | ✅ | Bisa dihitung dari data roadmap + milestone AI literacy completion |
| Understandable oleh tim | ✅ | "Seberapa cepat user adopt AI untuk profesi mereka?" — semua paham |
| Actionable | ✅ | Setiap agent (Goal, Tutor, Assessment, Progress, Motivator, Wellbeing) punya pengaruh langsung |
| Bukan vanity metric | ✅ | Bukan DAU/MAU — harus ada progress AI literacy nyata |
| Tidak bisa di-game tanpa deliver value | ✅ | Milestone hanya count jika quiz + Feynman explanation + review selesai dengan benar |

---

## Input Metrics

| Input Metric | Drives North Star By | Agent Owner |
|-------------|---------------------|-------------|
| **Profession Decomposition Quality Score** | Roadmap AI literacy yang lebih personal per profesi = lebih mudah diikuti | Goal Agent |
| **Concept Retention Rate** (quiz retake score improvement + Feynman explanation quality) | User yang paham konsep AI = lebih cepat capai milestone AI literacy | Tutor + Assessment Agent |
| **Weekly Session Streak** | Konsistensi belajar AI langsung drives progress | Motivator Agent |
| **Hint Escalation Rate** (% yang butuh hint ke-3) | Indikator kesulitan — high rate = materi terlalu sulit / tidak relevan profesi | Tutor Agent |
| **Wellbeing Score** | User yang burn out stop belajar AI = adoption drop | Wellbeing Agent |

---

## Metrics Constellation

```
AI Literacy Adoption Rate (North Star)
├── Profession Decomposition Quality Score    ← Goal Agent
├── Concept Retention Rate                    ← Tutor + Assessment Agent
│   ├── Hint Escalation Rate (counter)
│   └── Quiz Pass Rate (1st attempt)
├── Weekly Session Streak                     ← Motivator Agent
└── Wellbeing Score                           ← Wellbeing Agent
    └── Burnout Risk Flag (counter)
```

---

## Counter-Metrics

| Metric | Melindungi Dari |
|--------|----------------|
| **Hint Escalation Rate** | Materi AI terlalu mudah atau terlalu sulit (keduanya tidak produktif) |
| **Burnout Risk Flag** | Optimisasi adoption yang sacrifices wellbeing |
| **Time-to-First-Milestone** | Roadmap AI literacy yang terlalu panjang sebelum user lihat progress |

---

## Anti-Patterns yang Dihindari

| Metric yang Ditolak | Alasan |
|--------------------|--------|
| DAU/MAU | Vanity — user bisa login tanpa belajar AI |
| Total sessions | Lebih banyak sesi ≠ lebih efektif adopsi AI |
| Revenue | Lagging indicator, tidak capture user value |
| Quiz completion rate | Bisa diselesaikan tanpa pemahaman nyata (Feynman check mencegah ini) |
| Course completion rate | Fixed course ≠ adaptive AI literacy roadmap |

---

## Research Grounding

| Klaim | Riset |
|-------|-------|
| Goal/Profession-anchored learning meningkatkan progress | GenMentor, 2025 (DOI 10.1145/3701716.3715244) — goal decomposition ke milestones |
| Spaced repetition memanfaatkan forgetting curve per konsep | Zaidi et al., AIED 2020 (arXiv 2004.11327) — model, bukan angka perbaikan |
| Burnout tracking kritis untuk retention | Metacognitive Laziness (BJET, DOI 10.1111/bjet.13544, sitasi 700+) |
| Scaffold (Feynman) > Oracle mode untuk AI literacy | Feynman Bot (arXiv 2506.09055) — 80%+ prefer AI Feynman technique over passive re-reading; Protégé Effect (Chase et al. 2009) |
| Graduated hinting meningkatkan task success vs direct answers | IntelliCode (FWCI 23.5) |
| AI intervention in SRL: effect size g = 1.613 | Frontiers in Education 2025 (32 studies, arXiv 2504.11572) |

---

## V2 Changes from V1 (Career Switcher)

| Aspect | V1 (Career Switcher) | V2 (AI Literacy Pivot) |
|--------|---------------------|------------------------|
| **North Star Name** | Career Goal Progress Rate | **AI Literacy Adoption Rate** |
| **Definition** | % roadmap completed toward target tech role | **% AI literacy milestones completed per profession** |
| **Goal Agent Metric** | Goal Decomposition Quality Score | **Profession Decomposition Quality Score** |
| **Target User** | Career switcher → Data Analyst, etc. | **Profesional non-teknis: guru, UMKM, ekspor-impor, dokter, akuntan, admin, HR, content creator, digital marketing, aparatur** |
| **Value Proposition** | Reskilling ke career tech | **Adopsi AI efektif untuk profesi existing** |
| **B2B Angle** | Bootcamp/kampus reskilling | **Komdigi/Kemendikbud + korporat upskill non-teknis massal** |