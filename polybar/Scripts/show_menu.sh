#!/bin/bash

# Execute the menu script and pass its output to rofi
selected_option=$(./menu_script.sh | rofi -dmenu -p "Select an option:")

# Handle the selected option (for demonstration, just echoing it)
echo "You selected: $selected_option"
