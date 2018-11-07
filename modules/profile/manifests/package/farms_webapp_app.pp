#
# RPM for Yapstone Farms WebApp
#

class profile::package::farms_webapp_app {
  case $ec2_tag_product {
    'eu_farms', 'eur_farms': {
      $conf  =  'farmsgd1-conf'
    }
    default: {
      $conf  =  'farms-conf'
    }
  }
    
  package {'farms-webapp-app':
    ensure => hiera('profile::package::farms_webapp_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ hiera('profile::package::jdk8_ver', 'jdk1.8.0_74') ],
                 Package[ 'farms-base' ],
                 Package[ $conf ],
               ],
  }
}
