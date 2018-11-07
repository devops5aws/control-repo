#
# Profile install for Home Away Lighttpd
#
class profile::yap_haway_lighttpd {

  class {'::yapstone_config::yap_haway_lighttpd':
    server_user           => hiera('profile::lighttpd_config::server_user', 'wwwrun'),
    server_group          => hiera('profile::lighttpd_config::server_group', 'www'),
    server_port           => hiera('profile::lighttpd_config::server_port', '80'),
    server_documentroot   => hiera('profile::lighttpd_config::server_documentroot', '/srv/data/content/rentpayment.com-current'),
    server_pidfile        => hiera('profile::lighttpd_config::server_pidfile', '/var/run/lighttpd.pid'),
    server_tag            => hiera('profile::lighttpd_config::server_tag', 'lighttpd'),
    server_maxconns       => hiera('profile::lighttpd_config::server_maxconns', '2000'),
    server_maxfds         => hiera('profile::lighttpd_config::server_maxfds', '4096'),
    server_accesslog      => hiera('profile::lighttpd_config::server_accesslog', '/var/log/lighttpd/access_log'),
    server_errorlog       => hiera('profile::lighttpd_config::server_errorlog', '/var/log/lighttpd/error_log'),
  }

  include  ::yapstone_config::logrotate_lighttpd

}
