# {{DOMAIN}} Technology Stack — {{PROJECT_NAME}}

> **Cache-friendly file. Read once per session. Update only when tech stack changes.**
> Last Updated: {{DATE}}

---

## Technology Overview

| Category | Technology | Version | Purpose |
|----------|-----------|---------|---------|
| {{Category 1}} | {{Technology}} | {{Version}} | {{Purpose}} |
| {{Category 2}} | {{Technology}} | {{Version}} | {{Purpose}} |
| {{Category 3}} | {{Technology}} | {{Version}} | {{Purpose}} |
| {{Category 4}} | {{Technology}} | {{Version}} | {{Purpose}} |
| {{Category 5}} | {{Technology}} | {{Version}} | {{Purpose}} |

---

## Architecture Approach

**{{Pattern Name}}**: {{One-paragraph description of the architectural approach used in this domain. What pattern is followed, why it was chosen, and what problem it solves.}}

**{{Pattern Name 2}}**: {{Description}}

---

## Project Structure

```
{{domain-root}}/
├── {{layer-1}}/          ← {{purpose}}
│   ├── {{sublayer}}/     ← {{purpose}}
│   └── {{sublayer}}/     ← {{purpose}}
├── {{layer-2}}/          ← {{purpose}}
│   ├── {{sublayer}}/     ← {{purpose}}
│   └── {{sublayer}}/     ← {{purpose}}
└── {{layer-3}}/          ← {{purpose}}
```

---

## Key Patterns in Use

### {{Pattern 1 Name}}
**Purpose**: {{What problem this pattern solves}}
**When used**: {{When to apply this pattern}}
**Key files**: {{Reference to key implementation files, not code itself}}

### {{Pattern 2 Name}}
**Purpose**: {{What problem this pattern solves}}
**When used**: {{When to apply this pattern}}
**Key files**: {{Reference to key implementation files}}

### {{Pattern 3 Name}}
**Purpose**: {{What problem this pattern solves}}
**When used**: {{When to apply this pattern}}

---

## Coding Standards

### Naming Conventions
- **{{Item type}}**: {{Naming convention used}}
- **{{Item type}}**: {{Naming convention used}}
- **{{Item type}}**: {{Naming convention used}}

### File Organization Rules
- {{Rule 1}}
- {{Rule 2}}
- {{Rule 3}}

### Quality Requirements
- **Test Coverage**: Minimum {{COVERAGE_PCT}}% (target {{TARGET_PCT}}%)
- **Linting**: {{Linting tool and rules}}
- **Code Analysis**: {{Static analysis tools}}

---

## Testing Approach

**Strategy**: {{Test pyramid description — unit/integration/e2e ratios}}

| Test Type | Scope | Coverage Target | Tools |
|-----------|-------|-----------------|-------|
| Unit | {{what's unit tested}} | {{%}} | {{tools}} |
| Integration | {{what's integration tested}} | {{%}} | {{tools}} |
| End-to-End | {{what's e2e tested}} | {{%}} | {{tools}} |

---

## API / Interface Design

**{{API type}} design principles**:
- {{Principle 1}}
- {{Principle 2}}
- {{Principle 3}}

**Authentication**: {{Auth approach}}
**Versioning**: {{Versioning strategy}}
**Error format**: {{Error response format description}}

---

## Performance Considerations

- **{{Performance area 1}}**: {{Approach taken}}
- **{{Performance area 2}}**: {{Approach taken}}
- **{{Performance area 3}}**: {{Approach taken}}

---

## Security Standards

- **{{Security concern 1}}**: {{How it's addressed}}
- **{{Security concern 2}}**: {{How it's addressed}}
- **{{Security concern 3}}**: {{How it's addressed}}

---

## Common Anti-Patterns to Avoid

- ❌ {{Anti-pattern 1}} — {{Why to avoid and what to do instead}}
- ❌ {{Anti-pattern 2}} — {{Why to avoid and what to do instead}}
- ❌ {{Anti-pattern 3}} — {{Why to avoid and what to do instead}}

---

## External Dependencies & Integrations

| System | Integration Type | Direction | Notes |
|--------|-----------------|-----------|-------|
| {{System 1}} | {{Type}} | {{Inbound/Outbound/Both}} | {{Notes}} |
| {{System 2}} | {{Type}} | {{Direction}} | {{Notes}} |

---

## Cross-References

- Architecture decisions → [../arch/decisions-summary.md](../arch/decisions-summary.md)
- Architecture patterns → [../arch/patterns-overview.md](../arch/patterns-overview.md)
- Current sprint → [../core/sprint-tracker.md](../core/sprint-tracker.md)
