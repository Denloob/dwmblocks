#!/bin/bash

case $BUTTON in
    4) kitty -e "$EDITOR" "$0" ;;
esac

pubip=$(curl -s https://ipv4.geojs.io/v1/ip/geo.json | jq -r '.ip')

if [[ -n $pubip ]]; then
    printf '󰑩 %s' "$pubip"
fi
