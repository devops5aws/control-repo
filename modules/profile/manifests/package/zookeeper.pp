#
# RPM for Zookeeper
#
class profile::package::zookeeper {
  case $ec2_tag_product {
    'kafka': {
      package {'zookeeper':
        before => Class[ '::kafka' ],
        ensure => hiera('profile::package::zookeeper', 'present'),
	require => [ 
	  Package['bigtop-utils'], 
          YumRepo[hiera('profile::yum_tools::repo_name') ] 
        ],
      }
    }
    'samza': {
      package {'zookeeper':
        before => Class[ '::yapstone_samza' ],
        ensure => hiera('profile::package::zookeeper', 'present'),
        require => [
          Package['bigtop-utils'], 
          YumRepo[hiera('profile::yum_tools::repo_name') ] 
        ],
      }
    }
    'zk', /infra/: {
      package {'zookeeper':
        before => Class[ '::yapstone_zookeeper' ],
        ensure => hiera('profile::package::zookeeper', 'present'),
	require => [ 
	  Package['bigtop-utils'], 
          YumRepo[hiera('profile::yum_tools::repo_name') ] 
        ],
        }
      }
    }

}
