#
# Yapstone Custom Zookeeper configs
#
class yapstone_zookeeper (
  $server1                = $::yapstone_zookeeper::params::server1,
  $server2                = $::yapstone_zookeeper::params::server2,
  $server3                = $::yapstone_zookeeper::params::server3,
  $server4                = $::yapstone_zookeeper::params::server4,
  $server5                = $::yapstone_zookeeper::params::server5,
  $data_dir               = $::yapstone_zookeeper::params::data_dir,
  $tick_time              = $::yapstone_zookeeper::params::tick_time,
  $init_limit             = $::yapstone_zookeeper::params::init_limit,
  $sync_limit             = $::yapstone_zookeeper::params::sync_limit,
  $client_port            = $::yapstone_zookeeper::params::client_port,
  $server_port1           = $::yapstone_zookeeper::params::server_port1,
  $server_port2           = $::yapstone_zookeeper::params::server_port2,
  $leader_port            = $::yapstone_zookeeper::params::learder_port,
  $leader_election_port   = $::yapstone_zookeeper::params::leader_election_port,
  $myid                   = $::yapstone_zookeeper::params::myid,
  ) inherits yapstone_zookeeper::params {

  class { '::yapstone_zookeeper::zoo_conf':
    server1                => $server1,
    server2                => $server2,
    server3                => $server3,
    server4                => $server4,
    server5                => $server5,
    data_dir               => $data_dir,
    tick_time              => $tick_time,
    init_limit             => $init_limit,
    sync_limit             => $sync_limit,
    client_port            => $client_port,
    leader_port            => $leader_port,
    leader_election_port   => $leader_election_port,
    myid                   => $myid,
  }
}
