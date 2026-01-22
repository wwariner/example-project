#!/usr/bin/env bash
set -euo pipefail
# Append a timestamped note to .vscode/session-state.md
mkdir -p .vscode
ts="$(date -u +"%Y-%m-%d %H:%M:%SZ")"
if [ "$#" -gt 0 ]; then
  note="$*"
else
  # read stdin
  note="$(cat -)"
fi
if [ -z "$(echo "$note" | tr -d '[:space:]')" ]; then
  echo "No input provided. Usage: ./scripts/append-session.sh 'your note' or pipe text to the script." >&2
  exit 1
fi
printf "\n## Update: %s\n%s\n" "$ts" "$note" >> .vscode/session-state.md
echo "Appended session note at $ts"
