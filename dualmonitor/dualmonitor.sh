#! /bin/bash
xrandr --auto
xrandr --output LVDS1 --off
xrandr --output HDMI1 --left-of VGA1

xrandr --output VGA1 --mode 1440x900
xrandr --output HDMI1 --mode 1280x1024
