#
# RPM for Yapstone Farms Euro GD1 Conf
#

class profile::package::farmsgd1_conf {
  package {'farmsgd1-conf':
    ensure => hiera('profile::package::farmsgd1_conf_ver', 'present'),
    before => Package['farms-webapp-app'],
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ hiera('profile::package::jdk8_ver', 'jdk1.8.0_74') ],
                 Package[ 'farms-base' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
