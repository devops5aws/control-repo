#
# Install NetCat Package
#

class profile::package::nc {
  package {'nc':
    ensure => hiera('profile::package::nc_version', 'present'),
  }
}
