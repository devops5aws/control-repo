#
# OpenSwan VPN
#
class yapstone_openswan (
      $ensure           = $::yapstone_openswan::params::ensure,
      $type             = $::yapstone_openswan::params::type,
      $connect_name     = $::yapstone_openswan::params::connect_name,
      $authby           = $::yapstone_openswan::params::authby,
      $left             = $::yapstone_openswan::params::left,
      $leftid           = $::yapstone_openswan::params::leftid,
      $leftsubnet       = $::yapstone_openswan::params::leftsubnet,
      $leftnexthop      = $::yapstone_openswan::params::leftnexthop,
      $right            = $::yapstone_openswan::params::right,
      $rightsubnet      = $::yapstone_openswan::params::rightsubnet,
      $pfs              = $::yapstone_openswan::params::pfs,
      $auto             = $::yapstone_openswan::params::auto,
      $compress         = $::yapstone_openswan::params::compress,
      $pre_shared_key   = $::yapstone_openswan::params::pre_shared_key,
  ) inherits yapstone_openswan::params {

  class {'::yapstone_openswan::connection':
    ensure           => $ensure,
    connect_name     => $connect_name,
    type             => $type,
    authby           => $authby,
    left             => $left,
    leftid           => $leftid,
    leftsubnet       => $leftsubnet,
    leftnexthop      => $leftnexthop,
    right            => $right,
    rightsubnet      => $rightsubnet,
    pfs              => $pfs,
    auto             => $auto,
    pre_shared_key   => $pre_shared_key,
  }

  file { "/etc/ipsec.conf":
    ensure     => $ensure,
    content    => template('yapstone_openswan/ipsec.conf.erb'),
    owner      => root,
    group      => root,
    mode       => '0664',
    require    => Package['openswan'],
  }
}
