#
# RPM for openswan
#
class profile::package::openswan {
  package {'openswan':
    ensure => hiera('profile::package::openswan', 'present'),
  }
}
