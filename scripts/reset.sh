#!/usr/bin/env bash
# Wipe the work area for a fresh take.
#   bash scripts/reset.sh            -> wipe everything in projects/ + Claude session history
#   bash scripts/reset.sh clip-maker -> wipe only projects/clip-maker
# Your Claude Code login is kept.
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
proj="$root/projects"

if [ $# -gt 0 ]; then
  target="$proj/$1"
  [ -e "$target" ] || { echo "No such project: $1"; exit 1; }
  echo "Will delete: $target"
else
  echo "Will delete everything in: $proj"
  echo "and Claude Code session history (login is kept)"
fi
read -r -p "Type yes to continue: " ok
[ "$ok" = "yes" ] || { echo "Cancelled."; exit 0; }

if [ $# -gt 0 ]; then
  rm -rf -- "$target"
else
  find "$proj" -mindepth 1 ! -name .gitkeep -exec rm -rf -- {} +
  rm -rf -- "$HOME/.claude/projects" "$HOME/.claude/todos" "$HOME/.claude/shell-snapshots"
fi
echo "Clean. Ready for the next take."
