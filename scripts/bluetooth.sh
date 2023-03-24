#!/bin/bash

ISRUNNING=$(systemctl status bluetooth.service | grep "Active: active")

case $BUTTON in
    1) 
        if [ -n "$ISRUNNING" ]; then
            # If Bluetooth is running, stop it
            notify-send "Stopping Bluetooth..."
            systemctl stop bluetooth
        else
            # If Bluetooth is not running, start it
            notify-send "Starting Bluetooth..."
            systemctl start bluetooth
        fi
        ;;

    3) kitty -e bluetuith ;;
esac

if [ -n "$ISRUNNING" ]; then
    printf ""
else
    printf "󰂲"
fi

