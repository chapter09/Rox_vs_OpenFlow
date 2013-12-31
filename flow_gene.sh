#!/bin/bash

#tcpdump -i eth1 -s 100 -w tcp.pcap

#sudo tcpdump -i eth3 -s 80 -w tcp-29-12.pcap

i=0
while [ $i -le 1300 ]
do
  iperf -c 192.168.22.12 -n 40KB 
  i=$(( $i+1 ))
  #echo $i
  sleep 1
done
