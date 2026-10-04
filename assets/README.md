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
| `01-user-interface.png` | Web app user interface |
| `02-langflow-workflow.png` | Langflow workflow (goal_decomposer) |
| `03-langflow-endpoint.png` | Langflow MCP endpoint |
| `04-output.png` | Structured JSON roadmap response |

## diagrams/

Architecture diagrams. Currently empty — add draw.io exports (`.drawio`, `.svg`, `.png`) here.

Suggested diagrams to create:
- `architecture.png` — Bob → MCP → Langflow → LLM stack
- `agent-flow.png` — how the 6 agents interact
- `user-journey.png` — career switcher → goal → roadmap → learn → quiz → progress
