#!/bin/bash

printf " "

case $BUTTON in
    4) kitty -e "$EDITOR" "$0" ;;
esac

case $(xkb-switch) in
    "us") printf "EN";;
    "il") printf "HE";;
    "ru") printf "RU";;
esac

