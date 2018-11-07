#
# Yapstone RP Samza Configs
#
class yapstone_samza::samza_rp (
  $server_user                    = undef,
  $server_group                   = undef,
  $samzarp_jobid                  = undef,
  $samzarp_jobconfig              = undef,
  $vertical_name                  = samza_rp,
  $samzarp_zk_server              = undef,
  $samzarp_bootstrap_server       = undef,
  $samzarp_task_replication       = undef,
  $samzarp_proxy_server           = undef,
  $samzarp_proxy_port             = undef,
  $samzarp_job_replication        = undef,
  $samzarp_sender_url             = undef,
  $samzarp_username               = undef,
  $samzarp_passwd                 = undef,
  $samzarp_aggregatedid           = undef,
  $samzarp_subscribed_event_types = undef,
  ) {

  file { '/opt/yap-notifications/config/notification-message-subscriber-RP.properties':
    ensure    => present,
    content   => template('yapstone_samza/notification-message-subscriber.properties.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
    require   => [
                   Package['yap-notifications-server'],
                   User['samza'],
                 ],
  }
  file { '/opt/yap-notifications/bin/run-samza-rp.sh':
    ensure    => present,
    content   => template('yapstone_samza/run-samza.sh.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0755',
    require   => [
                   Package['yap-notifications-server'],
                   User['samza'],
                 ],
  }

}
