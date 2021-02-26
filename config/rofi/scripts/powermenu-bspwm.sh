#!/usr/bin/env bash

## Author : Crustware
## Mail : crustware@gmail.com
## Github : Crustware

rofi_command="rofi -location 6 -yoffset -60 -line-padding 4 -columns 1 -width 5 -lines 10 -padding 25"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="Shut Down"
reboot="Reboot"
logout="Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$logout"

chosen="$(echo -e "$options" | $rofi_command -dmenu "UP - $uptime" -d)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $logout)
        bspc quit
        ;;    
esac

