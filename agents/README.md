# agents/ — Agent Configs & System Prompts

This directory contains configuration files and system prompts for Serambi.ai agents.

> **Currently empty** — agent logic lives inside Langflow flows (`../flows/`).
> This directory is reserved for future agent configs that live outside Langflow
> (e.g., system prompts, persona definitions, few-shot examples).

## Planned Contents

| File | Purpose |
|------|---------|
| `goal_decomposer.md` | System prompt for Goal Agent — goal-to-skill mapping rules |
| `explain_concept.md` | System prompt for Tutor Agent — Feynman technique constraints |
| `generate_quiz.md` | System prompt for Assessment Agent — graduated hinting rules |

## Pedagogical Constraints

All agent prompts in this directory must follow the constraints defined in [`../AGENTS.md`](../AGENTS.md):
- Scaffold, not oracle
- Graduated hinting
- Probing questions over direct answers
- No cognitive offloading
- Goal-first anchoring
