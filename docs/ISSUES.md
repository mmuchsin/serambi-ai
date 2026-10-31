# Issues Tracker — Serambi.ai

**Aturan:** Satu issue per sesi. Cari `[-]` atau `[ ]` paling atas untuk lanjutkan.  
**Commit:** Conventional commits (`feat(flow):`, `feat(mcp):`, `docs:`, `fix:`).  
**Verifikasi wajib sebelum commit:**
- `bash scripts/verify-flow.sh` — selalu wajib, exit 0
- `bash scripts/verify-e2e.sh` — wajib jika Langflow server hidup (exit 0/1; exit 2 = server mati, catat di issue)

---

## Phase 8: AI Literacy Pivot Implementation (Current)

### ISS-13: Update all docs for AI literacy pivot (non-technical professionals)
- [x] PRD.md updated with new target users (guru, UMKM, ekspor-impor, dll.)
- [ ] ISSUES.md updated (this file)
- [ ] README.md updated
- [ ] submission-draft.md updated
- [ ] business/value-proposition.md updated (new JTBD segments)
- [ ] business/north-star.md updated (new north star metric)
- [ ] business/go-to-market.md updated (new GTM hypotheses)
- [ ] business/sdg-alignment.md updated (refined alignment)
- [ ] business/competitive-analysis.md updated (new competitors for AI literacy)
- [ ] AGENTS.md updated (pedagogical constraints still apply)

### ISS-14: Deploy Nuxt 4 PWA (apps/web) to Vercel for prototype link
- [ ] Configure Vercel deployment
- [ ] Add environment variables (MCP endpoint, API keys)
- [ ] Deploy and verify prototype URL works
- [ ] Test Goal Decomposer via web app

### ISS-15: Record 3-minute demo video for hackathon submission
- [ ] Script demo flow (onboarding → roadmap → resources)
- [ ] Record screen + voiceover (Indonesian)
- [ ] Upload to YouTube/Drive, get shareable link

### ISS-16: Submit hackathon form (Deadline: 2026-10-31 23:59)
- [ ] Paste submission-draft.md to form
- [ ] Upload pitch deck (slides/serambi-pitch-deck.pptx + PDF)
- [ ] Upload 4 screenshots (submission/1-goal-setup.png ... 4-progress.png)
- [ ] Push 11 commits to GitHub repo
- [ ] Submit form before deadline

---

## Phase 6: Goal Decomposer (Agent 1) — COMPLETED

### ISS-01: Create Goal Decomposer flow in Langflow
- [x] Flow created: `flows/goal_decomposer.json`
- [x] 4 nodes: ChatInput → Prompt Template → LanguageModel → ChatOutput
- [x] JSON output enforced, temperature 0.3

### ISS-02: Register flow as MCP tool
- [x] `.bob/mcp.json` configured with `uvx mcp-proxy` to Langflow
- [x] Tool exposed as `mcp__lf-serambi_ai__goal_decomposer`

### ISS-03: End-to-end verification
- [x] `verify-flow.sh` passes (JSON valid, required fields, unique endpoint_name)
- [x] `verify-e2e.sh` passes (MCP tools/list + goal_decomposer exposed)

---

## Phase 7: Submission Materials — COMPLETED

### ISS-04: README.md created (repo root)
- [x] Project overview, architecture, 6 agents table, research grounding

### ISS-05: docs/README.md created
- [x] Reading order, file index, research summary table

### ISS-06: Hackathon submission draft written
- [x] `docs/submission-draft.md` — 17-field form answers

### ISS-07: Pitch deck created
- [x] `slides/serambi-pitch-deck.pptx` (11 slides)
- [x] `slides/serambi-pitch-deck.pdf`

### ISS-08: Screenshots captured
- [x] `submission/1-goal-setup.png`
- [x] `submission/2-roadmap.png`
- [x] `submission/3-learning.png`
- [x] `submission/4-progress.png`

### ISS-09: Verification scripts created
- [x] `scripts/verify-flow.sh` (static validation)
- [x] `scripts/verify-e2e.sh` (live MCP validation)

### ISS-10: ADRs documented
- [x] `docs/adr/0001-langflow-engine.md`
- [x] `docs/adr/0002-mcp-streamable-http.md`
- [x] `docs/adr/0003-bob-dev-harness.md`
- [x] `docs/adr/0004-llm-providers.md`
- [x] `docs/adr/0005-project-decisions-log.md`

### ISS-11: Handoff doc created
- [x] `HANDOFF.md` — 1-page status + next action

---

## Phase 8+: Post-Hackathon Roadmap

### ISS-25: Sejajarkan roadmap `goal_decomposer` ke 6 minggu
- [ ] Ubah prompt/flow ke rencana 6 minggu, sesi 10-30 menit
- [ ] Update `agents/goal_decomposer.md` dan PRD kontrak output
- [ ] Verifikasi `verify-flow.sh` + `verify-e2e.sh` (Langflow harus hidup)
- [ ] Jalankan flow dengan watsonx (saat ini belum pernah)

### ISS-26: Scheduler Agent + sinkron Google Calendar
- [ ] Flow Langflow penjadwal (dari jam kosong), diekspos sebagai MCP tool
- [ ] Integrasi Google Calendar (hanya jam sibuk/kosong)

### ISS-27: Hubungkan prototipe (`apps/prototype/`) ke backend / migrasi Nuxt 4 PWA

### ISS-17: Tutor Agent (`explain_concept`) with RAG
- [ ] Research: Feynman technique + RAG for profession-specific analogies
- [ ] Create `flows/explain_concept.json`
- [ ] Create `agents/explain_concept.md`
- [ ] Register as MCP tool
- [ ] Verify flow + e2e

### ISS-18: Assessment Agent (`generate_quiz`) with RAG
- [ ] Research: Graduated hinting + adaptive quiz generation
- [ ] Create `flows/generate_quiz.json`
- [ ] Create `agents/generate_quiz.md`
- [ ] Register as MCP tool
- [ ] Verify flow + e2e

### ISS-19: Progress Agent (`check_progress`) — Spaced Repetition
- [ ] Research: Forgetting curve per concept, adaptive scheduling
- [ ] Create flow + agent + MCP registration

### ISS-20: Motivator Agent (`send_reminder`) — Nudge Engine
- [ ] Research: Behavioral nudge timing, personalization
- [ ] Create flow + agent + MCP registration

### ISS-21: Wellbeing Agent (`check_wellbeing`) — Burnout Prevention
- [ ] Research: Engagement check-in, workload adjustment
- [ ] Create flow + agent + MCP registration

### ISS-22: RAG Layer for Tutor + Assessment
- [ ] Vector DB setup (Chroma/Pinecone)
- [ ] Ingest profession-specific content (curated docs, videos)
- [ ] Integrate with `explain_concept` and `generate_quiz` flows

### ISS-23: User Auth + Data Persistence (Nuxt + Nitro)
- [ ] nuxt-auth-utils setup (email/password + guest mode)
- [ ] Database (Turso/libSQL) for user profiles, roadmaps, progress
- [ ] Sync roadmap progress across devices

### ISS-24: PWA Polish + Offline Support
- [ ] Service worker caching strategies
- [ ] Offline fallback (cached last roadmap)
- [ ] Install prompt optimization
- [ ] Push notifications (motivator nudge)

---

## Archive: Pre-Pivot Issues (Reference Only)

### Old ISS-04 to ISS-05: Career Switcher Flow (Superseded by Pivot)
- Original target: career switcher (admin → data analyst)
- Pivoted to: AI literacy for professionals in their current profession
- All work preserved in git history (commits up to 09a2c15)

---

## Quick Reference: Current Sprint

| Issue | Description | Status | Blocker |
|-------|-------------|--------|---------|
| **ISS-13** | Update all docs for AI literacy pivot | **IN PROGRESS** | — |
| **ISS-14** | Deploy Nuxt 4 PWA to Vercel | `[ ]` | ISS-13 |
| **ISS-15** | Record 3-min demo video | `[ ]` | ISS-14 |
| **ISS-16** | Submit hackathon form | `[ ]` | ISS-15 |

**Next session starts at:** ISS-13 (continue updating remaining docs)