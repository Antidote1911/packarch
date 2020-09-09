#!/bin/bash

# A script to inject colours to polybar, termite & rofi.

WM="$DESKTOP_SESSION"
DIR="$HOME/.config"
XDIR="$HOME/.Xresources.d"
cat "$DIR"/styles/coffee > "$XDIR"/colors
xrdb ~/.Xresources

getcolors () {
	FOREGROUND="$(xrdb -query | grep 'foreground:'| awk '{print $NF}')"
	BACKGROUND="$(xrdb -query | grep 'background:'| awk '{print $NF}')"
	CURSOR="$(xrdb -query | grep 'cursorColor:'| awk '{print $NF}')"
	BLACK="$(xrdb -query | grep 'color0:'| awk '{print $NF}')"
	RED="$(xrdb -query | grep 'color1:'| awk '{print $NF}')"
	GREEN="$(xrdb -query | grep 'color2:'| awk '{print $NF}')"
	YELLOW="$(xrdb -query | grep 'color3:'| awk '{print $NF}')"
	BLUE="$(xrdb -query | grep 'color4:'| awk '{print $NF}')"
	MAGENTA="$(xrdb -query | grep 'color5:'| awk '{print $NF}')"
	CYAN="$(xrdb -query | grep 'color6:'| awk '{print $NF}')"
	WHITE="$(xrdb -query | grep 'color7:'| awk '{print $NF}')"
	ALTBLACK="$(xrdb -query | grep 'color8:'| awk '{print $NF}')"
	ALTRED="$(xrdb -query | grep 'color9:'| awk '{print $NF}')"
	ALTGREEN="$(xrdb -query | grep 'color10:'| awk '{print $NF}')"
	ALTYELLOW="$(xrdb -query | grep 'color11:'| awk '{print $NF}')"
	ALTBLUE="$(xrdb -query | grep 'color12:'| awk '{print $NF}')"
	ALTMAGENTA="$(xrdb -query | grep 'color13:'| awk '{print $NF}')"
	ALTCYAN="$(xrdb -query | grep 'color14:'| awk '{print $NF}')"
	ALTWHITE="$(xrdb -query | grep 'color15:'| awk '{print $NF}')"
}

xmenu () {
	sed -i -e 's/background_color=.*/background_color="'${BACKGROUND}'",/' $DIR/xmenu/config.h
	sed -i -e 's/foreground_color=.*/foreground_color="'${FOREGROUND}'",/' $DIR/xmenu/config.h
	sed -i -e 's/selbackground_color=.*/selbackground_color="'${BACKGROUND}'",/' $DIR/xmenu/config.h
	sed -i -e 's/selforeground_color=.*/selforeground_color="'${MAGENTA}'",/' $DIR/xmenu/config.h
	sed -i -e 's/separator_color=.*/separator_color="'${BLACK}'",/' $DIR/xmenu/config.h
	sed -i -e 's/border_color=.*/border_color="'${BACKGROUND}'",/' $DIR/xmenu/config.h	
	cd $DIR/xmenu/ && make && sudo make install
}

geany () {
	sed -i -e 's/color_scheme=.*/color_scheme=forest.conf/g' $DIR/geany/geany.conf
	sed -i -e 's/editor_font=.*/editor_font=Noto Sans 11/g' $DIR/geany/geany.conf
}

gtk () {
	xfconf-query -c xsettings -p /Net/ThemeName -s "Fantome"
	xfconf-query -c xsettings -p /Net/IconThemeName -s "Numix"
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Hybrid_Light"
	xfconf-query -c xsettings -p /Gtk/FontName -s "Noto Sans 10"
}

obconf () {
	namespace="http://openbox.org/3.4/rc"
	config="$DIR/openbox/rc.xml"
	theme="Velnias"
	layout="CLM"
	font="Noto Sans 11"
	fontsize="11"

	# Theme
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:name' -v "$theme" "$config"

	# Title
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:titleLayout' -v "$layout" "$config"

	# Fonts
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:weight' -v Bold "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveWindow"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:weight' -v Normal "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveWindow"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:weight' -v Bold "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuHeader"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:weight' -v Normal "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="MenuItem"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:weight' -v Bold "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="ActiveOnScreenDisplay"]/a:slant' -v Normal "$config"

	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:name' -v "$font" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:size' -v "$fontsize" "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:weight' -v Normal "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:theme/a:font[@place="InactiveOnScreenDisplay"]/a:slant' -v Normal "$config"

	# Margins
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:top' -v 0 "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:bottom' -v 10 "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:left' -v 10 "$config"
	xmlstarlet ed -L -N a="$namespace" -u '/a:openbox_config/a:margins/a:right' -v 10 "$config"
}

divers () {
	dunstify -r 1 -t 0 "Generating new icons cache for Coffee theme. Please wait..."
	cd $DIR/numix-config && echo -e "2\ncustom\nc0b18b\n8F8467\n8F8467\n" | sudo $DIR/numix-config/numix-folders -t
	dunstify -r 1 -t 0 "Generating image cache for betterlockscreen. Please wait..."
	betterlockscreen -u /usr/share/backgrounds/coffee.jpg
	nitrogen --set-zoom-fill --save /usr/share/backgrounds/coffee.jpg
	sed -i -e 's/progressbar_color = .*/progressbar_color = "black"/g' $HOME/.ncmpcpp/config
}

bspbar () {
	cat > $DIR/polybar/colors.ini <<- EOF	
	[color]

	FOREGROUND = ${FOREGROUND}
	BACKGROUND = ${BACKGROUND}
	BLACK = ${BLACK}
	RED = ${RED}
	GREEN = ${GREEN}
	YELLOW = ${YELLOW}
	BLUE = ${BLUE}
	MAGENTA = ${MAGENTA}
	CYAN = ${CYAN}
	WHITE = ${WHITE}
	ALTBLACK = ${ALTBLACK}
	ALTRED = ${ALTRED}
	ALTGREEN = ${ALTGREEN}
	ALTYELLOW = ${ALTYELLOW}
	ALTBLUE = ${ALTBLUE}
	ALTMAGENTA = ${ALTMAGENTA}
	ALTCYAN = ${ALTCYAN}
	ALTWHITE = ${ALTWHITE}
	EOF
}

bspterm () {
	sed -i '/colors/Q' $DIR/termite/config
	cat >> $DIR/termite/config <<- EOF	
	[colors]

	foreground=${FOREGROUND}
	background=${BACKGROUND}
	cursor=${CURSOR}

	color0=${BLACK}
	color1=${RED}
	color2=${GREEN}
	color3=${YELLOW}
	color4=${BLUE}
	color5=${MAGENTA}
	color6=${CYAN}
	color7=${WHITE}

	color8=${ALTBLACK}
	color9=${ALTRED}
	color10=${ALTGREEN}
	color11=${ALTYELLOW}
	color12=${ALTBLUE}
	color13=${ALTMAGENTA}
	color14=${ALTCYAN}
	color15=${ALTWHITE}
	EOF
	killall -USR1 termite >/dev/null 2>&1
}

bsprofi () {
	cat > $DIR/rofi/styles/colors.rasi <<- EOF
/* Color-Scheme */

* {
	BG:    ${BACKGROUND}ff;
	BGA:   ${ALTCYAN}ff;
	FG:    ${FOREGROUND}ff;
	BDR:   ${CYAN}ff;
	SEL:   ${CYAN}ff;
	UGT:   ${MAGENTA}ff;
	IMG:   ${MAGENTA}ff;
	ON:    ${GREEN}ff;
	OFF:   ${MAGENTA}ff;
}
EOF
cat > $DIR/rofi/dialogs/colors.rasi << _EOF_
/* Color-Scheme */

* {
    BG:    ${BACKGROUND}ff;
    FG:    ${FOREGROUND}ff;
    BDR:   ${MAGENTA}ff;
}
_EOF_
}

dunst () {
	sed -i -e 's/geometry = .*/geometry = "250x50-10+38"/g' $DIR/dunst/dunstrc
	sed -i -e 's/font = .*/font = Noto Sans 11/g' $DIR/dunst/dunstrc
	sed -i -e 's/frame_width = .*/frame_width = 1/g' $DIR/dunst/dunstrc

	cat > $DIR/dunst/sid <<- EOF
	Dark
	EOF

	sed -i '/urgency_low/Q' $DIR/dunst/dunstrc
	cat >> $DIR/dunst/dunstrc <<- EOF
	[urgency_low]
	timeout = 4
	background = "${BACKGROUND}"
	foreground  = "${FOREGROUND}"
	frame_color = "${FOREGROUND}"

	[urgency_normal]
	timeout = 6
	background = "${BACKGROUND}"
	foreground  = "${FOREGROUND}"
	frame_color = "${FOREGROUND}"

	[urgency_critical]
	timeout = 0
	background = "${BACKGROUND}"
	foreground  = "${MAGENTA}"
	frame_color = "${RED}"
	EOF
	pkill dunst && dunst &
}

restartwm () {
	if [[ $WM == "bspwm" ]]; then
  	echo "hello bspwm"
  	dunstify -r 1 -t 0 "Restarting Bspwm. Please wait..."
  	bspc wm -r
  	
	elif [[ $WM == "openbox" ]]; then
  	echo "hello openbox"
  	dunstify -r 1 -t 0 "Restarting Openbox. Please wait..."
  	openbox --reconfigure
	#restart polybar
  	$DIR/polybar/launch_for_ob.sh
  	
  	elif [[ $WM == "herbstluftwm" ]]; then
  	echo "hello Herbstluftwm"
  	dunstify -r 1 -t 0 "Restarting Herbstluftwm. Please wait..."
    herbstclient reload
	fi
}

main () {
	getcolors
	xmenu
	geany
	gtk
	obconf
	divers
	bspbar
	bspterm
	bsprofi
	dunst
	restartwm
}

main

