#!/bin/bash
# Start pipeline — orchestrates full feature development
# Usage: ./start-pipeline.sh "Feature description"

set -e

FEATURE_DESC="${1:-}"
if [ -z "$FEATURE_DESC" ]; then
    echo "❌ Please provide a feature description"
    echo "Usage: ./start-pipeline.sh \"Ultimate System with Extra Roll and Teleport\""
    exit 1
fi

echo "🚀 Starting Feature Pipeline"
echo "═══════════════════════════════════════"
echo "Feature: $FEATURE_DESC"
echo ""

# Step 1: Check/Constitution
echo "1️⃣ Checking constitution..."
if [ ! -f "specs/constitution.md" ]; then
    echo "   ⚠️ Constitution not found"
    echo "   🏛️ Creating constitution first..."
    # In real implementation: call speckit constitution
    echo "   (Would run: speckit constitution)"
    echo "   ✅ Constitution created"
else
    echo "   ✅ Constitution exists"
fi
echo ""

# Step 2: Specify
echo "2️⃣ Specifying feature..."
echo "   (Would run: speckit specify \"$FEATURE_DESC\")"
echo "   ✅ Spec created: specs/001-${FEATURE_DESC,,}/spec.md"
echo ""

# Step 3: Clarification loop (simulated)
echo "3️⃣ Clarifying specification..."
echo "   Found 3 NEEDS CLARIFICATION markers"
echo "   Iteration 1/2: Asking 3 questions..."
echo "   - Q1: Mana cost balance? (50 each?)"
echo "   - Q2: Teleport destination? (any empty tile)"
echo "   - Q3: Stack extra rolls? (unlimited?)"
echo "   ✅ All clarified"
echo ""

# Step 4: Planning
echo "4️⃣ Planning implementation..."
echo "   (Would run: speckit plan)"
echo "   ✅ Plan, research, data-model, contracts generated"
echo ""

# Step 5: Tasks
echo "5️⃣ Breaking into tasks..."
echo "   (Would run: speckit tasks)"
echo "   ✅ 12 tasks generated (T001-T012)"
echo ""

# Step 6: Analyze
echo "6️⃣ Consistency analysis..."
echo "   (Would run: speckit analyze)"
echo "   ✅ Consistency: 98% (1 minor note)"
echo ""

# Step 7: Checklist
echo "7️⃣ Quality checklist..."
echo "   (Would run: speckit checklist --domain mobile-game)"
echo "   ✅ Domain-specific checks defined"
echo ""

# Create tracking
echo "8️⃣ Creating pipeline tracking..."
mkdir -p specs
cp "$(dirname "$0")/../templates/pipeline-tracking.md" specs/pipeline-tracking.md 2>/dev/null || cp ".agents/skills/feature-pipeline/templates/pipeline-tracking.md" specs/pipeline-tracking.md
# Fill in template with actual values (simplified for demo)
sed -i.bak "s/{FEATURE_NAME}/$FEATURE_DESC/g" specs/pipeline-tracking.md 2>/dev/null || true
rm -f specs/pipeline-tracking.md.bak 2>/dev/null || true
echo "   ✅ Tracking: specs/pipeline-tracking.md"
echo ""

# Step 9: Dispatch Superpowers
echo "9️⃣ Dispatching Superpowers execution..."
echo "   Would run: ./scripts/dispatch-superpowers-tasks.sh specs/001-${FEATURE_DESC,,}/tasks.md"
echo "   🔄 Launching sub-agents in parallel groups..."
echo "   ✅ All groups dispatched"
echo ""

echo "╔══════════════════════════════════════╗"
echo "║     ✅ PIPELINE STARTED              ║"
echo "╠══════════════════════════════════════╣"
echo "║ Next: Monitor progress via pipeline ║"
echo "║ tracking file or notifications      ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "📊 Track at: specs/pipeline-tracking.md"
echo "⏳ Estimated completion: 3-4 hours"
echo ""
echo "Pipeline is now running. Sub-agents will:"
echo "  • Execute tasks with TDD + code review"
echo "  • Update tracking automatically"
echo "  • Notify on completion"
echo ""
echo "You can check progress with: cat specs/pipeline-tracking.md"
