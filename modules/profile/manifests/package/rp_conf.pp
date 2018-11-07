#
# RPM for Yapstone Rent Payment Conf
#
class profile::package::rp_conf {
  package {'rp-conf':
    ensure => hiera('profile::package::rp_conf_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
                 Package[ 'daemontools' ],
                 Package[ 'rp-base' ],
                 Package[ 'apache-tomcat' ],
               ],
  }
}
