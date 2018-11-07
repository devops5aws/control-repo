#
# YAP_rp_innpayment
#
class profile::package::yap_rp_innpayment {
  package {'YAP_rp_innpayment':
    ensure => hiera('profile::package::yap_rp_innpayment', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
