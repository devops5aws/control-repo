#
# Kafka Configs
#
class profile::kafka_conf {
  class { '::kafka':
      version                           => hiera('profile::kafka_conf::version', '0.10.0.0'), 
      scala_version                     => hiera('profile::kafka_conf::scala_version', '2.11'),
      mirror_url                        => hiera('profile::kafka_conf::mirror_url', 'https://s3-us-west-2.amazonaws.com/yapstone-puppet'),
   }

  class { 'kafka::broker':
    config => {
      'broker.id'                       => hiera('profile::kafka_conf::broker_id', '0'),
      'zookeeper.connect'               => hiera('profile::kafka_conf::zookeeper_connect', 'localhost:2181'),
      'listeners'                       => hiera('profile::kafka_conf::listeners', 'PLAINTEXT://:6667'),
      'default.replication.factor'      => hiera('profile::kafka_conf::default_replication_factor', '1'),
      'num.partitions'                  => hiera('profile::kafka_conf::num_partitions', '1'),
    }
  }
}
