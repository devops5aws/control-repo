#
# Install Yapstone pip27 Package
#

class profile::package::yap_pip27 {
  package {'yap-pip27':
    ensure   => hiera('profile::package::pip27_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
