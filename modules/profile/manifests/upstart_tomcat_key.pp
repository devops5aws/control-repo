#
# Upstart: Manage via Tomcat process
# 
#
class profile::upstart_tomcat_key {

  include ::upstart

  ::upstart::job { 'tomcat':
    description     => 'Used for Managing Tomcat Key',
    respawn         => true,
    respawn_limit   => '10 5',
    console         => none,
    exec            => '/opt/yapstone/socketServer/service/socketServer/run',
    require         => [ Package['yap-socketServer'], Package['jdk'],],
  }
}
