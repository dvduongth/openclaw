# Feature Pipeline — Integrated Development Orchestration

## Overview

Automates the complete feature development workflow combining **speckit** (Spec-Driven Development) and **Superpowers** (quality-gated execution). Transforms a feature idea into shipped code with zero manual intervention.

**Workflow:** `idea → constitution → spec → clarify → plan → tasks → dispatch → implement → verify → complete`

**Key Innovation:**
- **Single command** triggers full pipeline
- **Automatic handoffs** between speckit and Superpowers phases
- **Progress tracking** across all stages
- **Quality enforcement** at every gate
- **Parallel execution** where appropriate

---

## When to Use

Use this skill when you need to:
- Develop a new feature from idea to production
- Ensure alignment with project constitution
- Automate the entire development pipeline
- Maintain consistency between specs and implementation
- Enforce TDD, code review, and verification automatically

**Triggers:**
- "Develop feature X from start to finish"
- "Automate the development pipeline for Y"
- "Run full integrated workflow for Z"
- "Feature pipeline: [feature description]"

---

## Prerequisites

✅ **Must have installed:**
- `speckit` (full pipeline)
- `superpowers` (all skills)
- `using-superpowers` (workflow orchestrator)

✅ **Project setup:**
- `specs/constitution.md` exists (or will be created)
- Git repository initialized
- OpenClaw agent with all skills loaded

---

## Core Commands

### 1. `start-pipeline` — Kickoff Full Feature Development

**Purpose:** Start automated pipeline from feature idea.

**Input:** Feature description (1-2 sentences)

**Example:**
```
User: "Em hãy phát triển Ultimate System cho CCN2"
→ Feature: "Ultimate System cho player (Extra Roll + Teleport)"
```

**Steps:**
1. Check constitution exists → if not, call `speckit constitution` first
2. Call `speckit specify` → generate spec.md
3. Auto-detect NEEDS CLARIFICATION → loop `speckit clarify` until clear
4. Call `speckit plan` → generate plan.md, research.md, data-model.md
5. Call `speckit tasks` → generate tasks.md with T### numbering
6. Call `speckit analyze` → validate consistency
7. Call `speckit checklist` → domain-specific quality gates
8. Create pipeline tracking file: `specs/pipeline-tracking.md`
9. Call `dispatch-superpowers` → execute all tasks with quality gates
10. Call `verify-pipeline` → final validation
11. Call `complete-pipeline` → merge, document, cleanup

**Output:**
- Complete feature implementation
- All specs updated
- Tests passing
- Documentation updated
- GitHub issues created (optional)

---

### 2. `dispatch-superpowers` — Execute Tasks with Superpowers

**Purpose:** Read tasks.md and dispatch sub-agents for each task with proper quality gates.

**Input:** Path to tasks.md (default: current feature folder)

**Process:**
1. Parse tasks.md for unmarked tasks `[ ]`
2. Group tasks by:
   - **User story** (US###) — execute story sequentially
   - **Dependencies** (prerequisites) — topological sort
   - **Priority** (P1/P2/P3)
3. For each independent task group:
   - Spawn fresh sub-agent via `subagent-driven-development`
   - Inject context: spec.md, plan.md, tasks.md, constitution.md
   - Set model via `model-strategy` (haiku for simple, sonnet for complex)
   - Enforce TDD, code review, verification
4. Monitor progress → update pipeline-tracking.md
5. Mark tasks DONE as they complete
6. Handle failures: retry with `systematic-debugging` (max 2 retries)

**Parallelization:**
- Tasks with no dependencies → dispatch simultaneously
- Tasks with dependencies → wait for prerequisite completion
- Use `dispatching-parallel-agents` for orchestration

---

### 3. `verify-pipeline` — Multi-Layer Validation

**Purpose:** Comprehensive validation before completion.

**Checks:**
1. **All tasks DONE?** Check tasks.md has no `[ ]`
2. **Tests passing?** Run test suite (via sub-agent)
3. **Constitution compliance?** Validate against all principles
4. **Spec coverage?** Ensure all acceptance criteria have implementation
5. **Code quality?** Lint, type check, no warnings
6. **Performance?** Benchmarks meet spec requirements (if any)
7. **Security scan?** No secrets, no vulnerabilities
8. **Documentation?** API docs, GDD updated (if needed)

**If any check fails:** 
- Create GitHub issue (or add to tracking)
- Requeue failed tasks for rework
- Notify user with failure summary

---

### 4. `complete-pipeline` — Finalize & Ship

**Purpose:** Wrap up completed feature.

**Actions:**
1. Merge feature branch → main (via `finishing-a-development-branch`)
2. Archive spec: `specs/NNN-feature/` → `docs/implemented/NNN-feature/`
3. Update project documentation:
   - GDD (if game feature)
   - API documentation (generate from contracts/)
   - README (if user-facing)
4. Create GitHub release notes (via `gh-issues` skill)
5. Cleanup:
   - Delete feature branch (with git worktree cleanup)
   - Remove temporary tracking files (optional)
6. Generate completion report:
   ```markdown
   # Feature Complete: [Feature Name]
   - Total tasks: N
   - Time: X hours
   - Test coverage: Y%
   - Quality score: Z/10
   - Issues found & fixed: M
   ```

---

## Tracking & Monitoring

### Pipeline Tracking File

`specs/pipeline-tracking.md` (auto-generated):

```markdown
# Pipeline Tracking: 001-ultimate-system

## Status
- **Current phase:** Implementation
- **Started:** 2026-03-14 23:30
- **Estimated completion:** 2026-03-15 02:00 (2.5 hours)

## Phase Breakdown
| Phase | Status | Tasks | Completed | Time |
|-------|--------|-------|-----------|------|
| Specification | ✅ | 3 | 3 | 30m |
| Clarification | ✅ | 2 iterations | - | 20m |
| Planning | ✅ | 4 artifacts | 4 | 40m |
| Task breakdown | ✅ | 12 tasks | 12 | 20m |
| Consistency check | ✅ | 1 | 1 | 10m |
| Quality checklist | ✅ | 1 | 1 | 10m |
| Implementation | 🔄 | 12 | 4/12 | 1h20m |
| Integration | ⬜ | 3 | 0 | - |
| Verification | ⬜ | 5 checks | 0 | - |
| Completion | ⬜ | - | - | - |

## Active Sub-Agents
- Agent @abc123: T001-T003 (Data Model) — running
- Agent @def456: T004-T007 (Game Logic) — queued

## Issues & Blockers
- None currently

## Quality Metrics
- Constitution compliance: Pending
- Test coverage target: ≥80%
- Code review: Pending (0/12 tasks reviewed)
```

---

## Example Usage

### User Request:
```
"Phát triển feature Ultimate System cho CCN2 với 2 types: Extra Roll và Teleport"
```

### Pipeline Execution (automated):

```bash
# Step 1: Start pipeline (user triggers)
> feature-pipeline start-pipeline "Ultimate System với 2 types: Extra Roll và Teleport"

[✓] Constitution exists: specs/constitution.md
[✓] Specifying feature...
[✓] Created: specs/001-ultimate-system/spec.md
[!] Found 3 NEEDS CLARIFICATION markers
[?] Q1: "Mana cost balance — 50 mana mỗi ultimate?"
[A:] Yes, 50 mana each
[?] Q2: "Teleport destination — any tile or only empty?"
[A:] Any empty tile
[?] Q3: "Stack extra rolls — unlimited?"
[A:] Yes, unlimited stacking
[✓] Clarification complete (2 iterations)
[✓] Plan generated: specs/001-ultimate-system/plan.md
[✓] Tasks generated: 12 tasks (T001-T012)
[✓] Consistency check: 98% alignment
[✓] Quality checklist: mobile-game domain

📊 Pipeline Tracking: specs/pipeline-tracking.md created

# Step 2: Dispatch Superpowers (automatically triggered)
[✓] Grouped tasks by dependencies:
  Group 1 (Independent): T001-T003 (Data Model)
  Group 2 (Depends on 1): T004-T007 (Game Logic)
  Group 3 (Depends on 1): T008-T009 (UI Components)
  Group 4 (Depends on 2,3): T010-T012 (Tests & Integration)

[🚀] Dispatching 4 sub-agents in parallel groups:
  → Group 1: spawning sub-agent (model: sonnet-4-6)
  → Group 2: queued (waiting for Group 1)
  → Group 3: queued (waiting for Group 1)
  → Group 4: queued (waiting for 2,3)

[⏳] Monitoring progress...
```

```bash
# Real-time updates (via notifications):

[✅] Group 1 COMPLETE (45 min)
  • T001: UltimateType enum — DONE
  • T002: PlayerState.ultimateState — DONE
  • T003: canUseUltimate() helper — DONE

[🚀] Group 2 & 3 dispatched (parallel)

[✅] Group 2 COMPLETE (1h20m)
[✅] Group 3 COMPLETE (1h10m)

[🚀] Group 4 dispatched (integration tests)

[✅] Group 4 COMPLETE (50m)

[🔍] Verifying pipeline...
[✓] All 12 tasks DONE
[✓] Tests passing (42/42)
[✓] Constitution compliance: 100%
[✓] Spec coverage: 100% (12/12 criteria)
[✓] Code quality: 0 errors, 0 warnings
[✓] Performance: 60 FPS maintained
[✓] Security scan: PASS

[📦] Completing pipeline...
[✓] Merged feature branch → main
[✓] Archived specs → docs/implemented/001-ultimate-system/
[✓] Updated GDD with ultimate mechanics
[✓] Generated API documentation
[✓] Created GitHub release notes
[✓] Cleanup: branch deleted, worktree removed

╔══════════════════════════════════════╗
║     ✅ PIPELINE COMPLETE!            ║
╠══════════════════════════════════════╣
║ Feature: Ultimate System             ║
║ Total time: 3h 45m                  ║
║ Tasks: 12/12 ✅                      ║
║ Test coverage: 94%                   ║
║ Quality score: 9.2/10                ║
║ Issues fixed: 5                      ║
║ Branch: merged                       ║
╚══════════════════════════════════════╝
```

---

## Error Handling & Retries

### Failure Scenarios:

1. **Task fails (sub-agent error)**
   - Auto-retry with `systematic-debugging` skill
   - Max 2 retries per task
   - If still failing → mark BLOCKED, notify user

2. **Specification ambiguity discovered mid-implementation**
   - Pause pipeline
   - Create clarification question batch
   - Resume after user response

3. **Constitution violation detected**
   - Immediate stop
   - Report violation details
   - Require manual review before proceeding

4. **Dependency deadlock**
   - Detect circular dependencies
   - Break deadlock with user input
   - Reorder tasks

---

## Configuration

### Pipeline Options (via config file or command flags):

```yaml
pipeline:
  auto_merge: true            # Auto-merge on success
  require_review: true        # Require code review before merge
  run_integration_tests: true # Run full integration suite
  benchmark_targets:          # Performance targets
    fps_min: 60
    build_time_max: 300s
  notifications:
    slack: "#dev-pipeline"
    telegram: true
  retry_policy:
    max_attempts: 2
    backoff_factor: 2
```

---

## Benefits

✅ **One-command development** — No manual switching between tools  
✅ **Consistent quality** — All Superpowers gates enforced  
✅ **Traceability** — Every code change links to spec & task  
✅ **Parallel efficiency** — Independent tasks run concurrently  
✅ **Constitution-bound** — All decisions align with project principles  
✅ **Automated verification** — No manual testing checklists  
✅ **Progress tracking** — Real-time visibility into pipeline status  

---

## Implementation Notes

**Storage:**
- Pipeline specs: `specs/` (git-ignored, as per speckit)
- Tracking: `specs/pipeline-tracking.md` (git-ignored)
- Artifacts: `docs/implemented/` (git-tracked for audit)

**Dependencies:**
- Requires all Superpowers skills loaded
- Requires speckit full pipeline
- Uses `subagents` tool for parallel execution
- Uses `sessions_spawn` for isolated execution

**Model Strategy:**
- Speckit phases (specify, plan, analyze): `sonnet-4-6` (Deep Analysis)
- Clarification: `haiku-4-5` (fast Q&A)
- Implementation tasks: per task complexity (from tasks.md metadata)
- Verification: `sonnet-4-6` (comprehensive check)

---

## Future Enhancements

- [ ] **Pipeline visualization** (Mermaid diagrams in tracking file)
- [ ] **Webhook notifications** (Slack, Discord)
- [ ] **Resume from failure** (checkpoint system)
- [ ] **A/B test configurations** (compare implementation approaches)
- [ ] **Predictive time estimates** (ML from past tasks)
- [ ] **Resource optimization** (smart parallelization based on agent load)

---

**Ready to transform feature development into a single, automated, quality-gated pipeline!**
