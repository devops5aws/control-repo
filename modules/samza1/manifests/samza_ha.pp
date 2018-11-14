#
# Yapstone HA Samza Configs
#
class yapstone_samza::samza_ha (
  $server_user                    = undef,
  $server_group                   = undef,
  $vertical_name                  = samza_ha,
  $samzaha_jobid                  = undef,
  $samzaha_jobconfig              = undef,
  $samzaha_zk_server              = undef,
  $samzaha_bootstrap_server       = undef,
  $samzaha_task_replication       = undef,
  $samzaha_proxy_server           = undef,
  $samzaha_proxy_port             = undef,
  $samzaha_job_replication        = undef,
  $samzaha_sender_url             = undef,
  $samzaha_username               = undef,
  $samzaha_passwd                 = undef,
  $samzaha_aggregatedid           = undef,
  $samzaha_subscribed_event_types = undef,
  ) {

  file { '/opt/yap-notifications/config/notification-message-subscriber-HA.properties':
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
  file { '/opt/yap-notifications/bin/run-samza-ha.sh':
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
