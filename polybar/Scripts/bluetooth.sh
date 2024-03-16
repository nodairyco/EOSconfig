#!/bin/bash

bluetooth_list=$(bluetoothctl devices | awk '{print $2}')

formatted_list=""
while read -r device_id; do
    device_name=$(bluetoothctl info "$device_id" | awk '/Device/ {print $2}')
    formatted_list+=" $device_name\n"
done <<< "$bluetooth_list"

chosen=$(echo -e "$formatted_list" | rofi -theme ~/.config/rofi/applets/type-1/style-3.rasi -dmenu -p "Bluetooth devices:")

if [ -n "$chosen" ]; then
    device_id=$(bluetoothctl devices | grep "$chosen" | awk '{print $2}')
    bluetoothctl connect "$device_id"
fi
