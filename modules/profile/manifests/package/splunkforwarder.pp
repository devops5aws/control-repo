#
# Base packages splunkforwarder
#

class profile::package::splunkforwarder {
   package { splunkforwarder:
     ensure => present,
   }
 }
