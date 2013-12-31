#!/bin/bash

date +%s > time.log
while true
do
    #ovs-ofctl dump-flows br0 | wc -l
    #ovs-ofctl dump-flows br0 | wc -l
    ret=`ovs-appctl -t /ovs/var/run/openvswitch/ovs-vswitchd.$1.ctl pronto/dump-flows | wc -l`
    echo $ret
    if [[ $ret = 2045 ]]; then
        ovs-ofctl dump-flows br0 | tail -n 1
        date +%s >> time.log
    #ovs-ofctl dump-flows br0 >> flow.log
    #echo '------------------------------------------------------------------------' >> flow.log
    fi
    sleep 0.1
done
