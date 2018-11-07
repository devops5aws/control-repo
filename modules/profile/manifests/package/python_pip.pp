#
# Install python-pip
#

class profile::package::python_pip {
  package {'python-pip':
    ensure => installed,
  }

  # Puppet needs for using provider => pip
  file { '/usr/bin/python-pip':
    ensure => 'link',
    target => '/usr/bin/pip',
  } 
}
