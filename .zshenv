# Zsh
export ZDOTDIR="$HOME/.config/zsh"

export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Misc
export KEYTIMEOUT=1

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS="--appdir=${HOME}/Applications"

# Fzf
# export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border"

# Zinit
export ZINIT_HOME="$ZDOTDIR/zinit/zinit.git"
