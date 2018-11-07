#
# TripWire Client
# 
class profile::tripwire_agent {
  class {'::yapstone_tripwire::tripwire_agent':
    bridge_host     => hiera('profile::tripwire_agent::bridge_host', '10.50.52.109'),
    bridge_port     => hiera('profile::tripwire_agent::bridge_port', '5670'), 
  }
}
