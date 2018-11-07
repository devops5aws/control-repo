#
# RPM for Yapstone Cathedral Conf
#

class profile::package::cathedral_conf {
  package {'cathedral-conf':
    ensure => hiera('profile::package::cathedral_conf_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 Package[ 'cathedral-base' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
