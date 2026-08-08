#!/bin/bash
set -e

BASE_DIR="/home/raka/mcp-arwaky/fetch-arwaky"
REPO_DIR="$BASE_DIR/fetch-mcp"
DIST_DIR="$REPO_DIR/dist"

echo ">>> Creating dist directory..."
mkdir -p "$DIST_DIR"

echo ">>> Installing dependencies..."
cd "$REPO_DIR"
npm install

echo ">>> Compiling with esbuild..."
# Menggunakan esbuild karena bun tidak terinstall di sistem ini
npx -y esbuild src/index.ts --bundle --platform=node --format=esm --outfile=dist/index.js --external:jsdom --external:@mozilla/readability --external:turndown --external:private-ip --external:@modelcontextprotocol/sdk --external:zod


echo ">>> Setting permissions..."
chmod 755 "$DIST_DIR/index.js"

echo ">>> Done! Output in $DIST_DIR"
