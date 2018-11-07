#
# RPM for Yapstone Farms Conf
#

class profile::package::farms_conf {
  package {'farms-conf':
    ensure => hiera('profile::package::farms_conf_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ hiera('profile::package::jdk8_ver', 'jdk1.8.0_74') ],
                 Package[ 'farms-base' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
