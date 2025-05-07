# 🛠️ dotfiles

My personal Linux dotfiles. Clean, modular, and safely symlinked.

## 🗂️ Structure

Each folder in this repo contains its own config and an `install.sh` script to link it to the correct location.

dotfiles/
├── bash/ → ~/.bashrc sources this config
├── nvim/ → ~/.config/nvim
├── tmux/ → ~/.config/tmux


## 🚀 Usage

Install configs one at a time:

```bash
cd bash && ./install.sh      # Adds source line to ~/.bashrc
cd nvim && ./install.sh      # Links Neovim config
cd tmux && ./install.sh      # Links Tmux config and installs TPM

Each install script:

    Skips or errors if a non-symlink exists

    Symlinks into the correct place

    Is safe to run multiple times

🧠 Philosophy

    Preserve system defaults

    Keep my config clean and under version control

    Modular, simple, no bloat

🐧 Platform

Linux only.
This is fkn Linux baby 🖤
🔗 Notes

    Neovim config based on kickstart.nvim

    Tmux plugins managed with TPM


---

Paste it into your `README.md`, commit it, and you’re golden.

Want a badge (e.g. “Made with ❤️ on Arch”) or keep it raw and hacker-core?

