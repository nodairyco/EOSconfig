#!/bin/bash

Mode=${1}


#change only /home/noklon/Pictures/Screenshots/ to your desired path !!!
screenshot_path="/home/nodariko/Pictures/Screenshots/screenshot_$(date +"%Y-%m-%d-%H-%M-%S").png"

if [ "$Mode" = "-s" ]; then
    # Select mode: Capture a region
    shutter -s -e -o "$screenshot_path" -c
elif [ "$Mode" = "-f" ]; then
    # Fullscreen mode: Capture the entire screen
    maim > "$screenshot_path"
else
    # Focused window mode: Capture the focused window using import
    import -window "$(xdotool getactivewindow)" "$screenshot_path"
fi

# Copy the screenshot to the clipboard
xclip -selection clipboard -t image/png -i "$screenshot_path"

#------------------------------------------------------------------------------
# Dependencies: xclip, maim, imagemagick, xdotool !!!
#------------------------------------------------------------------------------
# i3 config !!!

# full screen picture
#bindsym  $mod+Shift+F exec /home/nodariko/.config/scripts/Screenshot.sh -f

# choose region
#bindsym  $mod+Shift+S exec /home/nodariko/.config/scripts/Screenshot.sh -s

# use current focussed window
#bindsym  $mod+Shift+W exec /home/nodariko/.config/scripts/Screenshot.sh 
#------------------------------------------------------------------------------
