#!/usr/bin/env bash
# Zip every skill in skills/ into dist/<name>.zip for upload to the Claude app.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p dist
for d in skills/*/; do
  name=$(basename "$d")
  rm -f "dist/$name.zip"
  (cd skills && zip -qr "../dist/$name.zip" "$name")
  echo "Packaged dist/$name.zip"
done
