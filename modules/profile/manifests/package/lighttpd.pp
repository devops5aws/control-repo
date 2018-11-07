#
# Install lighttpd Package
#

class profile::package::lighttpd {
  package {'lighttpd':
    ensure   => hiera('profile::package::lighttpd_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
