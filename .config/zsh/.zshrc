# ---------------- ENVIRONMENT ----------------
export PATH=/opt/homebrew/bin:$PATH
export LANG=en_US.UTF-8
alias vim="/opt/homebrew/bin/vim"
export PATH="/opt/homebrew/opt/mupdf/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/curl/bin:/opt/homebrew/opt/gcc/bin:$PATH"

# ---------------- HISTORY ----------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY
setopt inc_append_history   # Append to history immediately

# ---------------- COLORS ----------------
autoload -U colors && colors

# ---------------- PROMPT ----------------
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
# ---------------- PROMPT ----------------
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

PS1="%B%K{black}%F{red}[%F{yellow}%n%F{green}@%F{blue}%m %F{magenta}%2~%F{red}]%k%f%F{yellow}$%f%b "
# ---------------- TERMINAL BEHAVIOR ----------------
setopt autocd              # cd into typed dir automatically
stty stop undef            # disable Ctrl-S freeze
setopt interactive_comments

# ---------------- COMPLETION ----------------
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)    # include hidden files

# ---------------- VI MODE & CURSOR ----------------
bindkey -v
export KEYTIMEOUT=1

# Cursor shape for vi modes
function zle-keymap-select() {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;   # block cursor in normal mode
    viins|main) echo -ne '\e[5 q';; # beam cursor in insert mode
  esac
}
zle -N zle-keymap-select

zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # beam cursor at startup
preexec() { echo -ne '\e[5 q'; }

# ---------------- EDIT COMMAND LINE ----------------
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line  # Ctrl-E edit in vim

# ---------------- FAST DIRECTORY NAVIGATION ----------------
# LF file manager
lfcd () {
  tmp="$(mktemp -uq)"
  trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}
bindkey -s '^o' '^ulfcd\n'         # Ctrl-O opens lf

# FZF fuzzy finder
fcd() {
  local dir
  dir=$(find . -type d 2>/dev/null | fzf +m) && cd "$dir"
}
bindkey -s '^f' '^ufcd\n'          # Ctrl-F fuzzy cd

# ---------------- DELETE CHAR ----------------
bindkey '^[[P' delete-char

# ---------------- SYNTAX HIGHLIGHTING ----------------
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# ---------------- AUTOSUGGESTIONS ----------------
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ---------------- ALIASES ----------------
alias gst="git status"
alias gco="git checkout"
alias glog="git log --oneline --graph --all"
alias gp="git push"
alias gd="git diff"
alias vi="vim"
alias grep='rg'
alias grep='rg --color=auto'
alias find='fd'
alias fdf='fd --type f'
alias fdd='fd --type d'
alias cd='z'
alias cdi='zi'


# ---------------- LS COLORS ----------------
alias ls="eza --color=always --icons=always"
alias ll="eza -lha --color=always --icons=always --git"
alias lt="eza --tree --color=always --icons=always"
alias la="eza -a --color=always --icons=always"
