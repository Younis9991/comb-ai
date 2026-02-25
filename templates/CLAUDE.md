# {{PROJECT_NAME}} — Claude Code

**Project**: {{PROJECT_NAME}} | **Stack**: {{BRIEF_TECH_SUMMARY}} | **Repo**: {{REPO_URL}}

---

## Session Start — Do This First, Every Session

Read these files in order (all plain markdown):

```
1. memory-bank-protocol.md    ← methodology, reading strategy, workflows, update protocol
2. project-rules.md           ← project rules, coding standards + dynamic sprint zone
3. memory-bank/INDEX.md       ← routing hub, follow its strategy for the current task type
```

**Reading strategy:**
- `memory-bank-protocol.md` — static, cache for the session (methodology never changes)
- `project-rules.md` — has a dynamic zone below `=== DYNAMIC CONTENT ===`, re-read that section each task
- `memory-bank/INDEX.md` — determines which memory bank files to load next

---

## Key Project Decisions

*(Too important to bury in memory bank files — Claude must always know these)*

- **{{Decision topic}}**: {{One sentence — what was decided and why}}
- **{{Decision topic}}**: {{One sentence}}
- **{{Decision topic}}**: {{One sentence}}

---

## Skills

| Command | Effect |
|---------|--------|
| `/create-memory-bank [name]` | Initialize memory bank for a new (greenfield) project |
| `/adopt-memory-bank [name]` | Add memory bank to an existing (brownfield) project |
| `/update-memory-bank [task]` | Update memory bank after task completion (also auto-invoked) |

## Manual Overrides

| Say this | Effect |
|----------|--------|
| "Update memory bank" | Full memory bank review and update |
| "Read all memory bank files" | Override smart reading — read everything |
| "Skip memory bank" | Proceed without memory bank (use sparingly) |

---

## File Map

```
memory-bank-protocol.md         ← Methodology (read every session, cache)
project-rules.md                ← Rules + dynamic zone (read every session)
memory-bank/
├── INDEX.md                    ← Routing hub (read every session)
├── core/
│   ├── active-context.md       ← Current focus (read every session)
│   ├── sprint-tracker.md       ← Sprint status (read every session)
│   ├── progress.md             ← Overall progress (reference)
│   ├── progress-archive.md     ← History (skip in daily work)
│   ├── backlog.md              ← Future work (sprint planning only)
│   ├── projectbrief.md         ← Foundation (read once)
│   └── productContext.md       ← Vision (reference)
├── tech/
│   ├── {{domain1}}-stack.md    ← Cache per session
│   └── {{domain2}}-stack.md    ← Cache per session
└── arch/
    ├── patterns-overview.md    ← Cache per session
    └── decisions-summary.md    ← Reference only
```
