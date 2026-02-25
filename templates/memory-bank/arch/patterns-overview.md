# Architecture Patterns Overview — {{PROJECT_NAME}}

> **Static file. Cache for entire session. Update only when architecture changes.**
> Last Updated: {{DATE}}

---

## System Architecture

**Architecture style**: {{e.g., Microservices, Monolith, Modular Monolith, Serverless}}
**Core paradigm**: {{e.g., Event-driven, Request-response, CQRS, etc.}}
**Deployment model**: {{e.g., Containerized, Serverless, Hybrid}}

**System overview**:
{{A 3–5 sentence description of the system: what it does, how it's structured at a high level, what the main components are and how they interact.}}

---

## Architecture Diagram (Text)

```
[Client Layer]
  └── {{Client Type}} → {{Protocol}} → [Gateway / BFF]

[Gateway Layer]
  └── {{Gateway}} → {{Auth method}} → [Service Layer]

[Service Layer]
  ├── {{Service 1}} — {{Responsibility}}
  ├── {{Service 2}} — {{Responsibility}}
  └── {{Service 3}} — {{Responsibility}}

[Data Layer]
  ├── {{Storage 1}} — {{What's stored}}
  ├── {{Storage 2}} — {{What's stored}}
  └── {{Storage 3}} — {{What's stored}}

[Infrastructure]
  ├── {{Message bus}} — {{Purpose}}
  └── {{Cache}} — {{Purpose}}
```

---

## Core Design Patterns

### 1. {{Pattern Name}}
**Problem solved**: {{What problem this pattern addresses}}
**How applied**: {{Brief description of how this project uses it}}
**Key benefit**: {{Primary benefit in this context}}

### 2. {{Pattern Name}}
**Problem solved**: {{What problem this pattern addresses}}
**How applied**: {{Brief description}}
**Key benefit**: {{Primary benefit}}

### 3. {{Pattern Name}}
**Problem solved**: {{What problem this pattern addresses}}
**How applied**: {{Brief description}}
**Key benefit**: {{Primary benefit}}

### 4. {{Pattern Name}}
**Problem solved**: {{What problem this pattern addresses}}
**How applied**: {{Brief description}}
**Key benefit**: {{Primary benefit}}

### 5. {{Pattern Name}}
**Problem solved**: {{What problem this pattern addresses}}
**How applied**: {{Brief description}}
**Key benefit**: {{Primary benefit}}

*(Add as many patterns as needed. Keep descriptions to 2–3 lines each.)*

---

## Cross-Cutting Concerns

### Authentication & Authorization
- **Mechanism**: {{Auth mechanism, e.g., JWT, API Key, OAuth}}
- **Multi-tenancy**: {{How tenant isolation is implemented, if applicable}}
- **Role model**: {{How roles/permissions work}}

### Error Handling
- **Strategy**: {{e.g., Result Pattern, Exception-based, Error codes}}
- **Client errors**: {{How 4xx errors are structured and communicated}}
- **Server errors**: {{How 5xx errors are handled and logged}}
- **Validation**: {{Where and how input validation happens}}

### Logging & Observability
- **Log format**: {{Structured/unstructured, format details}}
- **Log levels**: {{What gets logged at each level}}
- **Tracing**: {{How requests are traced across services}}
- **Metrics**: {{What metrics are collected and how}}

### Data Consistency
- **Strategy**: {{Eventually consistent, strongly consistent, saga pattern, etc.}}
- **Transaction scope**: {{What fits in a single transaction vs. requires compensating actions}}
- **Conflict resolution**: {{How conflicts are resolved}}

### Security
- **Data in transit**: {{Encryption approach}}
- **Data at rest**: {{Storage encryption}}
- **Secrets management**: {{How secrets/credentials are managed}}
- **Vulnerability scanning**: {{Tools and frequency}}

---

## Architectural Constraints & Non-Goals

**Hard constraints** (must always be respected):
- {{Constraint 1}} — {{Why this is a hard constraint}}
- {{Constraint 2}} — {{Why this is a hard constraint}}

**Non-goals** (explicitly out of scope):
- {{Non-goal 1}} — {{Brief rationale}}
- {{Non-goal 2}} — {{Brief rationale}}

---

## Scalability Approach

| Concern | Current Approach | Future Consideration |
|---------|-----------------|---------------------|
| {{Horizontal scaling}} | {{Current approach}} | {{If/when to change}} |
| {{Data scaling}} | {{Current approach}} | {{If/when to change}} |
| {{Traffic spikes}} | {{Current approach}} | {{If/when to change}} |

---

## Known Trade-offs

| Decision | Benefit | Cost |
|----------|---------|------|
| {{Architectural choice 1}} | {{What you gain}} | {{What you give up}} |
| {{Architectural choice 2}} | {{What you gain}} | {{What you give up}} |
| {{Architectural choice 3}} | {{What you gain}} | {{What you give up}} |

---

## Architecture Decision Record Summary

| ADR | Title | Status | Date |
|-----|-------|--------|------|
| ADR-001 | {{Title}} | Active | {{Date}} |
| ADR-002 | {{Title}} | Active | {{Date}} |
| ADR-003 | {{Title}} | Superseded | {{Date}} |

→ Full ADR details: [decisions-summary.md](decisions-summary.md)

---

## Cross-References

*(These files are created by the `/create-memory-bank` skill or manually as the project grows)*

- Detailed patterns → [patterns-detailed.md](patterns-detailed.md) *(read for deep dives only)*
- ADR history → [decisions-summary.md](decisions-summary.md)
- Tech implementation → [../tech/](../tech/)
- Current sprint → [../core/sprint-tracker.md](../core/sprint-tracker.md)
