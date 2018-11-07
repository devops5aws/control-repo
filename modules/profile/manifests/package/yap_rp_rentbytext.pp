#
# YAP_rp_rentbytext
#
class profile::package::yap_rp_rentbytext {
  package {'YAP_rp_rentbytext':
    ensure => hiera('profile::package::yap_rp_rentbytext_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
