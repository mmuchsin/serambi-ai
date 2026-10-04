# apps/ — Application Surfaces

This directory contains all user-facing applications for Serambi.ai (monorepo pattern).

> **Currently scaffolded** — no app has been built yet.
> **Web app (`apps/web/`) is the production user interface.** Bob (TUI) is a *development* agent harness the team uses to build, test, and verify Langflow agents — not the end-user surface.

## Sub-apps

| Directory | Stack | Status |
|-----------|-------|--------|
| `web/` | Next.js / React (TBD) | 🔜 Target UI pengguna akhir — memanggil MCP tool yang sama dengan Bob |

## Convention

Each app in `apps/` should have its own:
- `README.md` — setup and run instructions
- `package.json` (or equivalent) — dependencies
- `.env.example` — required environment variables

Shared code (utilities, types, API clients) goes in [`../packages/`](../packages/README.md).

## Interface Status

| Interface | Role | Status |
|-----------|------|--------|
| **Web app** (`apps/web/`) | UI pengguna akhir — backend memanggil MCP tool `goal_decomposer`, dst. | 🔜 Dalam pengembangan |
| **IBM Bob** (TUI) | **Development harness** — build, test, dan verifikasi agent end-to-end | ✅ Dipakai tim |

Development path (today): see [`../README.md`](../README.md) for quick start — Bob reads [`../.bob/mcp.json`](../.bob/mcp.json) and connects to Langflow automatically, so every flow is verified as a named MCP tool before the web app consumes it.
