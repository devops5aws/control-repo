#
# RPM for Yapstone Cathedral Base
#

class profile::package::cathedral_base {
  package {'cathedral-base':
    ensure => hiera('profile::package::cathedral_base_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
