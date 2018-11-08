#
# Yapstone Package to deal with custom lighttpd
# not needed anymore profile::package::yap_ha_lighttpd_conf
#
class yapstone_config::yap_haway_lighttpd (
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
  ) {

  if $ec2_tag_component == 'qa' or $ec2_tag_component == 'stg' {
    file {"/etc/lighttpd/lighttpd.conf":
      ensure    => present,
      content   => template('yapstone_config/haway_lighttpd.conf.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   => Package['lighttpd'],
    }
  }
  else {
    file {"/etc/lighttpd/lighttpd.conf":
      ensure    => present,
      content   => template('yapstone_config/haway_lighttpd.conf.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   => Package['lighttpd'],
    }
  }

  ### Adding Users ###
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
