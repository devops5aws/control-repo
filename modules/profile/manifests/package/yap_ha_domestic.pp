#
# RPM for Yapstone HomeAway Domestic
#
class profile::package::yap_ha_domestic {
  package {'YAP_ha_domestic':
    ensure => hiera('profile::package::ha_domestic_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
