#
# Install Yum Repo for EPEL
#

class profile::package::epel_release {
  package {'epel-release':
    ensure => present,
  }
}
