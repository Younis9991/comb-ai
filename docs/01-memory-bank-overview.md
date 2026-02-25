# Memory Bank Overview

## What Is a Memory Bank?

A **memory bank** is a structured set of documentation files that act as an AI assistant's persistent, project-specific knowledge base. Unlike general documentation written for humans, memory bank files are optimized for AI consumption — structured, concise, and organized around how an AI actually retrieves context.

The core insight is this: **AI assistants don't need to read everything to do their job well. They need to read the right things.**

---

## Why Standard Documentation Fails with AI

Traditional project documentation (wikis, READMEs, architecture docs) is organized for human readers who scan, search, and have accumulated mental models over time. For AI assistants:

- **Every session starts fresh** — the AI has no memory of the previous conversation
- **Context window is finite** — loading too much documentation exhausts the available token budget
- **All text costs the same** — a 5-year-old ADR and today's sprint blocker cost identical tokens
- **Cache misses compound** — frequently-changing files mixed with static files reduce cache efficiency

The result: AI assistants either work with too little context (missing critical decisions) or too much context (burning tokens on irrelevant history).

---

## The Memory Bank Mental Model

Think of the memory bank as a layered filing system:

```
LAYER 4: Archive (reference only)
  └── Completed sprint details, historical decisions
  └── Read: Never during daily work

LAYER 3: Static Knowledge (cache aggressively)
  └── Architecture patterns, tech stack, design decisions
  └── Read: Once per session, when needed by task type

LAYER 2: Semi-dynamic (refresh weekly)
  └── Tech stack files, integration patterns
  └── Read: Once per session for relevant domain

LAYER 1: Dynamic (read fresh every session)
  └── Current sprint focus, active blockers, today's priorities
  └── Read: Every session, always

ENTRY POINT: INDEX.md (always first)
  └── Routing guide — tells AI what to read based on task type
  └── Read: First, always
```

---

## Key Principles

### 1. Separation of Concerns by Volatility

Files are organized not by topic, but by **how frequently they change**:

| Volatility | Category | Examples | Cache Strategy |
|-----------|----------|---------|---------------|
| Never changes | Static | Architecture ADRs, original project brief | Full session cache |
| Rarely changes | Semi-static | Tech stack, design patterns | Session cache |
| Changes weekly | Semi-dynamic | Sprint tracker, integration docs | Read fresh weekly |
| Changes daily | Dynamic | Active context, current blockers | Read fresh every session |
| Historical | Archive | Completed sprints, resolved decisions | Never read in daily work |

### 2. The INDEX as Router

The `INDEX.md` file is not documentation — it's a **routing table** for the AI. It answers the question: *"Given this type of task, which files should I read?"*

The AI reads INDEX.md first, every time, without exception. Everything else is conditional on the task type.

### 3. Right-Sizing Files

Memory bank files are kept small by design:

- **Target**: Under 400 lines per file
- **Mechanism**: When a file exceeds 600–800 lines, archive the older content
- **Result**: Any file the AI reads loads quickly and fits within comfortable context budgets

### 4. Explicit Skip Lists

The INDEX explicitly tells the AI what **not** to read. This is as important as telling it what to read. Files like historical progress archives, old sprint details, and rarely-needed reference documents are listed with clear "skip unless explicitly needed" markers.

### 5. Minimal Viable Context

For any given task, the AI should read the minimum set of files needed to do the task correctly. The memory bank is designed to make this minimum set obvious and consistent.

---

## What Goes in a Memory Bank

A well-structured memory bank contains:

**Core files (always relevant):**
- `INDEX.md` — Routing hub and quick reference
- `active-context.md` — Current sprint focus, blockers, next steps
- `sprint-tracker.md` — Active sprint tasks, hours, completion status

**Domain files (relevant to task type):**
- `tech/[domain]-stack.md` — Tech stack and patterns for each domain (backend, frontend, infrastructure)
- `arch/patterns-overview.md` — Architecture patterns summary

**Reference files (rarely read during daily work):**
- `projectbrief.md` — Original project scope and requirements
- `productContext.md` — Product vision and user needs
- `progress.md` — Overall progress summary
- `backlog.md` — Future features and tech debt

**Archive files (historical reference only):**
- `progress-archive.md` — Completed sprint details
- `decisions-archive.md` — Superseded architectural decisions

---

## What Does NOT Go in a Memory Bank

- **Source code** — Reference file paths, not code itself
- **API documentation** — Link to it, don't copy it
- **Test results** — Reference coverage percentages, not test output
- **Meeting notes** — Extract decisions and actions, discard the rest
- **Duplicate information** — Each fact appears in exactly one file

---

## The Result

A properly structured memory bank enables an AI assistant to:

- Start every session with the right context in under 1,000 lines read
- Know exactly what to skip without being told each time
- Update its own knowledge efficiently as the project evolves
- Maintain context fidelity across long multi-sprint projects

See [02-file-structure.md](02-file-structure.md) for the concrete file organization.
