#
# YAP_rp_storagerentpayment
#
class profile::package::yap_rp_storagerentpayment {
  package {'YAP_rp_storagerentpayment':
    ensure => hiera('profile::package::yap_rp_storagerentpayment_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
