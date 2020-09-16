#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

## Environtment
export PATH="${PATH}:$HOME/.config/bspwm/bin"

#change your keyboard if you need it
#setxkbmap -layout be
# conky -c $HOME/.config/bspwm/system-overview &
# run nm-applet &
# numlockx on &
# run volumeicon &
# run xfce4-power-manager &
# run thunar --daemon &
# run pamac-tray &
run xfsettingsd &

xsetroot -cursor_name left_ptr &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
nitrogen --restore &
run dunst &

pkill -9 -f bspfloat &
run bspfloat &

bspcomp
sh ~/.config/polybar/launch.sh &
