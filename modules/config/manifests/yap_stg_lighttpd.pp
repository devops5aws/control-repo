#
# Yapstone Package Stage lighttpd
#
class yapstone_config::yap_stg_lighttpd (
  $server_user                      = undef,
  $server_group                     = undef,
  $server_port                      = undef,
  $server_documentroot              = undef,
  $server_pidfile                   = undef,
  $server_tag                       = undef,
  $server_maxconns                  = undef,
  $server_maxfds                    = undef,
  $server_accesslog                 = undef,
  $server_errorlog                  = undef,
  $http_remoteip                    = undef,
  $co_uk_remoteip                   = undef,
  $eurotest_rp_remoteip             = undef,
  $farms_remoteip                   = undef,
  $proxy_url_farms                  = undef,
  $app_farms_hostname               = undef,
  $ssl_pemfile                      = undef,
  $ssl_ca_file                      = undef,
  $ssl_ca_bundle_pem                = undef,
  $verticle_pem_key                 = undef,
  $yap_url                          = undef,
  $proxy_url                        = [],
  $proxy_url_ip                     = undef,
  $proxy_url_script                 = undef,
  $proxy_url_server_port            = undef,
  $app_hostname                     = undef,
  $service_name                     = undef,
  ) {

  $verticle_pem  = hiera('profile::stg_lighttpd::cert_name', 'undef')

  file {"/etc/lighttpd/lighttpd.conf":
    ensure    => present,
    content   => template('yapstone_config/stg_lighttpd.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    require   => Package['lighttpd'],
    notify    => Service['lighttpd'],
}

  file {"/etc/lighttpd/inc/proxy_url.sh":
    ensure    => present,
    content   => template('yapstone_config/proxy_url.sh.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0751',
    require   => Package['lighttpd'],
  }

  file { "/etc/lighttpd/ssl/$verticle_pem.pem":
    ensure    => present,
    content   => template('yapstone_config/verticle.pem.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    require   => Package['lighttpd'],
  }

  file {"/etc/lighttpd/ssl/SSL_CA_Bundle.pem":
    ensure    => present,
    content   => template('yapstone_config/SSL_CA_Bundle.pem.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
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

  file { [ '/var/log/lighttpd',
           '/etc/lighttpd/inc',
           '/etc/lighttpd/ssl',
           '/var/www/cache',
          ]:
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }

}
