#! /bin/bash

if (xrandr | grep "VGA1 connected" > /dev/null)
then
  exec xrandr --output HDMI1 --off --output LVDS1 --primary --mode 1366x768 --pos 0x132 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --mode 1440x900 --pos 1366x0 --rotate normal
  exit
else
  exec xrandr --output HDMI1 --off --output LVDS1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --off
  exit
fi
