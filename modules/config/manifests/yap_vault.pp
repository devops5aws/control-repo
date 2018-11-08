#
#
#
class yapstone_config::yap_vault (

  $vault_port         = undef,
  $zk1                = undef,
  $zk2                = undef,
  $zk3                = undef,
  $zk4                = undef,
  $zk5                = undef,
  $zk_port            = undef,
  $default_lease_ttl  = undef,
  $max_lease_ttl      = undef,
  ) {

  file { '/etc/vault/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

  #service { 'vault':
  #  ensure  => 'running',
  #  enable  => 'true',
  #  require => [ Package['vault-server'], Package['vault-conf-prod'] ],
  #}

  file {'/etc/vault/vault.json':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    #notify    => Service['vault'],
    content   => template('yapstone_config/vault.json.erb'),
    require => [ Package['vault-server'], Package['vault-conf-prod'] ],
  }

  file {'/etc/profile.d/vault.sh':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    content   => template('yapstone_config/vault.sh.erb'),
  }

  $repo_name   = hiera('profile::yum_yapbuild_repo::repo_name')

  package { "vault-server": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "vault-conf-prod": ensure => present, require => Yumrepo[ $repo_name ], }

}
