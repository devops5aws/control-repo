#
# Base packages TripWire 1 of 3
#

class profile::package::axon_agent {
   package { 'axon-agent':
     ensure => hiera('profile::package::axon_agent', 'present'),
   }
 }
