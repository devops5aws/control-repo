#
# RPM for lsof
#
class profile::package::lsof {
  package {'lsof':
    ensure => hiera('profile::package::lsof', 'present'),
  }
}
