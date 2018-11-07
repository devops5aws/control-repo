#
# Samza Initial Configs
#
class yapstone_samza {
  file { [
       '/opt/yap-notifications/',
       '/opt/yap-notifications/config',
       '/var/log/samza',
       '/var/log/samza/yap-notifications-ha',
       '/var/log/samza/yap-notifications-rp',
       '/var/log/samza/yap-notifications-eu'
      ]:
    ensure  => directory,
    owner   => samza,
    group   => samza,
    mode    => '0775',
    require => [ User['samza'], Group['samza'], ],
    recurse => true,
    before  => [
                   Package['yap-notifications-server'],
                   File['/opt/yap-notifications/config/notification-message-subscriber-HA.properties'],
                   File['/opt/yap-notifications/config/notification-message-subscriber-RP.properties'],
                   File['/opt/yap-notifications/config/notification-message-subscriber-EU.properties'],
                 ],
        }
}
