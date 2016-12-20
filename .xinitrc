#!/usr/bin/env bash

#
# Launch i3 window manager
#

eval $(dbus-launch --sh-syntax)
exec i3
