#!/bin/bash

gpio mode 1 out

max=50
min=40
temp=`/opt/vc/bin/vcgencmd measure_temp | grep -E -o '[0-9]{2,3}'`
cooling=`gpio read 1`

echo "Temp: $temp"
if [[ "$temp" -gt "$max" ]] && [[ "$cooling" == 0 ]]; then 
  echo "Cooling!"
  gpio write 1 1
fi;

if [[ "$temp" -lt "$min" ]] && [[ "$cooling" == 1 ]]; then
  echo "Stop cooling."
  gpio write 1 0
fi;
