#
# YAP_rp_vacationrentpayment
#
class profile::package::yap_rp_vacationrentpayment {
  package {'YAP_rp_vacationrentpayment':
    ensure => hiera('profile::package::yap_rp_vacationrentpayment', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
