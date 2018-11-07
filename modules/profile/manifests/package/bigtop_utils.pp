#
# RPM for Bigtop Utils
#
class profile::package::bigtop_utils { 
  case $ec2_tag_product {
    'kafka': {
      package {'bigtop-utils':
        before => Class[ '::kafka' ],
        ensure => hiera('profile::package::bigtop_utils', 'present'),
        require => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
      }
    }
    'zk', /infra/: {
      package {'bigtop-utils':
        before => Class[ '::yapstone_zookeeper' ],
        ensure => hiera('profile::package::bigtop_utils', 'present'),
        require => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
        }
      }
    }
}
