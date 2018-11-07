#
# YAP_rp_duespayment
#
class profile::package::yap_rp_duespayment {
  package {'YAP_rp_duespayment':
    ensure => hiera('profile::package::yap_rp_duespayment_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
