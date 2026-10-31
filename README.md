# Serambi.ai

**AI Literacy Navigator untuk Profesional Non-Teknis Indonesia**

Serambi.ai membantu profesional non-teknis (guru, pemilik UMKM, staf ekspor-impor, dokter, akuntan, admin, HR, content creator, pemasaran digital, aparatur publik) yang sadar AI penting tapi **bingung mau belajar apa dan mulai dari mana**.

Input: **profesi + hobi + jam kosong** → Output: **rencana belajar AI 6 minggu** (target produk) dengan sesi 10-30 menit, contoh dari pekerjaan, dan analogi dari hobi.

> **Status jujur:** prototipe di [`apps/prototype/`](apps/prototype/) adalah mockup statis dengan data contoh (tanpa akun, database, atau backend). Flow `goal_decomposer` di repo saat ini masih menghasilkan roadmap **12 minggu** dan belum terhubung ke prototipe. Penyelarasan ke 6 minggu ada di future works (ISS-25).

Bahasa Indonesia native, mobile-first. Frontend produksi (Nuxt 4 PWA + backend Nuxt Nitro) adalah **future works**; yang live sekarang hanya prototipe statis.

> *Serambi* (Indonesia): serambi depan rumah. Tempat percakapan dimulai.

---

## What it does

Satu flow sudah ada di repo: **`goal_decomposer`** (Langflow, terverifikasi e2e sebelumnya). Output flow saat ini berupa roadmap AI literacy 12 minggu terstruktur dalam Bahasa Indonesia; target produk adalah 6 minggu.

```json
// Input
{
  "profession": "guru",
  "hobbies": ["membaca", "fotografi"],
  "level": "pemula",
  "weekly_hours": 5
}

// Output (ringkas)
{
  "profession": "guru",
  "level": "pemula",
  "weekly_hours": 5,
  "roadmap": [
    {
      "week": "1-2",
      "theme": "Dasar AI & Prompt Engineering untuk Guru",
      "objectives": ["Memahami LLM", "Membuat prompt efektif untuk tugas guru"],
      "key_concepts": ["LLM", "Prompt Engineering", "Zero-shot vs Few-shot"],
      "practice": "Buat 5 prompt untuk: rencana pelajaran, soal ujian, surat orang tua, feedback siswa, newsletter kelas",
      "resources": [
        {"title": "Panduan Prompt Engineering untuk Pendidik", "url": "https://belajar.kemdikbud.go.id/...", "type": "official"},
        {"title": "Video: Menggunakan AI di Kelas", "url": "https://youtube.com/...", "type": "video"}
      ],
      "estimated_hours": 5
    }
    // ... 11 milestone lagi
  ]
}
```

**Verifikasi:**

```bash
bash scripts/verify-flow.sh    # exit 0: struktur flow valid
bash scripts/verify-e2e.sh     # exit 0 saat Langflow jalan; exit 2 saat server tidak reachable
```

---

## Problem Statement & Market Gap

**9 juta talenta digital dibutuhkan Indonesia hingga 2030** (Komdigi), ~30% terpenuhi. Indonesia top dunia **pengguna AI**, tapi jauh tertinggal **pengembang AI** (Jakarta Post, Juli 2025). Hambatan utama: **kurang keterampilan digital** (57% pelaku usaha, AWS Agustus 2025).

Tiga gap yang Serambi.ai tutup:

1. **Platform belajar mulai dari kurikulum, bukan dari profesi.** Kursus AI umumnya teknis (coding, ML). Profesional non-teknis butuh AI *untuk profesi mereka*: guru butuh buat soal otomatis, UMKM butuh konten marketing, ekspor-impor butuh baca dokumen bahasa asing.
2. **AI tutor umum adalah oracle, dan itu masalahnya.** ChatGPT jawab langsung. Riset BJET (DOI 10.1111/bjet.13544, sitasi 700+): *metacognitive laziness* — saat model yang berpikir, learner retensi minim.
3. **Passar reskilling tumbuh 11-14% CAGR tapi fokus B2B/korporat.** Professional individu yang mau adopsi AI sendirian tertinggal di antara keduanya.

---

## How It Works: 2 Agents (MCP Tools) + Fitur Aplikasi

Masing-masing agent = 1 Langflow flow → 1 MCP tool bernama. Spaced repetition (hari 1, 3, 7, 14, 30), latihan, dan Tanya AI adalah fitur aplikasi, bukan agent terpisah. LLM yang dituju: IBM watsonx (rencana; flow belum pernah dijalankan dengan watsonx).

| # | Agent | MCP Tool | Fungsi | Status |
|---|-------|----------|--------|--------|
| 1 | **Goal Agent** | `goal_decomposer` | Profesi+hobi+jadwal → rencana belajar + sumber kredibel | ✅ Ada di repo (output saat ini 12 minggu, target 6 minggu) |
| 2 | **Scheduler** | (belum dinamai) | Jadwal belajar adaptif dari jam kosong / Google Calendar | ⬜ Rencana |

**Ide lanjutan (bukan bagian prototipe):** `explain_concept` dan `generate_quiz` (draf di [`agents/`](agents/)), `check_progress`, `send_reminder`, `check_wellbeing`.

**MVP Hackathon:** Goal Agent saja; prototipe UI statis terpisah dan belum terhubung.

---

## Research Grounding

| Decision | Source |
|---|---|
| Goal-to-skill mapping + efficient learning path | GenMentor, 2025. [DOI 10.1145/3701716.3715244](https://doi.org/10.1145/3701716.3715244) |
| Feynman technique > passive reading | Feynman Bot, IEEE TALE 2024. [arXiv 2506.09055](https://arxiv.org/abs/2506.09055) |
| Spaced repetition from forgetting-curve model | Zaidi et al., AIED 2020. [arXiv 2004.11327](https://arxiv.org/abs/2004.11327) |
| Scaffold not oracle (anti-offloading) | Fan et al., BJET 56(2), 2024. [DOI 10.1111/bjet.13544](https://doi.org/10.1111/bjet.13544), cited 700+ |
| Multi-agent: one learner model, specialized agents | IntelliCode (multi-agent tutoring) |

Full papers: [`research/`](research/)

---

## Architecture

**Satu MCP contract, dua pemanggil.** IBM Bob (coding agent harness) membangun dan memverifikasi flow Langflow. Di masa depan, backend Nuxt Nitro memanggil MCP server yang sama sebagai MCP client.

![Diagram arsitektur sistem Serambi.ai](assets/diagrams/serambi-architecture.svg)

| Komponen | Peran | Status |
|---|---|---|
| **IBM Bob** | Coding agent harness. Membangun dan memverifikasi agent. Bukan UI pengguna | Dipakai |
| **Langflow MCP server** | Flow engine. 1 flow = 1 named MCP tool (streamable HTTP via `mcp-proxy`) | Ada di repo (`goal_decomposer`) |
| **LLM provider** | Target: IBM watsonx. Flow saat ini memakai endpoint OpenAI-compatible, temperature 0.3 | watsonx belum pernah dijalankan |
| **Prototipe statis** (`apps/prototype/`) | Mockup UI di Netlify, data contoh, tanpa backend | Live |
| **Nuxt 4 PWA frontend** (`apps/web`) | Antarmuka pengguna produksi | Future works (baru scaffold) |
| **Nuxt Nitro backend** | API + MCP client yang memanggil tool Langflow | Future works |
| **Database** | SQLite/libSQL (Turso) atau Postgres, belum diputuskan | Future works |

---

## Install & Run (Development)

### Prerequisites

| Requirement | Version | Untuk |
|---|---|---|
| IBM Bob | v2.0+ | Running agents via MCP |
| Langflow | v1.12+ | Flow engine (Docker recommended) |
| Node.js | v20+ | Bob, Nuxt 4 |
| Python | 3.11+ | Bootstrap/verify scripts |
| `uvx` | `pip install uv` | Bob spawns `mcp-proxy` |
| `jq` + `curl` | any | `scripts/*.sh` parse JSON & call MCP |

### 1. Clone & Configure

```bash
git clone https://github.com/mmuchsin/serambi-ai.git
cd serambi-ai
cp .env.example .env
# Edit .env: set LANGFLOW_API_KEY
```

### 2. Start Langflow

```bash
docker run -p 7860:7860 langflowai/langflow:1.12.2
```

Buka http://localhost:7860, import `flows/goal_decomposer.json`, set Endpoint Name = `goal_decomposer`.

### 3. Load API Key

```bash
source ~/.bashrc   # atau: export LANGFLOW_API_KEY=<your-key>
```

### 4. Open Bob

Bob load `.bob/mcp.json` on start. Server `lf-serambi_ai` connect ke Langflow via streamable HTTP. Setiap flow dengan Endpoint Name jadi named tool. No further setup.

### 5. Lihat prototipe (opsional)

Prototipe statis tanpa build step: buka `apps/prototype/index.html` di browser, atau lihat versi live di https://serambi-ai.netlify.app. Frontend Nuxt 4 di `apps/web` masih scaffold (future works) dan belum terhubung ke Langflow.

---

## Usage

Di Bob (dev harness):

```
Saya guru SD, suka membaca, level pemula, 5 jam/minggu. Buatkan roadmap AI literacy 12 minggu.
```

Bob call `goal_decomposer`, Langflow jalankan flow, response = roadmap 12 minggu terstruktur.

Verifikasi tanpa server live:

```bash
bash scripts/verify-flow.sh
```

Exit codes: 0 = flow valid. Exit 2 dari `verify-e2e.sh` = Langflow tidak reachable (bukan flow broken).

---

## Business Model

**Filed under:** Education & Future of Work

### AI Unit Economics

AI product gross margin ~45% (2025) → low 50s (2026) vs 60-80% SaaS tradisional (1752vc + ICONIQ, State of AI 2026). Inference cost scales dengan usage → margin managed per user. Serambi.ai cost/user = 1 dekomposisi per goal + review + quiz calls. Roadmap singkat (1 prompt cycle), loop panjang. Plan usage-based/hybrid pricing dari awal. North Star = learning progress, bukan revenue (revenue lag beberapa bulan).

### Willingness to Pay

Consumer anchor: Astra AI Rp 115rb/bln (App Store) untuk ujian sekolah. Career switching = higher WTP (bayar outcome: pekerjaan, bukan nilai). Serambi.ai avoid price match, sell outcome.

### Revenue Paths (Ranked by Time to Revenue)

| Path | Bayar Siapa | Market Size | Catatan |
|---|---|---|---|
| **B2B White-label** | Bootcamp, kampus, Komdigi reskilling | Ribuan learner/instansi, cost/learner rendah | **Fastest to revenue**. Flow sudah jalan behind MCP endpoint |
| **Institutional Licensing** | SMK, vokasi, universitas | Recurring, per-kohort | Butuh multi-tenant di Langflow |
| **Consumer Subscription** | Professional individu | Terbesar, paling kompetitif | Astra AI sudah pegang price band ini |

Data forgetting-curve anonim jadi asset defensible: aggregate review schedule = moat, source material stay out of product.

Business docs: [`docs/business/north-star.md`](docs/business/north-star.md) · [`docs/business/value-proposition.md`](docs/business/value-proposition.md) · [`docs/business/competitive-analysis.md`](docs/business/competitive-analysis.md)

---

## Guardrails

### Pedagogical (dari riset)

| Constraint | Effect |
|---|---|
| **Scaffold, not oracle** | Agent guide, bukan jawab. Stuck → smallest useful hint, bukan solusi |
| **Graduated hinting** | Hint escalate hanya kalau yang kecil gagal |
| **Probing questions** | "Why" & "how" surface gap lebih cepat dari explain |
| **No cognitive offloading** | Agent refuse do learner's thinking |
| **Goal-first** | Setiap response point back ke profesi + konteks user |

### Operational

- Setiap flow separately verifiable, `verify-flow.sh` jalan sebelum setiap commit
- Structured output, `temperature = 0.3` → decomposition deterministic untuk downstream agents
- Node configs follow NIST AI RMF (govern, map, measure, manage) level prototype
- Regulatory context Indonesia tracked di [`docs/`](docs/): Surat Edaran Etika AI (Kominfo 2023, renamed Komdigi 2024), Komdigi National AI Roadmap consultation (Agustus 2025)
- Research corpus = project material. No learner data, no paid content di retrieval set

### Security & Misuse Prevention

**Enforced today:**

| Guardrail | Effect |
|---|---|
| Credentials stay out of repo | API keys di env vars (`.env`, `.envrc`), gitignored. MCP reject unauthenticated (403 tanpa `x-api-key`) |
| Schema-validated output | Setiap agent return JSON checked against fixed schema. Model output parsed as data, never executed |
| Learning-coach scope | Agent stay in learning role, decline general assistant / hand over graded work (academic integrity) |

**Committed untuk web app:**

- Free-text goals treated as data inside fixed system prompt, input length & content bounds → blunt prompt injection
- Public endpoints require auth + rate limiting before learner data retained
- Data minimization: learning state limited to progress signals needed, forgetting-curve data aggregated & anonymized before secondary use

---

## Roadmap

### Delivered (Phase 1-7)

- `goal_decomposer` flow, verified end-to-end via Bob, MCP, Langflow
- Verification scripts dengan explicit exit codes
- 5 ADRs covering architecture
- Competitive analysis (12 competitors), value proposition, North Star metric
- Pitch deck 11 slides + speaker notes
- Prototipe statis (landing + `/app/`) di `apps/prototype/`, dideploy ke Netlify
- Scaffold Nuxt 4 di `apps/web` (future works, belum dipakai)

### Stage 1 (Hackathon Submission - Deadline 31 Okt 2026)

- [x] Deploy prototipe statis ke Netlify (https://serambi-ai.netlify.app)
- [ ] Record 3-min demo video (onboarding → roadmap → resources)
- [ ] Submit hackathon form dengan materials updated

### Stage 2 (Post-Hackathon)

- **Scheduler Agent** + sinkron Google Calendar (ISS-26)
- **Ide lanjutan:** `explain_concept` (Feynman-style + RAG), `generate_quiz` (graduated hints + RAG), `check_progress`, `send_reminder`, `check_wellbeing`
- **Selaraskan flow ke 6 minggu** dan jalankan dengan IBM watsonx (ISS-25)
- **RAG Layer** over `research/` untuk Tutor + Assessment (ISS-12)
- **Nuxt 4 PWA + Nitro backend (MCP client)**, auth, dan database (SQLite/libSQL atau Postgres, belum diputuskan) (ISS-27)
- **PWA Polish** — offline support, push notifications, install prompt

---

## Repository Structure

```
serambi-ai/                          monorepo root
├── .bob/
│   ├── mcp.json                     MCP server config (lf-serambi_ai)
│   ├── settings.json                Turn-counter hook, session discipline
│   └── skills/                      83 agent skills
├── flows/                          Langflow flow exports
│   └── goal_decomposer.json        ✅ e2e verified
├── agents/                         Agent configs & system prompts
│   └── goal_decomposer.md
├── apps/prototype/                 Prototipe statis (live di Netlify)
├── apps/web/                       Nuxt 4 + PWA (future works, baru scaffold)
├── packages/                       Shared libraries (future)
├── docs/
│   ├── PRD.md                      Product requirements (v2.0 AI literacy pivot)
│   ├── ISSUES.md                   Issue tracker
│   ├── submission-draft.md         Hackathon form answers
│   ├── business/                   Competitive analysis, north-star, value proposition, GTM, SDG
│   └── adr/                        ADR 0001–0005
├── resources/
│   └── ai-learning-resources.json  Curated credible URLs per profession/topic
├── mcp/README.md                   MCP integration details
├── research/                       30+ papers (grounding per agent)
├── scripts/                        verify-flow.sh, verify-e2e.sh, bootstrap-langflow.sh
├── slides/                         Pitch deck v2 (PPTX + PDF)
├── submission/                     4 screenshots untuk submission form
├── assets/
│   ├── screenshots/                Demo screenshots
│   └── diagrams/                   Architecture, agent loop, competitive (HTML source included)
├── DESIGN.md                       Design system (from mockup, adapted for Nuxt 4 + @nuxt/ui)
├── HANDOFF.md                      Session handoff
├── SPEC.md                         Implementation spec (Goal Decomposer prompt swap)
└── AGENTS.md                       Session rules, pedagogical constraints, MCP table
```

---

## MCP Integration

Bob connect ke Langflow via mcp-proxy over streamable HTTP. Config di [`.bob/mcp.json`](.bob/mcp.json); API key dari environment, never committed. Setiap Langflow flow dengan Endpoint Name jadi callable tool: `mcp__lf-serambi_ai__goal_decomposer` resolve ke live flow. Details: [`mcp/README.md`](mcp/README.md).

---

## AI Agent Skills (83 skills di `.bob/skills/`)

| Skill | Purpose |
|---|---|
| `diagram-design` | Architecture, flow, journey, chart diagrams as HTML/SVG |
| `pitch-deck` | 11-slide pitch deck structure |
| `value-proposition` | Jobs-to-be-done template |
| `north-star` | North Star metric + input metrics |
| `competitive-analysis` | Competitor mapping & differentiation |
| `business-model` | Canvas-based business model |
| `plan-launch` | Go-to-market & beachhead segment |
| `ai-engineering-workflow` | 7-phase engineering workflow |
| `code-review` | Standards + Spec review axes |
| `agentic-engineering-workflow` | Grill → Research → Prototype → Spec → Tickets → Implement → Review |

Sources: [phuryn/pm-skills](https://github.com/phuryn/pm-skills), [mattpocock/skills](https://github.com/mattpocock/skills), project custom skills.

---

## Development Tools

| Tool | Purpose |
|---|---|
| IBM Bob | Agent orchestration, MCP tool-calling, flow verification |
| pi agent + feynman extension | Academic research & paper search |

---

## Maintainers

**M. Muchsin**, [github.com/mmuchsin](https://github.com/mmuchsin)

---

## License

Apache 2.0 © 2026 Serambi.ai Contributors. See [LICENSE](LICENSE).