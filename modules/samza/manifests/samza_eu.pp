#
# Yapstone Samza Configs
#
class yapstone_samza::samza_eu (
  $server_user                    = undef,
  $server_group                   = undef,
  $vertical_name                  = samza_eu,
  $samzaeu_jobid                  = undef,
  $samzaeu_jobconfig              = undef,
  $samzaeu_zk_server              = undef,
  $samzaeu_bootstrap_server       = undef,
  $samzaeu_task_replication       = undef,
  $samzaeu_proxy_server           = undef,
  $samzaeu_proxy_port             = undef,
  $samzaeu_job_replication        = undef,
  $samzaeu_sender_url             = undef,
  $samzaeu_username               = undef,
  $samzaeu_passwd                 = undef,
  $samzaeu_aggregatedid           = undef,
  $samzaeu_subscribed_event_types = undef,
  ) {


  file { '/opt/yap-notifications/config/notification-message-subscriber-EU.properties':
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
  file { '/opt/yap-notifications/bin/run-samza-eu.sh':
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
