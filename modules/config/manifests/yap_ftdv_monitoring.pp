#
# Yapstone FTDv Monitoriing to Switch over on Failure
#
class yapstone_config::yap_ftdv_monitoring (
  $aws_region        = undef,
  $apiurl            = undef,
  $ftdv_routetable   = undef,
  $ftdv1_ip          = undef,
  $ftdv2_ip          = undef,
  $ftdv1_eni         = undef,
  $ftdv2_eni         = undef,
  $ftdv_vpn_ip1     = undef,
  $ftdv_vpn_ip2     = undef,
  ) {

  file { "/opt/scripts/check_ftdv_status.py":
    ensure     => present,
    content    => template('yapstone_config/check_ftdv_status.py.erb'),
    owner      => root,
    group      => root,
    mode       => '0700',
    notify     => Service['verify-ftdv'],
    require    => [ File['/opt/scripts']],
  }

  file { '/opt/scripts':
    ensure     => directory,
    owner      => 'root',
    group      => 'root',
    mode       => 0755,
  }

  # Puppet needs for using provider => pip
  file { '/usr/bin/pip-python':
    ensure => 'link',
    target => '/usr/bin/pip',
    before => Package['requests'],
  } ->
  class {'profile::package::pip_requests':}
}
