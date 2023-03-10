#!/bin/bash

if [ -f /sys/class/power_supply/BAT0/uevent ]; then
    prct=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
    charging=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2) # POWER_SUPPLY_STATUS=Discharging|Charging

    battery_icons=( "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" )
    
    battery_icon_index=$(( $prct / 10 ))
    icon=${battery_icons[$battery_icon_index]}

    if [ $charging = "Charging" ]; then
        icon+="󱐋"
    fi

    echo -n "${icon} ${prct}%"
else
    echo -n "󰂃 ??%"
fi
