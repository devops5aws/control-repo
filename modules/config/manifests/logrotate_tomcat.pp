#
# Tomcat logrotate
#
class yapstone_config::logrotate_tomcat {
  $logrotate_name      = hiera('profile::yap_app_config::logrotate_name', 'tomcat')
  $logrotate_path      = hiera('profile::yap_app_config::logrotate_path', '/var/log/tomcat/euro/dailyApp.log')
  $logrotate_rotate    = hiera('profile::yap_app_config::logrotate_days', '366')
  $logrotate_every     = hiera('profile::yap_app_config::logrotate_every', 'daily')

 ::logrotate::rule { $logrotate_name :
    path          => $logrotate_path,
    rotate        => $logrotate_rotate,
    rotate_every  => $logrotate_every,
    sharedscripts => true,
    compress      => true,
    missingok     => true,
    copytruncate  => true,
    dateext       => true,
    ifempty       => false,
  }
}
