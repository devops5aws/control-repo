#
# RPM for Yapstone Rent Payment 
#
class profile::package::rp_webapp_app {
  case $ec2_tag_product {
    'ha_app', 'har_app': {
      $base  = 'ha-base'
      $conf  = 'ha-conf'
    }
    'ip_app', 'ipr_app': {
      $base  = 'ip-base'
      $conf  = 'ip-conf'
    }
    default: {
      $base  =  'rp-base'
      $conf  =  'rp-conf'
    }
  }
  package {'rp-webapp-app':
    ensure => hiera('profile::package::rp_webapp_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 Package[ $base ],
                 Package[ $conf ],
                 Package[ 'daemontools' ],
               ],
  }
}
