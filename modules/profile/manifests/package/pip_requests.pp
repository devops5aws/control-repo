#
# PIP install request
#

class profile::package::pip_requests {

  $pip_requests = 'https://s3-us-west-2.amazonaws.com/yapstone-rpm-repo/pip/requests-2.11.1-py2.py3-none-any.whl'

  package {'requests':
    ensure    => hiera('profile::package_pip::version', '2.11.1'),
    provider  => pip,
    require   => Package['python-pip'],
    source    => hiera('profile::package_pip::requests', $pip_requests),
  }
}
