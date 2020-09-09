#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar and log the result
polybar top -c "$HOME"/.config/polybar/config_ob.ini 2>"$HOME"/.config/polybar/logtopO &
polybar bottom -c "$HOME"/.config/polybar/config_ob.ini 2>"$HOME"/.config/polybar/logdownO &
