typeset -U path fpath

# Macos
if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"
    path+=("/opt/homebrew/opt/libpq/bin")
fi

# Zinit 
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Autoloads
autoload -Uz compinit && compinit
autoload -Uz edit-command-line

# Zle
zle -N edit-command-line

# History
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Keybindings
bindkey -v
bindkey -M vicmd . edit-command-line
bindkey "^?" backward-delete-char

# Aliases
alias ls="ls --color=auto"
alias _icns="rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock"
alias _kbd="hidutil property --set '{\"UserKeyMapping\":[{\"HIDKeyboardModifierMappingSrc\": 0x7000000E4,\"HIDKeyboardModifierMappingDst\": 0x7000000E6}]}'"

# Source files
source "$ZDOTDIR/.p10k.zsh"

# JetBrains
if [ -d "$HOME/Library/Application Support/JetBrains" ]; then
    path+=("$HOME/Library/Application Support/JetBrains/Toolbox/scripts")
fi

# Orbstack
if [ -f "$HOME/.orbstack/shell/init.zsh" ]; then
    source "$HOME/.orbstack/shell/init.zsh"
fi

# Composer
if [ -d "$HOME/.composer/vendor/bin/" ]; then
    path+=("$HOME/.composer/vendor/bin")
fi

# Angular CLI
if [ "$(command -v ng)" != "" ]; then
    source <(ng completion script)
fi
