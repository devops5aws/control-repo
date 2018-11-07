#
# YAP_hrp_eu
#
class profile::package::yap_hrp_eu {
  package {'YAP_hrp_eu':
    ensure => hiera('profile::package::yap_hrp_eu_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}