#!/bin/sh

# Add ~/.local/bin to $PATH environment variable
export PATH="$PATH:$HOME/.local/bin/"
export PATH="$PATH:$HOME/.local/bin/statusbar"
export PATH="$PATH:$HOME/.local/share/go/bin"
export PATH="$PATH:$HOME/.local/share/cargo/bin"

# Set default programs
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"
export FILE="Lf"

# Config file directory clean up
export INPUTRC="$HOME/.config/inputrc"
export ZDOTDIR="$HOME/.config/zsh"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export CARGO_HOME="$HOME/.local/share/cargo"
export GOPATH="$HOME/.local/share/go"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export GRADLE_USER_HOME="$HOME/.local/share/gradle"
export ANDROID_SDK_HOME="$HOME/.config/android"
export ANDROID_SDK_ROOT="$HOME/.local/share/Android/Sdk"

# Java language server configs and plugins
export JDTLS_HOME="$HOME/.local/share/nvim/lsp_servers/jdtls"

# Setting for Java program to respect tiling window manager
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

# Manual page syntax highlighting
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# Start mpd
mpd >/dev/null 2>&1 &

# Start graphical server
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx
