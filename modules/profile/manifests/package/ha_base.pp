#
# RPM for Yapstone HomeAway Base
#
class profile::package::ha_base {
  package {'ha-base':
    ensure => hiera('profile::package::habase_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
