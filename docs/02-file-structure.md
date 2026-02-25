# File Structure

## Directory Layout

```
memory-bank/
├── INDEX.md                        ← Master routing hub (always read first)
├── core/                           ← Dynamic and semi-dynamic core files
│   ├── active-context.md           ← Current sprint focus (read every session)
│   ├── sprint-tracker.md           ← Active sprint details (read every session)
│   ├── sprint-plan.md              ← Medium-term sprint planning (read for planning)
│   ├── backlog.md                  ← Product backlog (read for sprint planning)
│   ├── progress.md                 ← Overall progress summary (reference)
│   ├── progress-archive.md         ← Completed sprint history (reference only)
│   ├── projectbrief.md             ← Project foundation (read once at start)
│   └── productContext.md           ← Product vision (read once at start)
├── tech/                           ← Semi-static technology documentation
│   ├── backend-stack.md            ← Backend tech stack and patterns
│   ├── frontend-stack.md           ← Frontend tech stack and patterns
│   ├── infrastructure-stack.md     ← Infrastructure and DevOps patterns
│   └── [domain]-stack.md           ← Add one file per technical domain
└── arch/                           ← Static architecture documentation
    ├── patterns-overview.md        ← Architecture patterns summary
    ├── patterns-detailed.md        ← Detailed patterns (reference only)
    └── decisions-summary.md        ← ADR summary (reference only)
```

---

## File Responsibilities

### INDEX.md

The INDEX is the single entry point for every AI session. It contains:

1. **Project status header** — Current version, sprint, overall health
2. **Smart reading strategy** — Which files to read per task type
3. **Cache-aware reading order** — Static files before dynamic files
4. **File map** — All files with their purpose and line count
5. **Key technology reference** — Quick technology summary
6. **Architecture highlights** — Core architectural patterns in 5–10 bullets
7. **Quick decision tree** — "What are you working on?" → which files to read
8. **Performance metrics** — Token reduction stats, cache hit rates

The INDEX should be concise (200–400 lines) and updated whenever the project's reading strategy changes.

---

### core/active-context.md

The most frequently read file. Contains **only current state**:

- Current sprint phase and completion percentage
- Last 3–5 completed tasks (with dates)
- Current blockers and open questions
- Next 3–5 planned tasks
- Key decisions made this sprint
- Nothing historical — archive anything older than the current sprint

**Target size**: 80–150 lines
**Update frequency**: Every session, or at minimum weekly
**Cache strategy**: Read fresh every session — do not cache

---

### core/sprint-tracker.md

Active sprint details, structured for quick scanning:

- Sprint goal and scope
- Task list with status, owner, planned hours, actual hours
- Sprint metrics (completion %, hours burned)
- Blockers and dependencies
- Acceptance criteria per task

**Target size**: 200–400 lines
**Update frequency**: After every task completion
**Cache strategy**: Read fresh every session

---

### core/progress.md

A **summary** of where the project stands overall — not history, just current state:

- What's working in production
- What's complete but not yet deployed
- What's in active development
- Key metrics (test coverage, performance benchmarks)
- References to progress-archive.md for history

**Target size**: 200–400 lines
**Update frequency**: Weekly or at sprint boundaries
**Cache strategy**: Reference only, skip for daily work

---

### core/progress-archive.md

Historical sprint data that has been moved out of active files:

- Completed sprint summaries
- Resolved blockers
- Historical metrics

**Target size**: Up to 1,000 lines (archive, never grows unboundedly)
**Update frequency**: At sprint boundaries
**Cache strategy**: Never read during daily work

---

### tech/[domain]-stack.md

One file per technical domain (backend, frontend, infrastructure, etc.):

- Technology choices and versions
- Key libraries and frameworks
- Architectural patterns specific to this domain
- Testing approach and coverage targets
- File organization conventions
- Common patterns and anti-patterns

**Target size**: 200–400 lines per file
**Update frequency**: When tech stack or patterns change
**Cache strategy**: High cache affinity — rarely changes, cache for entire session

---

### arch/patterns-overview.md

A concise summary of all active architectural patterns:

- List of patterns in use (CQRS, Repository, Event Sourcing, etc.)
- One paragraph per pattern explaining the "why"
- Cross-references to tech stack files for implementation details

**Target size**: 150–250 lines
**Update frequency**: When architecture decisions change
**Cache strategy**: High cache affinity — cache for entire session

---

### arch/decisions-summary.md

Summary of Architectural Decision Records (ADRs):

- ADR number, title, status (active/superseded), date
- One-line rationale per decision
- Link to detailed documentation if needed

**Target size**: 150–300 lines
**Update frequency**: When new architecture decisions are made
**Cache strategy**: High cache affinity — cache for entire session

---

## File Sizing Guidelines

| File Category | Target Lines | Max Before Archiving |
|---------------|-------------|---------------------|
| INDEX.md | 200–400 | 500 |
| active-context.md | 80–150 | 200 |
| sprint-tracker.md | 200–400 | 600 |
| progress.md | 200–400 | 600 |
| tech/*.md | 200–400 | 600 |
| arch/patterns-overview.md | 150–250 | 350 |
| arch/decisions-summary.md | 150–300 | 400 |

When a file exceeds its maximum, archive the older sections to the corresponding `*-archive.md` file.

---

## Content Categories Within Files

Each memory bank file should contain only one or two of these content categories:

| Category | Description | Files That Use It |
|----------|-------------|-----------------|
| **Current state** | What's true right now | active-context.md, progress.md |
| **Active work** | Tasks in progress or upcoming | sprint-tracker.md, active-context.md |
| **Technical decisions** | Why tech choices were made | tech/*.md, arch/*.md |
| **Patterns** | How things are built | arch/patterns-overview.md, tech/*.md |
| **Routing** | Where to find other information | INDEX.md |
| **History** | Completed or superseded information | progress-archive.md |

**Anti-pattern**: Mixing current state with history in the same file. It forces the AI to read historical context when only current state is needed.

---

## Naming Conventions

- **Lowercase with hyphens**: `backend-stack.md`, `active-context.md`
- **Domain prefix for tech files**: `backend-`, `frontend-`, `infrastructure-`
- **Archive suffix**: `progress-archive.md`, `decisions-archive.md`
- **No version numbers in filenames**: Use git history, not `v2-backend-stack.md`

---

See [03-reading-strategy.md](03-reading-strategy.md) for how the AI navigates this structure.
