#
# Yapstone Vault Conf
#
class profile::yap_vault {

  class { '::yapstone_config::yap_vault':
    zk1                => hiera('profile::yap_vault::zk1'),
    zk2                => hiera('profile::yap_vault::zk2'),
    zk3                => hiera('profile::yap_vault::zk3'),
    vault_port         => hiera('profile::yap_vault::vault_port', '8200'),
    zk_port            => hiera('profile::yap_vault::zk_port', '2181'),
    default_lease_ttl  => hiera('profile::yap_vault::default_lease_ttl', '43800h'),
    max_lease_ttl      => hiera('profile::yap_vault::max_lease_ttl', '43800h'),
  }
}
