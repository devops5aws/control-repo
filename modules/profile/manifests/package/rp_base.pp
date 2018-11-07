#
# RPM for Yapstone Rent Payment Base
#
class profile::package::rp_base {
  package {'rp-base':
    ensure => hiera('profile::package::rp_base_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
