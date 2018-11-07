#
# Upstart: Manage via Tomcat process
# 
#
class profile::upstart_tomcat_farms {

  include ::upstart

  case $ec2_tag_product {
    'eur_farms' , 'eu_farms':  {
      $pkg_conf   = 'farmsgd1-conf'
    }
    default: {
      $pkg_conf   = 'farms-conf'
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
                         Package[ hiera('profile::package::jdk8_ver', 'jdk1.8.0_74') ],
                         Package['daemontools'],
                         Package['yaprpmq_xinetd'],
                         Package['apache-tomcat'],
                         Package['farms-base'],
                         Package[ $pkg_conf ],
                         Package['farms-webapp-app'],
                       ],

  }
}
