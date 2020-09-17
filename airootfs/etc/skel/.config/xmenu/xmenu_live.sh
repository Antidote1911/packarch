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
Internet					firefox
File Manager
	Pcmanfm					pcmanfm
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
		Pcmanfm				sudo pcmanfm
	Leafpad					sudo leafpad
	Geany					sudo geany
	Nvim					sudo termite -e nvim
Applications
	Multimedia
		SMplayer			smplayer
	Utils
		Htop				termite -e htop
		Geany				geany
		Leafpad				leafpad
		KeepassXC			keepassxc
		Veracrypt			veracrypt
		Bootable Usb			mintstick -m iso
		Format Usb			mintstick -m format
		Infos System			hardinfo
	Funny Apps
		Neofetch			termite -e neofetch --hold
		Pipes 1				termite -e pipes-1
		Pipes 2				termite -e pipes-2
		Pipes 3				termite -e pipes-3
		Invaders			termite -e invaders --hold
		Color Bars			termite -e colortest --hold
		Pacman				termite -e pacmancolor --hold
		Monsters			termite -e monster --hold
Configuration
	Change theme
		Archlinux			$HOME/.config/styles/archlinux.sh
		Coffee				$HOME/.config/styles/coffee.sh
		Cyberpunk			$HOME/.config/styles/cyberpunk.sh
		Forest				$HOME/.config/styles/forest.sh
		Manga				$HOME/.config/styles/manga.sh
		Nord				$HOME/.config/styles/nord.sh
		Packarch			$HOME/.config/styles/packarch.sh
		Sexy				$HOME/.config/styles/sexy.sh
	Edit config files
		Bspwm config		termite -e 'nvim $HOME/.config/bspwm/bspwmrc' --class termite-float
		Bspwm sxhkd		termite -e 'nvim $HOME/.config/bspwm/sxhkd/sxhkdrc' --class termite-float		
		Hlwm config		termite -e 'nvim $HOME/.config/herbstluftwm/autostart' --class termite-float
		Hlwm sxhkd		termite -e 'nvim $HOME/.config/herbstluftwm/sxhkd/sxhkdrc' --class termite-float		
		Commons modules	termite -e 'nvim $HOME/.config/polybar/commons_modules.ini' --class termite-float
		Bspwm modules	termite -e 'nvim $HOME/.config/polybar/bspwm_modules.ini' --class termite-float
		Hlwm modules	termite -e 'nvim $HOME/.config/polybar/hlwm_modules.ini' --class termite-float		
		Edit this menu		termite -e 'nvim $HOME/.config/xmenu/xmenu.sh' --class termite-float		
		Restart WM			$RESTARTWM
		Reload keybinding	pkill -USR1 -x sxhkd
		Restart Polybar		$HOME/.config/polybar/launch.sh
	Change Wallpaper			nitrogen
	Lxappearance			lxappearance
	Audio Settings			pavucontrol
Screenshot
	Screenshot Now			shotnow
	Screenshot In 5s			shotin5
	Screenshot In 10s			shotin10
	Screenshot Area			shotArea
	Screenshot Window		shotWindow
Sticky Notes					tasks

Quick Links
	Gmail					firefox https://mail.google.com
	Facebook				firefox https://www.facebook.com
	Youtube					firefox https://www.youtube.com
	Linux
		Archlinux fr			firefox https://archlinux.fr
		Archlinux			firefox https://www.archlinux.org
		Distrowatch			firefox https://distrowatch.com
	Develop
		Github				firefox https://github.com
		Developpez			firefox https://www.developpez.com
	Lan
		Syno DS918			firefox http://192.168.1.96:5000/?_dc=1522237352866
		Switch				firefox http://192.168.1.89/login.htm
		Cups				firefox http://localhost:631/admin
		Bbox				firefox https://mabbox.bytel.fr/login.html
	About Developer			firefox https://github.com/Antidote1911
Places
	My Home				pcmanfm -n $HOME
	Downloads				pcmanfm -n $(xdg-user-dir DOWNLOAD)
	Videos					pcmanfm -n $(xdg-user-dir VIDEOS)
	Images					pcmanfm -n $(xdg-user-dir PICTURES)
	Documents				pcmanfm -n $(xdg-user-dir DOCUMENTS)
	Config					pcmanfm -n $HOME/.config
	Syno Ds918
		Syno Partage			pcmanfm -n /mnt/Partage/
		Syno Films			pcmanfm -n /mnt/Partage/Films/
		Syno Torrents		pcmanfm -n /mnt/Partage/torrents/
		Syno Musiques		pcmanfm -n /mnt/Musiques/
		Syno Photos			pcmanfm -n /mnt/Photos/

Lock Screen					betterlockscreen -l blur
Power
	Logout					$LOGOUT
	Reboot					systemctl reboot
	Shutdown				systemctl poweroff
EOF
