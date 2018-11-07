#
# RPM for logstash-forwarder Client
#
class profile::package::logstash_forwarder {
  package {'logstash-forwarder':
    ensure => hiera('profile::package::logstash_forwarder', 'present'),
  }
}
