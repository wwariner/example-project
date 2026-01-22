#!/usr/bin/env bash
set -euo pipefail
file=.vscode/session-state.md
if [ ! -f "$file" ]; then
  echo "No session file found at $file" >&2
  exit 1
fi
start=$(grep -n '^## Update:' "$file" 2>/dev/null | tail -1 | cut -d: -f1 ; true)
if [ -z "$start" ]; then
  echo "No '## Update:' blocks found in $file" >&2
  exit 1
fi
awk -v s="$start" 'NR>=s{ if(/^## Update:/ && NR!=s) exit; print }' "$file"
