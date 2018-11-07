#
# RPM for Yapstone Samza Notification
#
class profile::package::yap_notifications_server {
  package {'yap-notifications-server':
    ensure => hiera('profile::package::samza_notification_ver', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
