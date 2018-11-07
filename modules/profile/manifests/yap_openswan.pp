#
#  OpenSwan VPN Configs
#
class profile::yap_openswan {

  class { '::yapstone_openswan':
      type             => hiera('profile::yap_openswan::type', 'tunnel'),
      connect_name     => hiera('profile::yap_openswan::connect_name'),
      authby           => hiera('profile::yap_openswan::authby', 'secret'),
      left             => hiera('profile::yap_openswan::left', '%defaultroute'),
      leftid           => hiera('profile::yap_openswan::leftid', $ec2_public_ipv4),
      leftsubnet       => hiera('profile::yap_openswan::leftsubnet'),
      leftnexthop      => hiera('profile::yap_openswan::leftnexthop', '%defaultroute'),
      right            => hiera("profile::yap_openswan::right"),
      rightsubnet      => hiera('profile::yap_openswan::rightsubnet'),
      pfs              => hiera('profile::yap_openswan::pfs', 'yes'),
      auto             => hiera('profile::yap_openswan::auto', 'start'),
      compress         => hiera('profile::yap_openswan::compress', 'no'),
      pre_shared_key   => hiera('profile::yap_openswan::pre_shared_key'),
    }
}
