#!/bin/bash

set -e

BASHRC="$HOME/.bashrc"
SOURCE_LINE='source "$HOME/git/dotfiles/bash/bashrc"'

# Check if the source line already exists
if grep -Fxq "$SOURCE_LINE" "$BASHRC"; then
    echo "✅ Already sourcing bashrc from dotfiles."
else
    echo "🔗 Adding source line to ~/.bashrc"
    echo "" >> "$BASHRC"
    echo "# Load custom bash config" >> "$BASHRC"
    echo "$SOURCE_LINE" >> "$BASHRC"
    echo "✅ Done. Restart your shell or run: source ~/.bashrc"
fi
