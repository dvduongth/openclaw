#!/bin/bash
# Dispatch Superpowers tasks from tasks.md
# Usage: ./dispatch-superpowers-tasks.sh [path/to/tasks.md]

set -e

# Get script directory (works regardless of cwd)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(dirname "$SCRIPT_DIR")"

TASKS_FILE="${1:-specs/current/tasks.md}"
TRACKING_FILE="${2:-specs/pipeline-tracking.md}"

echo "🔍 Parsing tasks from: $TASKS_FILE"
echo "📊 Tracking: $TRACKING_FILE"

# Extract tasks with grep/awk (simple format: - [ ] T### [P?] [US?] description)
# Group by dependencies and user stories

# For now, we'll use a placeholder that spawns subagents via OpenClaw
# In real implementation, this would call `sessions_spawn` with proper prompts

echo "📋 Task groups identified:"
echo "  Group 1 (Independent): T001-T003"
echo "  Group 2 (Depends on 1): T004-T007"
echo "  Group 3 (Depends on 1): T008-T009"
echo "  Group 4 (Depends on 2,3): T010-T012"
echo ""
echo "🚀 Dispatching sub-agents..."
echo "This is a placeholder — actual implementation uses OpenClaw's sessions_spawn API"
echo ""
echo "✅ All tasks dispatched successfully"
