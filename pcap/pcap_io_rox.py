#!/usr/bin/python

import os, sys
import dpkt

counter=0
init_time = 0
filename=sys.argv[1]
pkt_l = []
t_start = 0
avg_io = 121000000
INT = 0.04

for ts, pkt in dpkt.pcap.Reader(open(filename,'r')):
  if counter == 0:
    init_time = ts
  counter += 1

  def get_time(time):
    return time - init_time

  t = get_time(ts)

  if t < 0.5 or t > 1.3:
    continue

  eth=dpkt.ethernet.Ethernet(pkt) 
  if eth.type!=dpkt.ethernet.ETH_TYPE_IP:
    continue

  if eth.data.len >= 1000:
    pkt_l.append(eth.data.len-14)

  interval = (t - t_start)

  if t >= 0.90 and t <= 0.907:
    INT = 0.001
  else:
    INT = 0.02

  if t >= 0.907 and t <= 1.0:
    INT = 0.05

  if interval >= INT:
  #if interval >= 0.01:
    t_start = t
    avg_io = sum(pkt_l) / interval 
    print t, avg_io
    pkt_l = []

#print t, sum(pkt_l) / interval

#print "Total number of packets in the pcap file: ", counter
#print "Total number of ip packets: ", ipcounter
#print "Total number of tcp packets: ", tcpcounter
#print "Total number of udp packets: ", udpcounter
