#!/bin/bash

[[ "$(playerctl -p spotify status 2>/dev/null)" == "Playing" ]] && echo "" || echo ""
