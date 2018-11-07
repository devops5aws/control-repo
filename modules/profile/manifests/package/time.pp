#
# Install Time Package
#

class profile::package::time {
  package {'time':
    ensure   => hiera('profile::package::time_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_os_centos::repo_name') ],
  }
}
