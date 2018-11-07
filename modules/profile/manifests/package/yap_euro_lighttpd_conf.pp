#
# RPM for Yapstone Rent Payment 
#
class profile::package::yap_euro_lighttpd_conf {
  package {'yap-euro-lighttpd-conf':
    ensure => hiera('profile::package::yap_euro_lighttpd_conf', 'present'),
    require => Yumrepo[ hiera('profile::yum_yap::repo_name') ],
  }
}
