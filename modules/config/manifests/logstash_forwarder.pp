#
# Logstash Forwarder for Client Server
#
class yapstone_config::logstash_forwarder (

  $logstash_servers   = [], 
  $logstash_port      = undef,
  $logstash_timeout   = undef,
  $logstash_ssl_ca    = undef,
  $logstash_paths     = [],
  $field_type         = undef,
  $logstash_ssl_cert  = undef,
  ) {

  $ssl_cert_file = hiera('profile::logstash_forwarder::ssl_cert', '/etc/pki/tls/certs/logstash-forwarder.crt')

  service { 'logstash-forwarder':
    ensure  => 'running',
    enable  => 'true',
  }

  file {'/etc/logstash-forwarder.conf':
    ensure    => 'file',
    owner     => 'root',
    group     => 'root',
    mode      => '0664',
    notify    => Service['logstash-forwarder'],
    content   => template('yapstone_config/logstash_forwarder.conf.erb'),
    require   => [ 
                   Package['logstash-forwarder'],
                   File[ $ssl_cert_file ],
                 ],
  }

  file { $ssl_cert_file:
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0664',
    content   => template('yapstone_config/logstash_forwarder.crt.erb'),
  }
}
