#
# Install Squid Proxy Package
#

class profile::package::squid {
  package {'squid':
    ensure   => hiera('profile::package::squid_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
