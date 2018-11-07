#
# Zookeeper Configs
#
class profile::zookeeper_conf {
  case $ec2_tag_component {
    'qa_usw2': {
      class { '::yapstone_zookeeper':
        server1                => hiera('profile::zookeeper_conf::server1', 'localhost'),
        myid                   => hiera('profile::zookeeper_conf::myid', '1'),
        data_dir               => hiera('profile::zookeeper_conf::data_dir', '/var/lib/zookeeper'),
        tick_time              => hiera('profile::zookeeper_conf::tick_time', '2000'),
        client_port            => hiera('profile::zookeeper_conf::client_port', '2181'),
        init_limit             => hiera('profile::zookeeper_conf::init_limit', '10'),
        sync_limit             => hiera('profile::zookeeper_conf::sync_limit', '5'),
        leader_port            => hiera('profile::zookeeper_conf::leader_port', '2888'),
        leader_election_port   => hiera('profile::zookeeper_conf::leader_election_port', '3888'),
      }
    }
    'st_usw2': {
      class { '::yapstone_zookeeper':
        server1                => hiera('profile::zookeeper_conf::server1'),
        server2                => hiera('profile::zookeeper_conf::server2'),
        server3                => hiera('profile::zookeeper_conf::server3'),
        myid                   => hiera('profile::zookeeper_conf::myid'),
        data_dir               => hiera('profile::zookeeper_conf::data_dir', '/var/lib/zookeeper'),
        tick_time              => hiera('profile::zookeeper_conf::tick_time', '2000'),
        client_port            => hiera('profile::zookeeper_conf::client_port', '2181'),
        init_limit             => hiera('profile::zookeeper_conf::init_limit', '10'),
        sync_limit             => hiera('profile::zookeeper_conf::sync_limit', '5'),
        leader_port            => hiera('profile::zookeeper_conf::leader_port', '2888'),
        leader_election_port   => hiera('profile::zookeeper_conf::leader_election_port', '3888'),
      }
    }
    /pd_(usw2|euw1)/: {
      class { '::yapstone_zookeeper':
        server1                => hiera('profile::zookeeper_conf::server1'),
        server2                => hiera('profile::zookeeper_conf::server2'),
        server3                => hiera('profile::zookeeper_conf::server3'),
        server4                => hiera('profile::zookeeper_conf::server4'),
        server5                => hiera('profile::zookeeper_conf::server5'),
        myid                   => hiera('profile::zookeeper_conf::myid'),
        data_dir               => hiera('profile::zookeeper_conf::data_dir', '/var/lib/zookeeper'),
        tick_time              => hiera('profile::zookeeper_conf::tick_time', '2000'),
        client_port            => hiera('profile::zookeeper_conf::client_port', '2181'),
        init_limit             => hiera('profile::zookeeper_conf::init_limit', '10'),
        sync_limit             => hiera('profile::zookeeper_conf::sync_limit', '5'),
        leader_port            => hiera('profile::zookeeper_conf::leader_port', '2888'),
        leader_election_port   => hiera('profile::zookeeper_conf::leader_election_port', '3888'),
      }
    }
  }
}
