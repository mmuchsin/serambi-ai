# Competitive Analysis — Serambi.ai

**Tanggal:** 2026-10-11 (v4 — ditambahkan Astra AI: kompetitor AI-tutor lokal berskala 15,2 juta pelajar, data harga & fitur terverifikasi dari App Store ID + landing page)
**Framework:** Competitive Landscape Analysis + Battlecard framing
**Skills applied:** `competitive-analysis`, `battlecard`, `value-proposition`
**Lens:** Hackathon pitch + investor positioning
**Competitors:** 9 direct + 2 indirect (11 total)

---

## Market Overview

The global EdTech & upskilling market grows at 11–14% CAGR, but growth is concentrated in **B2B/corporate reskilling** programs. Individual career switchers — self-directed learners who need personal, goal-anchored guidance — are systematically underserved. AI-powered tutoring systems exist, but almost none are designed around the *career goal → skill gap → adaptive scaffold* pipeline in Bahasa Indonesia.

OECD (2024) identifies a widening gap between tech skill demand and output from traditional educational institutions. Reskilling independently is increasingly the primary solution, but lacks adaptive support infrastructure — the exact gap Serambi.ai fills.

**Key market signal:** Dicoding has **1,327,000+ registered developers** from **523 cities** across Indonesia, with 843,000+ active learners in Dicoding Academy — proof that Indonesian developers will use structured online learning at scale. The gap is that none of these platforms are *adaptive to the individual's career goal*.

**Kill-shot market signal (Okt 2026):** **Astra AI** — AI tutor yang dibangun di Slovenia (Astra AI d.o.o.), sudah melayani **15.206.000+ pelajar** di 40+ negara dengan 37+ bahasa (termasuk bahasa Indonesia), rating **4,9/5 dari 442 rating** di App Store Indonesia dan peringkat **No. 8 Top Free Education** ID. Ini bukti dua hal sekaligus: (a) pasar Indonesia sudah *membayar* untuk AI tutor — Astra AI Plus **Rp 115.000/bulan**, Sigma **Rp 385.000/bulan**, credit pack Rp 299.000–1.999.000 (App Store ID, Okt 2026); (b) permintaan itu terpusat di **tujuan ujian sekolah (SMP/SMA/kuliah)**, bukan **tujuan karier**. Positioning Astra sendiri adalah "ganti guru les privat" dan "hadapi ujian 2x lebih cepat" — *career goal decomposition* sama sekali belum ada di sana.

---

## Competitive Landscape

| Competitor | Category | Target | Positioning | Strength | Weakness |
|-----------|----------|--------|-------------|----------|----------|
| **ChatGPT / Gemini** | General AI chatbot | Everyone | Universal assistant | Instant answers, free, multilingual | Oracle mode — no scaffold, no goal anchoring, promotes cognitive offloading (BJET, cited 694×) |
| **Ruangguru / Zenius** | Local EdTech | Indonesian students | Structured curriculum + live tutors | Strong local brand, Bahasa Indonesia, affordable | Fixed curriculum, not career-goal-anchored, no adaptive roadmap |
| **Coursera / Udemy** | MOOC platform | Global learners | Certificate courses | Huge catalog, employer recognition | One-size-fits-all, ~90% dropout, no personal roadmap |
| **Dicoding** | Local dev education | Indonesian developers | Structured coding path + certification | Largest Indonesian dev community (1.3M+ registered, 843K+ active learners), Bahasa Indonesia, industry-relevant tracks | Fixed learning paths, not personalized to career goal, no adaptive AI, no spaced repetition |
| **Boot.dev** | Gamified backend dev | Self-taught developers | "Learn backend in the right order" | Strong opinionated learning path, gamified, CS fundamentals, Socratic AI ("Boots") with in-game penalty for over-reliance | English-only, backend-specific, no career-goal mapping, no Indonesian |
| **DataCamp** | Data skills platform | Data practitioners | Hands-on data science/analytics | High-quality data curriculum, interactive exercises, skill tracks | English-first, one-size-fits-all tracks, no career goal decomposition, subscription cost |
| **Khan Academy (Khanmigo)** | AI tutor | K-12 students | Socratic AI tutor | Research-backed pedagogy, Socratic method | English-only, K-12 focus, not career-switching context |
| **LinkedIn Learning** | Corporate upskilling | Working professionals | Skills for work | Employer-linked, broad catalog | No goal decomposition, not adaptive, English-first |
| **Duolingo** | Spaced rep app | Language learners | Gamified spaced repetition | Habit loop design, proven retention | Single domain (language), no career roadmap |
| **Cakap** | Local online course | Indonesian professionals | Live classes + certification | Local focus, Bahasa Indonesia | Instructor-dependent, not AI-adaptive, fixed schedule |
| **Astra AI** | AI tutor (mobile-first, global — Astra AI d.o.o., Slovenia) | Pelajar SMP/SMA/kuliah, 40+ negara | "Ganti guru les privat — hadapi ujian 2x lebih cepat" | **15.206.000+ pelajar**, 37+ bahasa (incl. Indonesia), rating 4,9/5 (442 rating ID), multi-modal (video, podcast, 3D simulasi, flashcards, kuis), Socratic Mode + Solver Mode + Exam Prep, gamifikasi streak | Fokus **ujian sekolah**, bukan karier — tanpa career-goal decomposition, tanpa roadmap karier, tanpa wellbeing check untuk profesional, konten = kurikulum sekolah |

---

## Feature Comparison Matrix

| Capability | **Serambi.ai** | ChatGPT | Ruangguru | Dicoding | Boot.dev | DataCamp | Khanmigo | Astra AI |
|-----------|:-----------:|:-------:|:---------:|:--------:|:--------:|:--------:|:--------:|:--------:|
| Goal → personal roadmap | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| **Career-goal anchoring** | ✅ | ❌ | ❌ | ⚠️ tracks | ⚠️ path | ⚠️ tracks | ❌ | ❌ |
| Bahasa Indonesia native | ✅ | ⚠️ | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ |
| Scaffold (not oracle) | ✅ | ❌ | ⚠️ | ❌ | ⚠️ partial | ❌ | ✅ | ⚠️ Socratic Mode, tapi Solver Mode ada |
| Feynman / probing questions | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| Graduated hinting | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ❌ |
| Adaptive spaced repetition | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ⚠️ flashcards |
| Burnout / wellbeing check | ✅ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Interactive coding exercises | 🔜 | ❌ | ⚠️ | ✅ | ✅ | ✅ | ❌ | ❌ |
| Multi-modal (video/podcast/3D sim) | 🔜 | ❌ | ✅ | ❌ | ❌ | ❌ | ✅ | ✅ |
| Structured curriculum depth | 🔜 | ❌ | ✅ | ✅ | ✅ | ✅ | ⚠️ | ✅ |
| Mobile-native consumer scale | 🔜 | ⚠️ | ✅ | ⚠️ | ❌ | ⚠️ | ⚠️ | ✅ 15,2 juta |
| Research-backed pedagogy | ✅ 30+ papers | ❌ | ❌ | ❌ | ❌ | ❌ | ✅ | ⚠️ internal dataset |
| Modular agent architecture | ✅ MCP | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ |
| Available now (MVP) | ✅ Goal Agent | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Free tier | 🔜 | ✅ | ⚠️ | ✅ | ✅ | ❌ | ✅ | ⚠️ trial |
| Consumer price anchor (ID) | TBD | gratis | terjangkau | ±Rp 150–500rb/bln | $29/bln | ±$25/bln | gratis | **Rp 115rb/bln Plus · Rp 385rb/bln Sigma** |

---

## Competitor Profiles — New Entrants

### Astra AI *(baru di v4 — kompetitor paling berbahaya di pasar Indonesia)*
- **Positioning:** "Siap hadapi ujian 2x lebih cepat dengan AI" — "ganti guru les privat". Dibangun di Slovenia (Astra AI d.o.o.), kini 40+ negara dan 37+ bahasa termasuk bahasa Indonesia. Tagline pasar: *"Meet your tutor, free"* + "better than my tutor, for less".
- **Skala & traction:** **15.206.000+ pelajar** (halaman resmi), rating **4,9/5 dari 442 rating** App Store Indonesia (Okt 2026), **No. 8 Top Free Education** Indonesia. App 27,7 MB, iOS 15+, age rating 9+.
- **Fitur inti:** (1) unggah catatan/slide/soal tahun lalu → rencana belajar personal; (2) **Socratic Mode** (eksplorasi konsep) + **Solver Mode** (bantuan PR instan) + **Exam Prep** (revisi terarah); (3) multi-modal: video interaktif, podcast, simulasi 3D per mata pelajaran; (4) gamifikasi streak; (5) flashcards & kuis; (6) mastery gating — *"nggak lanjut sebelum kamu paham"*.
- **Model harga (App Store ID, Okt 2026 — data riil, bukan estimasi):** Free + IAP: Astra AI Plus **Rp 115.000/bulan** atau **Rp 575.000/tahun**, Weekly Rp 119.000; Astra AI Sigma **Rp 385.000/bulan**; Credit Pack 2x Rp 299.000 · 3x Rp 599.000 · 5x Rp 999.000 · 10x Rp 1.999.000.
- **Kekuatan:** mobile-native consumer distribution 15 juta user; multi-modal engagement (video/3D/podcast — Serambi belum punya); bahasa Indonesia lokal; harga rupiah yang terjangkau vs bimbel; testimoni konkret ("naik dua tingkat nilai dalam 4 minggu", "7/20 → 16-20").
- **Kelemahan (peluang Serambi):** (1) **tanpa career-goal decomposition** — targetnya ujian sekolah, bukan jalur karier; (2) dua mode kontradiktif (Socratic *dan* Solver Mode) — justru membuka pintu cognitive offloading yang BJET tunjukkan merusak learning motivation & performance; (3) tanpa spaced repetition yang berbasis forgetting curve adaptif; (4) tanpa wellbeing/burnout check — kritis untuk profesional yang tetap kerja; (5) **tanpa research-grounded pedagogy** yang terpublikasi; (6) tanpa arsitektur modular/B2B white-label.
- **vs Serambi.ai:** Astra menjawab *"bagaimana lulus ujian berikutnya"*. Serambi menjawab *"bagaimana pindah karier dalam 6 bulan sambil tetap kerja"* — target, horizon, dan stakeholder berbeda (pelajar vs profesional), dan Serambi selaras dengan Boot.dev dalam menolak oracle mode. **Integrasi, bukan substitusi:** kursus Dicoding/Boot.dev/DataCamp bisa jadi milestone di roadmap Serambi, sementara Astra adalah kanal distribusi dan kanal riset perilaku (mastery gating, streak, multi-modal) yang layak dipelajari — bukan ditiru total.

### Dicoding
- **Positioning:** Indonesia's largest structured developer education platform. Certification-driven, industry partnerships (Google, AWS, IBM, Dicoding Academy).
- **Strengths:** **1,327,000+ registered developers** from **523 cities** — Indonesia's largest developer education platform. 843,000+ active learners in Dicoding Academy. 213 programming classes. 42,000+ challenge participants. Gamification: Dicoding Points → rewards. Curriculum partners: Google, AWS, IBM. Industry-recognized certificates, project-based learning, active community.
- **Weaknesses:** Fixed learning paths (not personal to career goal), no AI-adaptive layer, no forgetting curve / spaced repetition, no wellbeing support. Progress = course completion ≠ career readiness.
- **Pricing:** Free (basic) + Dicoding Premium (~IDR 150K–500K/month).
- **Market traction:** Dominant in Indonesian developer community; Google Developer Student Clubs integration; 4 pillars: Academy, Challenge, Event, Jobs.
- **vs Serambi.ai:** Dicoding is *where you take the course*. Serambi.ai is *how you figure out which course to take, in what order, for your specific goal* — then stays with you to make sure the knowledge sticks. They're complementary, not substitutes.

### Boot.dev
- **Positioning:** "Learn backend development by actually building things." Founded by Lane Wagner — originally built to help his wife switch careers (x-ray technician → software engineer). Strong opinionated learning path: CS fundamentals → backend → system design, in the right order.
- **8 core beliefs (from about page):** CS fundamentals matter (degrees don't), coding is fun, no shortcuts (12+ months realistic), stay uncomfortable (Zone of Proximal Development), **"Avoid AI when learning"**, bite-sized lessons + full projects, go deeper, build and deploy.
- **Boots (AI chatbot):** Boot.dev's AI tutor uses **Socratic method** and applies an **in-game XP penalty** when learners rely on it too much — philosophically the closest to Serambi.ai's scaffold-not-oracle principle among all competitors.
- **Strengths:** Opinionated CS-foundation-first path, gamified (XP system), community-driven (Discord), Socratic AI prevents cognitive offloading.
- **Weaknesses:** English-only, backend specialization only (not data, ML, cloud), no Bahasa Indonesia, fixed path not personalized to stated career goal, no spaced repetition outside exercises.
- **Pricing:** Free (limited) + ~$29/month or $249/year.
- **vs Serambi.ai:** Boot.dev is philosophically the closest competitor — both believe in scaffold over oracle, both resist AI dependency. But Boot.dev is English-only and backend-specific. Serambi.ai owns the same scaffold philosophy for **all career paths in Bahasa Indonesia**. Boot.dev courses can be *milestones within a Serambi.ai roadmap* — integration partners, not substitutes.

### DataCamp
- **Positioning:** "Learn data skills online." Skill tracks for data analyst, data scientist, ML engineer; interactive in-browser exercises; assessment tools.
- **Strengths:** High-quality data curriculum, interactive exercises (code in browser), skill assessment at start of track, employer partners (DataCamp Donates program), certificate recognized by data teams.
- **Weaknesses:** Subscription cost (~$25–33/month, expensive for Indonesian market), English-first (limited Bahasa Indonesia content), fixed track structure not personalized to career timeline, no forgetting curve / adaptive review scheduling, no goal decomposition.
- **Pricing:** ~$25/month (individual), enterprise pricing for B2B.
- **vs Serambi.ai:** DataCamp is a strong *content platform* for data roles. Serambi.ai is the *adaptive navigation layer* on top of any content — including DataCamp courses. For a user who says "I want to be a data analyst in 3 months," Serambi.ai's Goal Agent builds the roadmap and could recommend specific DataCamp modules as milestones. Complementary, not substitute.

---

## Battlecard Summary — Win/Lose Reasons

### vs Dicoding
| When Serambi.ai **wins** | When Serambi.ai **loses** |
|--------------------------|--------------------------|
| User doesn't know where to start or which path fits their specific goal | User specifically wants an industry-recognized Dicoding certificate |
| User has taken some Dicoding courses but feels lost or behind | User wants a structured course catalog with instructor support |
| User burns out and needs wellbeing support | User prefers structured cohort learning over self-paced AI |
| User needs adaptive review to retain what they learned | — |

**Objection handling:** *"Dicoding sudah ada, kenapa pakai Serambi.ai?"*
> "Dicoding adalah tempat kamu belajar. Serambi.ai adalah yang bantu kamu tahu *harus belajar apa dulu, dalam urutan apa, sesuai target karier kamu* — dan pastikan yang sudah dipelajari tidak lupa. Bisa dipakai bareng Dicoding."

### vs Boot.dev
| When Serambi.ai **wins** | When Serambi.ai **loses** |
|--------------------------|--------------------------|
| User wants to pivot to backend *and* other domains (data, ML, cloud) | User is committed to backend-only path and comfortable with English |
| User needs Bahasa Indonesia interface | User is English-proficient and values Boot.dev's CS-foundation-first approach |
| User's goal is broader than just backend | User is motivated by Boot.dev's gamification and community Discord |

**Objection handling:** *"Boot.dev sudah bagus untuk backend."*
> "Boot.dev bagus untuk orang yang sudah tahu mau jadi backend dev dan nyaman English. Kalau kamu masih nentuin arah, atau mau data/ML/cloud, atau butuh Bahasa Indonesia — Serambi.ai dimulai dari goal kamu, bukan dari kurikulum tetap."

### vs DataCamp
| When Serambi.ai **wins** | When Serambi.ai **loses** |
|--------------------------|--------------------------|
| User is early-stage career switcher (doesn't know SQL vs Python yet) | User is mid-level data practitioner who knows exactly what to learn |
| User can't afford DataCamp subscription (~$25/month) | User needs interactive in-browser coding exercises (DataCamp's real strength) |
| User wants to track progress toward career goal, not just course completion | User works at a company with DataCamp enterprise license |
| User needs adaptive review, not just completing videos | — |

**Objection handling:** *"DataCamp sudah punya skill tracks untuk data analyst."*
> "DataCamp punya konten yang bagus. Tapi dia mulai dari kurikulum, bukan dari goal kamu. Serambi.ai mulai dari 'dalam 3 bulan kamu mau jadi data analyst' — lalu baru pilihkan materi apa, kapan, dan pastikan kamu tidak lupa sebelum wawancara."

### vs Astra AI *(baru di v4)*
| When Serambi.ai **wins** | When Serambi.ai **loses** |
|--------------------------|--------------------------|
| User wants a *career switch*, not the next exam — 22–35-year-old professional who keeps working | User is a 13–19-year-old student preparing for school/university exams |
| User needs Bahasa Indonesia *and* local career context (which role, which timeline, what salary band) | User wants the polished multi-modal experience (video, podcast, 3D sim, app 27MB) Astra already ships |
| User needs spaced repetition tied to a forgetting curve for long-arc skill retention | User values streak gamification and viral consumer marketing |
| User is an adult learner at burnout risk — needs wellbeing checks | User is fine with an oracle: Astra ships **Solver Mode** next to Socratic Mode |
| User is an institution (bootcamp/kampus) wanting white-label adaptive layer | User (consumer) prefers paying Rp 115rb/bulan for a polished mobile app |

**Objection handling:** *"Astra AI sudah 15 juta user dan bahasanya bagus, kenapa bukan itu?"*
> "Astra luar biasa untuk ujian sekolah — dan itu memang masalahnya: dia dirancang untuk 'lulus ujian berikutnya', bukan 'ganti karier dalam 6 bulan sambil tetap kerja'. Serambi mulai dari goal karier: role apa, sampai kapan, apa yang harus dikuasai tiap minggu. Dan Serambi mematikan oracle: AI-nya sengaja tidak menjawab langsung, karena riset BJET (cited 700+) menunjukkan jawaban instan justru menurunkan motivasi dan performa belajar — Astra sendiri menawarkan Solver Mode yang kebalikannya."

**Integrasi yang realistis (bukan head-on):** Astra adalah kompetitor di segmen *pelajar*, bukan *profesional*. Strategi: pelajari mekanika retensi mereka (streak, unggah-catatan → rencana belajar, mastery gating "nggak lanjut sebelum kamu paham") dan jadikan Serambi dapat diakses mobile-first dengan price anchor serupa (Rp 115rb/bln = benchmark pasar riil, bukan tebakan).

---

## Positioning Map

Two axes: **Adaptivity** (goal-anchored, AI-personal) vs **Indonesia focus** (Bahasa Indonesia + local career context).

```
                    HIGH ADAPTIVITY
                         |
          Serambi.ai ●   |   ← unclaimed quadrant
        (goal-first,     |
         scaffold,       |         ● Khanmigo      ● Astra AI
         BahasaIndo)     |           (high adapt,   (high adapt, exams,
                         |            English)       Bahasa ID, 15M users)
                         |
BAHASA ──────────────────┼────────────────────── ENGLISH /
INDONESIA                |                       GLOBAL
         ● Ruangguru     |
         ● Zenius        |    ● Boot.dev (opinionated path, English)
         ● Dicoding      |    ● DataCamp (data tracks, English)
         ● Cakap         |    ● Coursera / LinkedIn Learning
                         |    ● ChatGPT (universal, low adapt)
                    LOW ADAPTIVITY
```

**v4 update:** Astra AI naik ke kuadran high-adaptivity (personal study plan + Socratic Mode + 15 juta user) — jadi "unclaimed quadrant" tidak lagi 100% kosong. Yang tetap kosong: **goal karier** sebagai sumbu masuk. Astra mulai dari *catatan & ujian kamu*; Serambi mulai dari *karier yang kamu tuju*. Perbarui framing pitch: bukan "kuadran kosong", tapi **"satu-satunya yang memulai dari tujuanku"** (job-based, like JJJ framework).

**Serambi.ai occupies the unclaimed top-left quadrant.**
Dicoding and Ruangguru are Bahasa Indonesia but low adaptivity.
Boot.dev and DataCamp are opinionated but English-only and fixed path.
Khanmigo is high adaptivity but English-only and K-12 focused.

---

## Differentiation Opportunities

### 1. "Scaffold, not oracle" — the anti-ChatGPT position
Every competitor either gives direct answers (ChatGPT/Gemini) or delivers passive content (MOOCs, Dicoding, DataCamp). Serambi.ai is the only product *explicitly designed* to not answer directly.

> **Tagline:** *"ChatGPT membuat kamu bergantung. Serambi.ai membuat kamu capable."*

**Research:** BJET (cited 694×); Feynman Bot (arXiv 2506.09055) — 80%+ prefer over passive; IntelliCode (FWCI 23.5).

### 2. Goal-first architecture — no one else starts here
Dicoding: starts from course catalog. DataCamp: starts from skill track. Boot.dev: starts from curriculum. **Serambi.ai: starts from your career goal.** Natural language → weekly roadmap in < 1 minute. Already e2e verified.

### 3. Bahasa Indonesia + local career context — unclaimed adaptive quadrant
Dicoding and Ruangguru have the language but not the adaptivity. Boot.dev and DataCamp have quality but not the language. Serambi.ai is the only adaptive AI tutor designed for Indonesian career switchers from the ground up.

### 4. Complementary to, not competing with, Dicoding/DataCamp/Boot.dev
This is a **strategic positioning opportunity**: Serambi.ai can recommend Dicoding certificates, DataCamp modules, or Boot.dev courses as *milestones within the roadmap*. Frame Serambi.ai as the "learning OS" on top of content platforms — the layer that decides *what to study, when, and how to make sure it sticks*.

### 5. Research depth — 30+ papers with FWCI scores
Unusual for any EdTech product, let alone a hackathon prototype. Trust signal with judges, investors, and institutional B2B buyers (bootcamp, kampus, Komdigi).

### 6. Modular MCP architecture — B2B moat
Each agent is an independent Langflow flow exposed as a named MCP tool. Dicoding, DataCamp, and Boot.dev are monolithic platforms. Serambi.ai can be embedded as a white-label adaptive layer inside any of them.

---

## Competitive Threats

| Threat | Likelihood | Recommended Response |
|--------|-----------|---------------------|
| ChatGPT Custom GPTs / "career coach" GPT | High | Scaffold-not-oracle is structural, not just prompting; hard to enforce in oracle-first architecture |
| Dicoding adds AI adaptive recommendation | Medium-High | They have distribution; build goal-decomposition moat deep before they catch up |
| DataCamp adds Bahasa Indonesia + roadmap layer | Medium | Cost and English dependency are structural; attack the affordable + local angle |
| Boot.dev expands to non-backend domains | Low-Medium | They're opinionated by design; expanding to all domains would dilute their identity |
| Ruangguru acquires or builds AI adaptive tutoring | Medium | Has brand + distribution; build research credibility and MCP architecture as switching-cost moat |

---

## Recommendations

**Double down on:**
- Scaffold pedagogy — the research moat is rare and defensible
- Goal decomposition — the hook that no one (including Dicoding, DataCamp) has
- Bahasa Indonesia native — language moat + local career context
- "Learning OS" framing — Serambi.ai routes you *to* Dicoding/DataCamp, not against them
- MCP modularity — B2B white-label unlock

**Close the gap on:**
- Interactive coding exercises (DataCamp/Boot.dev strength) — integrate or recommend, don't rebuild
- Free tier — needed to compete with Dicoding and ChatGPT as first touchpoint
- Web app distribution — currently dev-harness only

**Ignore:**
- Matching Dicoding's certificate catalog or DataCamp's content breadth — wrong game
- English-language market for now — local focus is the structural advantage

---

## Research Grounding

| Klaim kompetitif | Riset pendukung |
|-----------------|----------------|
| AI oracle mode memicu cognitive offloading | BJET (cited 694×) — Metacognitive Laziness |
| Scaffold + Feynman lebih efektif dari passive reading | Feynman Bot (arXiv 2506.09055) — 80%+ prefer |
| Graduated hinting meningkatkan task success | IntelliCode (FWCI 23.5) |
| Goal-anchored learning meningkatkan personalisasi | GenMentor (FWCI 47.3) |
| Adaptive spaced repetition +15–20% retention | Zaidi et al. (arXiv 2004.11327) |
| AI intervention in SRL: effect size g = 1.613 | Frontiers in Education 2025 (32 studies) |
