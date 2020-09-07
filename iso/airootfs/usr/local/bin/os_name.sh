#!/usr/bin/env bash

# Script to fix OS name

checkname="$(cat /etc/os-release | grep -i NAME | head -n 1 | sed 's/NAME=//' | tr -d \")"

check_name() {
	if [[ "$checkname" != "Packarch" ]]; then
		if [[ $(whoami) != "root" ]]; then
			echo "Action needed, Please run this as root."
			exit 1
		fi
	else
		echo "No Action Needed."
		exit 0
	fi
}

fix_name() {
	## Fix /etc/os-release
	cat > "/etc/os-release" <<- EOL
		NAME="Packarch"
		PRETTY_NAME="Packarch"
		ID=arch
		BUILD_ID=rolling
		ANSI_COLOR="38;2;23;147;209"
		HOME_URL="https://github.com/Antidote1911/packarch"
		LOGO=packarch
	EOL

	## Fix /etc/issue
	cat > "/etc/issue" <<- EOL
		Packarch \r (\l)
	EOL
}

check_name
fix_name
