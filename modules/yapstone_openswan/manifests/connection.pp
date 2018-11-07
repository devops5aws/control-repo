#
# Managing the vpn Connections
#

class yapstone_openswan::connection (
  $ensure         = 'present',
  $connect_name   = undef,
  $type           = undef,
  $authby         = undef,
  $left           = undef,
  $leftid         = undef,
  $leftsubnet     = undef,
  $leftnexthop    = undef,
  $right          = undef,
  $rightsubnet    = undef,
  $pfs            = undef,
  $auto           = undef,
  $compress       = undef,
  $pre_shared_key = undef,
  ) {

  service { 'ipsec':
    ensure     => 'running',
    enable     => 'true',
    require    => Package['openswan'],
  }

  file { "/etc/ipsec.d/$connect_name.conf":
    ensure     => $ensure,
    content    => template('yapstone_openswan/connection.conf.erb'),
    owner      => root,
    group      => root,
    mode       => '0664',
    notify     => Service['ipsec'],
    require    => Package['openswan'], 
  }

  file { "/etc/ipsec.d/$connect_name.secrets":
    ensure     => $ensure,
    content    => template('yapstone_openswan/connection.secrets.erb'),
    owner      => root,
    group      => root,
    mode       => '0664',
    require    => Package['openswan'],
  }
}
