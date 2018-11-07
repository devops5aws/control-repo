#
# PIP install AWSCLI
#

class profile::package::pip_awscli {
  package {'awscli':
    ensure    => hiera('profile::package::awscli::version', '1.10.4')
    provider  => pip,
    require   => Package['python-pip'],
  }
}
