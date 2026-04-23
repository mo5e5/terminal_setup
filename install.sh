#!/bin/bash
# ============================================================
# Install script for terminal-setup
# github.com/malteoppermann/terminal-setup
# ============================================================

ZSHRC="$HOME/.zshrc"
BACKUP="${ZSHRC}.backup_$(date +%Y%m%d_%H%M%S)"

echo ""
echo "  terminal-setup installer"
echo "  ────────────────────────"
echo ""

# Backup
if [ -f "$ZSHRC" ]; then
  cp "$ZSHRC" "$BACKUP"
  echo "  ✓ Backup created: $BACKUP"
fi

# Copy .zshrc
cp "$(dirname "$0")/.zshrc" "$ZSHRC"
echo "  ✓ .zshrc installed"

echo ""
echo "  ┌─────────────────────────────────────────┐"
echo "  │  Done! Open a new terminal window and   │"
echo "  │  type 'help' to see all shortcuts.      │"
echo "  └─────────────────────────────────────────┘"
echo ""
echo "  Note: Edit ~/.zshrc to customize your prompt,"
echo "  greetings, or weather location."
echo ""
