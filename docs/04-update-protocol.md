# Update Protocol

## Why Updates Matter

A memory bank that doesn't update is worse than no memory bank at all — it gives the AI confidently wrong context. The update protocol ensures the memory bank stays synchronized with the actual state of the project.

---

## Update Triggers

### Automatic Triggers (AI-detected)

The AI assistant should automatically update the memory bank when it detects these signals:

| Signal | Detected When | Files to Update |
|--------|--------------|-----------------|
| Task completed | User says "done", "finished", "complete" | sprint-tracker → active-context |
| Feature shipped | Code committed, PR merged | sprint-tracker → active-context → progress |
| Sprint milestone | Sprint % jumps significantly | sprint-tracker → active-context |
| Blocker resolved | User reports unblocking | active-context |
| Architecture decision made | New pattern adopted | arch/patterns-overview → arch/decisions-summary |
| Tech stack change | New library added/removed | relevant tech/*.md |
| Sprint completed | All tasks marked done | sprint-tracker → progress → archive |

### Manual Triggers

The developer should explicitly trigger memory bank updates when:

- Planning the next sprint (backlog → sprint-tracker)
- Completing a sprint retrospective (sprint-tracker → progress → archive)
- Onboarding a new team member (verify all files are current)
- After any major architectural pivot

---

## Update Scope Levels

Not every update requires touching all files. Use the minimum update scope:

### Minimal Update
**When**: Single task completed, small bug fixed
**Files updated**: sprint-tracker.md, active-context.md
**Time**: 2–5 minutes

### Standard Update
**When**: Feature completed, significant bug resolved, decision made
**Files updated**: sprint-tracker.md → active-context.md → progress.md
**Time**: 5–10 minutes

### Full Update
**When**: Sprint completed, major milestone
**Files updated**: sprint-tracker.md → active-context.md → progress.md → archive → arch files
**Time**: 15–30 minutes

### Architecture Update
**When**: Architectural decision made, new pattern adopted
**Files updated**: sprint-tracker.md → active-context.md → arch/patterns-overview.md → arch/decisions-summary.md
**Time**: 5–15 minutes

### Tech Stack Update
**When**: New dependency added, library replaced, tech choice changed
**Files updated**: sprint-tracker.md → active-context.md → relevant tech/*.md
**Time**: 5–10 minutes

---

## Update Process (Step by Step)

### Step 1: Detect completion signal
The AI identifies that work has been completed based on user communication or task state.

### Step 2: Determine update scope
- Single task → Minimal
- Feature complete → Standard
- Sprint end → Full

### Step 3: Update files in priority order

**Priority 1 — sprint-tracker.md**
- Mark task as complete with actual hours
- Update sprint completion percentage
- Note any scope changes

**Priority 2 — active-context.md**
- Remove completed items from "current work"
- Add to "last completed" list (keep only 3–5 most recent)
- Update "next steps" to reflect current state
- Update any resolved blockers

**Priority 3 — progress.md**
- Update "what's working" section
- Update key metrics if changed
- Update overall status line

**Priority 4 — Relevant tech files (if changed)**
- New patterns discovered → update relevant tech/*.md
- New library added → update tech stack file

**Priority 5 — Architecture files (if changed)**
- New ADR → add to arch/decisions-summary.md
- New pattern → add to arch/patterns-overview.md

**Priority 6 — Archive (at sprint boundaries)**
- Move completed sprint content from sprint-tracker to progress-archive
- Trim progress.md to summary only

### Step 4: Report the update

After updating, the AI should report a brief summary:

```
Memory Bank Updated

Scope: standard
Trigger: User authentication feature completed

Updated:
- sprint-tracker.md → Task AUTH-05 marked complete (8h actual vs 6h planned)
- active-context.md → Next: Authorization middleware implementation
- progress.md → User authentication now working end-to-end

Next steps:
- Sprint 2, Task AUTH-06: Authorization middleware (est. 4h)
```

---

## Archive Protocol

Archives prevent memory bank files from growing unboundedly. Archive when a file exceeds its size limit.

### When to Archive

| File | Archive Trigger | Archive Destination |
|------|----------------|-------------------|
| progress.md | > 600 lines | progress-archive.md |
| sprint-tracker.md | Sprint completes | progress-archive.md (sprint section) |
| arch/decisions-summary.md | > 400 lines | arch/decisions-archive.md |

### How to Archive

1. **Never delete** — Move content, don't remove it
2. **Keep summaries** — Leave a 1–3 line summary in the source file with a link to archive
3. **Update INDEX** — Reflect the new file sizes in the INDEX.md file map
4. **Date the archive entry** — Include the date when archiving for traceability

### Archive Entry Format

In the source file, replace detailed content with:
```
Sprint 3 (October 2024) — COMPLETE
  Total: 42h (Backend 22h + Frontend 20h)
  Key achievements: Authentication, user management, audit trail
  → Full details: progress-archive.md#sprint-3
```

---

## What Gets Updated vs. What Stays Stable

### Always updated on task completion
- Task status (in-progress → complete)
- Actual vs. planned hours
- "Last completed" section in active-context
- "Next steps" in active-context

### Updated at sprint boundaries
- Sprint completion percentage
- Overall progress summary
- Archive of completed tasks

### Updated only when things change
- Tech stack files (new library, changed pattern)
- Architecture files (new ADR, revised pattern)
- INDEX.md (new file added, reading strategy refined)

### Never updated (stable by design)
- projectbrief.md — Captures original intent; changes signal scope change
- productContext.md — Stable product vision; update only for major pivots

---

## Preventing Drift

Memory bank drift occurs when the documented state diverges from actual project state. Signs of drift:

- Active-context.md mentions tasks that were completed 2 sprints ago
- Sprint-tracker.md shows tasks as "in progress" that are already deployed
- Progress.md mentions blockers that were resolved weeks ago
- Tech stack files list libraries that were removed

**Drift prevention practices:**

1. **End-of-sprint review** — Always do a full update at sprint boundaries
2. **Weekly active-context refresh** — Keep the 5-line current state accurate
3. **AI correction instruction** — Tell your AI: "If you notice discrepancies between the memory bank and what we discuss, flag them immediately"
4. **Archive early** — Don't let old content accumulate in active files

---

## Manual Override

Developers can trigger a full memory bank refresh at any time:

Instruction to AI: **"Update memory bank"**

This triggers:
1. AI reviews all active files for accuracy
2. AI compares documented state against conversation history
3. AI updates all files that are out of sync
4. AI reports what was updated and why

Use this after long gaps in development, after a sprint retrospective, or when you suspect drift.

---

See [05-metrics-and-tuning.md](05-metrics-and-tuning.md) for how to measure whether the memory bank is working.
