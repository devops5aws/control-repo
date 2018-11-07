#
# RPM for Yapstone Socket
#
class profile::package::yap-socketserver {
  package {'yap-socketServer':
    ensure => hiera('profile::package::yap-socketserver', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
