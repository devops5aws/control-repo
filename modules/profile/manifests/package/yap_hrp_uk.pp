#
# YAP_hrp_uk
#
class profile::package::yap_hrp_uk {
  package {'YAP_hrp_uk':
    ensure => hiera('profile::package::yap_hrp_uk_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}