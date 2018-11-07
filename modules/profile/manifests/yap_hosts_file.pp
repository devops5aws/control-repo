#
# Manages /etc/hosts
#
class profile::yap_hosts_file {

  class { 'yapstone_config::yap_hosts_file':
    hosts_file    => hiera_array('profile::yapstone_config::hosts_file', []),
  }
}
