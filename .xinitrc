#!/usr/bin/env bash

#
# Launch i3 window manager
#

eval $(dbus-launch --sh-syntax)
export XDG_CURRENT_DESKTOP=GNOME
exec i3
