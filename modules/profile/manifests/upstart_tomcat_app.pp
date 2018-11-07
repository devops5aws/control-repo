#
# Upstart: Manage via Tomcat process
# 
#
class profile::upstart_tomcat_app {

  include ::upstart

  case $ec2_tag_product {
    'rp_app', 'rpr_app':  {
      $pkg_base   = 'rp-base'
      $pkg_conf   = 'rp-conf'
      $pkg_webapp = 'rp-webapp-app'
    }
    'ip_app', 'ipr_app': {
      $pkg_base   = 'ip-base'
      $pkg_conf   = 'ip-conf'
      $pkg_webapp = 'rp-webapp-app'
    }
    'eu_app', 'eur_app': {
      $pkg_base   = 'euro-base'
      $pkg_conf   = 'euro-conf'
      $pkg_webapp = 'euro-webapp'
    }
    'ha_app', 'har_app': {
      $pkg_base   = 'ha-base'
      $pkg_conf   = 'ha-conf'
      $pkg_webapp = 'rp-webapp-app'
    }
    'ca_app', 'car_app': {
      $pkg_base   = 'cathedral-base'
      $pkg_conf   = 'cathedral-conf'
      $pkg_webapp = 'cathedral-webapp-app'
    }
  }

  ::upstart::job { 'tomcat':
    description     => 'Used for Managing Tomcat Services',
    respawn         => true,
    respawn_limit   => '10 5',
    console         => none,
    chdir           => '/usr/share/tomcat/bin',
    exec            => 'setuidgid tomcat envdir /etc/sysconfig/tomcat/env ./catalina.sh run',
    require         => [
                       Class['profile::yapstone_db_user'],
                       Package['jdk'],
                       Package['daemontools'],
                       Package['yaprpmq_xinetd'],
                       Package['apache-tomcat'],
                       Package[ $pkg_base ],
                       Package[ $pkg_conf ],
                       Package[ $pkg_webapp ],
                     ],
  }
}
