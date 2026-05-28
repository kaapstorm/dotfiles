#!/usr/bin/env bash
# extract_prompt.sh — print the last unanswered user prompt, else nothing.
#
# Conversation format (single-stream transcript):
#   ● <claude response>      (Claude's turns;  '● ' at line start)
#   / <user prompt>          (user's turns;    '/ ' at line start)
#   followed by a blank line and '///' to commit the prompt.
#
# A prompt is "ready" iff the file ends with the commit sentinel
# (blank line + '///') AND the last marker line is the user's ('/ '),
# not Claude's ('● ') — the marker check prevents re-answering a Claude
# response that happens to end in a line of three slashes (e.g. a Rust
# doc-comment in a code block).
set -euo pipefail
f="${1:?usage: extract_prompt.sh <conversation.md>}"

# 1. Committed? Last line is '///', preceded by a blank line.
mapfile -t t < <(tail -n 2 "$f")
[[ "${t[1]:-}" == "///" && -z "${t[0]:-}" ]] || exit 0

# 2. Whose turn? The last marker must be the user's ('/ '), not Claude's.
last=$(grep -nE '^(/ |● )' "$f" | tail -n 1) || exit 0
content=${last#*:}
[[ "${content:0:2}" == '/ ' ]] || exit 0

# 3. Emit from that marker to EOF, minus the blank+'///' sentinel,
#    with the leading '/ ' stripped from the first line.
sed -n "${last%%:*},\$p" "$f" | head -n -2 | sed '1s|^/ ||'
