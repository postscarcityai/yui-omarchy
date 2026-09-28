#!/bin/sh
# Copies the shared Yui Lines conformance vectors from the hub repo (postscarcityai/yuigui)
# into conformance/, so this repo tests without the hub checked out.
#   scripts/sync-vectors.sh [path/to/yuigui]
# With no path it looks for ../yuigui, then downloads the hub's main branch from GitHub.
set -eu
root=$(cd "$(dirname "$0")/.." && pwd)
hub=${1:-"$root/../yuigui"}
dst="$root/conformance"
tmp=""
if [ ! -d "$hub/spec/conformance" ]; then
  tmp=$(mktemp -d)
  curl -fsSL https://github.com/postscarcityai/yuigui/archive/refs/heads/main.tar.gz | tar -xz -C "$tmp"
  hub="$tmp/yuigui-main"
fi
mkdir -p "$dst"
rm -f "$dst"/[0-9][0-9]-*.json
cp "$hub"/spec/conformance/[0-9][0-9]-*.json "$dst"/
rev=$(git -C "$hub" rev-parse HEAD 2>/dev/null || echo "main as of $(date -u +%Y-%m-%d)")
echo "$rev" > "$dst/SOURCE"
[ -n "$tmp" ] && rm -rf "$tmp"
echo "sync-vectors: $(ls "$dst"/[0-9][0-9]-*.json | wc -l | tr -d ' ') files from yuigui $rev"
