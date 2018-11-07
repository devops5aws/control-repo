#
# RPM for Yapstone Farms Base
#

class profile::package::farms_base {
  package {'farms-base':
    ensure => hiera('profile::package::farms_base_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ hiera('profile::package::jdk8_ver', 'jdk1.8.0_74') ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
