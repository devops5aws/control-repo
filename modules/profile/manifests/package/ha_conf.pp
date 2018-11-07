#
# RPM for Yapstone HomeAway Configs
#
class profile::package::ha_conf {
  package {'ha-conf':
    ensure => hiera('profile::package::haconf_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
