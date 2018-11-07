#
# Upstart: Manage via Supervise for lighttd
# 

class profile::upstart_lighttpd {

  include ::upstart

  ::upstart::job { 'lighttpd':
    description     => 'Used for Monitoring lighttpd Services',
    respawn         => true,
    respawn_limit   => '5 10',
    console         => none,
    chdir           => '/etc/lighttpd',
    exec            => '/usr/sbin/lighttpd -D -f lighttpd.conf',
    require         => [ Package['lighttpd'], Package['bind-utils'], ],
  }
}
