#!/bin/env bash

file=/tmp/cpu

ex="false"
[ ! -s $file ] && ex="true"

useage=$(head -n1 $file)
temperature=$(tail -n1 $file)

useage=$(echo "${useage%%.*}" | sed "s/^\(..\)$/\1  /" | sed "s/^\(.\)$/\1    /" )

[[ "$ex" == "false" ]] && echo "%{T2}$useage%%{F-}"

useage=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat)| tr -s ' ' | cut -d' ' -f2,4,5| tr '\n' ' '| sed "s/^\([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) \([^ ]*\) $/(\1-\4+\2-\5)*100\/(\1-\4+\2-\5+\3-\6)/g"| calc -dp)

temperature=$(cat /sys/devices/pci0000:00/0000:00:08.1/0000:07:00.0/hwmon/hwmon2/temp1_input | tail -n1 | sed 's/...$/°/')

echo "$useage" > $file
echo "$temperature" >> $file
[[ "$ex" == "true" ]] && exit 1 || exit 0
