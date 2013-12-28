"""
Adding the 'topos' dict with a key/value pair to generate our newly defined
topology enables one to pass in '--topo=mytopo' from the command line.
"""

from mininet.topo import Topo

class S_FT_Topo(Topo):
  "Simple topology example."
  def __init__(self):
    "Create custom topo."

    # Initialize topology
    Topo.__init__(self)

    # Add hosts and switches
    left_host = self.addHost('h1')
    right_host = self.addHost('h2')

    core_switch = self.addSwitch('s3')
    left_upper_switch = self.addSwitch('s4')
    left_lower_switch = self.addSwitch('s5')
    right_upper_switch = self.addSwitch('s6')
    right_lower_switch = self.addSwitch('s7')

    # Add links
    self.addLink(left_host, left_lower_switch)
    self.addLink(right_host, right_lower_switch)
    self.addLink(left_lower_switch, left_upper_switch)

    self.addLink(left_upper_switch, core_switch)
    self.addLink(right_lower_switch, right_upper_switch)
    self.addLink(right_upper_switch, core_switch)

topos = { 's_ftree': ( lambda: S_FT_Topo() ) }
