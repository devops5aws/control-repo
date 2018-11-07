#
# Logstash Forwarder Client
# Ships logs to logstash
class profile::logstash_forwarder_client {
  class {'::yapstone_config::logstash_forwarder':
    # Not in use only have 1 server
    #logstash_servers          => hiera_array('profile::logstash_forwarder::servers'),
    logstash_port             => hiera('profile::logstash_forwarder::port', '5000'),
    logstash_timeout          => hiera('profile::logstash_forwarder::timeout', '15'),
    logstash_ssl_ca           => hiera('profile::logstash_forwarder::ssl_ca', '/etc/pki/tls/certs/logstash-forwarder.crt'),
    logstash_paths            => hiera_array('profile::logstash_forwarder::paths'),
    field_type                => hiera('profile::logstash_forwarder::field_type', 'syslog'), 
    logstash_ssl_cert         => hiera('profile::logstash_forwarder::logstash_ssl_cert'),
  }
}
