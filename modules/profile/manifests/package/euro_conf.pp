#
# RPM for Yapstone Euro Conf
#

class profile::package::euro_conf {
  package {'euro-conf':
    ensure => hiera('profile::package::euro_conf_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
                 Package[ 'jdk' ],
                 Package[ 'euro-base' ],
               ],
  }
}
