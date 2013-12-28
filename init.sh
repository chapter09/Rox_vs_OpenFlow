ovs-vsctl --db=tcp:192.168.11.1:6636 add-br br0
ovs-vsctl --db=tcp:192.168.11.1:6636 set bridge br0 datapath_type=pronto
ovs-vsctl --db=tcp:192.168.11.1:6636 add-port br0 ge-1/1/1 -- set Interface ge-1/1/1 type=pronto
ovs-vsctl --db=tcp:192.168.11.1:6636 add-port br0 ge-1/1/2 -- set Interface ge-1/1/2 type=pronto
ovs-vsctl --db=tcp:192.168.11.1:6636 set-controller br0 tcp:192.168.11.254:6633

