#!/bin/bash

theme="$HOME/.config/rofi/config.rasi"

shutdown="⏻  Выключить"
reboot="⏻  Перезагрузить"
lock="⏻   Заблокировать"
logout="⏻   Выйти"

options="$shutdown\n$reboot\n$lock\n$logout"

chosen="$(echo -e "$options" | rofi -dmenu -i -theme $theme -p "Действие:")"

case $chosen in
    $shutdown) poweroff ;;
    $reboot) reboot ;;
    $lock) hyprlock ;;
    $logout) hyprctl dispatch exit ;;
esac
