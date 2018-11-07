#
# install the OMD v1.30 package - Open Monitoring Distribution
#
class profile::package::omd_1_30 {
  package {'omd-1.30':
    ensure  => 'present',
    require => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
