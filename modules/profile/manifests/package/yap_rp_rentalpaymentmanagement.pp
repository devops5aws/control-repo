#
# YAP_rp_rentalpaymentmanagement
#
class profile::package::yap_rp_rentalpaymentmanagement {
  package {'YAP_rp_rentalpaymentmanagement':
    ensure => hiera('profile::package::yap_rp_rentalpaymentmanagement_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
