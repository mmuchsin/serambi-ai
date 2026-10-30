# Go-to-Market — Serambi.ai (v2 — AI Literacy Pivot)

**Tanggal:** 2026-10-30 (v2 — AI Literacy Pivot)  
**Identitas:** M. Muchsin, S2 Informatika, Universitas Negeri Semarang  
**Status:** Draft untuk diskusi mentor — monetisasi terbuka

---

## Latar Belakang Singkat

Serambi.ai adalah **navigasi AI literacy adaptif untuk profesional non-teknis Indonesia**. Input: profesi + hobi + level AI + jam belajar/minggu. Output: roadmap AI literacy 12 minggu personal per profesi, scaffold (bukan oracle) dengan Feynman technique, graduated hinting, spaced repetition, dan wellbeing check. Bahasa Indonesia native, PWA (Nuxt 4).

**Target utama (Beachhead):** 10 profesi non-teknis prioritas — guru, UMKM/ekspor-impor, dokter/tenaga kesehatan, akuntan/keuangan, admin/sekretaris, HR/rekrutmen, content creator, digital marketing, aparatur publik, freelancer kreatif.

**Kompetitor langsung:**
- **ailene.id** — AI tooling/prompting course (fixed levels, sekali bayar, 17K member, Rp 799rb–1,49jt)
- **Astra AI** — AI tutor ujian sekolah (15.2M users, Rp 115rb/bln, bukan AI literacy profesi)
- **Dicoding/Ruangguru/Cakap** — fixed curriculum, low adaptivity
- **ChatGPT/Gemini/Copilot** — oracle mode, no structure, cognitive offloading risk

---

## Dua Hipotesis Go-to-Market (Diperbarui untuk AI Literacy)

### Hipotesis 1: B2C Individual — "Roadmap AI Literacy Profesi Pertama Gratis, Langganan untuk Semua Profesi & Fitur Lanjut"

**Ide:** Pengguna gratis mendapat satu roadmap AI literacy 12 minggu untuk **satu profesi** + fitur dasar (Feynman, hinting, quiz). Langganan bulanan membuka **semua 10+ profesi**, spaced repetition review, wellbeing check, export roadmap, priority support.

| Elemen | Detail |
|--------|--------|
| Target | Profesional non-teknis Indonesia 25–50 tahun, bekerja full-time, butuh AI untuk profesi existing |
| Value proposition | "Dapatkan roadmap AI literacy 12 minggu personal untuk profesi Anda — dalam 1 menit, Bahasa Indonesia, gratis untuk profesi pertama" |
| Channel | WhatsApp (validasi survei mini), Instagram, LinkedIn, komunitas profesi (Ikatan Guru, Himpunan UMKM, Ikatan Dokter, IAI, komunitas HR, dll.) |
| Harga anchor | **Rp 39.000–79.000/bln** (benchmark: Astra AI Rp 115rb/bln; ailene.id Rp 799rb sekali bayar; Netflix ID Rp 54–186rb; Spotify ID Rp 59rb) |
| CPA target | < Rp 40.000 per pengguna aktif (organik via komunitas profesi) |
| Uji murah | Landing page PWA + WA blast ke komunitas profesi target; tawarkan roadmap profesi pertama gratis 2 minggu; hitung waitlist & aktivasi |

**Asumsi risiko:** Profesional Indonesia terbiasa beli kursus sekali bayar (ailene.id model), langganan butuh edukasi value. **Mitigasi:** Free tier generous (1 profesi penuh), yearly discount 30%, family/team plan.

---

### Hipotesis 2: B2B2C via Institusi — "AI Literacy Navigator sebagai White-Label Layer"

**Ide:** Serambi.ai menjadi layer adaptif **white-label** di dalam platform institusi (Kemdikbud/Komdigi untuk guru, Kominfo untuk UMKM/ekspor-impor, Kemenkes untuk dokter, Ikatan Akuntan Indonesia, BUMN/BUMD untuk aparatur, bootcamp/kampus untuk fresh graduate).

| Elemen | Detail |
|--------|--------|
| Target | **Kemdikbud / Komdigi** (guru 4,8 juta), **Kominfo** (UMKM 18 juta + ekspor-impor), **Kemenkes** (tenaga kesehatan), **IAI / BPK** (akuntan 200K+), **BUMN/BUMD** (aparatur), **Bootcamp/Kampus** (fresh grad) |
| Value proposition | "Tambahkan navigasi AI literacy adaptif di atas program yang sudah ada — turunkan dropout, tingkatkan adopsi AI massal, data progres per profesi real-time" |
| Channel | Partnership bisnis, tender pemerintah, komunitas profesi, LinkedIn outreach ke decision-maker institusi, IBM SkillsBuild network |
| Harga anchor | **Licensing tahunan per institusi** atau **revenue-share per profesional aktif** (TBD — benchmark: Ruangguru B2G, Zenius B2G, Dicoding enterprise) |
| CPA target | < Rp 150.000 per profesional aktif (via institusi, bukan direct-to-user) |
| Uji murah | Pilot 1–2 institusi/komunitas profesi (20–50 profesional), integrasi MCP API minimal, ukur adoption rate & satisfaction |

**Asumsi risiko:** Sales cycle B2B/G lambat (6–18 bln); butuh integrasi teknis (MCP API). **Mitigasi:** Mulai dari komunitas profesi (bottom-up) → buat case study → naik ke institusi induk (top-down).

---

### Hipotesis 3: B2B Corporate — "AI Literacy Upskilling untuk Karyawan Non-Teknis"

**Ide:** Perusahaan (bank, retail, manufaktur, jasa, BUMN) beli seat untuk karyawan non-teknis (admin, HR, finance, ops, sales, CS) agar adopt AI di kerjaan harian.

| Elemen | Detail |
|--------|--------|
| Target | **Perusahaan menengah-besar Indonesia** (BRI, BCA, Telkom, Unilever, Astra, dll.) — karyawan non-teknis 50–5000+ org |
| Value proposition | "Upskill AI literacy seluruh karyawan non-teknis tanpa hire data scientist — roadmap personal per role, progress dashboard manajemen, ROI terukur" |
| Channel | HR tech partnerships, corporate training vendors, IBM SkillsBuild enterprise, LinkedIn Sales Navigator |
| Harga anchor | **Rp 150.000–300.000/seat/thn** (volume discount), termasuk dashboard manajemen + custom profession roadmap |
| CPA target | < Rp 500.000 per enterprise account (sales-assisted) |
| Uji murah | Pilot 1 perusahaan (50–100 karyawan non-teknis), 8 minggu, ukur adoption rate per role + manager satisfaction |

---

## Strategi Rollout (Phased)

| Phase | Fokus | Target | Timeline |
|-------|-------|--------|----------|
| **Phase 0 (Hackathon)** | Demo working Goal Agent + narrative Phase 2 | Juri, mentor, investor early | **Now – Oct 31** |
| **Phase 1 (Nov–Jan)** | **B2C Beachhead** — Guru & UMKM (2 profesi terbesar, kebutuhan urgent) | 1.000 waitlist → 200 aktif → 50 paid | 3 bulan |
| **Phase 2 (Feb–Apr)** | **B2B2C Komunitas Profesi** — Ikatan Guru, Himpunan UMKM, IAI, Perhimpunan Dokter | 3–5 pilot komunitas, case study | 3 bulan |
| **Phase 3 (May–Jul)** | **B2B2C Institusi + Corporate** — Komdigi, Kominfo, Kemenkes, 2–3 enterprise | 1–2 MoU institusi, 1 enterprise pilot | 3 bulan |
| **Phase 4 (Aug+)** | Scale semua 10 profesi, white-label platform, ASEAN expansion | 10.000+ aktif, revenue positive | 6+ bulan |

**Beachhead Decision: Guru + UMKM first.**
- **Guru (4,8 juta):** Mandat Kemendikbud AI literacy, komunitas terorganisir (PGRI, IGI, komunitas guru per mapel), pain point nyata (administrasi, pembelajaran, evaluasi).
- **UMKM/Ekspor-Impor (18 juta):** Mandat Kominfo digitalisasi, pain point nyata (marketing, ekspor, keuangan, operasional), komunitas aktif (Hipmi, Kadin, asosiasi ekspor).

---

## Uji Murah (Cheap Test) — 4 Langkah Pertama (Diperbarui)

1. **Survei + WA blast ke komunitas Guru & UMKM** — tawarkan roadmap AI literacy profesi pertama gratis 2 minggu, kumpulkan waitlist + feedback.
2. **Landing page PWA (apps/web)** — value proposition AI literacy per profesi, form waitlist per profesi, tautan ke WA group komunitas.
3. **Pilot manual (concierge MVP)** — untuk 15–20 pengguna waitlist per profesi, buat roadmap AI literacy manual (pakai Goal Agent yang sudah live), kirim via WA/Notion, tanyakan apakah mengikuti & merasa manfaat.
4. **Iterasi biaya nol** — pakai .venv lokal, Langflow flows (Goal Agent live), Nuxt 4 PWA di Vercel/Netlify free tier, tidak ada biaya cloud.

**Meter sukses uji murah (Phase 1):**
- ≥ 30% dari 100 kontak komunitas bergabung waitlist
- ≥ 8 dari 20 pilot pengguna menyelesaikan 3 minggu roadmap AI literacy
- ≥ 5 dari 20 pilot menyatakan akan bayar Rp 39–79rb/bln jika diluncurkan
- NPS ≥ 40 untuk pengalaman roadmap pertama

---

## Tiga Pertanyaan untuk Mentor (Diperbarui)

1. **Monetisasi B2C:** Model langganan bulanan (Rp 39–79rb) vs sekali bayar (Rp 299–599rb) — mana lebih diterima profesional Indonesia untuk AI literacy? Referensi: Astra AI (langganan Rp 115rb), ailene.id (sekali bayar Rp 799rb), Netflix/Spotify (langganan diterima).
2. **Prioritas GTM:** Validasi B2C Guru+UMKM dulu (biaya nol, cepat, buat traction) → lalu B2B2C komunitas profesi (case study) → baru institusi/corporate? Atau parallel track B2C + B2B2C komunitas?
3. **Posisi slide hackathon:** Monetisasi perlu masuk slide 11-slide deck? Atau cukup sebagai appendix/open question? (Current deck: 11 slides, monetisasi belum ada).

---

## Open Question — Monetisasi (Belum Masuk Slide)

| Model | Pros | Cons | Cocok Untuk |
|-------|------|------|-------------|
| **Langganan bulanan** (Rp 39–79rb/bln) | Recurring revenue, alignment dengan value ongoing, yearly discount | Churn risk, butuh edukasi "langganan belajar" | B2C, Corporate seat-based |
| **Sekali bayar lifetime** (Rp 299–599rb) | Cocok pola beli Indonesia, tidak ada churn, cash flow upfront | Tidak recurring, tekanan aquisisi konstan | B2C (referensi ailene.id) |
| **B2B2C Licensing institusi** | Kontrak besar, distribusi massal via partner | Sales cycle lama, integrasi teknis | Komdigi, Kominfo, Kemdikbud, IAI |
| **Corporate seat-based** (Rp 150–300rb/seat/thn) | High LTV, dashboard manajemen, ROI terukur | Sales-assisted, butuh fitur enterprise | BUMN, bank, retail, manufaktur |

**Rekomendasi sementara:** **Hybrid** — B2C: langganan bulanan + opsi yearly 30% off + opsi lifetime 6x monthly; B2B2C: licensing institusi; Corporate: seat-based. **Keputusan final butuh validasi Phase 1 (harga sensitivitas survei waitlist).**

---

## Channel Strategy per Segmen

| Segmen | Channel Utama | Channel Pendukung | KPI Phase 1 |
|--------|---------------|-------------------|-------------|
| **Guru** | Komunitas guru (WA groups, IG @guru_id, PGRI), Kemdikbud/Komdigi | Instagram edu, YouTube guru influencer, webinar gratis | 500 waitlist guru |
| **UMKM/Ekspor-Impor** | Hipmi, Kadin, asosiasi ekspor, Kominfo, BNI/BRI UMKM | LinkedIn UMKM, Instagram bisnis, podcast entrepreneur | 500 waitlist UMKM |
| **Dokter/Tenaga Kesehatan** | Ikatan Dokter (IDI), Perhimpunan Spesialis, Kemenkes | Medscape ID, komunitas rumah sakit | 200 waitlist (Phase 2) |
| **Akuntan/Keuangan** | IAI, BPK, komunitas CPA, bank | LinkedIn finance, webinar pajak/AI | 200 waitlist (Phase 2) |
| **Admin/HR/Content Creator/Digital Marketing/Aparatur** | Komunitas spesifik, BUMN/BUMD | Corporate HR network | Phase 3+ |

---

## Partnership Leverage (Hackathon Assets)

| Asset | Cara Pakai untuk GTM |
|-------|----------------------|
| **IBM SkillsBuild** | Network ke kampus/korporat, brand credibility, potential distribution |
| **Langflow + MCP architecture** | Technical differentiator untuk B2B white-label pitch ("embed adaptive layer Anda") |
| **30+ research papers** | Trust signal untuk institusi/korporat, grant application, publication |
| **Pitch deck + submission** | Investor conversation starter, partnership credibility |
| **Working Goal Agent (e2e verified)** | Live demo untuk semua stakeholder, bukan slideware |

---

## Catatan Teknis untuk GTM Execution

- **PWA (Nuxt 4)** — deploy Vercel/Netlify free tier → custom domain → installable di HP tanpa app store
- **MCP API** — `/api/mcp` endpoint di Nitro untuk B2B integration (Langflow flows as tools)
- **Analytics** — Plausible/Umami (privacy-first) + custom event tracking (adoption rate, milestone completion, hint escalation, wellbeing score)
- **Auth** — nuxt-auth-utils (email magic link + Google + Apple), guest mode untuk roadmap pertama
- **i18n** — Bahasa Indonesia primary, English secondary (ASEAN expansion Phase 4)
- **SEO** — @nuxtjs/seo untuk landing page per profesi (programmatic SEO: "AI literacy untuk guru", "AI literacy untuk UMKM", dll.)