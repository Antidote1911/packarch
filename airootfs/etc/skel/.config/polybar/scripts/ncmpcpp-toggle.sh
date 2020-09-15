#!/bin/bash
if pgrep -x "ncmpcpp" > /dev/null
then
	killall ncmpcpp
else
	termite -e ncmpcpp &
fi
