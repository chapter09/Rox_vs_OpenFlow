#!/bin/bash
c=6000
while [ $c -ge 5900 ]
do
  iperf -c 192.168.22.12 -P 10
  sleep 10
  (( c-- ))
done
