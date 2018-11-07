#
# Install Yapstone Python27 Package
#

class profile::package::yap_python27 {
  package {'yap-python27':
    ensure   => hiera('profile::package::python27_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
