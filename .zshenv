# Set Zsh configuration directory
export ZDOTDIR=$HOME/.config/zsh

# Set XDG configuration directory 
export XDG_CONFIG_HOME=$HOME/.config

# Initialize Homebrew environment 
if type brew &>/dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Include user-local binaries in PATH
export PATH="$HOME/.local/bin:$PATH"
