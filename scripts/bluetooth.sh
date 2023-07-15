#!/bin/bash

ISRUNNING=$(systemctl status bluetooth.service | grep "Active: active")

case $BUTTON in
    1) kitty -e bluetuith ;;
esac

if [ -n "$ISRUNNING" ]; then
    printf ""
else
    printf "󰂲"
fi

