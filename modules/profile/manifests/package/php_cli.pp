#
# Install PHP CLI Package
#

class profile::package::php_cli {
  package {'php-cli':
    ensure => hiera('profile::package::phpcli_version', '5.3.3-46.el6_6'),
  }
}
