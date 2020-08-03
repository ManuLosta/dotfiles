#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar workspaces >>/tmp/polybar1.log 2>&1 &
polybar music >>/tmp/polybar2.log 2>&1 &
polybar status >>/tmp/polybar3.log 2>&1 &


echo "Bars launched..."
