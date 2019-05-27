#!/bin/bash

gpio mode 1 out

case $1 in
  start)
    gpio write 1 1
    ;;
  stop)
    gpio write 1 0
    ;;
  *)
    echo -e "Usage: $0 start|stop\n"
esac
