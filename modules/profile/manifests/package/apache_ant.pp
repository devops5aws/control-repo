#
# Install Apache ANT Package
#

class profile::package::apache_ant {
  package {'apache-ant':
    ensure   => hiera('profile::package::apache_ant_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
