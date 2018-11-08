#
# Hosts File
#
class yapstone_config::yap_hosts_file (
  $hosts_file      = [],
  ) {

  file {'/etc/hosts':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    content   => template('yapstone_config/hosts.erb'),
  }
}
