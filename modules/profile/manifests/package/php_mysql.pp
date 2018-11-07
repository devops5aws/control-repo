#
# Install Mysql Package
#

class profile::package::php_mysql {
  package {'php-mysql':
    ensure => hiera('profile::package::php_mysql_version', '5.3.3-46.el6_6'),
  }
}
