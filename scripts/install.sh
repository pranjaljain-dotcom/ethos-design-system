#!/bin/bash
# install.sh
# Copies product context files (CLAUDE.md + .claude/commands/) into the target product project.
# Does NOT overwrite existing CLAUDE.md — prompts before replacing.
#
# Usage:
#   ./scripts/install.sh annuities-interview
#   ./scripts/install.sh modal-preview
#   ./scripts/install.sh all

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PRODUCTS_DIR="$DS_ROOT/product-contexts"
BASE_DIR="/Users/pranjal.jain"

install_product() {
  local product="$1"
  local src="$PRODUCTS_DIR/$product"
  local dest="$BASE_DIR/$product"

  if [ ! -d "$src" ]; then
    echo "❌  No product context found for '$product' in $PRODUCTS_DIR"
    return 1
  fi

  if [ ! -d "$dest" ]; then
    echo "❌  Target project not found: $dest"
    return 1
  fi

  echo "📦  Installing context for: $product"

  # CLAUDE.md
  if [ -f "$dest/CLAUDE.md" ]; then
    read -r -p "   CLAUDE.md already exists in $product. Overwrite? [y/N] " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      cp "$src/CLAUDE.md" "$dest/CLAUDE.md"
      echo "   ✅  CLAUDE.md replaced"
    else
      echo "   ⏭️   CLAUDE.md skipped"
    fi
  else
    cp "$src/CLAUDE.md" "$dest/CLAUDE.md"
    echo "   ✅  CLAUDE.md created"
  fi

  # .claude/commands/
  if [ -d "$src/.claude/commands" ]; then
    mkdir -p "$dest/.claude/commands"
    cp -r "$src/.claude/commands/"* "$dest/.claude/commands/"
    echo "   ✅  Slash commands installed → $dest/.claude/commands/"
  fi

  echo "   Done: $product"
}

case "$1" in
  all)
    for dir in "$PRODUCTS_DIR"/*/; do
      install_product "$(basename "$dir")"
    done
    ;;
  "")
    echo "Usage: $0 <product-name> | all"
    echo "Available products:"
    for dir in "$PRODUCTS_DIR"/*/; do echo "  - $(basename "$dir")"; done
    ;;
  *)
    install_product "$1"
    ;;
esac
