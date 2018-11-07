#
# YAP_rp_yapstone
#
class profile::package::yap_rp_yapstone {
  package {'YAP_rp_yapstone':
    ensure => hiera('profile::package::yap_rp_yapstone_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
