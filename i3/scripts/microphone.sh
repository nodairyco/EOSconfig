
#!/bin/bash

# Capture the current microphone percentage
mic_percentage=$(pactl list sources | grep -A 10 'Name: .*\.monitor' | grep 'Volume:' | awk '{print $5}' | tr -d '%')
const_inc=2
# Bar color for the notification
bar_colour=#7f7fff
icon=""

notif(){
  if pactl list sources | grep -q 'Mute: yes'; then
    dunstify -t 7000 -r 2593 -u normal "$icon MUTED" 
  else
    dunstify -u normal "" -t 1000 -r 2593 -h int:value:$mic_percentage -h string:hlcolor:$bar_colour
  fi
}

increase_mic(){
  inc=$(echo "$mic_percentage+$const_inc" | bc)
  if [ "$inc" -le 100 ]; then 
    pactl set-source-volume @DEFAULT_SOURCE@ $inc%
  fi
}

decrease_mic(){
  inc=$(echo "$mic_percentage-$const_inc" | bc)
  if [ "$inc" -ge 0 ]; then 
    pactl set-source-volume @DEFAULT_SOURCE@ $inc%
  fi 
}

mute_mic(){
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

case $1 in
  -m)
    mute_mic
    notif
    ;;
  -i)
    increase_mic
    notif
    ;;
  -d)
    decrease_mic
    notif
    ;;
esac

