#
# Manages resolv.conf template
#

class yapstone_config::resolv_conf (
  $search1       = false,
  $search2       = false,
  $resolv_domain = false,
  $nameserver1   = false,
  $nameserver2   = false,
  ) {

  file {'/etc/resolv.conf':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('yapstone_config/resolv.conf.erb'),
  }
}
