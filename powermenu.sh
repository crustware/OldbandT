#!/usr/bin/env bash

## Author : Crustware
## Mail : crustware@gmail.com
## Github : Crustware

wofi_command="wofi -s /home/crust/.config/wofi/style.css"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="Shut Down"
reboot="Reboot"
lock="Lock"
suspend="Suspend"
logout="Logout"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $wofi_command -p "UP - $uptime" -d)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock-fancy-multimonitor
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        swaymsg exit
        ;;
esac

