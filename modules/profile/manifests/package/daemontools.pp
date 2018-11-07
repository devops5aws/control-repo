#
# Daemon Tools for Yapstone
#
class profile::package::daemontools {
  package {'daemontools':
    ensure => hiera('profile::package::daemontools_ver', 'present'),
    require => Yumrepo[ hiera('profile::yum_yap::repo_name') ],
  }
}
