#!/bin/bash

BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [[ $BATTERY_STATUS != "Charging" && $BATTERY_LEVEL -le 10 ]]; then
    notify-send -u critical -i battery-caution "CRITICAL BATTERY WARNING" "Battery at ${BATTERY_LEVEL}%! Plug in your machine NOW!"
    
    # Also try to show a zenity dialog for maximum visibility
    if command -v zenity &> /dev/null; then
        zenity --warning --text="CRITICAL BATTERY: ${BATTERY_LEVEL}%\nPlug in your machine NOW!" --width=400 --height=200 2>/dev/null &
    fi
fi