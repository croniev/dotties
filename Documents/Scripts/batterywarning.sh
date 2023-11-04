#!/bin/bash

export $(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u croniev cinnamon-sessio | head -n 1)/environ | tr '\0' '\n')

BATTERY_PATH=$(upower -e | grep battery)
echo $BATTERY_PATH
LINE_POWER_PATH=$(upower -e | grep line_power)
echo $LINE_POWER_PATH
BATTERY_PERCENTAGE=$(upower -i $BATTERY_PATH | grep 'percentage:' | awk '{ print $2 }' | sed 's/%//')
echo $BATTERY_PERCENTAGE
CABLE_PLUGGED=$(upower -i $LINE_POWER_PATH | grep -A2 'line-power' | grep online | awk '{ print $2 }')
echo $CABLE_PLUGGED

if !(cinnamon-screensaver-command -q | grep "is active"); then
    if [[ $CABLE_PLUGGED == 'no' ]]; then

        if [[ $BATTERY_PERCENTAGE -lt 23 ]]; then
            zenity --warning --title "Battery Low" --text "Low battery c$BATTERY_PERCENTAGEc" --display=:0.0
        fi


    else

        if [[ $BATTERY_PERCENTAGE -gt 93 ]]; then
            zenity --warning --title "Battery Full" --text "Fully charged ($BATTERY_PERCENTAGE)" --display=:0.0
        fi

    fi
fi
