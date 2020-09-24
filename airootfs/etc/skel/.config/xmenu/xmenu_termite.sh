#!/bin/bash

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

WM="$DESKTOP_SESSION"
LOGOUT=""
RESTARTWM=""

if [[ $WM == "bspwm" ]]; then
	LOGOUT="bspc quit"
	RESTARTWM="bspc wm -r"
  	
  	elif [[ $WM == "herbstluftwm" ]]; then
  	LOGOUT="herbstclient quit"
  	RESTARTWM="herbstclient reload"
  	
  	elif [[ $WM == "openbox" ]]; then
  	LOGOUT="openbox --exit"
  	RESTARTWM="openbox --restart"
	fi

cat <<EOF | xmenu | sh &
Internet						(firefox &> /dev/null &)
File Manager
	Pcmanfm				(pcmanfm &> /dev/null &)
	Ranger					termite -e ranger
	Ranger Float				termite --class termite-float -e ranger
Terminal
	Termite					termite
	Termite Float				termite --class termite-float
Htop						termite -e htop

Apps as root
	Terminal
		Termite				sudo termite -c /root/.config/termite/config
		Termite Float			sudo termite --class termite-float -c /root/.config/termite/config
	File Manager
		Ranger				sudo termite -c /root/.config/termite/config -e ranger
		Ranger Float			sudo termite --class termite-float -c /root/.config/termite/config -e ranger
		Pcmanfm			(sudo pcmanfm &> /dev/null &)
	Leafpad					(sudo leafpad &> /dev/null &)
	Geany					(sudo geany &> /dev/null &)
	Nvim					(sudo termite -e nvim)
Applications
	Multimedia
		SMplayer			(smplayer &> /dev/null &)
		Spotify				(spotify &> /dev/null &)
		Mp3 Player			termite -e ncmpcpp
		Visualizer			termite -e cava
	Graphism
		Gimp				(gimp &> /dev/null &)
		Gcolor3				(gcolor3 &> /dev/null &)
		Color Picker			color_picker
	Develop
		Atom				(atom &> /dev/null &)
		QtCreator			(qtcreator &> /dev/null &)
	Utils
		Htop				termite -e htop
		Geany				(geany &> /dev/null &)
		Leafpad				(leafpad &> /dev/null &)
		Vmware				(vmware &> /dev/null &)
		Virtualbox			(virtualbox &> /dev/null &)
		KeepassXC			(keepassxc &> /dev/null &)
		Veracrypt			(veracrypt &> /dev/null &)
		Fonts Manager		(font-manager &> /dev/null &)
		Bootable Usb			(mintstick -m iso &> /dev/null &)
		Format Usb			(mintstick -m format &> /dev/null &)
		Infos System			(hardinfo &> /dev/null &)
		Gparted				(gparted &> /dev/null &)
	Funny Apps
		Neofetch			termite -e "$SHELL -c 'neofetch && $SHELL'" &
		Pipes 1				termite -e pipes-1.sh
		Pipes 2				termite -e pipes-2.sh
		Pipes 3				termite -e pipes-3.sh
		Invaders				termite -e "$SHELL -c 'invaders.sh && $SHELL'" &
		Color Bars			termite -e "$SHELL -c 'colortest.sh && $SHELL'" &
		Pacman				termite -e "$SHELL -c 'pacmancolor.sh && $SHELL'" &
		Monsters			termite -e "$SHELL -c 'monster.sh && $SHELL'" &
Configuration
	Change theme
		Archlinux			$HOME/.config/styles/archlinux.sh &> /dev/null &
		Coffee				$HOME/.config/styles/coffee.sh &> /dev/null &
		Cyberpunk			$HOME/.config/styles/cyberpunk.sh &> /dev/null &
		Forest				$HOME/.config/styles/forest.sh &> /dev/null &
		Manga				$HOME/.config/styles/manga.sh &> /dev/null &
		Nord				$HOME/.config/styles/nord.sh &> /dev/null &
		Packarch			$HOME/.config/styles/packarch.sh &> /dev/null &
		Sexy				$HOME/.config/styles/sexy.sh &> /dev/null &
	Edit config files
		Bspwm config		termite -e 'nvim $HOME/.config/bspwm/bspwmrc' --class termite-float
		Bspwm sxhkd		termite -e 'nvim $HOME/.config/bspwm/sxhkd/sxhkdrc' --class termite-float		
		Edit this menu		termite -e 'nvim $HOME/.config/xmenu/xmenu.sh' --class termite-float		
		Restart WM			$RESTARTWM
		Reload keybinding	pkill -USR1 -x sxhkd
		Restart Polybar		$HOME/.config/polybar/launch.sh &> /dev/null &
	Change Wallpaper			(nitrogen &> /dev/null &)
	Lxappearance			(lxappearance &> /dev/null &)
	Xfce4 Settings			(xfce4-settings-manager &> /dev/null &)
	Audio Settings			(pavucontrol &> /dev/null &)
Screenshot
	Screenshot Now			shotnow
	Screenshot In 5s			shotin5
	Screenshot In 10s			shotin10
	Screenshot Area			shotArea
	Screenshot Window		shotWindow
Sticky Notes					tasks

Quick Links
	Gmail					(firefox https://mail.google.com &> /dev/null &)
	Facebook				(firefox https://www.facebook.com &> /dev/null &)
	Youtube					(firefox https://www.youtube.com &> /dev/null &)
	Linux
		Archlinux fr			(firefox https://archlinux.fr &> /dev/null &)
		Archlinux			(firefox https://www.archlinux.org &> /dev/null &)
		Distrowatch			(firefox https://distrowatch.com &> /dev/null &)
	Develop
		Github				(firefox https://github.com &> /dev/null &)
		Developpez			(firefox https://www.developpez.com &> /dev/null &)
	Lan
		Syno DS918			(firefox http://192.168.1.96:5000/?_dc=1522237352866 &> /dev/null &)
		Switch				(firefox http://192.168.1.89/login.htm &> /dev/null &)
		Cups				(firefox http://localhost:631/admin &> /dev/null &)
		Bbox				(firefox https://mabbox.bytel.fr/login.html &> /dev/null &)
	About Developer			(firefox https://github.com/Antidote1911 &> /dev/null &)
Places
	My Home				(pcmanfm -n $HOME &> /dev/null &)
	Downloads				(pcmanfm -n $(xdg-user-dir DOWNLOAD) &> /dev/null &)
	Videos					(pcmanfm -n $(xdg-user-dir VIDEOS) &> /dev/null &)
	Images					(pcmanfm -n $(xdg-user-dir PICTURES) &> /dev/null &)
	Documents				(pcmanfm -n $(xdg-user-dir DOCUMENTS) &> /dev/null &)
	Config					(pcmanfm -n $HOME/.config &> /dev/null &)
	Syno Ds918
		Syno Partage			(pcmanfm -n /mnt/Partage/ &> /dev/null &)
		Syno Films			(pcmanfm -n /mnt/Partage/Films/ &> /dev/null &)
		Syno Torrents		(pcmanfm -n /mnt/Partage/torrents/ &> /dev/null &)
		Syno Musiques		(pcmanfm -n /mnt/Musiques/ &> /dev/null &)
		Syno Photos			(pcmanfm -n /mnt/Photos/&> /dev/null &)

Lock Screen					betterlockscreen -l blur
Power
	Logout					$LOGOUT
	Reboot					systemctl reboot
	Shutdown				systemctl poweroff
EOF
