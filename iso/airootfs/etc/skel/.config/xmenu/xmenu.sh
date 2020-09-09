#!/bin/bash

cat <<EOF | xmenu | sh &
Internet					firefox
File Manager
	Pcmanfm				pcmanfm
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
		Pcmanfm			sudo pcmanfm
	Leafpad					sudo leafpad
	Geany					sudo geany
	Ranger					sudo termite --class termite-float -c /root/.config/termite/config -e ranger
	NVim					sudo termite --class termite-float -c /root/.config/termite/config -e nvim
Applications
	Multimedia
		SMplayer			smplayer
		Spotify				spotify
		Mp3 Player			termite -e ncmpcpp
		Visualizer			termite -e cava
	Graphism
		Gimp				gimp
		Gcolor3				gcolor3
		Color Picker			color_picker
	Develop
		Atom				atom
		QtCreator			qtcreator
	Utils
		Htop				termite -e htop
		Geany				geany
		Leafpad				leafpad
		Vmware				vmware
		Virtualbox			virtualbox
		KeepassXC			keepassxc
		Veracrypt			veracrypt
		Fonts Manager		font-manager
		Bootable Usb			mintstick -m iso
		Format Usb			mintstick -m format
		Infos System			hardinfo
	Funny Apps
		Neofetch			termite -e neofetch --hold
		Pipes 1				termite -e pipes-1
		Pipes 2				termite -e pipes-2
		Pipes 3				termite -e pipes-3
		Panes				termite -e panes --hold
		Color Bars			termite -e colorbar-full --hold
		Color Blocks			termite -e colorblocks --hold
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
		Sxhkd keybinding		termite -e 'nvim $HOME/.config/sxhkd/sxhkdrc' --class termite-float
		Polybar config.ini		termite -e 'nvim $HOME/.config/polybar/commons_modules.ini' --class termite-float
		Polybar commons modules	termite -e 'nvim $HOME/.config/polybar/bspwm_modules.ini' --class termite-float
		Polybar Bspwm modules	termite -e 'nvim $HOME/.config/polybar/bspwm_modules.ini' --class termite-float
		Edit this menu		termite -e 'nvim $HOME/.config/xmenu/xmenu.sh' --class termite-float
		Restart Bspwm		bspc wm -r
		Reload keybinding	pkill -USR1 -x sxhkd
		Restart Polybar				
	Change Wallpaper			nitrogen
	Appearance Settings		xfce4-appearance-settings
	Lxappearance			lxappearance
	Power Settings			xfce4-power-manager-settings
	Settings Manager			xfce4-settings-manager
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
	Logout					bspc quit
	Reboot					my_powermenu --reboot
	Suspent					my_powermenu --suspent
	Shutdown				my_powermenu --shutdown
EOF
