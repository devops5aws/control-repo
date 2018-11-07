#
# Custom resolv.conf based on region
#

class profile::resolv_conf {

  # Second search parameter is optional, but at least one required. Same goes for nameserver
  $search1 = hiera('profile::resolv_conf::search1')
  $search2 = hiera('profile::resolv_conf::search2', false)
  $nameserver1 = hiera('profile::resolv_conf::nameserver1')
  $nameserver2 = hiera('profile::resolv_conf::nameserver2', false)
  $resolv_domain = hiera('profile::resolv_conf::domain')

  class {'yapstone_config::resolv_conf':
    resolv_domain => $resolv_domain,
    nameserver1   => $nameserver1,
    nameserver2   => $nameserver2,
    search1       => $search1,
    search2       => $search2,
  }
}
