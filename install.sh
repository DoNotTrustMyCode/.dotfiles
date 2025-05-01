#!/bin/bash
set -e

echo "🚀 Setting up dotfiles..."

DOTFILES="$HOME/.dotfiles"

# Ensure config directories exist
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/tmux"

# Symlink tmux config
ln -sf "$DOTFILES/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# Install TPM if not already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "📦 Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "✅ TPM already installed"
fi

# Future configs (example: Neovim)
# mkdir -p "$HOME/.config/nvim"
# ln -sf "$DOTFILES/config/nvim/init.lua" "$HOME/.config/nvim/init.lua"

echo "✅ Dotfiles setup complete!"
echo "👉 Inside tmux, press:  <prefix> + I  to install plugins."

