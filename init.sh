#!/bin/bash


ovs-vsctl --db=tcp:$1 add-br br0
ovs-vsctl --db=tcp:$1 set bridge br0 datapath_type=pronto
ovs-vsctl --db=tcp:$1 add-port br0 ge-1/1/$3 -- set Interface ge-1/1/$3 type=pronto
ovs-vsctl --db=tcp:$1 add-port br0 ge-1/1/$4 -- set Interface ge-1/1/$4 type=pronto
ovs-vsctl --db=tcp:$1 set-controller br0 tcp:$2

