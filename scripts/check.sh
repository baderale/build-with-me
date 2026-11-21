#!/usr/bin/env bash
# Show which tools are installed. Runs once when the container is created.
for t in claude node python3 uv yt-dlp ffmpeg git; do
  if command -v "$t" >/dev/null 2>&1; then
    v=$("$t" --version 2>&1 | head -1)
    printf '  ok   %-8s %s\n' "$t" "$v"
  else
    printf '  --   %-8s not installed\n' "$t"
  fi
done
echo
echo "Work in ./projects. Reset between takes: bash scripts/reset.sh"
