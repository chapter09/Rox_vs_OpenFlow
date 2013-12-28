"""
Adding the 'topos' dict with a key/value pair to generate our newly defined
topology enables one to pass in '--topo=mytopo' from the command line.
"""

from mininet.topo import Topo

class Simple_Topo(Topo):
  "Simple topology example."
  def __init__(self):
    "Create custom topo."

    # Initialize topology
    Topo.__init__(self)

    # Add hosts and switches
    left_host = self.addHost('h1')
    right_host = self.addHost('h2')

    core_switch = self.addSwitch('s3')
    #left_switch = self.addSwitch('s3')
    #right_switch = self.addSwitch('s4')

    # Add links
    self.addLink(left_host, core_switch)
    self.addLink(right_host, core_switch)
    #self.addLink(right_switch, left_switch)

topos = { 'simple': ( lambda: Simple_Topo() ) }
