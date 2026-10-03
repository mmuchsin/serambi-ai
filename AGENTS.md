# AGENTS.md — Serambi.ai

AI agent harness guide for this workspace. Read this before starting any session.

## What is Serambi.ai

An adaptive multi-agent learning assistant for Indonesian career switchers.
Bob (AI agent harness) orchestrates Langflow flows via MCP as named tools.

## Monorepo Layout

```
flows/          Langflow flow exports (one file = one agent)
agents/         Agent configs and system prompts
apps/           Future: webapp and other surfaces
packages/       Future: shared libraries
mcp/            MCP server docs
docs/           PRD, issues, research
```

Full structure → see [`docs/PRD.md`](docs/PRD.md#module-map-monorepo).

## MCP Tools (Langflow agents)

| Tool | What it does |
|------|-------------|
| `goal_decomposer` | Maps a career goal → weekly roadmap with milestones |
| `explain_concept` | Feynman-style concept explanation *(planned)* |
| `generate_quiz` | Adaptive quiz with graduated hints *(planned)* |
| `check_progress` | Spaced repetition review scheduler *(planned)* |
| `send_reminder` | Motivational nudge with next action *(planned)* |
| `check_wellbeing` | Burnout/engagement check-in *(planned)* |

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
   *Source: GenMentor (FWCI 47.3)*

## Session Rules

- One issue per session — check [`docs/ISSUES.md`](docs/ISSUES.md) for current `[-]` or `[ ]`
- Commit atomically with conventional commits (`feat(flow):`, `feat(mcp):`, `docs:`)
- Do not expand to Agent 2-6 until the current issue's Definition of Done is met
- Turn limit: 100/session

## Skills to Load

**Built-in Bob skills** (load when needed):
```
use_skill configure-mcp        # MCP troubleshooting
use_skill conventional-commits # before any commit
```

**Project PM skills** (43 skills in `.bob/skills/`):
```
use_skill value-proposition    # submission form: why this solution
use_skill competitive-analysis # differentiation vs competitors
use_skill north-star           # impact metrics
use_skill pitch-deck           # 11-slide outline
use_skill red-team-prd         # stress-test PRD before submitting
use_skill business-model       # lean canvas / monetization
use_skill plan-launch          # GTM / beachhead segment
use_skill strategy             # product strategy canvas
```
Full list: `.bob/skills/` — source: github.com/phuryn/pm-skills
