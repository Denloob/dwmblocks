#!/bin/bash

case $BUTTON in
    4) kitty -e "$EDITOR" "$0" ;;
esac

locip=$(ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p')

if [[ -n $locip ]]; then
    printf '󰩠 %s' "$locip"
fi
