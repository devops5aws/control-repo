#
#  Skeleton for Upstart
#  Needed because of new rpm will not install 
#  Unless it has the upstart config first
class profile::upstart_skel {
  
  case $ec2_tag_product {
    'rp_app', 'rpr_app':  {
      $pkg_webapp = 'rp-webapp-app'
    }
    'ip_app', 'ipr_app': {
      $pkg_webapp = 'rp-webapp-app'
    }
    'eu_app', 'eur_app': {
      $pkg_webapp = 'euro-webapp'
    }
    'ha_app', 'har_app': {
      $pkg_webapp = 'rp-webapp-app'
    }
    'ca_app', 'car_app': {
      $pkg_webapp = 'cathedral-webapp-app'
    }
    'farms', 'eu_farms': {
      $pkg_webapp = 'farms-webapp-app'
    }
  }

  # touch the upstart file 
  # profile::upstart_tomcat will take over afterwards
  exec { 'skel_upstart_tomcat':
    command => "touch /etc/init/tomcat.conf",
    creates => '/etc/init/tomcat.conf',
    path    => [ '/bin', '/etc/init' ],
    before  => Package[ $pkg_webapp ],
  }
}
