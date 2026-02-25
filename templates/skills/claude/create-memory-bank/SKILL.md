---
name: create-memory-bank
description: Initialize a COMB memory bank for a new (greenfield) project. Creates the directory structure, core files, and INDEX.md from templates. For existing projects, use /adopt-memory-bank instead.
argument-hint: [project-name]
user-invocable: true
---

# Create Memory Bank (Greenfield)

Initialize a COMB (Context-Optimized Memory Bank) for the new **$0** project.

> **For existing projects with code**: Use `/adopt-memory-bank` instead — it analyzes
> the codebase and pre-fills memory bank files with real data.

## Process

### Step 1 — Gather project information

Ask the user for these details before creating files:

1. **Project name**: $0 (from argument)
2. **Technical domains**: What are the main development areas? (e.g., backend, frontend, infrastructure, mobile)
3. **Tech stack per domain**: What technologies are used? (e.g., backend: .NET 8 + PostgreSQL, frontend: React 18 + TypeScript)
4. **Current phase**: What phase is the project in? (kickoff, active development, maintenance)
5. **Team size**: Solo developer or team?

### Step 2 — Create directory structure

```
memory-bank/
├── INDEX.md
├── core/
│   ├── projectbrief.md
│   ├── productContext.md
│   ├── active-context.md
│   └── sprint-tracker.md
├── tech/
│   └── (one file per domain: backend-stack.md, frontend-stack.md, etc.)
└── arch/
    ├── patterns-overview.md
    └── decisions-summary.md
```

### Step 3 — Create project root files

Create these files in the project root:

1. **`memory-bank-protocol.md`** — Copy from the COMB methodology template
2. **`project-rules.md`** — Create with project-specific rules and the dynamic zone
3. **`CLAUDE.md`** — Create the Claude Code pointer file

If the user uses Cursor, also create:
4. **`.cursor/rules/memory-bank.mdc`** — The thin Cursor wrapper

### Step 4 — Fill in INDEX.md

The INDEX.md is the most critical file. Fill in:

- Project overview (name, team, version, status)
- Smart reading strategy decision tree (customized to the project's domains)
- Cache-aware reading order (static files listed before dynamic files)
- File map with line counts (initially estimated)
- Key technologies summary
- Architecture highlights
- Performance metrics placeholders

### Step 5 — Create core files

- **`core/projectbrief.md`** — Ask user for project scope, goals, constraints
- **`core/productContext.md`** — Ask user for product vision, target users, key features
- **`core/active-context.md`** — Initialize with current phase and first tasks
- **`core/sprint-tracker.md`** — Initialize with Sprint 1 if applicable

### Step 6 — Create tech files

For each domain the user specified:
- Create `tech/{domain}-stack.md`
- Fill in technology choices, architecture approach, key patterns, coding standards

### Step 7 — Create arch files

- **`arch/patterns-overview.md`** — Document initial architecture patterns
- **`arch/decisions-summary.md`** — Start with ADR-001 (initial architecture choice)

### Step 8 — Report

After creation, report:

```
Memory Bank Created for $0

Files created:
- memory-bank/INDEX.md (XXX lines)
- memory-bank/core/projectbrief.md (XXX lines)
- memory-bank/core/productContext.md (XXX lines)
- memory-bank/core/active-context.md (XXX lines)
- memory-bank/core/sprint-tracker.md (XXX lines)
- memory-bank/tech/{domain}-stack.md (XXX lines each)
- memory-bank/arch/patterns-overview.md (XXX lines)
- memory-bank/arch/decisions-summary.md (XXX lines)
- memory-bank-protocol.md
- project-rules.md
- CLAUDE.md

Estimated daily read: ~XXX lines (~XXX tokens)
AI reads only what the current task requires.

Next: Start your first task. The memory bank will guide context loading.
```

## Important Rules

- Keep each file under 400 lines (target) / 600 lines (max)
- INDEX.md must contain the smart reading strategy decision tree
- Static files (tech/, arch/) listed before dynamic files in reading order
- Use the project's actual technology names — not placeholders
- Do NOT create archive files yet — they're created when needed
