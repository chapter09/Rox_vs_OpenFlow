#!/bin/bash

tcpdump -i eth1 -s 100 -w tcp.pcap

i=0
while [ $i -le 40 ]
do
  iperf -c 192.168.22.11 -P 30 -n 10KB
  i=$(( $i+1 ))
  sleep 3
done
