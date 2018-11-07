#
# Creating Config Keys for Socket Server
#
class yapstone_config::socket_server_key (

  $current_key        = undef,
  $possible_keys      = undef,
  ) {

  file {'/opt/yapstone/socketServer/conf/rentpayment_root.properties':
    ensure    => present,
    owner     => 'yapstone',
    group     => 'yapstone',
    mode      => '0644',
    notify    => Service['tomcat'],
    content   => template('yapstone_config/socketserver_rentpayment_root.properties.erb'),
    require => [
                 Package['jdk'],
                 Package['yap-socketServer'],
                 File['/opt/yapstone/socketServer/conf'],
               ],
  }
}
