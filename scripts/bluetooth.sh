#!/bin/bash

case $BUTTON in
    1) kitty -e bluetuith ;;
    4) kitty -e "$EDITOR" "$0" ;;
    6) bluetooth toggle
esac

ISRUNNING=$(bluetooth | grep "on")

if [ -n "$ISRUNNING" ]; then
    printf ""
else
    printf "󰂲"
fi

