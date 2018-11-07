#
# Yapstone Package EURO custom lighttpd
#
class yapstone_config::yap_euw1_lighttpd (
  $server_user            = undef,
  $server_group           = undef,
  $server_port            = undef,
  $server_documentroot    = undef,
  $server_pidfile         = undef,
  $server_tag             = undef,
  $server_maxconns        = undef,
  $server_maxfds          = undef,
  $server_accesslog       = undef,
  $server_errorlog        = undef,
  $proxy_url              = [],
  $proxy_url_script       = undef,
  $http_remoteip          = undef,
  $http_remoteip_admin    = undef,
  $http_remoteip_office   = undef,
  $ssl_pemfile            = undef,
  $ssl_ca_file            = undef,
  $holidayrentpayment_pem = undef,
  $ssl_ca_bundle_pem      = undef,
  $proxy_url_ip           = undef,
  $proxy_url_server_port  = undef,
  ) {

  file {"/etc/lighttpd/lighttpd.conf":
    ensure    => present,
    content   => template('yapstone_config/euw1_lighttpd.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    require   => Package['lighttpd'],
  }

  file {"/etc/lighttpd/inc/proxy_url.sh":
    ensure    => present,
    content   => template('yapstone_config/proxy_url.sh.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0751',
    require   => Package['lighttpd'],
  }

  file {"/etc/lighttpd/ssl/holidayrentpayment.pem":
    ensure    => present,
    content   => template('yapstone_config/holidayrentpayment.pem.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    loglevel  => crit,
    require   => Package['lighttpd'],
  }

  file {"/etc/lighttpd/ssl/SSL_CA_Bundle.pem":
    ensure    => present,
    content   => template('yapstone_config/SSL_CA_Bundle.pem.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    loglevel  => crit,
    require   => Package['lighttpd'],
  }

  ### Adding Users ###
  group { $server_group:
    ensure  => present,
  }

  user { $server_user:
    ensure       => present,
    comment      => 'User for lighttpd',
    groups       => $server_group,
    managehome   => true,
    home         => '/var/www',
    shell        => '/sbin/nologin',
  }

  file { '/var/log/lighttpd':
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }

  file { '/etc/lighttpd/inc':
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }

  file { '/etc/lighttpd/ssl':
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }

  file { '/var/www/cache':
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }
}
