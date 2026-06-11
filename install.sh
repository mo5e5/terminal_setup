#!/bin/bash
set -euo pipefail

# ============================================================
# Install script for terminal_setup
# github.com/mo5e5/terminal_setup
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TERMINAL_SETUP_FILE="$SCRIPT_DIR/terminal_setup.zsh"
ZSHRC="$HOME/.zshrc"
TERMINAL_SETUP_TARGET="$HOME/.terminal_setup.zsh"
BACKUP="${ZSHRC}.backup_$(date +%Y%m%d_%H%M%S)"

echo ""
echo "  terminal_setup installer"
echo "  ────────────────────────"
echo ""

# 1. Check that terminal_setup.zsh exists
if [ ! -f "$TERMINAL_SETUP_FILE" ]; then
  echo "  ✗ Error: terminal_setup.zsh not found in $(dirname "$0")"
  exit 1
fi

# 2. Copy terminal_setup.zsh to $HOME/.terminal_setup.zsh
cp "$TERMINAL_SETUP_FILE" "$TERMINAL_SETUP_TARGET"
echo "  ✓ terminal_setup.zsh installed to $TERMINAL_SETUP_TARGET"

# 3. Create .zshrc if missing, backup if exists
if [ ! -f "$ZSHRC" ]; then
  echo "# ~/.zshrc" > "$ZSHRC"
  echo "  ✓ .zshrc created"
else
  cp "$ZSHRC" "$BACKUP"
  echo "  ✓ Backup of existing .zshrc: $BACKUP"
fi

# 4. Add source block (idempotent via marker comment)
MARKER="# terminal_setup"
SOURCE_BLOCK="# terminal_setup
[ -f \"\$HOME/.terminal_setup.zsh\" ] && source \"\$HOME/.terminal_setup.zsh\""

if ! grep -q "^$MARKER$" "$ZSHRC"; then
  echo "" >> "$ZSHRC"
  echo "$SOURCE_BLOCK" >> "$ZSHRC"
  echo "  ✓ Source block added to .zshrc"
else
  echo "  ✓ Source block already present (idempotent)"
fi

echo ""
echo "  ┌─────────────────────────────────────────┐"
echo "  │  Done! Open a new terminal window and   │"
echo "  │  type 'help' to see all shortcuts.      │"
echo "  └─────────────────────────────────────────┘"
echo ""
echo "  To customize:"
echo "  - Edit $TERMINAL_SETUP_TARGET to add/modify aliases"
echo "  - Set TS_WEATHER_CITY in that file for weather commands"
echo ""
