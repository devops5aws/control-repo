#
# RPM for Yapstone Samza Notification
#
class profile::package::yap_notications_server {
  package {'yap-notifications-server':
    ensure => hiera('profile::package::samza_notification_ver', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
