#!/bin/bash

HISTSIZE= HISTFILESIZE=

# Color prompt
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 3)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 3)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 4)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# Aliases
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto"

# Alias command "nvim" as "vim" if neovim is installed.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"
