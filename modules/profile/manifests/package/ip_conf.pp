#
# RPM for Yapstone Rent Payment Conf
#
class profile::package::ip_conf {
  package {'ip-conf':
    ensure => hiera('profile::package::ip_conf_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Class[ 'profile::yapstone_env' ],
                 Package[ 'daemontools' ],
                 Package[ 'ip-base' ],
                 Package[ 'apache-tomcat' ],
               ],
  }
}
