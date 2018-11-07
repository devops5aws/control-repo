#
# RPM for Yapstone Socket
#
class profile::package::yap_socketserver {
  package {'yap-socketServer':
    ensure => hiera('profile::package::yap_socketserver', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
