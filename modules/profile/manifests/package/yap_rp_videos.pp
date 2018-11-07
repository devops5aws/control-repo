#
# YAP_rp_videos
#
class profile::package::yap_rp_videos {
  package {'YAP_rp_videos':
    ensure => hiera('profile::package::yap_rp_videos_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
