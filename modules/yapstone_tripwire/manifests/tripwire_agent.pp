#
# Trip Wire for Client Server
#
class yapstone_tripwire::tripwire_agent (
  $bridge_host       = undef,
  $bridge_port       = undef,
  ) {

  $tw_path           = '/etc/tripwire'
  $registration_key  = 123456789

  file {'/etc/tripwire/twagent.conf':
    ensure           => 'present',
    owner            => 'root',
    group            => 'root',
    mode             => '0600',
    notify           => Service['tripwire-axon-agent'],
    content          => template('yapstone_tripwire/twagent.conf.erb'),
    require          => [
                          Package['axon-agent'],
                          Package['tw-eg-driver-rhel'],
                          Package['tw-eg-service'],
                          Exec['prep_registration'],
                        ],
  }

  exec { 'prep_registration':
    path             => ['/usr/bin', '/bin'],
    creates          => "$tw_path/lock_registration_pre_shared_key.txt",
    command          => "touch $tw_path/lock_registration_pre_shared_key.txt;  \
                        echo $registration_key  > $tw_path/registration_pre_shared_key.txt",
  }

 # Ensures Splunk Daemon is running
  service { 'tripwire-axon-agent':
    ensure           => running,
    enable           => true,
    hasstatus        => false,
    start            => '/etc/init.d/tripwire-axon-agent start',
    restart          => '/etc/init.d/tripwire-axon-agent restart',
    status           => '/etc/init.d/tripwire-axon-agent status',
  }
}
