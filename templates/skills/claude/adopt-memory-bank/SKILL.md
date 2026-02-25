---
name: adopt-memory-bank
description: Add a COMB memory bank to an existing (brownfield) project by analyzing current codebase, dependencies, and architecture. Use when the project already has code but no memory bank.
argument-hint: [project-name]
user-invocable: true
---

# Adopt Memory Bank — Brownfield Projects

Add a COMB memory bank to the existing **$0** project by analyzing its current state.

> Unlike `/create-memory-bank` (greenfield), this skill reverse-engineers the project's
> architecture, dependencies, and patterns from the existing codebase.

## Process

### Step 1 — Analyze the codebase

Explore the project without asking the user first:

1. **Project structure**: Read the directory layout, identify layers (backend, frontend, infra, etc.)
2. **Dependencies**: Read package.json, *.csproj, go.mod, Cargo.toml, requirements.txt, etc.
3. **Configuration**: Read config files, environment setup, CI/CD pipelines
4. **Existing docs**: Check for README.md, CONTRIBUTING.md, architecture docs, ADRs
5. **Git history**: Run `git log --oneline -20` to understand recent development focus
6. **Test setup**: Identify test frameworks, coverage configuration

### Step 2 — Summarize findings to user

Present a summary of what was discovered:

```
Project Analysis: $0

Structure:
- Backend: [detected tech] at [path]
- Frontend: [detected tech] at [path]
- Infrastructure: [detected setup]

Dependencies: [count] packages ([key ones listed])
Test coverage: [if detectable]
Recent focus: [based on git log]
Existing docs: [list found]

Does this look correct? Anything to add or correct?
```

### Step 3 — Confirm domains with user

Ask the user:
1. Are the detected domains correct? Any missing?
2. What's the current sprint/phase? (or "no sprints — maintenance mode")
3. Are there active blockers or decisions pending?
4. Any patterns or conventions not obvious from code?

### Step 4 — Create directory structure

Same as greenfield but pre-filled:

```
memory-bank/
├── INDEX.md              ← Pre-filled from analysis
├── core/
│   ├── projectbrief.md   ← Extracted from existing docs + analysis
│   ├── productContext.md  ← From README/docs or user input
│   ├── active-context.md  ← Current state from git log + user input
│   └── sprint-tracker.md  ← Current sprint if applicable
├── tech/
│   └── [domain]-stack.md  ← Auto-generated from dependency analysis
└── arch/
    ├── patterns-overview.md   ← Inferred from code structure
    └── decisions-summary.md   ← From existing ADRs or inferred
```

### Step 5 — Generate pre-filled files

**KEY DIFFERENCE from greenfield**: Files are pre-filled with real data, not placeholders.

**INDEX.md**:
- Fill in actual project name, tech stack, file sizes
- Reading strategy customized to detected domains
- Architecture highlights from code analysis

**tech/[domain]-stack.md** (one per detected domain):
- Actual technology names and versions from dependency files
- Actual project structure (directory layout)
- Patterns inferred from code (e.g., MVC, Repository, CQRS)

**arch/patterns-overview.md**:
- Architecture style inferred from structure (monolith, microservices, modular, etc.)
- Design patterns detected in code
- Cross-cutting concerns observed (auth, logging, error handling)

**core/active-context.md**:
- Current phase based on git activity
- Recent completed work from git log
- Next steps inferred from TODO comments, open branches, or user input

**core/projectbrief.md**:
- Extracted from existing README or docs
- Scope derived from codebase analysis

### Step 6 — Create project root files

1. **`memory-bank-protocol.md`** — Copy from COMB methodology
2. **`project-rules.md`** — Pre-fill with detected coding standards, naming conventions
3. **`CLAUDE.md`** — Create pointer file with actual project decisions

### Step 7 — Report

```
Memory Bank Adopted for $0

Analysis:
- Scanned [N] directories, [N] config files, [N] recent commits
- Detected [N] domains: [list]
- Identified [N] architectural patterns

Files created:
- memory-bank/INDEX.md (XXX lines) — pre-filled
- memory-bank/core/projectbrief.md (XXX lines) — from existing docs
- memory-bank/core/active-context.md (XXX lines) — from git history
- memory-bank/tech/[domain]-stack.md (XXX lines each) — from dependencies
- memory-bank/arch/patterns-overview.md (XXX lines) — from code analysis
- [project root files]

Pre-filled accuracy: Review each file for correctness.
Some inferences may need manual adjustment.

Next: Review the generated files, then start your first task with COMB.
```

## Key Differences from Greenfield

| Aspect | Greenfield (`/create-memory-bank`) | Brownfield (`/adopt-memory-bank`) |
|--------|-----------------------------------|----------------------------------|
| Input source | User answers questions | Codebase analysis + user confirmation |
| Tech stack | User provides | Auto-detected from dependencies |
| Architecture | User describes | Inferred from code structure |
| Active context | Empty / Sprint 1 | Populated from git history |
| File content | Placeholders filled by user | Pre-filled from analysis |
| Accuracy | High (user provides) | Needs review (inferred) |

## Rules

- Always analyze before asking — show what you found, don't ask blind questions
- Pre-fill files with real data, not placeholders
- Flag inferences with low confidence: "*(inferred — please verify)*"
- Keep each file under 400 lines even with pre-filled content
- Respect existing docs — incorporate, don't replace
- If existing ADRs or architecture docs exist, reference them rather than duplicating
