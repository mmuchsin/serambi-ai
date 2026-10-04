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

Architecture and flow diagrams for the pitch deck and documentation.

| File | Shows |
|------|-------|
| `architecture.drawio` | Bob/MCP/Langflow/LLM stack — dev harness vs production (identical MCP contract) |
| `agent-flow.drawio` | 6-agent interaction flow — how Goal → Tutor → Assessment → Progress → Motivator → Wellbeing hand off context |
| `user-journey.drawio` | Career switcher learning loop — swimlane: user actions × agents × support loop |

**Usage in pitch deck:**
- Open `.drawio` files in draw.io desktop or https://app.diagrams.net
- Export as PNG (File → Export as → PNG, 2× scale) → save to `assets/diagrams/`
- Insert PNG into `slides/serambi-pitch-deck.pptx` slide 05 (How It Works) and slide 06 (AI & Technology)

**WSL2 export gotcha:** draw.io desktop may not open directly from WSL path. Use `xdg-open assets/diagrams/architecture.drawio` or copy file to Windows side first, then export from there.
