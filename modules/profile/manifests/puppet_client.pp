#
# Puppet Client Configs
#
class profile::puppet_client {

  class {'::yapstone_config::puppet_client':
    logdir         => hiera('profile::puppet_client::logdir', '/var/log/puppet'),
    rundir         => hiera('profile::puppet_client::rundir', '/var/run/puppet'),
    ssldir         => hiera('profile::puppet_client::ssldir', '$vardir/ssl'),
    classfile      => hiera('profile::puppet_client::classfile', '$vardir/classes.txt'),
    localconfig    => hiera('profile::puppet_client::localconfig', '$vardir/localconfig'),
    master_server  => hiera('profile::puppet_client::master_server', 'puppet-master'),
    ca_server      => hiera('profile::puppet_client::ca_server', 'puppet-ca'),
    report         => hiera('profile::puppet_client::report', 'true'),
    pluginsync     => hiera('profile::puppet_client::pluginsync', 'true'),
  }
}
