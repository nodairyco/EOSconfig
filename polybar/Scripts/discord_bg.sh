#!/bin/bash

if [ "$1" = "-s" ]; then
    if pgrep -x "Discord" > /dev/null; then
        echo "󰙯"
    else
        echo ""
    fi
elif [ "$1" = "-f" ]; then
    if pgrep -x "Discord" > /dev/null; then
        pkill Discord
    fi
fi

