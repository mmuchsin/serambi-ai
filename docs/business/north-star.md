# North Star Metric — Serambi.ai

**Tanggal:** 2025-10-03  
**Framework:** North Star + Input Metrics

---

## Business Game Classification

**Game:** **Productivity** (SaaS / EdTech tool)  
Pengguna membayar (atau didanai) karena Serambi.ai membantu mereka mencapai outcome nyata — career transition — lebih cepat dan lebih efisien. Revenue berasal dari value delivered (reskilling berhasil), bukan waktu yang dihabiskan di platform.

> ⚠️ Bukan "Attention" (kita tidak ingin user scroll lama), bukan "Transaction" (tidak ada jual beli satu kali).

---

## North Star Metric

### Kandidat

| # | Kandidat | Reasoning |
|---|----------|-----------|
| A | **Weekly Learning Sessions Completed** | Mengukur engagement, tapi tidak capture apakah belajar efektif |
| B | **Milestones Achieved per User per Month** | Lebih dekat ke outcome, tapi milestone bisa di-game |
| **C** | **Career Goal Progress Rate** (% roadmap completed toward stated goal) | ✅ Paling dekat ke value nyata — apakah user maju menuju target role mereka? |

### Rekomendasi: **Career Goal Progress Rate**

**Definisi:**  
`(Milestones completed this week / Total milestones in roadmap) × 100`  
Dilaporkan per user per minggu, dirata-ratakan.

**Target awal (hackathon):** N/A — MVP belum produksi  
**Target 3 bulan post-launch:** Rata-rata progress ≥ 15%/minggu per active user

---

## Validasi North Star

| Kriteria | Pass? | Catatan |
|----------|-------|---------|
| Mengekspresikan value ke user | ✅ | User maju menuju career goal mereka — ini yang mereka bayar |
| Leading indicator revenue | ✅ | User yang progress tinggi → lebih mungkin berlangganan, refer teman |
| Measurable | ✅ | Bisa dihitung dari data roadmap + milestone completion |
| Understandable oleh tim | ✅ | "Seberapa cepat user maju?" — semua paham |
| Actionable | ✅ | Setiap agent (Goal, Tutor, Assessment, Progress) punya pengaruh langsung |
| Bukan vanity metric | ✅ | Bukan DAU/MAU — harus ada progress nyata |
| Tidak bisa di-game tanpa deliver value | ✅ | Milestone hanya count jika quiz/task selesai dengan benar |

---

## Input Metrics

| Input Metric | Drives North Star By | Agent Owner |
|-------------|---------------------|-------------|
| **Goal Decomposition Quality Score** | Roadmap yang lebih baik = lebih mudah diikuti | Goal Agent |
| **Concept Retention Rate** (quiz retake score improvement) | User yang paham konsep = lebih cepat capai milestone | Tutor + Assessment Agent |
| **Weekly Session Streak** | Konsistensi belajar langsung drives progress | Motivator Agent |
| **Hint Escalation Rate** (% yang butuh hint ke-3) | Indikator kesulitan — high rate = materi terlalu sulit | Tutor Agent |
| **Wellbeing Score** | User yang burn out stop belajar = progress drop | Wellbeing Agent |

---

## Metrics Constellation

```
Career Goal Progress Rate (North Star)
├── Goal Decomposition Quality Score          ← Goal Agent
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
| **Hint Escalation Rate** | Materi terlalu mudah atau terlalu sulit (keduanya tidak produktif) |
| **Burnout Risk Flag** | Optimisasi progress yang sacrifices wellbeing |
| **Time-to-First-Milestone** | Roadmap yang terlalu panjang sebelum user lihat progress |

---

## Anti-Patterns yang Dihindari

| Metric yang Ditolak | Alasan |
|--------------------|--------|
| DAU/MAU | Vanity — user bisa login tanpa belajar |
| Total sessions | Lebih banyak sesi ≠ lebih efektif |
| Revenue | Lagging indicator, tidak capture user value |
| Quiz completion rate | Bisa diselesaikan tanpa pemahaman nyata |

---

## Research Grounding

| Klaim | Riset |
|-------|-------|
| Goal-anchored learning meningkatkan progress | GenMentor (FWCI 47.3) — goal decomposition ke milestones |
| Spaced repetition personal > fixed schedule 15-20% | Zaidi et al. (arXiv 2004.11327) |
| Burnout tracking kritis untuk retention | Metacognitive Laziness (BJET, cited 694) |
