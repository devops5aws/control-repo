#
# lighttpd logrotate
#
class yapstone_config::logrotate_lighttpd {

  ::logrotate::rule { 'lighttpd':
    path          => '/var/log/lighttpd/*_log',
    rotate        => 99,
    sharedscripts => true,
    missingok     => true,
    copytruncate  => true,
    maxage        => 99,
    dateext       => true,
    ifempty       => false,
    postrotate    => '/etc/init.d/lighttpd reload',
  }
}
