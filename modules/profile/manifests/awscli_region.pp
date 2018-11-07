#
# File in .aws/config to determine region
#

class profile::awscli_region (
  $region = hiera('profile::awscli_region::region', 'us-west-2'),
  ) {

  file { '/root/.aws':
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0700',
  }

  file { '/root/.aws/config':
    content => template('profile/aws_config.erb'),
    owner   => root,
    group   => root,
    mode    => '0600',
  }
}
