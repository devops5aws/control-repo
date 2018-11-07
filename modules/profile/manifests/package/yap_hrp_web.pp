#
# YAP_hrp_web
#
class profile::package::yap_hrp_web {
  package {'YAP_hrp_web':
    ensure => hiera('profile::package::yap_hrp_web_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}