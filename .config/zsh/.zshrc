# Enable git info settings to display git branch in prompt
autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "(%b)"
precmd() { vcs_info }
setopt prompt_subst

# Enable colors and change prompt colors
autoload -U colors && colors
PS1='%B%{$fg[blue]%}[%{$fg[yellow]%}%n%{$fg[blue]%}@%{$fg[yellow]%}%M %{$fg[magenta]%}%~%{$fg[green]%}${vcs_info_msg_0_}%{$fg[blue]%}]%{$reset_color%}$%b '

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

# Set custom keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Allow backspace in insert mode
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] ||
	     [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
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

# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

export GPG_TTY=$(tty)
