# Reading Strategy

## Core Principle: Read the Minimum, Read the Right Files

The reading strategy is the operational heart of COMB. It answers the question every AI session starts with: **"What should I read to do this task well?"**

The answer varies by task type, and it's always much less than the full memory bank.

---

## The Reading Order Rule

**Always follow this order within a session:**

1. **INDEX.md first** — Always, without exception
2. **Static files second** — Tech stack, architecture (cache these)
3. **Dynamic files last** — Active context, sprint tracker (read fresh)

This order is cache-aware: static files change rarely, so LLMs can reuse cached versions. Dynamic files change frequently, so they must be read fresh. Reading static files first maximizes cache hit rates.

---

## Task-Based Reading Matrix

| Task Type | Files to Read | Approx. Lines |
|-----------|--------------|---------------|
| Bug fix | INDEX + active-context + relevant tech file | ~800 |
| New feature | INDEX + active-context + sprint-tracker + relevant tech file | ~1,050 |
| Architecture change | INDEX + active-context + arch/patterns-overview | ~1,000 |
| Code review | INDEX + active-context + relevant tech file | ~900 |
| Sprint planning | INDEX + active-context + sprint-tracker + backlog | ~1,050 |
| Integration work | INDEX + active-context + relevant tech files (2) | ~1,100 |
| Documentation | INDEX + active-context + arch/decisions-summary | ~1,000 |
| First-time setup | INDEX + all core files + relevant tech file | ~1,500 |

---

## The Decision Tree

The INDEX.md should embed this decision tree so the AI can self-route:

```
What are you working on?

Backend development
  → Read: INDEX + active-context + sprint-tracker + tech/backend-stack

Frontend development
  → Read: INDEX + active-context + sprint-tracker + tech/frontend-stack

Infrastructure / DevOps
  → Read: INDEX + active-context + sprint-tracker + tech/infrastructure-stack

Integration between layers
  → Read: INDEX + active-context + tech/backend-stack + tech/frontend-stack

Architecture decisions
  → Read: INDEX + active-context + arch/patterns-overview

Sprint planning
  → Read: INDEX + active-context + sprint-tracker + core/backlog

Medium/long-term planning
  → Read: INDEX + active-context + core/sprint-plan

First session on this project
  → Read: INDEX + all core/ files + relevant tech file
```

---

## Cache-Aware Reading Order (Detailed)

LLMs (particularly Claude) implement prompt caching — if the start of a conversation matches a cached version, the cached tokens are reused at dramatically lower cost and latency.

**To maximize cache hits:**

### Session Start Sequence

```
Step 1: Read INDEX.md
  → Always first. Routing logic rarely changes = high cache affinity.

Step 2: Read static files (tech and arch)
  → tech/backend-stack.md, arch/patterns-overview.md
  → These change rarely = excellent cache candidates.
  → Cache duration: entire session.

Step 3: Read dynamic files
  → core/active-context.md, core/sprint-tracker.md
  → These change frequently = low cache affinity.
  → Read fresh every session.
```

### Why Order Matters for Caching

LLM caches work on prefixes — the beginning of the input must match exactly. If you read dynamic files first, even one character change in `active-context.md` invalidates the cache for all subsequent static files. Reading static files first means those cached portions remain valid even as dynamic content changes.

---

## Explicit Skip List

The reading strategy is as much about what **not** to read as what to read. The INDEX should explicitly list files that are skipped for daily work:

**Skip unless explicitly needed:**
- `core/projectbrief.md` — Read once at project start; skip for daily work
- `core/productContext.md` — Stable; skip unless product decisions are being made
- `core/progress.md` — Summary file; skip for daily development tasks
- `core/progress-archive.md` — Historical; never read during daily work
- `core/sprint-plan.md` — Long-term planning; read only for strategic planning
- `arch/patterns-detailed.md` — Deep reference; skip unless implementing new patterns
- `arch/decisions-archive.md` — Historical ADRs; skip unless researching decision history

---

## Reading Strategy by Project Phase

Project phases affect which files are most useful:

| Phase | Priority Files | Files to Skip |
|-------|---------------|--------------|
| **Project start** | All core files, all tech files | Nothing |
| **Active sprint** | active-context + sprint-tracker + tech file | projectbrief, productContext, progress-archive |
| **Sprint wrap-up** | active-context + sprint-tracker + progress | progress-archive, backlog |
| **Sprint planning** | sprint-tracker + backlog + sprint-plan | progress-archive, tech files |
| **Architecture review** | arch/ files + tech files | sprint-tracker, backlog |
| **Production deployment** | active-context + sprint-tracker | backlog, sprint-plan |
| **Maintenance mode** | active-context + relevant tech file | sprint-tracker, backlog |

---

## Token Budget Planning

Plan your memory bank size based on your AI assistant's context window:

| Context Window | Recommended Max Read | Files Typically Covered |
|---------------|---------------------|------------------------|
| 32K tokens | ~400 lines | INDEX + active-context + 1 tech file |
| 100K tokens | ~1,200 lines | Full COMB daily read |
| 200K tokens | ~2,500 lines | Full COMB + 1 additional reference file |
| 1M tokens | ~8,000 lines | Full memory bank if needed |

**Rule of thumb**: Plan for the typical daily read to consume no more than 15% of the context window. The rest is available for code, conversations, and tool outputs.

---

## Anti-Patterns to Avoid

### Anti-pattern: Reading everything "just in case"
- **Problem**: Burns tokens on irrelevant context; slows the session; reduces quality
- **Fix**: Trust the decision tree; only deviate when the task explicitly requires it

### Anti-pattern: Reading dynamic files before static files
- **Problem**: Cache misses on every session; 3–10x higher cost
- **Fix**: Always read static files (tech, arch) before dynamic files (active-context, sprint-tracker)

### Anti-pattern: No skip list
- **Problem**: AI has no guidance on what's safe to skip; defaults to reading everything
- **Fix**: Add an explicit "Skip unless explicitly needed" section to INDEX.md

### Anti-pattern: Mixing historical and current content
- **Problem**: AI reads 500 lines of completed sprint history to find 50 lines of current work
- **Fix**: Archive completed sprint content to `progress-archive.md`

### Anti-pattern: One giant context file
- **Problem**: Every task reads everything; no cache optimization possible
- **Fix**: Split by domain (backend, frontend, infrastructure) and volatility (static, dynamic, archive)

---

## AI Instruction Template

Add this to your `.cursorrules`, `CLAUDE.md`, or AI assistant instructions:

```
MEMORY BANK READING PROTOCOL

Session initialization (every session):
1. Read memory-bank/INDEX.md first, always
2. Identify task type from user request
3. Follow the reading strategy in INDEX.md for this task type
4. Read static files (tech/, arch/) before dynamic files (core/active-context.md)
5. Do NOT read files listed in the "Skip unless explicitly needed" section

Reading principles:
- Minimum viable context: Read only what INDEX.md specifies for this task type
- Fresh dynamic files: Never use cached versions of active-context.md or sprint-tracker.md
- Cache static files: Assume tech/ and arch/ files are unchanged unless told otherwise
```

---

See [04-update-protocol.md](04-update-protocol.md) for how to keep the memory bank current.
