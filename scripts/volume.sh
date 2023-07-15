#!/bin/bash

case $BUTTON in
    1) kitty -e alsamixer ;;
    4) kitty -e "$EDITOR" "$0" ;;
esac

amixer_output=$(amixer sget Master)

left_volume=$(echo "$amixer_output" | awk -F"[][]" '/Left:/ {print $2}' | tr -d '%')
right_volume=$(echo "$amixer_output" | awk -F"[][]" '/Right:/ {print $2}' | tr -d '%')

volumes=("$left_volume" "$right_volume")

for i in "${!volumes[@]}"; do
    volume="${volumes[$i]}"
    if (( volume > 60 )); then
        printf "󰕾"
    elif (( volume > 30 )); then
        printf "󰖀"
    else
        printf "󰕿"
    fi

    # prints ' ' + volume + '%' + ' ' (if not the last element)
    printf " %s%%" "$volume"
    if [[ $i -ne $((${#volumes[@]} - 1)) ]]; then
        printf " "
    fi
done
