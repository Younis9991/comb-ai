# Sprint {{SPRINT_NUMBER}} Tracker — {{PROJECT_NAME}}

> **Dynamic file. Read fresh every session. Update after every task completion.**
> Last Updated: {{DATE}}

---

## Sprint Overview

| Field | Value |
|-------|-------|
| **Sprint Goal** | {{SPRINT_GOAL}} |
| **Period** | {{START_DATE}} → {{END_DATE}} |
| **Status** | {{STATUS_EMOJI}} {{STATUS}} |
| **Completion** | {{COMPLETION_PCT}}% ({{COMPLETED_HOURS}}h / {{PLANNED_HOURS}}h planned) |

---

## Sprint Tracks

*(Create one section per parallel workstream. Common: Backend, Frontend, Infrastructure, QA)*

### {{Track 1 Name}} Track
**Assigned to**: {{TEAM_MEMBER_OR_ROLE}}
**Planned**: {{HOURS}}h | **Completed**: {{HOURS}}h | **Completion**: {{PCT}}%

| Task ID | Description | Status | Planned | Actual | Notes |
|---------|-------------|--------|---------|--------|-------|
| {{ID}} | {{Task description}} | ✅ Done | {{h}} | {{h}} | {{notes}} |
| {{ID}} | {{Task description}} | 🔄 In Progress | {{h}} | {{h}} | {{notes}} |
| {{ID}} | {{Task description}} | ⏳ Pending | {{h}} | — | {{notes}} |
| {{ID}} | {{Task description}} | ❌ Blocked | {{h}} | — | {{blocker}} |

### {{Track 2 Name}} Track
**Assigned to**: {{TEAM_MEMBER_OR_ROLE}}
**Planned**: {{HOURS}}h | **Completed**: {{HOURS}}h | **Completion**: {{PCT}}%

| Task ID | Description | Status | Planned | Actual | Notes |
|---------|-------------|--------|---------|--------|-------|
| {{ID}} | {{Task description}} | ✅ Done | {{h}} | {{h}} | {{notes}} |
| {{ID}} | {{Task description}} | ⏳ Pending | {{h}} | — | {{notes}} |

---

## Status Legend

| Symbol | Meaning |
|--------|---------|
| ✅ | Completed |
| 🔄 | In Progress |
| ⏳ | Pending (not started) |
| ❌ | Blocked |
| ⏭️ | Moved to next sprint |
| 🔀 | Moved from previous sprint |

---

## Sprint Metrics

| Metric | Value | Notes |
|--------|-------|-------|
| Total tasks | {{N}} | |
| Completed | {{N}} ({{PCT}}%) | |
| In progress | {{N}} | |
| Blocked | {{N}} | |
| Scope changes | {{N}} added / {{N}} removed | |
| Hours: planned | {{H}}h | |
| Hours: completed | {{H}}h | |
| Hours: remaining | {{H}}h | |

---

## Blockers & Dependencies

| # | Blocker | Affects | Owner | Since | Resolution |
|---|---------|---------|-------|-------|-----------|
| 1 | {{Blocker description}} | {{Task IDs affected}} | {{Owner}} | {{Date}} | {{Status}} |

*(Empty = no blockers)*

---

## Scope Changes This Sprint

| Change | Reason | Impact |
|--------|--------|--------|
| Added: {{Task}} | {{Reason}} | +{{H}}h planned |
| Moved to next sprint: {{Task}} | {{Reason}} | −{{H}}h |

---

## Sprint Retrospective Notes

*(Fill in at sprint end)*

**What went well**:
- {{Point 1}}
- {{Point 2}}

**What to improve**:
- {{Point 1}}
- {{Point 2}}

**Actions for next sprint**:
- {{Action 1}} — Owner: {{owner}}
- {{Action 2}} — Owner: {{owner}}

---

## Sprint Goals & Acceptance Criteria

| Goal | Acceptance Criteria | Status |
|------|--------------------|---------|
| {{Goal 1}} | {{Measurable criteria}} | {{Status}} |
| {{Goal 2}} | {{Measurable criteria}} | {{Status}} |

---

## Archive Notes

*(At sprint close, move completed task details to progress-archive.md and replace with summary)*

```
Sprint {{SPRINT_NUMBER}} Summary ({{DATE}})
  Completed: {{N}} tasks, {{H}}h total
  Key achievements: {{brief list}}
  Carried to next sprint: {{if any}}
  → Full details: core/progress-archive.md#sprint-{{SPRINT_NUMBER}}
```

---

## Cross-References

*(These files are created by the `/create-memory-bank` skill or manually as the project grows)*

- Current focus → [active-context.md](active-context.md)
- Overall progress → [progress.md](progress.md)
- Future sprints → [sprint-plan.md](sprint-plan.md)
- Backlog → [backlog.md](backlog.md)
