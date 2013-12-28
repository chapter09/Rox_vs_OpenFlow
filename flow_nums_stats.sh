#!/bin/bash

while true
do
    #ovs-ofctl dump-flows br0 | wc -l
    ovs-appctl -t /ovs/var/run/openvswitch/ovs-vswitchd.20103.ctl pronto/dump-flows | wc -l
    #ovs-ofctl dump-flows br0 >> flow.log
    #echo '------------------------------------------------------------------------' >> flow.log
    sleep 0.1
done
