#
# RPM for Yapstone Homeaway lighttpd Configs
#
class profile::package::yap_ha_lighttpd_conf {
  package {'yap-ha-lighttpd-conf':
    ensure => hiera('profile::package::haway_lighttpd_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
