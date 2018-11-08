#
# Managing the user for the service, as well as directories within...
#

class yapstone_wordpress::user (
  $server_user       = undef,
  $server_group      = undef,
  ) {

  group { $server_group:
    ensure  => present,
  }

  user { $server_user:
    ensure       => present,
    comment      => 'User for lighttpd',
    groups       => 'www',
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

  file { '/var/www/cache':
    ensure => directory,
    owner  => $server_user,
    group  => $server_group,
    mode   => 0755,
  }
}
