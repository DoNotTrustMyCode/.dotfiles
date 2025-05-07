#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$HOME/.config/tmux"
SOURCE="$DOTFILES_DIR/tmux"
TPM_DIR="$TARGET/plugins/tpm"

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Safety check
if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
    echo "❌ $TARGET exists and is not a symlink. Aborting to avoid data loss."
    exit 1
fi

# Remove old symlink if any
if [ -L "$TARGET" ]; then
    echo "🔄 Removing old symlink: $TARGET"
    rm "$TARGET"
fi

# Create symlink
echo "🔗 Linking $SOURCE → $TARGET"
ln -s "$SOURCE" "$TARGET"

# Clone TPM if missing
if [ ! -d "$TPM_DIR" ]; then
    echo "⬇️  Cloning TPM into $TPM_DIR"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "✅ TPM already installed."
fi

echo "✅ Tmux config installed. Open tmux and run: prefix + I to install plugins."

