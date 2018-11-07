#
# RPM for telnet
#
class profile::package::telnet {
  package {'telnet':
    ensure => hiera('profile::package::telnet', 'present'),
  }
}
