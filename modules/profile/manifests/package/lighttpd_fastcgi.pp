#
# Install lighttpd FastCGI Package
#

class profile::package::lighttpd_fastcgi {
  package {'lighttpd-fastcgi':
    ensure => hiera('profile::package::lighttpd_fastcgi_version', '1.4.37-1.el6'),
  }
}
