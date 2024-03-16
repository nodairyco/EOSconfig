#!/bin/bash

current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ "$current_layout" == "us" ]; then 
  echo "US"
else 
  echo "GE"
fi 
