INTERFACE=wlan0

# when no wireless at all, do not display this block
if [ ! -d "/sys/class/net/${INTERFACE}/wireless" ]; then
    exit
fi

case $BUTTON in
    1) kitty -e nmtui ;;
    4) kitty -e "$EDITOR" "$0" ;;
esac

# if wifi down
if [ "$(cat /sys/class/net/$INTERFACE/operstate)" = "down" ]; then
    printf "󰤮"
    exit
fi

QUALITY=$(grep $INTERFACE /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

if (( $QUALITY > 85 )); then
    printf "󰤨"
elif (( $QUALITY > 70 )); then
    printf "󰤥"
elif (( $QUALITY > 50 )); then
    printf "󰤢"
elif (( $QUALITY > 30 )); then
    printf "󰤟"
else 
    printf "󰤯"
fi 

