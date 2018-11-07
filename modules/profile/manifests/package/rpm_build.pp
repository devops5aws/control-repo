#
# Install RPM Build Package
#

class profile::package::rpm_build {
  package {'rpm-build':
    ensure   => hiera('profile::package::rpmbuild_version', 'present'),
    require  => Yumrepo[ hiera('profile::yum_os_centos::repo_name') ],
  }
}
