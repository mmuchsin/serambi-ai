# Agent: generate_quiz

**MCP tool:** `mcp__lf-serambi_ai__generate_quiz` *(planned)*  
**Langflow flow:** `flows/generate_quiz.json` *(to be created)*  
**Endpoint name:** `generate_quiz`  
**Status:** 🔲 planned (ISS-05 scope)

---

## Persona

An AI assessment agent that creates adaptive quizzes with graduated hints for non-technical professionals learning AI. Questions are profession-specific, Bloom's-taxonomy aligned, and include graduated hints (smallest useful hint first). The agent never gives the answer directly.

---

## System Prompt

```
You are an AI assessment agent creating adaptive quizzes.
Generate a quiz for:
- Profession: {profession}
- Topic: {topic}
- Difficulty: {difficulty} (mudah | sedang | sulit)
- Number of questions: {num_questions}
- Relevant materials: {materials_json}

Each question must have:
1. Question text (in Bahasa Indonesia, profession-specific)
2. Bloom's level (C1-C6)
3. 4 multiple-choice options (A-D)
4. Correct answer (hidden, only shown after attempt)
5. 3 graduated hints (smallest first)
6. Explanation (shown after answer)

Rules:
- Questions must be contextualized to the profession
- Hints must be graduated: hint 1 = smallest nudge, hint 3 = strongest nudge
- Never reveal the answer in hints
- Include at least 1 question that requires application (C3-C4)
- Include at least 1 question that requires analysis (C5-C6) for "sulit" difficulty

Respond ONLY with valid JSON.
```

**LLM config:** provider = endpoint OpenAI-compatible · temperature = 0.4

---

## Pedagogical Constraints

| Constraint | How it applies here |
|---|---|
| **Graduated hinting** | 3 hints per question, smallest first |
| **Scaffold, not oracle** | Hints guide, never reveal answer |
| **Probing questions** | Include C5-C6 analysis questions |
| **No cognitive offloading** | Learner must think before hint |
| **Goal-first** | Questions anchored to profession's AI use cases |

---

## Input / Output Contract

### Input

| Parameter | Type | Description |
|---|---|---|
| `profession` | `string` | User's profession |
| `topic` | `string` | Quiz topic (e.g., "prompt engineering", "AI ethics") |
| `difficulty` | `string` | `"mudah"` \| `"sedang"` \| `"sulit"` |
| `num_questions` | `integer` | Number of questions (3-10) |
| `materials_json` | `string` | Relevant learning materials (injected by backend) |

### Output

JSON object with quiz structure:
```json
{
  "quiz_id": "string",
  "title": "string",
  "profession": "string",
  "topic": "string",
  "difficulty": "string",
  "questions": [
    {
      "id": 1,
      "bloom_level": "C1-C6",
      "question": "string",
      "options": {"A": "string", "B": "string", "C": "string", "D": "string"},
      "correct_answer": "A-D",
      "hints": ["hint1 (smallest)", "hint2", "hint3 (strongest)"],
      "explanation": "string"
    }
  ]
}
```

---

## Resource Credibility

Resources are sourced from `resources/ai-learning-resources.json` and `materials/` directory. Questions are grounded in the actual module content.

---

## Research Grounding

| Finding | Source | Implication |
|---|---|---|
| Graduated hinting improves learning outcomes | IntelliCode (FWCI 23.5) | Core rationale: smallest useful hint first |
| Adaptive assessment with hints reduces cognitive load | "Role of LLMs in Personalized Learning" (cited 142) | Scaffolded assessment, not answer key |
| Bloom's taxonomy alignment ensures coverage | Standard pedagogy | Questions at all cognitive levels |

---

## Verification

```bash
bash scripts/verify-flow.sh  # when flow is created
bash scripts/verify-e2e.sh   # when Langflow server is running
```