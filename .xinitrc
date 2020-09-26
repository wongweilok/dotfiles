#!/bin/sh

# Load xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=fcitx

# Start bspwm
exec bspwm
#ssh-agent dwm
