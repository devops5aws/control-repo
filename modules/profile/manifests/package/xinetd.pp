#
# Install xinetd Package
#

class profile::package::xinetd {
  package {'xinetd':
    ensure   => hiera('profile::package::xinetd_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
