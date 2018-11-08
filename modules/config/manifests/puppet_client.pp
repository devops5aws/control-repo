#
# Update Puppet Client Configs
#
class yapstone_config::puppet_client (
  $logdir                 = undef,
  $rundir                 = undef,
  $ssldir                 = undef,
  $classfile              = undef,
  $localconfig            = undef,
  $master_server          = undef,
  $ca_server              = undef,
  $report                 = undef,
  $pluginsync             = undef,
  ) {

  file {"/etc/puppet/puppet.conf":
    ensure    => present,
    content   => template('yapstone_config/puppet.conf.erb'),
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    require   => Package['puppet'],
  }

  package { "puppet": ensure => present, }
}
