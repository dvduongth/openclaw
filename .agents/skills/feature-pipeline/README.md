# Feature Pipeline — Quick Start Guide

## What Is This?

A single-command automated development pipeline combining **speckit** (specification) and **Superpowers** (quality-gated execution). Turns a feature idea into shipped code.

## Installation

✅ **Prerequisites:**
```bash
# These should already be installed in your OpenClaw workspace
- speckit (full pipeline)
- superpowers (all skills: subagent-driven-development, TDD, code-review, etc.)
```

✅ **Skill Location:**
```
C:\Users\admin\.openclaw\workspace\.agents\skills\feature-pipeline\
```

## Quick Example

```bash
# Start full pipeline for a feature
./scripts/start-pipeline.sh "Ultimate System với Extra Roll và Teleport"

# That's it! The pipeline will:
# 1. Create spec via speckit
# 2. Clarify ambiguities with you
# 3. Generate plan and tasks
# 4. Dispatch Superpowers sub-agents
# 5. Execute all tasks with TDD + code review
# 6. Verify and complete
```

## Manual Commands

If you prefer step-by-step control:

```bash
# 1. Start (runs speckit pipeline through verification)
./scripts/start-pipeline.sh "Feature description"

# 2. Monitor progress
cat specs/pipeline-tracking.md

# 3. Verify (run quality checks manually)
./scripts/verify-pipeline.sh specs/current/tasks.md

# 4. Complete (merge, archive, cleanup)
./scripts/complete-pipeline.sh "feature-name"
```

## Tracking

Progress is automatically saved to:
```
specs/pipeline-tracking.md
```

This file shows:
- Current phase and phase timeline
- Task completion status
- Active sub-agents
- Issues & blockers
- Quality metrics

## Integration with Other Skills

| Skill | Used For |
|-------|----------|
| `speckit constitution` | Project principles |
| `speckit specify` | Feature specification |
| `speckit clarify` | Ambiguity resolution |
| `speckit plan` | Technical planning |
| `speckit tasks` | Task breakdown |
| `speckit analyze` | Consistency check |
| `speckit checklist` | Quality gates |
| `subagent-driven-development` | Task execution |
| `test-driven-development` | TDD per task |
| `requesting-code-review` + `receiving-code-review` | Code quality |
| `verification-before-completion` | Final validation |
| `finishing-a-development-branch` | Merge & cleanup |
| `gh-issues` | Create tracking issues |
| `model-strategy` | Model selection for sub-agents |

## Workflow Diagram

```
[User provides feature idea]
         ↓
[start-pipeline.sh]
         ↓
┌─────────────────────────────────────────┐
│  speckit: Constitution → Spec → Plan → Tasks │
└─────────────────────────────────────────┘
         ↓
┌─────────────────────────────────────────┐
│  Superpowers: Parallel Task Execution   │
│  • Fresh sub-agent per task             │
│  • TDD + Code Review + Verification     │
└─────────────────────────────────────────┘
         ↓
[verify-pipeline.sh] → Quality Gates
         ↓
[complete-pipeline.sh] → Merge & Ship
```

## Customization

### Configuration Options

Edit `pipeline.yaml` (when implemented) or modify scripts:

```yaml
pipeline:
  auto_merge: true
  require_review: true
  run_integration_tests: true
  retry_policy:
    max_attempts: 2
  notifications:
    slack: "#dev"
```

### Domain-Specific Quality Gates

Create custom checklist templates in:
```
specs/checklists/
├── mobile-game.md   (cocos2d-x, performance, memory)
├── frontend.md      (React, accessibility, SEO)
├── backend.md       (API, security, scalability)
└── database.md      (queries, indexes, migrations)
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Pipeline stuck in clarification | Answer all questions in spec.md, remove NEEDS CLARIFICATION markers |
| Task failure | Check sub-agent logs; systematic-debugging will auto-retry |
| Constitution violation | Review `specs/constitution.md` and adjust spec/plan |
| Dependency deadlock | Check tasks.md for circular dependencies; reorder |
| Tests failing | Run integration test manually: `./scripts/integration-test.sh` |

## Example Output

```
🚀 Starting Feature Pipeline
═══════════════════════════════════════
Feature: Ultimate System

1️⃣ Checking constitution...
   ✅ Constitution exists

2️⃣ Specifying feature...
   ✅ Spec created: specs/001-ultimate-system/spec.md

3️⃣ Clarifying specification...
   Found 3 NEEDS CLARIFICATION markers
   Iteration 1/2: Asking 3 questions...
   ✅ All clarified

...

9️⃣ Dispatching Superpowers execution...
   🔄 Launching sub-agents in parallel groups...
   ✅ All groups dispatched

╔══════════════════════════════════════╗
║     ✅ PIPELINE STARTED              ║
╠══════════════════════════════════════╣
║ Next: Monitor progress via pipeline ║
╚══════════════════════════════════════╝
```

## Next Steps

1. **Try it out:** Run `./scripts/start-pipeline.sh "Test feature"` on a small feature
2. **Customize:** Add domain-specific checklists
3. **Monitor:** Check `specs/pipeline-tracking.md` regularly
4. **Improve:** Adapt templates to your team's workflow

---

**Ready to automate your entire development pipeline?** 🚀
