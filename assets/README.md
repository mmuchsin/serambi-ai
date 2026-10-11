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
| `serambi-architecture.svg` | Bob / MCP / Langflow / LLM provider stack — dev harness vs production, one MCP contract |
| `html/serambi-architecture.html` | Source of the architecture diagram (self-contained HTML + inline SVG) |

**Diagrams are authored with the `diagram-design` skill** — self-contained HTML with inline SVG, exported to `.svg` for embedding. Source HTML lives in `assets/diagrams/html/`; the `.svg` sibling is the embeddable artifact.
