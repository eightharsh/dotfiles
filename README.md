──────────────────────────────────────────────────────────────────────────────
dotfiles
──────────────────────────────────────────────────────────────────────────────
Author: eightharsh
GitHub: https://github.com/eightharsh/dotfiles
──────────────────────────────────────────────────────────────────────────────

Overview
──────────────────────────────────────────────────────────────────────────────
This repository contains my personal configuration files (dotfiles) for macOS.
It includes:

  - Shell configuration: zsh, aliases, functions
  - Alacritty terminal config
  - Git configuration: .gitconfig, .gitignore_global
  - Other essential configs: .config directory, scripts

Purpose
──────────────────────────────────────────────────────────────────────────────
The goal of this repository is to maintain a portable, version-controlled
environment for my development workflow. It allows me to set up a new machine
quickly with consistent configurations.

Usage
──────────────────────────────────────────────────────────────────────────────
1. Clone the repository:
   
   $ git clone git@github.com:eightharsh/dotfiles.git ~/dotfiles

2. Navigate to the repo:

   $ cd ~/dotfiles

3. Use GNU Stow to symlink configs (recommended):

   $ stow zsh
   $ stow nvim
   $ stow tmux
   $ stow alacritty

4. Reload your shell:

   $ source ~/.zshenv

Contributing
──────────────────────────────────────────────────────────────────────────────
This is a personal configuration repository. Contributions are welcome
as suggestions via GitHub issues or pull requests, but use at your own risk.

License
──────────────────────────────────────────────────────────────────────────────
MIT License

──────────────────────────────────────────────────────────────────────────────
