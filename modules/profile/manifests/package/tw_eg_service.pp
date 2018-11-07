#
# Base packages TripWire 3 of 3
#

class profile::package::tw_eg_service {
   package { 'tw-eg-service':
     ensure => hiera('profile::package::tw_eg_service', 'present'),
   }
 }
