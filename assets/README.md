# assets/ — Static Assets

Demo screenshots, diagrams, and other static assets for Serambi.ai.

## Structure

```
assets/
├── screenshots/    Demo screenshots for submission and documentation
└── diagrams/       Architecture diagrams, flow diagrams
```

## screenshots/

Screenshots demonstrating the working system. Used in:
- Hackathon submission form (3-5 screenshots required)
- README and documentation

| File | Shows |
|------|-------|
| `Screenshot 2026-10-03 113405.png` | Langflow Playground — goal_decomposer output |
| `Screenshot 2026-10-03 124609.png` | Bob calling MCP tool |
| `Screenshot 2026-10-03 124806.png` | Structured JSON roadmap response |

## diagrams/

Architecture diagrams. Currently empty — add draw.io exports (`.drawio`, `.svg`, `.png`) here.

Suggested diagrams to create:
- `architecture.png` — Bob → MCP → Langflow → LLM stack
- `agent-flow.png` — how the 6 agents interact
- `user-journey.png` — career switcher → goal → roadmap → learn → quiz → progress
