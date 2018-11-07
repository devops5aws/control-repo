#
# Install Custom Maven Package
#

class profile::package::yap_maven {
  package {'yap-maven':
    ensure   => hiera('profile::package::maven_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
