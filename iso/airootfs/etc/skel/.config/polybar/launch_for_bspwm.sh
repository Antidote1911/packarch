#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar and log the result
polybar top -c "$HOME"/.config/polybar/config_bspwm.ini 2>"$HOME"/.config/polybar/logtopB &
polybar bottom -c "$HOME"/.config/polybar/config_bspwm.ini 2>"$HOME"/.config/polybar/logdownB &
