#
# YAP_rp_utilitypayment
#
class profile::package::yap_rp_utilitypayment {
  package {'YAP_rp_utilitypayment':
    ensure => hiera('profile::package::yap_rp_utilitypayment_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],

  }
}
