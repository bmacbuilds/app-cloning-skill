#!/usr/bin/env bash
# Removes App Cloning: only the skill folders our installer marked as ours. The apps you built are never touched.
set -euo pipefail
MARKER=".appcloning-install"
STAGES="recon architect design build backend test diff entrepreneur brand launch deploy"
removed=0
for base in appcloning bmac-appcloning; do
  for name in "$base" $(for s in $STAGES; do printf '%s-%s ' "$base" "$s"; done); do
    dir="$HOME/.claude/skills/$name"
    [ -e "$dir" ] || continue
    if [ -f "$dir/$MARKER" ]; then
      rm -rf "$dir"; removed=$((removed + 1))
    else
      printf 'Left %s alone: it is not an App Cloning installation.\n' "$dir"
    fi
  done
done
if [ "$removed" -gt 0 ]; then printf 'Removed App Cloning (%s skill folders).\n' "$removed"; else printf 'App Cloning was not installed.\n'; fi
