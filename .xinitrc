#!/bin/sh

# Load xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# Start bspwm
exec bspwm
