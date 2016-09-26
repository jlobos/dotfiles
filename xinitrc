#!/usr/bin/env bash

#
# Start GNOME Keyring
#

# /usr/lib/gnome-settings-daemon/gnome-settings-daemon
# eval $(gnome-keyring-daemon --start)
# export GNOME_KEYRING_CONTROL
# export GNOME_KEYRING_PID
# export GPG_AGENT_INFO
# export SSH_AUTH_SOCK

# Launch i3 window manager
eval $(dbus-launch --sh-syntax)
export XDG_CURRENT_DESKTOP=GNOME
exec i3
