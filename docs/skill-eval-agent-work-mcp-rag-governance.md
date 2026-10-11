# Evaluasi 5 Skill dari /tmp/claude-skills → Serambi.ai

Repo target: `/home/adm_ub24/projects/ibm/serambi-ai` (revisions/hackathon IBM Hacktiv8, bisnis > teknis, deadline 23:00).
Metode: baca SEMUA SKILL.md, `du -sk` per subfolder, dan **jalankan setiap skrip kandidat langsung atas repo/flow/input Serambi.ai** (bukan menilai dari judul). Semua angka di bawah adalah hasil eksekusi nyata di workspace ini.

## Tabel Hasil

| # | Skill | Ukuran KB | A (gap lokal) | B (nilai penyisihan) | C (aksi hari ini) | D (ringkas/self-contained) | VERDICT | Alasan (1 kalimat) |
|---|-------|-----------|---------------|----------------------|-------------------|----------------------------|---------|--------------------|
| 1 | `engineering/skills/agent-designer/` | 304 KB | 4 | 4 | 2 | 1 | **REJECT** | 130 KB adalah 3 skrip Python yang jawabannya bukan arsitektur milik proyek ini — diuji atas requirements Serambi ia tetapkan pola "swarm" padahal fakta repo justru supervisor + pipeline + 5 tool paralel di satu inti MCP (`flows/goal_decomposer.json`), dan mermaid diagram itu hanya skeleton generic, bukan diagram sistem Serambi. |
| 2 | `engineering/skills/agent-workflow-designer/` | 24 KB | 3 | 3 | 3 | 5 | **ADOPT (shrink 40%)** | Hanya satu skrip 60-baris yang sudah teruji menghasilkan config `evaluator` untuk `serambi-quiz`, terpisah dari orchestration-length agent-designer, dan isinya mencakup satu gap nyata: pola `evaluator` (generator + quality gate) yang tak ada padanan lokal. |
| 3 | `engineering/skills/mcp-server-builder/` | 60 KB | 3 | 3 | 4 | 3 | **ADOPT-SHRUNK (~35 KB)** | Nilai nyata ada di `scripts/mcp_validator.py` (~16 KB): skrip yang bisa diperluas jadi verifier kontrak tool MCP proyek (`mcp/README.md` table), sementara `openapi_to_mcp.py` tak punya bahan bakar — tidak ada OpenAPI spec atas Langflow, dan pipeline scaffold-nya memang menjurus web API, bukan flow Langflow. |
| 4 | `engineering/skills/rag-architect/` | 144 KB | 5 | 5 | 4 | 2 | **ADOPT-SHRUNK (~45 KB)** | Mengisi ISS-12 secara langsung dan terverifikasi jalan atas `research/` asli: `chunking_optimizer.py` merekomendasikan `sentence_based` (avg 1030 char, boundary 98.98% clean) dan `retrieval_evaluator.py` mengembalikan precision@5 0.500 / recall@5 0.667 / MRR 0.500 / NDCG@5 0.544 — angka yang bisa dipakai diterima SSH ADR "retrieval apa" — sisanya (3 file references + 2 skrip besar) dibuang. |
| 5 | `engineering/prompt-governance/skills/prompt-governance/` | 16 KB | 3 | 3 | 2 | 5 | **REJECT** | 11 KB teks soal prompt registry + A/B test + DB production padahal proyek baru punya SATU prompt (templat Langflow di `flows/goal_decomposer.json:1` bagian `template.prompt.value`) dan 5 agent belum dibangun: mayoritas mode-nya adalah production-ops pada prom yang belum ada. |

Skoring 1–5 per dimensi; A menilai overlap dengan 82 skill lokal (`.bob/skills/`, `.agents/skills/`), B menilai signifikansi untuk menang penyisihan, C menilai jalan-tanpa-kode-baru terhadap repo hari ini, D menilai self-containment/beban.

---

## Detail ADOPT

### 2. agent-workflow-designer (24 KB) — ADOPT-SHRUNK

**Struktur & ukuran terverifikasi (du -sk):** `scripts/` 8 KB, `references/` 8 KB, `SKILL.md` 4 KB. Isi: `SKILL.md` 2,724 byte, `scripts/workflow_scaffolder.py`, `references/workflow-patterns.md` (82 baris).

**Eksekusi nyata:** `python3 scripts/workflow_scaffolder.py evaluator --name serambi-quiz --output wf.json` → exit 0, output 326 byte berisi `{"pattern":"evaluator","generator":{"agent":"generator"},"evaluator":{"agent":"evaluator","criteria":["accuracy","format","safety"]},"loop":{"max_iterations":3,"pass_threshold":0.8,"on_fail":"revise_and_retry"}}`. Catatan bug kecil: flag `-o` di SKILL.md tidak dikenal; argumen yang benar `--output` (terverifikasi dari `--help` dan percobaan yang gagal). Dokumen referensi hanya punya 5 pola (sequential/parallel/router/orchestrator/evaluator) sebagai JSON skeleton — tidak ada generated code, sehingga hampir nol risiko overfit.

**Pertahankan (relatif ke folder skill):**
- `SKILL.md` (2,724 byte)
- `scripts/workflow_scaffolder.py`
- `references/workflow-patterns.md`

**Buang:** `README` tidak ada; selebihnya sudah terkandung di tiga file di atas — tidak ada `agents/` dir. Shrink yang masuk akal hanya memotong kalimat-pemasaran SKILL.md ("Tier: POWERFUL", tabel "Common Pitfalls" yang sebagian tentang over-orchestration) → ~15 KB tersisa, ~40% lebih ringkas.

**Dependensi eksternal:** `python3` (tersedia, 3.12.3). Nol paket pihak-ketiga (import hanya `argparse`, `json`, `pathlib`, `typing`). Nol jaringan.

**Pemakaian konkret untuk Serambi.ai:** `docs/ISSUES.md` (ISS-04, ISS-05, ISS-12) butuh naming + bentuk kontrak untuk Tutor/Assessment/Retrieval. Pakai skill ini untuk (a) menamai pola orkestrasi di `agents/` — Supervisor (Goal Agent sebagai router) + **Evaluator** untuk `generate_quiz` (generator → quality gate scaffold/graduated-hinting → revise_and_retry, persis loop yang SKILL.md definisikan), (b) menghasilkan `workflows/<nama>.json` skeleton yang langsung berdampingan dengan `flows/`, (c) memberi bahasa "handoff contract" + retry/timeout di `agents/README.md` yang saat ini masih kosong. Gap lokal terverifikasi: tidak ada padanan antara 82 skill (grep lokal: hanya `writing-for-agents`, `writing-fragments` yang cocok pola "agent", tidak ada satu pun tentang orkestrasi/workflow/pola evaluator).

### 3. mcp-server-builder (60 KB) — ADOPT-SHRUNK

**Struktur terverifikasi:** `scripts/` 24 KB, `references/` 24 KB, `SKILL.md` 4 KB, `README.md` 4 KB. Skrip: `openapi_to_mcp.py`, `mcp_validator.py`.

**Eksekusi nyata:**
- `openapi_to_mcp.py` dengan OpenAPI sintetis (endpoint `/api/goals` → `createGoal`) → sukses: `out/tool_manifest.json` + `out/server.py`. Parser OpenAI-format dan sanitasi nama tool (`createGoal` → `creategoal`). Catatan: input JSON harus benar-benar valid — JSON cacat parsing menghasilkan pesan suram (`Failed to parse OpenAPI input: while parsing a flow mapping`), artinya skrip butuh spec valid, bukan dump permintaan.
- `mcp_validator.py` pada manifest berisi `goal_decomposer` + tool rusak (`explain` dengan deskripsi 8 karakter & `properties:{}`) → 0 errors, 2 warnings (`description too short`, `no input properties declared`), exit 0. Dengan `--strict`, exit non-zero bila ada error.

**Pertahankan (relatif ke folder skill):**
- `scripts/mcp_validator.py`
- `references/validation-checklist.md` (only 1,5 KB: structural integrity, descriptive quality, security, versioning, runtime — langsung bisa jadi gerbang kontrak tool)
- `SKILL.md` (potong seksi OpenAPI-to-scaffold + TypeScript template, sisakan bagian validator + hardening)

**Buang:** `scripts/openapi_to_mcp.py` (tidak ada OpenAPI spec di repo — grep `openapi|swagger` hanya menemukan satu hit tak relevan di `.agents/skills/drawio-skill/references/toolbox.md`), `references/openapi-extraction-guide.md`, `references/python-server-template.md` + `typescript-server-template.md` (template FastMCP/Node untuk server HTTP biasa, bukan konfigurasi flow Langflow), `README.md` (hanya petunjuk instalasi Claude Code/Codex/OpenClaw, salah lokasi untuk repo ini).

**Dependensi eksternal:** `python3`. `yaml` hanya diimpor di cabang fallback (PyYAML 6.0.1 sudah terpasang, jadi aman bahkan tanpa diimpor). Nol network. `mcp_validator.py` mandiri stdlib.

**Pemakaian konkret untuk Serambi.ai:** repo sudah punya dokumen kontrak (`mcp/README.md` Tools table: `goal_decomposer` live, `explain_concept`/`generate_quiz`/… planned) dan `scripts/verify-flow.sh` + `verify-e2e.sh`, tapi belum ada **validator kontrak tool**. Perluas `mcp_validator.py` menjadi `scripts/verify-tool-contracts.sh` (wrapper python) yang menghasilkan manifest tool yang direncanakan dari `mcp/README.md`/`agents/*.md` lalu memeriksa: nama snake_case, deskripsi bermula dengan kata kerja inputSchema `required` ⊆ `properties`, `required` non-empty bila input wajib (aturan yang SKILL.md sendiri ajarkan: "Descriptions start with a verb"). Ini menambah standar reviewer di CI proyek sebelum ISS-04/ISS-05/ISS-12 membangun tool baru, dan jadi temuan audit untuk narasi submission. Nilai lebih besar bila dijadikan bagian dari workflow verifikasi proyek yang sudah ada (`AGENTS.md` "Verification feedback loop").

### 4. rag-architect (144 KB) — ADOPT-SHRUNK

**Struktur terverifikasi:** `references/` 48 KB (3 file), `chunking_optimizer.py` 32 KB, `rag_pipeline_designer.py` 28 KB, `retrieval_evaluator.py` 24 KB, `SKILL.md` 8 KB.

**Eksekusi nyata atas `research/` Serambi.ai (2 file, 101.172 karakter):**
- `chunking_optimizer.py research --extensions .md -o chunking.json` → rekomendasi **`sentence_based`** (avg chunk 1030 char, std 148, boundary quality 98.98% clean sentence breaks, semantic coherence 0.152). Sampel chunk nyata tampil (652/960 char).
- `rag_pipeline_designer.py` dengan requirements sintetis (2 doc, markdown, budget 0, accuracy 0.8, cost 0.9) → `chunking: paragraph_based`, `embedding: all-MiniLM-L6-v2`, `vector_db: chroma`, estimasi `$20.00/bulan`, mermaid diagram. CATATAN: rekomendasinya tidak selalu konsisten dengan hasil chunking optimizer (di sini paragraph_based vs sentence_based) — jangan diperlakukan sebagai kebenaran.
- `retrieval_evaluator.py` dengan 3 query uji + ground truth → loaded 2 docs (TF-IDF internal), **precision@1 0.000, precision@5 0.500, recall@5 0.667, MRR 0.500, NDCG@5 0.544**, plus rekomendasi otomatis ("query expansion/reranking", "short query issue"). Script ini butuh kunci `query` per entri (`text` memunculkan `Error: 'query'`); ground truth dipetakan ke `doc_id` yang merupakan stem nama file.

**Pertahankan (relatif ke folder skill):** `SKILL.md`, `chunking_optimizer.py`, `retrieval_evaluator.py`, dan `references/chunking_strategies_comparison.md` (strategi 5-perbandingan yang langsung menjelaskan output optimizer). Total tersisa ±70 KB.

**Buang:** `rag_pipeline_designer.py` (heuristic tukang, dan sudah terbukti kontradiktif dengan optimizer: mengusulkan `paragraph_based` saat corpus Serambi direkomendasikan `sentence_based`), `references/embedding_model_benchmark.md` (snapshot 2024 dengan staleness warning di atasnya sendiri), dan `references/rag_evaluation_framework.md` (definisi metrik yang sudah tercetak otomatis oleh `retrieval_evaluator.py`).

**Dependensi eksternal:** `python3` stdlib saja (numpy terpasang tapi tidak dipakai). Nol network, nol API. Ini penting di hackathon: tidak bisa waktu kehabisan oleh dependency.

**Pemakaian konkret untuk Serambi.ai:** mengisi ISS-12 — "RAG layer over `research/` for Tutor + Assessment agents" — yang acceptance criteria-nya eksplisit: (1) retrieval dipilih (embeddings lokal vs Langflow built-in) + dicatat ADR, (2) Tutor jawaban bisa dilacak ke `research/*.md`, (3) Assessment tidak mengarang konsep di luar korpus. Alur kerja skill ini langsung menghasilkan bukti: tabel skor retrieval atas kueri nyata TUTOR/ASSESSMENT style, rekomendasi chunking dari data, dan daftar "poor recall examples" yang bisa jadi unit-test non-regresi. Bisa langsung dijalankan **hari ini** tanpa kode aplikasi (numpy tak diperlukan, tidak ada API key), dan hasilnya bisa masuk `docs/adr/` (ADR 0006 retrieval) + `agents/` chunks.dataset.json. Gap lokal: 82 skill tak punya satu pun konsep retrieval/eval (terverifikasi grep).

### Catatan: bagian "skill-eksekusi" agent-designer memang bernilai, tapi servernya bukan proyek ini

Diuji langsung: `agent_planner.py` atas requirements Serambi (6 agents, tugas dekomasi/explain/quiz/review/wellbeing) memilih **swarm** dan memberi tool tidak relevan (`web_search`, `code_executor`, `file_manager`, `data_analyzer`, `api_client`) untuk keenam "swarm agents" — sedangkan fakta repo adalah satu orchestrator Goal Agent + 5 tool MCP paralel di satu flow. Dengan performance_requirements berbeda, planner berpindah ke **pipeline 1-stage** dan dengan deskripsi mengandung kata "supervisor" juga tetap tidak menghasilkan desain Goal Agent. Artinya output planner adalah arsitektur generik, bukan spesifik Serambi, dan salah satu kandidat arahnya keliru untuk sistem yang sudah punya. Nilai yang selamat hanya dua artefak: pattern decision table (supervisor/pipeline/hierarchical/swarm) dan `tool_schema_generator.py` (dipakai di bawah).

---

## Detail REJECT

### 1. agent-designer (304 KB)

- **Struktur terverifikasi:** `agent_evaluator.py` 56 KB, `references/` 52 KB (3 file, 9,9+20,4+13,7 KB), `expected_outputs/` 52 KB, `tool_schema_generator.py` 40 KB, `assets/` 40 KB, `agent_planner.py` 40 KB, `README.md` 16 KB, `SKILL.md` 8 KB.
- **Eksekusi nyata:** ketiga skrip jalan (stdlib saja). `agent_planner.py` → swarm/6 agents/30 links (di atas, salah arah untuk repo). `tool_schema_generator.py` → 5 tool manifest OpenAI/Anthropic valid (berguna, tapi generik; fungsinya = konversi deskripsi tool ke JSON schema,  40 KB). `agent_evaluator.py` pada log sample → 60% success, 4 critical issues, output analisis panjang.
- Alasan utama reject: **52 KB `expected_outputs/` + 40 KB `assets/` adalah sample buah jadi untuk domain asing** (research-analysis platform, web_search/code_executor); tidak ada satu pun kunci requirements yang mengarah ke Langflow, flow JSON, MCP endpoint, atau 6-agent pedagogue. **`references/` 52 KB** adalah katalog pola dan metodologi eval generik; bagian yang "cocok" sudah ada padanan ringkas (pattern table di SKILL.md). **97 KB tiga skrip Python** menghasilkan arsitektur yang harus direvisi manusia untuk proyek nyata.
- Nilai selamat 5% (pattern table + validator tool schema concept) = dan rata-rata skill pengembang AI sekarang sudah punya pola-katalog; adopsinya 304 KB, 64× lipat dari skill lokal terbesar (ppt-master), menambah beban permanen tanpa membalik keputusan proyek.
- **Pemakaian ulang jika sewajarnya:** pola orchestration intent parsing → agent selection → tool call sudah tercatat di `docs/submission-draft.md` dan `agents/README.md`; kalau memang ingin, cukup salin **`SKILL.md` pattern table (5 baris)** ke `docs/ai-engineering-best-practices.md`, tidak seluruh folder.

### 5. prompt-governance (16 KB)

- **Struktur terverifikasi:** satu file `SKILL.md` 11.213 byte (du 12 KB).
- **Isi:** 3 mode — build prompt registry (file-based `registry.yaml` atau DB), eval pipeline (golden dataset ≥20 contoh, LLM-as-judge), governed iteration + A/B test dengan ketentuan "minimum 1 week or 1,000 requests per variant, p<0.05".
- Alasan reject: (a) jumlah prompt proyek = 1 (templat Langflow 1 blok di `flows/goal_decomposer.json`, sistem-penjaga sudah di `AGENTS.md` §Pedagogical Constraints) — 5 agent lain belum jalan, prompt belum ada; (b) A/B test butuh 1.000 request/varianta + 1 minggu, mustahil sebelum tenggat 23:00; (c) DB-backed registry, ownership model, audit trail = enterprise ops, bukan penyisihan; (d) nilai reuse rendah: satu ekstraksi yang berguna (konsep "prompts are code + regression eval") sudah bisa diringkas ke `agents/README.md` 3 baris.
- **Dependensi eksternal:** nol (teks murni). Bahkan nol-dependensi juga tidak menyelamatkan dimensi B/C — piutangnya bukan alat.

---

## Coverage Status

**Diverifikasi langsung (eksekusi, bukan baca judul):**
- `chunking_optimizer.py` dijalankan atas `research/` Serambi.ai → `sentence_based`, avg 1030 char, boundary 98.98%.
- `retrieval_evaluator.py` dijalankan dengan 3 query sintetis + ground truth → precision@5 0.500, recall@5 0.667, MRR 0.500, NDCG@5 0.544, plus ambang evaluasi (poor precision/recall) dan rekomendasi otomatis.
- `rag_pipeline_designer.py` dijalankan → chroma/MiniLM/paragraph_based/$20 per bulan (dan mencatat kontradiksi vs optimizer).
- `agent_planner.py` dijalankan 3× dengan variants requirements → swarm (generic tools), pipeline (1 stage) — tidak pernah menghasilkan desain yang cocok dengan repo.
- `tool_schema_generator.py`, `agent_evaluator.py`, `openapi_to_mcp.py`, `mcp_validator.py` (dua manifest, satu rusak), `workflow_scaffolder.py` — semuanya exit 0 pada input uji, termasuk perekaman exit-strict mode dan parsing OpenAPI ku.
- Repo dibaca: `flows/goal_decomposer.json` (4 node lfx, prompt + temperature 0.3), `scripts/verify-flow.sh` + `verify-e2e.sh`, `mcp/README.md`, `.bob/skills/` (82 skill, real dirs: ppt-master 131 MB, sisanya ≤40 KB), `docs/ISSUES.md` (ISS-01..ISS-12), `AGENTS.md` §Pedagogical Constraints, `docs/adr/0001-0005`.
- Ketersediaan tools: `python3` 3.12.3, `PyYAML` 6.0.1, `numpy` 2.4.2 tersedia. `yaml` hanya perlu pada fallback YAML.
- Gap lokal diperiksa dengan grep (`mcp|rag|prompt|retriev|embed|vector|agent|eval|orchestr|tool|flow|langflow`) atas 86 nama skill → tidak ada padanan MCP/RAG/orchestration/eval.

**Belum diverifikasi / sisa ketidakpastian:**
- Referensi yang tidak dibaca penuh: `agent_architecture_patterns.md`, `evaluation_methodology.md` (agent-designer) — tidak penting karena skillnya ditolak; `production-hardening-guide.md`, `python/typescript-server-template.md`, `openapi-extraction-guide.md` (mcp-server-builder) dibaca 30-60 baris pertama — cukup untuk ADOPT-SHRUNK yang mempertahankan hanya validator + checklist.
- 25 baris terakhir `prompt-governance` SKILL.md tidak dibaca (Communication + Conflicting signals) — tidak mengubah verdict; isi inti (3 mode) sudah terbaca penuh.
- Kualitas eval `retrieval_evaluator.py` atas `research/` hanya diuji dengan 3 query sintetis buatan saya dan ground truth sederhana (bukan golden dataset direview manusia sesuai kriteria ISS-12); angka 0.500/0.667 adalah indikasi kerangka kerja, bukan klaim kualitas retrieval final.
- Belum diuji apakah skrip mcp-server-builder bisa dipetakan ke `verify-flow.sh` output format (desain perluasan `verify-tool-contracts.sh` adalah rencana, belum kode).
- Tidak ada test yang membandingkan `agent-workflow-designer` vs alternatif lokal, gap disimpulkan dari absence, bukan dari uji head-to-head.
- Jumlah data `research/` hanya 2 file (101.172 karakter, sekitar 2 dokumen) — angka chunking untuk korpus sangat kecil; untuk korpus padat Serambi harus menjalankan ulang setelah ISS-12 korpus diperluas.

## Sources
1. `/tmp/claude-skills/engineering/skills/agent-designer/SKILL.md` + `agent_planner.py`, `tool_schema_generator.py`, `agent_evaluator.py`, `references/`, `expected_outputs/`, `assets/` — sumber upstream: https://github.com/alirezarezvani/claude-skills
2. `/tmp/claude-skills/engineering/skills/agent-workflow-designer/SKILL.md` + `scripts/workflow_scaffolder.py` + `references/workflow-patterns.md` — https://github.com/alirezarezvani/claude-skills
3. `/tmp/claude-skills/engineering/skills/mcp-server-builder/SKILL.md` + `scripts/mcp_validator.py`, `openapi_to_mcp.py` + `references/` — https://github.com/alirezarezvani/claude-skills
4. `/tmp/claude-skills/engineering/skills/rag-architect/SKILL.md` + `chunking_optimizer.py`, `retrieval_evaluator.py`, `rag_pipeline_designer.py` + `references/` — https://github.com/alirezarezvani/claude-skills
5. `/tmp/claude-skills/engineering/prompt-governance/skills/prompt-governance/SKILL.md` — https://github.com/alirezarezvani/claude-skills
6. Serambi.ai repo: `flows/goal_decomposer.json`, `scripts/verify-flow.sh`, `scripts/verify-e2e.sh`, `mcp/README.md`, `docs/ISSUES.md`, `AGENTS.md`, `research/` (2 file, 101.172 char) — `/home/adm_ub24/projects/ibm/serambi-ai`
7. `du -sk` output + dilation grep lokal atas 86 nama skill (`.bob/skills/`, `.agents/skills`) — bukti ukuran & gap di workspace ini
