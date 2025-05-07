#!/bin/bash

set -e

# Paths
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="$HOME/.config/nvim"
SOURCE="$DOTFILES_DIR/nvim"

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Check if ~/.config/nvim exists
if [ -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
    echo "❌ $TARGET exists and is not a symlink. Aborting to avoid data loss."
    exit 1
fi

# Remove existing symlink if it exists
if [ -L "$TARGET" ]; then
    echo "🔄 Removing existing symlink: $TARGET"
    rm "$TARGET"
fi

# Create new symlink
echo "🔗 Linking $SOURCE → $TARGET"
ln -s "$SOURCE" "$TARGET"

echo "✅ Neovim config linked successfully."

