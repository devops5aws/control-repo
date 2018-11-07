#
# RPM for Yapstone Homeaway lighttpd SVC
#
class profile::package::yap_lighttpd_svc {
  package {'yap-lighttpd-svc':
    ensure => hiera('profile::package::lighttpd_svc_ver', 'present'),
    before  => Class['profile::upstart_svscanboot'],
    require => Yumrepo['yap-tools'],
  }
}
