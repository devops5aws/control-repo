#
# RPM for Yapstone Euro Base
#

class profile::package::euro_base {
  package {'euro-base':
    ensure => hiera('profile::package::euro_base_ver', 'present'),
    require => [
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
               ],
  }
}
