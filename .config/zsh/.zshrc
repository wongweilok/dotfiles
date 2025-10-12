# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set history directory
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.config/zsh/zsh_history

# Enable tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)	# Include hidden files.

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

# Set custom keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Allow backspace in insert mode
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}

zle-line-init() {
    echo -ne "\e[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Aliases
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

# Alias command "nvim" as "vim" if neovim is installed.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"

# Change directory using lf
lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    Lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' '^ulfcd\n'

# Search history for specific commands
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
bindkey -M vicmd '^k' history-search-backward
bindkey -M vicmd '^j' history-search-forward

se() { du -a $HOME/Files/uni/ | awk '{print $2}' | fzf | xargs -r $EDITOR }
fh() { cat $HOME/.config/zsh/zsh_history | fzf }
cpf() { cp $1 "$(find $2 -type d | fzf)" }

# Load Node version manager (nvm)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# GPG Key input
export GPG_TTY=$(tty)

# Load zsh-syntax-highlighting & p10k theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source $HOME/.local/share/powerlevel10k/powerlevel10k.zsh-theme

# Load p10k prompt
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
