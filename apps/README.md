# apps/ — Application Surfaces

This directory contains all user-facing applications for Serambi.ai (monorepo pattern).

> **Currently scaffolded** — no app has been built yet.
> The primary interface is IBM Bob (TUI). Web and mobile surfaces are post-hackathon.

## Sub-apps

| Directory | Stack | Status |
|-----------|-------|--------|
| `web/` | Next.js / React (TBD) | 🔜 Post-hackathon |

## Convention

Each app in `apps/` should have its own:
- `README.md` — setup and run instructions
- `package.json` (or equivalent) — dependencies
- `.env.example` — required environment variables

Shared code (utilities, types, API clients) goes in [`../packages/`](../packages/README.md).

## Current Primary Interface

For now, all interaction happens through IBM Bob:
- See [`../README.md`](../README.md) for quick start
- Bob reads [`../.bob/mcp.json`](../.bob/mcp.json) and connects to Langflow automatically
