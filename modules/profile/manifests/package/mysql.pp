#
# Install mysql Package
#

class profile::package::mysql {
  package {'mysql':
    ensure => hiera('profile::package::mysql_version', '5.1.73-5.el6_6'),
  }
}
