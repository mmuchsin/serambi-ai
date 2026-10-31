# AGENTS.md — Serambi.ai

AI agent harness guide for this workspace. Read this before starting any session.

## What is Serambi.ai

An adaptive multi-agent learning assistant for Indonesian career switchers.
Bob (AI agent harness) is the **development harness** — it orchestrates Langflow flows via MCP as named tools, builds and verifies agents end-to-end. Production users interact through the **web app** (`apps/`), which calls the same MCP tools.

## Monorepo Layout

```
flows/          Langflow flow exports (one file = one agent)
agents/         Agent configs and system prompts (one file = one agent)
apps/           Future: webapp and other surfaces
packages/       Future: shared libraries
mcp/            MCP integration docs and tool contracts
docs/           PRD, ISSUES, submission, adr/
research/       Research papers and literature (grounding per agent)
scripts/        Verification scripts (verify-flow.sh, verify-e2e.sh)
slides/         Pitch deck (PPTX + PDF)
assets/         Screenshots and diagrams
```

Full structure → see [`docs/PRD.md`](docs/PRD.md#module-map-monorepo).

## MCP Tools (Langflow agents)

| Tool | What it does |
|------|-------------|
| `goal_decomposer` | Goal Agent: goal/profession → weekly learning plan (flow outputs 12 weeks today; product target 6 weeks, ISS-25) |
| Scheduler *(planned, unnamed, ISS-26)* | Study schedule from free time / Google Calendar |
| `explain_concept`, `generate_quiz`, `check_progress`, `send_reminder`, `check_wellbeing` | *Follow-up ideas*, not part of the prototype; only draft specs exist for the first two |

Always call the MCP tool. Never answer from LLM alone when a tool covers the intent.

## Pedagogical Constraints (from research)

These apply to all agents and any prompt written for this project:

1. **Scaffold, not oracle** — guide the learner to the answer; don't hand it to them.
   *Source: "Role of LLMs in Personalized Learning" (cited 142)*

2. **Graduated hinting** — when stuck, give the smallest useful hint first.
   *Source: IntelliCode (FWCI 23.5)*

3. **Probing questions over direct answers** — ask "why?" and "how?" to surface gaps.
   *Source: Feynman Bot (arXiv 2506.09055), Protégé Effect (Chase et al. 2009)*

4. **No cognitive offloading** — never do the thinking for the learner.
   *Source: "Metacognitive Laziness" (BJET, cited 694)*

5. **Goal-first** — always anchor responses to the learner's stated career goal.
   *Source: GenMentor (DOI 10.1145/3701716.3715244)*

## Session Rules

- One issue per session — check [`docs/ISSUES.md`](docs/ISSUES.md) for current `[-]` or `[ ]`
- Commit atomically with conventional commits (`feat(flow):`, `feat(mcp):`, `docs:`)
- Do not expand to Agent 2-6 until the current issue's Definition of Done is met
- Turn limit: 100/session
- **Verification (feedback loop):** sebelum commit perubahan `flows/*.json` atau `.bob/mcp.json`, jalankan:
  - `bash scripts/verify-flow.sh` — selalu wajib, exit 0
  - `bash scripts/verify-e2e.sh` — wajib jika Langflow server hidup (exit 0/1; exit 2 = server mati, catat di issue)

## Skills to Load

**Built-in Bob skills** (load when needed):
```
$configure-mcp        # MCP troubleshooting
$conventional-commits # before any commit
```

**Project PM skills** (83 skills in `.bob/skills/`):
```
$value-proposition    # submission form: why this solution
$competitive-analysis # differentiation vs competitors
$north-star           # impact metrics
$pitch-deck           # 11-slide outline
$red-team-prd         # stress-test PRD before submitting
$business-model       # lean canvas / monetization
$plan-launch          # GTM / beachhead segment
$strategy             # product strategy canvas
```
Full list: `.bob/skills/` — sumber: github.com/phuryn/pm-skills + mattpocock engineering skills + custom project skills
