# Metrics and Tuning

## Why Measure?

Intuition says "reading less is better," but quantifying the improvement helps you:

1. Justify the effort of setting up COMB to stakeholders
2. Know when the system is working and when it's drifting
3. Identify which files are oversized or underused
4. Make data-driven decisions about file structure changes

---

## Core Metrics

### 1. Lines Read Per Session

**What it measures**: Total lines of memory bank content loaded for an average task session.

**How to measure**: Track the sum of line counts across all files read in a session. The INDEX.md file map shows current line counts for each file.

**Target**: Under 1,200 lines for typical daily work sessions.

**Baseline for comparison**:
- Unoptimized (all files): ~6,000–10,000 lines
- Well-tuned COMB: ~800–1,200 lines
- Excellent COMB: Under 800 lines

| Status | Lines Read | Assessment |
|--------|-----------|-----------|
| Excellent | < 800 | COMB highly optimized |
| Good | 800–1,200 | COMB working well |
| Acceptable | 1,200–2,000 | Room for improvement |
| Needs tuning | 2,000–4,000 | Files too large or too many files read |
| Broken | > 4,000 | Strategy not being followed |

---

### 2. Token Reduction Rate

**What it measures**: Percentage reduction in tokens consumed vs. a naive "read everything" baseline.

**How to calculate**:
```
Reduction % = (1 - (tokens_read / total_tokens_available)) × 100
```

Where `total_tokens_available` = sum of all memory bank file sizes in tokens.

**Target**: 75–90% reduction.

**Real-world example**:
- All files: ~7,000 lines → ~93,000 tokens
- Daily read: ~1,042 lines → ~15,600 tokens
- Reduction: **83%** (93,000 → 15,600)

---

### 3. Cache Hit Rate

**What it measures**: Percentage of token reads that are served from LLM cache rather than computed fresh.

**How to estimate**: Static files (tech/, arch/) that haven't changed = cache hits. Dynamic files (active-context, sprint-tracker) = cache misses.

**Calculation**:
```
Cache Hit Rate = (static_tokens_read / total_tokens_read) × 100
```

**Target**: 60–80% cache hit rate for daily work sessions.

**Cost impact**: Cache hits on Claude cost ~10x less than uncached tokens. At 70% cache hit rate, effective cost per session drops by ~60%.

---

### 4. File Size Health

Track file sizes over time to catch growth before it becomes a problem.

**Monthly file size audit**:

```
File                    | Target  | Current | Status
------------------------|---------|---------|--------
INDEX.md                | 200-400 | _       |
active-context.md       | 80-150  | _       |
sprint-tracker.md       | 200-400 | _       |
progress.md             | 200-400 | _       |
tech/backend-stack.md   | 200-400 | _       |
tech/frontend-stack.md  | 200-400 | _       |
arch/patterns-overview  | 150-250 | _       |
```

Files in the "warning" zone (50% over target) should be archived at the next sprint boundary.
Files in the "critical" zone (2x target) should be archived immediately.

---

### 5. Context Fidelity Score

**What it measures**: How accurately the memory bank reflects actual project state.

**How to assess** (qualitative, monthly review):

Rate each area 1–5:

| Area | Score (1-5) | Notes |
|------|------------|-------|
| Active sprint tasks accurate? | | |
| Current blockers current? | | |
| Tech stack reflects reality? | | |
| Architecture decisions current? | | |
| Progress metrics accurate? | | |

**Average score interpretation**:
- 4.5–5.0: Excellent fidelity, low drift
- 3.5–4.4: Good, minor updates needed
- 2.5–3.4: Moderate drift, schedule full update
- Under 2.5: Significant drift, immediate full update required

---

## Tuning Levers

### If Lines Read Per Session Is Too High

**Cause A: Files are too large**
- Run a file size audit
- Archive content that's older than the current sprint
- Split large tech files into sub-domain files

**Cause B: AI is reading too many files**
- Review and tighten the INDEX.md decision tree
- Make the skip list more explicit
- Add task-type examples to the INDEX

**Cause C: INDEX.md itself is too large**
- Move detailed strategy to docs and keep only the routing table in INDEX
- Target INDEX at under 350 lines

---

### If Cache Hit Rate Is Low

**Cause A: Dynamic files read before static files**
- Enforce the cache-aware reading order in your AI instructions
- Put the reading order prominently in INDEX.md

**Cause B: Static files are changing too frequently**
- Review what's causing tech/*.md files to change often
- If patterns are evolving rapidly, temporarily treat tech files as dynamic

**Cause C: AI instructions don't mention caching**
- Add explicit cache instructions to `.cursorrules` or `CLAUDE.md`

---

### If Context Fidelity Is Low

**Cause A: Updates not happening**
- Review whether the auto-update triggers are well-defined
- Add "update memory bank" as a mandatory step in sprint close-out checklist

**Cause B: Updates happening but incomplete**
- Review the update priority order — are lower-priority files being skipped?
- Schedule a monthly manual review

**Cause C: Project moving faster than updates**
- Reduce update scope — focus only on active-context.md daily, others weekly
- Create a minimal "daily sync" update that's faster to complete

---

## Tuning Checklist

Run this checklist monthly:

**File sizes**
- [ ] All files within target size ranges
- [ ] No file at 2x target size
- [ ] Archive triggered if any file at 1.5x target

**Reading strategy**
- [ ] INDEX.md decision tree covers all task types the team does
- [ ] Skip list includes all reference-only files
- [ ] Static files listed before dynamic files in reading order

**Update protocol**
- [ ] Updates happening at sprint boundaries (full scope)
- [ ] Active-context.md updated at minimum weekly
- [ ] Sprint-tracker accurate within 1–2 days of reality

**Content quality**
- [ ] No duplicate information across files
- [ ] No code blocks (only references to file paths)
- [ ] No historical content in active files
- [ ] All cross-references valid (no broken links)

**Performance**
- [ ] Lines per session: under 1,200 for daily work
- [ ] Estimated token reduction: over 75%
- [ ] Cache hit rate: over 60%

---

## Improvement Roadmap

### Quick wins (1–2 hours)
1. Add explicit skip list to INDEX.md
2. Archive any completed sprint content still in active files
3. Enforce cache-aware reading order in AI instructions

### Medium effort (half day)
1. Split oversize tech files into sub-domain files
2. Create a file size tracking table in INDEX.md
3. Add task-type examples to the decision tree

### Longer-term improvements (ongoing)
1. Monthly file size audit as part of sprint retrospective
2. AI instruction refinement based on session quality feedback
3. Per-developer reading strategy tuning as team grows

---

## Reporting Template

Use this for quarterly memory bank health reports:

```
COMB Health Report — [Quarter Year]

File Size Health
  Oversized files: X / Y total files
  Files requiring archiving: [list]

Performance Metrics
  Avg. lines read per session: X (target: <1,200)
  Estimated token reduction: X% (target: >75%)
  Estimated cache hit rate: X% (target: >60%)

Context Fidelity
  Score: X / 5.0
  Known drift areas: [list]

Actions This Quarter
  Archived: [files archived]
  Split: [files split]
  Updated: [files updated]
  Created: [new files]

Actions Next Quarter
  [planned improvements]
```

---

See [templates/](../templates/) for ready-to-use file templates to implement COMB in your project.
