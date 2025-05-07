#!/bin/bash

set -e

CONFIGS=(bash nvim tmux)

for config in "${CONFIGS[@]}"; do
    echo ""
    read -rp "Install $config config? [y/N]: " answer
    case "$answer" in
        [yY][eE][sS]|[yY])
            echo "▶ Installing $config..."
            ./$config/install.sh
            ;;
        *)
            echo "⏩ Skipping $config"
            ;;
    esac
done

echo ""
echo "✅ All done."

