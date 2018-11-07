#
# RPM for Yapstone lighttpd with SVC
#
class profile::package::lighttpd_svc {
  package {'lighttpd':
    ensure => hiera('profile::package::lighttpdsvc_ver', '1.4.35-20140717svc'),
    require => Yumrepo['yap-tools'],
  }
}
