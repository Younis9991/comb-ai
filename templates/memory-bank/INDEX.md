# Memory Bank Index — {{PROJECT_NAME}}

## Project Overview

**Project**: {{PROJECT_NAME}}
**Team**: {{TEAM_NAME}}
**Current Version**: {{VERSION}} ({{DATE}})
**Current Phase**: {{CURRENT_PHASE}}
**Status**: {{STATUS_EMOJI}} {{STATUS_TEXT}}
**Last Updated**: {{DATE}}

---

## Smart Reading Strategy

> **Start here every session. Follow the decision tree. Read only what's specified.**

### Decision Tree — What Are You Working On?

| Task Type | Read These Files | Approx. Lines |
|-----------|-----------------|---------------|
| {{Domain 1}} development | INDEX + active-context + sprint-tracker + tech/{{domain1}}-stack | ~800 |
| {{Domain 2}} development | INDEX + active-context + sprint-tracker + tech/{{domain2}}-stack | ~800 |
| Architecture change | INDEX + active-context + arch/patterns-overview | ~1,000 |
| Bug fix | INDEX + active-context + relevant tech file | ~800 |
| New feature | INDEX + active-context + sprint-tracker + tech file | ~1,050 |
| Sprint planning | INDEX + active-context + sprint-tracker + core/backlog | ~1,050 |
| Code review | INDEX + active-context + relevant tech file | ~900 |
| First session (new to project) | INDEX + all core/ files + relevant tech file | ~1,500 |

### Cache-Aware Reading Order

**Step 1 — Read static files first (maximize cache hits):**
1. INDEX.md ← this file
2. tech/{{domain1}}-stack.md (if relevant to task)
3. tech/{{domain2}}-stack.md (if relevant to task)
4. arch/patterns-overview.md (if architecture relevant)

**Step 2 — Read dynamic files (always fresh):**
5. core/active-context.md
6. core/sprint-tracker.md

### Skip Unless Explicitly Needed

- ❌ `core/projectbrief.md` — Read once at project start; skip for daily work
- ❌ `core/productContext.md` — Stable; skip unless product decisions being made
- ❌ `core/progress.md` — Summary only; skip for daily development
- ❌ `core/progress-archive.md` — Historical; never read during daily work
- ❌ `core/sprint-plan.md` — Long-term; read only for strategic planning
- ❌ `core/backlog.md` — Product backlog; read only for sprint planning
- ❌ `arch/patterns-detailed.md` — Deep reference; skip unless implementing new patterns
- ❌ `arch/decisions-summary.md` — ADR reference; skip for daily work

**Token Savings from skipping**: ~{{SKIP_TOKENS}} tokens per session

---

## File Map

| File | Purpose | When to Read | Lines |
|------|---------|--------------|-------|
| `core/projectbrief.md` | Project foundation | Reference only | ~{{N}} |
| `core/productContext.md` | Product vision | Reference only | ~{{N}} |
| `core/active-context.md` | Current work focus | Every session | ~{{N}} |
| `core/sprint-tracker.md` | Active sprint details | Every session | ~{{N}} |
| `core/progress.md` | Overall progress summary | Reference only | ~{{N}} |
| `core/progress-archive.md` | Historical sprint details | Reference only | ~{{N}} |
| `core/sprint-plan.md` | Medium-term planning | Sprint planning | ~{{N}} |
| `core/backlog.md` | Product backlog | Sprint planning | ~{{N}} |
| `tech/{{domain1}}-stack.md` | {{Domain 1}} tech stack | {{Domain 1}} tasks | ~{{N}} |
| `tech/{{domain2}}-stack.md` | {{Domain 2}} tech stack | {{Domain 2}} tasks | ~{{N}} |
| `arch/patterns-overview.md` | Architecture patterns summary | Architecture tasks | ~{{N}} |
| `arch/decisions-summary.md` | ADR summary | Architecture reference | ~{{N}} |

---

## Key Technologies

**{{Domain 1}}**: {{tech stack summary}}
**{{Domain 2}}**: {{tech stack summary}}
**Infrastructure**: {{infrastructure summary}}
**Quality**: {{quality tools and standards}}

---

## Architecture Highlights

- **{{Pattern 1}}**: {{One-line description}}
- **{{Pattern 2}}**: {{One-line description}}
- **{{Pattern 3}}**: {{One-line description}}
- **{{Pattern 4}}**: {{One-line description}}
- **{{Pattern 5}}**: {{One-line description}}

---

## Current Sprint Status

**Sprint**: {{SPRINT_NUMBER}} — {{SPRINT_GOAL}}
**Period**: {{START_DATE}} → {{END_DATE}}
**Completion**: {{PERCENT}}% ({{COMPLETED_HOURS}}h / {{PLANNED_HOURS}}h planned)
**Status**: {{STATUS}}

→ Full details: [core/sprint-tracker.md](core/sprint-tracker.md)
→ Current focus: [core/active-context.md](core/active-context.md)

---

## Performance Metrics

| Metric | Value |
|--------|-------|
| Total memory bank size | ~{{TOTAL_LINES}} lines |
| Typical daily read | ~{{DAILY_LINES}} lines |
| Token reduction | ~{{REDUCTION_PCT}}% |
| Cache hit rate (estimated) | ~{{CACHE_PCT}}% |
| Effective tokens per session | ~{{SESSION_TOKENS}} |

---

## Memory Bank Maintenance

**Weekly**: Update `core/active-context.md` and `core/sprint-tracker.md`
**Sprint close**: Update `core/progress.md`, archive completed tasks to `core/progress-archive.md`
**When tech changes**: Update relevant `tech/*.md` file
**When architecture changes**: Update `arch/patterns-overview.md` and `arch/decisions-summary.md`

Manual full update trigger → tell AI: **"Update memory bank"**
