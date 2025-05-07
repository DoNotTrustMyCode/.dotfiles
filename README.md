# 🛠️ dotfiles

My personal Linux dotfiles. Clean, modular, and safely symlinked.

## 🗂️ Structure

Each folder in this repo contains its own config and an `install.sh` script to link it to the correct location.


## 🚀 Usage

Install configs one at a time:

```bash
cd ./bash/install.sh      # Adds source line to ~/.bashrc
cd ./nvim/install.sh      # Links Neovim config
cd ./tmux/install.sh      # Links Tmux config and installs TPM

Each install script:

    Skips or errors if a non-symlink exists

    Symlinks into the correct place

    Is safe to run multiple times

🔗 Notes

    Neovim config based on kickstart.nvim
    Tmux plugins managed with TPM

---


