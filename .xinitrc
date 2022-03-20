#!/bin/sh

# Load xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Start window manager
ssh-agent dwm
