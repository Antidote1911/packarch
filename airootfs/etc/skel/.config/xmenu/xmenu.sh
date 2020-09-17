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
Install Packarch				sudo termite -t Packarch_Installer -c /installer/termite -e /installer/install_packarch.sh
Gparted						(gparted &> /dev/null &)
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
	Nvim					sudo termite -e nvim
Applications
	Multimedia
		SMplayer			(smplayer &> /dev/null &)
	Utils
		Htop				termite -e htop
		Geany				(geany &> /dev/null &)
		Leafpad				(leafpad &> /dev/null &)
		KeepassXC			(keepassxc &> /dev/null &)
		Veracrypt			(veracrypt &> /dev/null &)
		Bootable Usb			(mintstick -m iso &> /dev/null &)
		Format Usb			(mintstick -m format &> /dev/null &)
		Infos System			(hardinfo &> /dev/null &)
	Funny Apps
		Neofetch			termite -e neofetch --hold
		Pipes 1				termite -e pipes-1
		Pipes 2				termite -e pipes-2
		Pipes 3				termite -e pipes-3
		Invaders				termite -e invaders --hold
		Color Bars			termite -e colortest --hold
		Pacman				termite -e pacmancolor --hold
		Monsters			termite -e monster --hold
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
		Commons modules	termite -e 'nvim $HOME/.config/polybar/commons_modules.ini' --class termite-float
		Bspwm modules		termite -e 'nvim $HOME/.config/polybar/bspwm_modules.ini' --class termite-float		
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
	Config					(pcmanfm -n $(xdg-user-dir DOCUMENTS) &> /dev/null &)

Lock Screen					betterlockscreen -l blur
Power
	Logout					$LOGOUT
	Reboot					systemctl reboot
	Shutdown				systemctl poweroff
EOF
