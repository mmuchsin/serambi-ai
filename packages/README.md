# packages/ — Shared Libraries

This directory contains shared code used across multiple apps in the Serambi.ai monorepo.

> **Currently empty** — no shared packages yet.
> This directory is reserved for post-hackathon development.

## Planned Packages

| Package | Purpose |
|---------|---------|
| `packages/api-client/` | Typed API client for Langflow MCP tools |
| `packages/ui/` | Shared React component library (if multiple web apps) |
| `packages/types/` | Shared TypeScript types for learner state, roadmap, etc. |

## Convention

Each package should have:
- `package.json` with a scoped name (e.g. `@serambi/api-client`)
- `README.md` — what it does and how to use it
- `src/index.ts` — public API entry point

Packages are imported by apps in `../apps/` using workspace references.
