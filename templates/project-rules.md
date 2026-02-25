# {{PROJECT_NAME}} — Project Rules

> Plain markdown. No frontmatter. Works with any AI tool.
>
> **Cursor**: Referenced from `.cursor/rules/memory-bank-protocol.mdc`
> **Claude Code**: Referenced from `CLAUDE.md`
>
> Static zone (above `=== DYNAMIC CONTENT ===`): cache for the session.
> Dynamic zone (below the marker): read fresh at every task start.

---

## {{Domain 1}} Development Rules

Reference canonical rules: `{{PATH_TO_DOMAIN1_RULES_FILE}}`

Key principles:
- {{PRINCIPLE_1}}
- {{PRINCIPLE_2}}
- {{PRINCIPLE_3}}

File organization:
- {{FILE_ORG_RULE}}
- {{FILE_ORG_RULE}}

Naming conventions:
- {{NAMING_RULE}}
- {{NAMING_RULE}}

Testing requirements:
- Minimum coverage: {{COVERAGE_PCT}}%
- {{TESTING_RULE}}

---

## {{Domain 2}} Development Rules

Reference canonical rules: `{{PATH_TO_DOMAIN2_RULES_FILE}}`

Key principles:
- {{PRINCIPLE_1}}
- {{PRINCIPLE_2}}
- {{PRINCIPLE_3}}

File organization:
- {{FILE_ORG_RULE}}
- {{FILE_ORG_RULE}}

Naming conventions:
- {{NAMING_RULE}}
- {{NAMING_RULE}}

Testing requirements:
- Minimum coverage: {{COVERAGE_PCT}}%
- {{TESTING_RULE}}

---

## Project-Level Rules

### Code Quality
- {{QUALITY_RULE_1}}
- {{QUALITY_RULE_2}}
- {{QUALITY_RULE_3}}

### Security
- {{SECURITY_RULE_1}}
- {{SECURITY_RULE_2}}

### Performance
- {{PERFORMANCE_RULE_1}}
- {{PERFORMANCE_RULE_2}}

### Git Workflow
- Branch from: `{{BASE_BRANCH}}`
- Branch naming: `{{BRANCH_CONVENTION}}`
- Commit format: `{{COMMIT_FORMAT}}`
- Never commit directly to: `{{PROTECTED_BRANCHES}}`

---

## Architectural Constraints

1. {{CONSTRAINT_1}} — {{Why this constraint exists}}
2. {{CONSTRAINT_2}} — {{Why this constraint exists}}
3. {{CONSTRAINT_3}} — {{Why this constraint exists}}

---

## Explicit Prohibitions

- ❌ Commit to `{{PROTECTED_BRANCH}}`
- ❌ Add external dependencies without checking `memory-bank/arch/decisions-summary.md`
- ❌ Skip tests or lower coverage below {{COVERAGE_PCT}}%
- ❌ Modify `memory-bank/core/projectbrief.md`
- ❌ Read all memory bank files — follow the smart reading strategy in INDEX.md
- ❌ {{PROJECT_SPECIFIC_PROHIBITION}}

---

## Canonical Rule References

| Area | Rule File |
|------|-----------|
| Memory Bank Protocol | `.cursor/rules/memory-bank-protocol.mdc` |
| {{Domain 1}} | `{{PATH_TO_DOMAIN1_RULES}}` |
| {{Domain 2}} | `{{PATH_TO_DOMAIN2_RULES}}` |
| Infrastructure | `{{PATH_TO_INFRA_RULES}}` |

---

## Memory Bank File Size Limits

Archive when exceeded:
- `active-context.md`: max 200 lines → `progress-archive.md`
- `sprint-tracker.md`: max 600 lines → `progress-archive.md`
- `progress.md`: max 600 lines → `progress-archive.md`
- `tech/*.md`: max 600 lines → split into sub-domain files
- `arch/patterns-overview.md`: max 350 lines → `patterns-detailed.md`

Manual full update → say: **"update memory bank"**

# ============================================================
# === DYNAMIC CONTENT — Always read fresh, never cache ===
# ============================================================
#
# Everything below is updated automatically after task completion.
# For subsequent tasks in the same session, read ONLY this section (~80 lines).

## Current Sprint Context

Sprint: {{SPRINT_NUMBER}} — {{SPRINT_GOAL}}
Period: {{START_DATE}} → {{END_DATE}}
Status: {{STATUS}}
Completion: {{COMPLETION_PCT}}% ({{COMPLETED_H}}h / {{PLANNED_H}}h)

Focus:
- {{DOMAIN_1}}: {{CURRENT_FOCUS}}
- {{DOMAIN_2}}: {{CURRENT_FOCUS}}

Active blockers:
- {{BLOCKER_OR_NONE}}

## Recent Patterns Catalog

*(AI updates this after discovering new patterns. Keep last 5–10 entries.)*

- [{{DATE}}] {{PATTERN_NAME}}: {{One-line description}}
- [{{DATE}}] {{PATTERN_NAME}}: {{One-line description}}

## Last Memory Bank Update

Date: {{DATE}}
Scope: {{minimal/standard/full}}
Updated: {{FILES_LIST}}
Trigger: {{WHAT_TRIGGERED_UPDATE}}
