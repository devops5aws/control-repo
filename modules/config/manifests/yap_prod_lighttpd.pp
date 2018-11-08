#
# Yapstone Package Production lighttpd
#
class yapstone_config::yap_prod_lighttpd (
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
  $service_name                     = undef,
  ) {

  file {"/etc/lighttpd/lighttpd.conf":
    ensure    => present,
    content   => template('yapstone_config/prod_lighttpd.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    require   => Package['lighttpd'],
    notify    => Service['lighttpd'],
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
           '/var/www/cache',
          ]:
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }
}
