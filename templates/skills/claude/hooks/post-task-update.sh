#!/bin/sh
# ===========================================
# post-task-update.sh — COMB Memory Bank Hook
# ===========================================
# Runs after every Bash tool call in Claude Code.
# Detects git commits and suggests memory bank update.
#
# Install:
#   1. Copy to .claude/hooks/post-task-update.sh
#   2. chmod +x .claude/hooks/post-task-update.sh
#   3. Merge settings.json into .claude/settings.json

INPUT=$(cat)

# Extract the command that was executed
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)

# Only trigger on git commit commands
case "$COMMAND" in
  *"git commit"*)
    # Skip trivial commits (docs, chore, style, ci)
    case "$COMMAND" in
      *"docs:"*|*"chore:"*|*"style:"*|*"ci:"*)
        exit 0
        ;;
    esac
    # Suggest memory bank update for meaningful commits
    echo "Git commit detected. Consider running /update-memory-bank to keep the memory bank in sync." >&2
    ;;
esac

exit 0
