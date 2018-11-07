#
# Install git
#

class profile::package::git {
  package {'git':
    ensure   => hiera('profile::package::git', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
