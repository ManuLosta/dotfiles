#!/bin/sh

ps aux| grep "polybar info"| head -1 | tr -s ' ' |cut -d' ' -f2 | xargs kill
