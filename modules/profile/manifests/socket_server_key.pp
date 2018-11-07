#
# SocketServer Key Configs
#
class profile::socket_server_key {

  class { 'yapstone_config::socket_server_key':
    current_key     => hiera('profile::socket_server::current_key'),
    possible_keys   => hiera('profile::socket_server::possible_keys'),
  }
}
