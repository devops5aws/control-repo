#
# YAP_rp_domestic
#
class profile::package::yap_rp_domestic {
  package {'YAP_rp_domestic':
    ensure => hiera('profile::package::yap_rp_domestic_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
