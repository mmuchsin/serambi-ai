# flows/ — Langflow Flow Exports

This directory contains exported Langflow flow JSON files. Each file = one Serambi.ai agent.

## Convention

- One file per agent flow
- Filename matches the Langflow Endpoint Name: `<endpoint_name>.json`
- Export from Langflow: flow menu → Export → save here
- Import to Langflow: drag-and-drop or Import from the flows panel

## Flows

| File | Agent | Endpoint Name | Status |
|------|-------|--------------|--------|
| `goal_decomposer.json` | Goal Agent | `goal_decomposer` | ✅ Live |
| `explain_concept.json` | Tutor Agent | `explain_concept` | 🔜 Planned (ISS-04) |
| `generate_quiz.json` | Assessment Agent | `generate_quiz` | 🔜 Planned (ISS-05) |

## After Importing a Flow

Always set the **Endpoint Name** in Langflow after import:
1. Open the flow in Langflow
2. Click the flow name / settings icon
3. Set **Endpoint Name** = filename without `.json`
4. Save

The endpoint name is what makes the flow discoverable as an MCP tool in Bob.

## Related

- MCP config: [`../.bob/mcp.json`](../.bob/mcp.json)
- MCP docs: [`../mcp/README.md`](../mcp/README.md)
- Issue tracker: [`../docs/ISSUES.md`](../docs/ISSUES.md)
