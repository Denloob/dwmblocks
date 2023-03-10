if [ -f /sys/class/power_supply/BAT0/uevent ]; then
    prct=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
    charging=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2) # POWER_SUPPLY_STATUS=Discharging|Charging
    icon="󰂃"

    if [ $charging = "Charging" ]; then
        if [ $prct -lt 10 ]; then
            icon="󰢟"
        elif [ $prct -ge 10 -a $prct -lt 20 ]; then
            icon="󰢜"
        elif [ $prct -ge 20 -a $prct -lt 30 ]; then
            icon="󰂆"
        elif [ $prct -ge 30 -a $prct -lt 40 ]; then
            icon="󰂇"
        elif [ $prct -ge 40 -a $prct -lt 50 ]; then
            icon="󰂈"
        elif [ $prct -ge 50 -a $prct -lt 60 ]; then
            icon="󰢝"
        elif [ $prct -ge 60 -a $prct -lt 70 ]; then
            icon="󰂉"
        elif [ $prct -ge 70 -a $prct -lt 80 ]; then
            icon="󰢞"
        elif [ $prct -ge 80 -a $prct -lt 90 ]; then
            icon="󰂊"
        elif [ $prct -ge 90 -a $prct -lt 98 ]; then
            icon="󰂋"
        elif [ $prct -ge 98 ]; then
            icon="󰂅"
        fi
    else
        if [ $prct -lt 10 ]; then
            icon="󱉞"
        elif [ $prct -ge 10 -a $prct -lt 20 ]; then
            icon="󰁺"
        elif [ $prct -ge 20 -a $prct -lt 30 ]; then
            icon="󰁻"
        elif [ $prct -ge 30 -a $prct -lt 40 ]; then
            icon="󰁼"
        elif [ $prct -ge 40 -a $prct -lt 50 ]; then
            icon="󰁽"
        elif [ $prct -ge 50 -a $prct -lt 60 ]; then
            icon="󰁾"
        elif [ $prct -ge 60 -a $prct -lt 70 ]; then
            icon="󰁿"
        elif [ $prct -ge 70 -a $prct -lt 80 ]; then
            icon="󰂀"
        elif [ $prct -ge 80 -a $prct -lt 90 ]; then
            icon="󰂁"
        elif [ $prct -ge 90 -a $prct -lt 98 ]; then
            icon="󰂂"
        elif [ $prct -ge 98 ]; then
            icon="󰁹"
        fi
    fi

    echo -n "${icon} ${prct}%"
else
    echo -n "󰂃 ??%"
fi
