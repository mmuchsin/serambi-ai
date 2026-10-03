#!/usr/bin/env node
/**
 * turn-counter.mjs — UserPromptSubmit hook
 *
 * Per prompt:
 * 1. Increment turn counter (stored in .bob/turn-counter.json)
 * 2. Update terminal title bar: "Turn N/100 — Serambi.ai"
 * 3. Inject turn info into model context via additionalContext
 *    - At turn 80+: include a warning to wrap up or update HANDOFF.md
 */

import { readFileSync, writeFileSync } from "node:fs";
import { join } from "node:path";

const SESSION_LIMIT = 100;
const WARN_AT = 80;

// Read event payload from stdin
let raw = "";
for await (const chunk of process.stdin) raw += chunk;
const input = JSON.parse(raw);

const cwd = input.cwd ?? process.cwd();
const counterFile = join(cwd, ".bob", "turn-counter.json");

// Read or initialise counter
let data = { turn: 0 };
try {
  data = JSON.parse(readFileSync(counterFile, "utf8"));
} catch {
  // file doesn't exist yet — start fresh
}

data.turn = (data.turn ?? 0) + 1;
const turn = data.turn;
const remaining = SESSION_LIMIT - turn;

// Persist updated counter
writeFileSync(counterFile, JSON.stringify(data, null, 2));

// Update terminal title bar (ANSI escape — works in most terminal emulators)
process.stdout.write(`\x1b]0;Turn ${turn}/${SESSION_LIMIT} — Serambi.ai\x07`);

// Build context string for model
let context = `[Turn ${turn}/${SESSION_LIMIT} — ${remaining} turn tersisa dalam session ini]`;

if (turn >= WARN_AT) {
  context += `\n⚠️ Sisa ${remaining} turn. Sebelum session habis: update HANDOFF.md dan commit progress.`;
}

// Return additionalContext to Bob
const output = {
  hookSpecificOutput: {
    hookEventName: "UserPromptSubmit",
    additionalContext: context,
  },
};

process.stdout.write(JSON.stringify(output));
