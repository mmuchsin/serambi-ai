# Product Requirements Document — Serambi.ai

**Versi:** 2.0 (AI Literacy Pivot)  
**Tanggal:** 2026-10-30  
**Status:** Active — guides all implementation

---

## 1. Problem Statement

Profesional non-teknis di Indonesia (guru, pemilik UMKM, staf ekspor-impor, dokter, akuntan, admin, HR, dll.) sadar AI penting tapi **bingung mau belajar apa dan mulai dari mana**. Kursus umum terlalu teknis, ChatGPT terlalu terbuka (oracle), dan tidak ada panduan personal yang menyesuaikan profesi + hobi + level + jadwal mereka.

**Insight utama:** Mereka butuh *AI literacy untuk profesi mereka* — bukan jadi AI engineer. Contoh: guru butuh tahu cara buat soal otomatis & kurikulum; UMKM butuh tahu cara buat konten marketing & analisis pelanggan; ekspor-impor butuh tahu cara baca dokumen bahasa asing & cek regulasi.

---

## 2. Target User (Primary)

| Dimensi | Detail |
|---------|--------|
| **Profesi** | Guru, UMKM owner, ekspor-impor staff, dokter/paramedik, akuntan/keuangan, admin/sekretaris, HR/rekrutmen, content creator, pemasaran digital, aparatur publik |
| **Usia** | 25–50 |
| **Teknis** | Minimal (bisa pakai WhatsApp, email, browser) |
| **Bahasa** | Indonesia (native) |
| **Device** | Mobile-first (HP Android/iOS), kadang laptop kantor |
| **Waktu** | Terbatas — 3–10 jam/minggu di luar jam kerja |
| **Motivasi** | Efisiensi kerja, tidak ketinggalan, naik gaji/jabatan, mengurangi beban manual |

> **Pivot dari v1:** Target v1 = career switcher (admin → data analyst). Target v2 = profesional *di dalam profesi mereka* yang mau adopsi AI.

---

## 3. Solution Overview

**Serambi.ai** = adaptive multi-agent learning assistant yang mengubah **profesi + hobi + level + jadwal** → **rencana belajar AI personal per minggu** dengan sumber kredibel.

**Arsitektur:** Bob TUI (dev harness) → MCP (streamable HTTP) → Langflow v1.12.2 (flow engine) → LLM provider (Watsonx / OpenAI-compatible).  
**Produksi:** Web app Nuxt 4 + PWA (apps/web) memanggil MCP tools yang sama.

> **Pivot final (31 Okt 2026):** target produk = rencana 6 minggu, sesi 10-30 menit; agent inti = Goal Agent + Scheduler (rencana). Tabel di bawah dipertahankan sebagai ide lanjutan. Flow saat ini masih 12 minggu (lihat ISS-25).

### 6 Agents (MCP Tools) — ide lanjutan

| # | Agent | MCP Tool | Fungsi Utama | Status |
|---|-------|----------|--------------|--------|
| 1 | **Goal Decomposer** | `goal_decomposer` | Profesi + hobi + level + jam/minggu → roadmap mingguan 12 minggu + sumber kredibel per milestone | ✅ Live (e2e verified) |
| 2 | **Tutor** | `explain_concept` | Jelaskan konsep AI dengan teknik Feynman (analogi profesi user), graduated hinting | ⬜ Planned |
| 3 | **Assessment** | `generate_quiz` | Quiz adaptif per milestone, hint bertahap, self-assessment confidence | ⬜ Planned |
| 4 | **Progress** | `check_progress` | Spaced repetition review scheduler berbasis forgetting curve personal | ⬜ Planned |
| 5 | **Motivator** | `send_reminder` | Nudge motivational + next action berbasis jadwal & progress | ⬜ Planned |
| 6 | **Wellbeing** | `check_wellbeing` | Burnout/engagement check-in mingguan, adjust beban belajar | ⬜ Planned |

**MVP (Hackathon):** Agent 1 saja — Goal Decomposer yang menghasilkan roadmap AI literacy 12 minggu dengan `resources_json` kredibel per milestone.

---

## 4. Module Map (Monorepo)

```
serambi-ai/
├── flows/                    # Langflow flow exports (1 file = 1 agent)
│   └── goal_decomposer.json  # ✅ e2e verified
├── agents/                   # Agent configs & system prompts
│   └── goal_decomposer.md
├── apps/
│   └── web/                  # Nuxt 4 + PWA (production frontend)
├── packages/                 # Future: shared libraries
├── mcp/                      # MCP integration docs & tool contracts
├── docs/                     # PRD, ISSUES, submission, ADR, business
├── research/                 # 30+ papers (grounding per agent)
├── scripts/                  # verify-flow.sh, verify-e2e.sh, bootstrap-langflow.sh
├── slides/                   # Pitch deck (PPTX + PDF)
├── assets/                   # Diagrams, screenshots
├── submission/               # Hackathon form screenshots
├── resources/                # NEW: curated resource JSON per profession
│   └── ai-learning-resources.json
├── .bob/                     # Bob config: mcp.json, 83 skills in .bob/skills/
├── DESIGN.md                 # Design system (from mockup)
├── HANDOFF.md                # Session handoff
├── SPEC.md                   # Implementation spec (Goal Decomposer prompt swap)
└── AGENTS.md                 # Session rules, pedagogical constraints, MCP table
```

---

## 5. Goal Decomposer — Detailed Spec

### Input Contract
```json
{
  "profession": "guru",              // required: enum dari resources.json
  "hobbies": ["membaca", "fotografi"], // optional: array string
  "level": "pemula",                 // required: "pemula" | "menengah" | "mahir"
  "weekly_hours": 5,                 // required: integer 1–20
  "resources_json": "resources/ai-learning-resources.json" // path ke curated resources
}
```

### Output Contract (Roadmap 12 Minggu)
```json
{
  "profession": "guru",
  "level": "pemula",
  "weekly_hours": 5,
  "roadmap": [
    {
      "week": "1-2",
      "theme": "Dasar AI & Prompt Engineering untuk Guru",
      "objectives": [
        "Memahami LLM dan cara kerja prompt dasar",
        "Membuat prompt efektif untuk tugas guru"
      ],
      "key_concepts": ["LLM", "Prompt Engineering", "Zero-shot vs Few-shot"],
      "practice": "Buat 5 prompt untuk: rencana pelajaran, soal ujian, surat orang tua, feedback siswa, newsletter kelas",
      "resources": [
        {"title": "Prompt Engineering Guide untuk Guru", "url": "https://...", "type": "article", "credibility": "official"},
        {"title": "Video: AI di Kelas", "url": "https://...", "type": "video", "credibility": "community"}
      ],
      "estimated_hours": 5
    }
    // ... 11 more milestones
  ],
  "meta": {
    "generated_at": "2026-10-30T...",
    "total_estimated_hours": 60
  }
}
```

### Flow Nodes (Langflow)
1. **ChatInput** — menerima input user
2. **Prompt-GDA01** — system prompt (persona: AI Learning Navigator untuk profesional Indonesia)
3. **LanguageModel** — Watsonx/GPT-4o-mini, temperature 0.3, JSON mode
4. **ChatOutput** — return roadmap JSON

### Pedagogical Constraints (Apply to All Agents)
1. **Scaffold, not oracle** — guide learner to answer; don't hand it to them (Role of LLMs in Personalized Learning, cited 142)
2. **Graduated hinting** — smallest useful hint first (IntelliCode, FWCI 23.5)
3. **Probing questions over direct answers** — ask "why?" and "how?" (Feynman Bot, Protégé Effect)
4. **No cognitive offloading** — never do thinking for learner (Metacognitive Laziness, BJET, cited 700+)
5. **Goal-first** — anchor to learner's stated profession + context (GenMentor, DOI 10.1145/3701716.3715244)

---

## 6. Resource Credibility Strategy (Hybrid)

**RAG tidak dipakai di Goal Agent** (latency, cost, hallucination risk).  
**Approach:** `resources/ai-learning-resources.json` curated manual per profession.

```json
{
  "guru": {
    "Dasar AI & Prompt Engineering": [
      {"title": "Panduan Prompt Engineering untuk Pendidik", "url": "https://belajar.kemdikbud.go.id/...", "type": "official", "lang": "id"},
      {"title": "Video: Menggunakan AI di Kelas", "url": "https://youtube.com/...", "type": "video", "lang": "id"}
    ],
    "Administrasi & Kurikulum": [...]
  },
  "umkm": { ... },
  "ekspor_impor": { ... },
  "dokter": { ... },
  "akuntan": { ... }
}
```

**Goal Agent prompt:** "Populate `milestones[].resources` HANYA dari resources_json yang disediakan. Jangan hallucinate URL."

---

## 7. Research Grounding (Key Papers)

| Agent | Paper | Finding |
|-------|-------|---------|
| Goal | GenMentor (2025, DOI 10.1145/3701716.3715244) | Goal-to-skill mapping + efficient learning path scheduling |
| Goal | OECD AI in Work (2023) | AI literacy per profession > generic AI skills |
| Tutor | Feynman Bot (arXiv 2506.09055) | 80%+ prefer AI Feynman technique over passive re-reading |
| Tutor | Chase et al. 2009 (Protégé Effect) | Teaching a tutee agent deepens learner's own understanding |
| Assessment | IntelliCode (FWCI 23.5) | Graduated hinting outperforms direct answers |
| Progress | Zaidi et al. (arXiv 2004.11327) | Adaptive spaced repetition: 15-20% retention improvement |
| All | BJET 2024 (DOI 10.1111/bjet.13544, cited 700+) | AI must scaffold, not offload — preserve learner's cognitive effort |

---

## 8. Architecture Decisions (ADR Summary)

| ADR | Decision |
|-----|----------|
| 0001 | Langflow v1.12.2 as flow engine (visual editor, MCP-native, JSON export) |
| 0002 | MCP streamable HTTP via `uvx mcp-proxy` (Bob stdio → Langflow HTTP) |
| 0003 | Bob TUI = dev harness only. Web app (Nuxt 4) = production |
| 0004 | Langflow uses OpenAI-compatible endpoint; Bob uses Claude 3.7 Sonnet |
| 0005 | Brand = Serambi.ai, monorepo, 83 PM skills in `.bob/skills/` |

---

## 9. Submission Requirements (Hackathon IBM SkillsBuild)

**Deadline:** 2026-10-31 23:59 WIB

| Field | Status |
|-------|--------|
| Judul Project | ✅ Serambi.ai: AI Literacy Navigator untuk Profesional Non-Teknis |
| Tema | ✅ AI untuk SDM / Reskilling |
| Deskripsi | ✅ Updated for AI literacy pivot |
| Fitur Utama | ✅ Goal Decomposer (live), 5 agents planned |
| Dampak | ✅ SDG 4.3, 4.4, 8.2, 8.6 alignment |
| Validasi | ✅ Mini survey 51 orang, prototype tested |
| Perkembangan | ✅ Phase 2: Tutor + RAG, Phase 3: Assessment, Progress, Motivator, Wellbeing |
| Video Demo | ⬜ Record 3-min demo |
| Slide Deck | ✅ 11 slides (updated for pivot) |
| Link Prototype | ⬜ Deploy apps/web to Vercel/Netlify |

---

## 10. Guardrails

- **No `as any`** in TypeScript
- **Conventional commits** required: `feat(flow):`, `feat(mcp):`, `docs:`, `fix:`
- **Verification before commit:** `bash scripts/verify-flow.sh` (always) + `bash scripts/verify-e2e.sh` (if Langflow running)
- **One issue per session** — check `ISSUES.md` for current `[-]` or `[ ]`
- **Pedagogical constraints** non-negotiable (see Section 5)

---

## 11. Next Actions (Priority)

1. **T1-T7 Done** → Goal Decomposer prompt swap + resource JSON + agent spec updated
2. **Deploy apps/web** (Nuxt 4 PWA) to Vercel for prototype link
3. **Record 3-min demo video** showing Goal Decomposer flow
4. **Submit hackathon form** with updated materials
5. **Post-hackathon:** ISS-17 (Tutor Agent / `explain_concept` with RAG, ide lanjutan)