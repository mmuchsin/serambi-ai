# docs/ — Project Documentation

Internal documentation for Serambi.ai. Not end-user docs — these are for the team and AI agents.

## Files

| File | Audience | Purpose |
|------|----------|---------|
| [`PRD.md`](PRD.md) | Agent + Team | Product requirements, architecture, module map, research grounding |
| [`ISSUES.md`](ISSUES.md) | Agent + Team | Issue tracker — find current `[-]` or `[ ]` to continue work |
| [`research-papers-and-abstracts.md`](research-papers-and-abstracts.md) | Team | Literature base: multi-agent tutoring, spaced repetition, Feynman technique, market gap |

## Reading Order (new session)

1. **[`../HANDOFF.md`](../HANDOFF.md)** — 1-page status + next action (start here)
2. **[`ISSUES.md`](ISSUES.md)** — find the topmost `[-]` or `[ ]` issue
3. **[`PRD.md`](PRD.md)** — architecture and constraints if needed

## Research Papers Summary

Key papers that ground each agent's design:

| Agent | Paper | Key Finding |
|-------|-------|-------------|
| Goal Agent | GenMentor (FWCI 47.3) | Goal-to-skill mapping + efficient learning path scheduling |
| Tutor Agent | Feynman Bot (arXiv 2506.09055) | 80%+ prefer AI Feynman technique over passive re-reading |
| Tutor Agent | Chase et al. 2009 (Protégé Effect) | Teaching a tutee agent deepens learner's own understanding |
| Assessment Agent | IntelliCode (FWCI 23.5) | Graduated hinting outperforms direct answers |
| Progress Agent | Zaidi et al. (arXiv 2004.11327) | Adaptive spaced repetition: 15-20% retention improvement |
| All | BJET 2024 (cited 694) | AI must scaffold, not offload — preserve learner's cognitive effort |
