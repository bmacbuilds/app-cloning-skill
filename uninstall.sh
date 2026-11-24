#!/usr/bin/env bash
# Removes App Cloning: only the skill folders our installer marked as ours. The apps you built are never touched.
set -euo pipefail
MARKER=".appcloning-install"
removed=0
for name in appcloning bmac-appcloning; do
  dir="$HOME/.claude/skills/$name"
  [ -e "$dir" ] || continue
  if [ -f "$dir/$MARKER" ]; then
    rm -rf "$dir"; removed=1
    printf 'Removed /%s (%s).\n' "$name" "$dir"
  else
    printf 'Left %s alone: it is not an App Cloning installation.\n' "$dir"
  fi
done
[ "$removed" = 1 ] || printf 'App Cloning was not installed.\n'
