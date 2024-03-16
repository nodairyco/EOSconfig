
#!/bin/bash

# Set the amount to increase/decrease gaps
amount=10

# Increase or decrease gaps
case "$1" in
    "increase")
        i3-msg gaps inner current plus $amount
        i3-msg gaps outer current plus $amount
        ;;
    "decrease")
        i3-msg gaps inner current minus $amount
        i3-msg gaps outer current minus $amount
        ;;
    *)
        echo "Usage: $0 [increase|decrease]"
        exit 1
        ;;
esac

