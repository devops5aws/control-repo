#
# Base packages TripWire 2 of 3
#

class profile::package::tw_eg_driver_rhel {
  package { 'tw-eg-driver-rhel':
    ensure => hiera('profile::package::tw_eg_driver_rhel', 'present'),
  }
 }
