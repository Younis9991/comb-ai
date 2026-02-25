---
name: update-memory-bank
description: Update memory bank after task completion. Detects scope automatically and updates files in priority order. Can be auto-invoked when task completion is detected in conversation.
argument-hint: [task-description]
disable-model-invocation: false
user-invocable: true
---

# Update Memory Bank

Update the memory bank to reflect: **$ARGUMENTS**

## Automatic Trigger Conditions

This skill should be invoked automatically when any of these signals are detected:

- Task implementation completed (code changes committed or ready)
- Sprint task marked complete
- Bug fix implemented
- Feature implementation finished
- Architectural decision made
- User says: "done", "finished", "complete", "task completed", "what's next?"

## Process

### Step 1 — Detect scope

Determine the update scope based on what changed:

| Scope | When | Files to Update |
|-------|------|-----------------|
| **Minimal** | Single task completed | sprint-tracker + active-context |
| **Standard** | Feature implemented | + progress |
| **Full** | Sprint completed / major milestone | + archive + arch/tech files |
| **Architecture** | Architecture decision made | + arch/patterns-overview + arch/decisions-summary |
| **Tech Stack** | New dependency or technology added | + relevant tech/*.md |

### Step 2 — Update files in priority order

**Priority 1 — `core/sprint-tracker.md`**
- Mark task as complete with actual hours
- Update sprint completion percentage
- Note any scope changes

**Priority 2 — `core/active-context.md`**
- Remove completed items from "current work"
- Add to "last completed" list (keep only 5 most recent)
- Update "next steps" to reflect current state
- Update any resolved blockers

**Priority 3 — `core/progress.md`** (standard/full scope only)
- Update "what's working" section
- Update key metrics if changed
- Update overall status

**Priority 4 — `tech/*.md`** (if tech stack changed)
- New library added → update tech stack file
- New pattern discovered → add to patterns section

**Priority 5 — `arch/*.md`** (if architecture changed)
- New ADR → add to arch/decisions-summary.md
- New pattern → add to arch/patterns-overview.md

**Priority 6 — Archive** (full scope / sprint boundary only)
- Move completed sprint content from sprint-tracker to progress-archive.md
- Trim progress.md to summary only

### Step 3 — Update dynamic zone

Update the dynamic section of `project-rules.md` (below `=== DYNAMIC CONTENT ===`):
- Current sprint context
- Recent patterns catalog (add if new pattern discovered, keep last 5-10)
- Last memory bank update metadata

### Step 4 — Report

```
Memory Bank Updated

Scope: [minimal/standard/full/architecture/tech-stack]
Trigger: [task description]

Updated:
- core/sprint-tracker.md → [what changed]
- core/active-context.md → [what changed]
- [other files if applicable]

Next steps:
- [what's next based on active-context]
```

## File Size Check

After updating, check file sizes against limits:

| File | Max Lines | Action if Exceeded |
|------|-----------|-------------------|
| active-context.md | 200 | Archive to progress-archive.md |
| sprint-tracker.md | 600 | Archive sprint section to progress-archive.md |
| progress.md | 600 | Archive to progress-archive.md |
| tech/*.md | 600 | Split into sub-domain files |
| arch/patterns-overview.md | 350 | Move details to patterns-detailed.md |

## Rules

- **Do NOT ask permission** — auto-update when completion is detected
- **Be smart about scope** — don't update files unrelated to the completed task
- **Keep reports concise** — bullet points, not paragraphs
- **Continue workflow** — after reporting, suggest the next task
- **Never skip active-context.md** — it's the most critical file for session continuity
