#
# RPM for Yapstone Rent Payment Base
#
class profile::package::ip_base {
  package {'ip-base':
    ensure => hiera('profile::package::ip_base_ver', 'present'),
    require => Yumrepo[ hiera('profile::yum_yap::repo_name') ],
  }
}
