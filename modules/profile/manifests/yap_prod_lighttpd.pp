#
# Yapstone Lighttpd Config for Prod Web Server
#
class profile::yap_prod_lighttpd {

  case $ec2_tag_product {
    'eu_web': {
      class {'::yapstone_config::yap_prod_lighttpd':
        server_user             => hiera('profile::prod_lighttpd::server_user', 'wwwrun'),
        server_group            => hiera('profile::prod_lighttpd::server_group', 'www'),
        server_port             => hiera('profile::prod_lighttpd::server_port', '80'),
        server_documentroot     => hiera('profile::prod_lighttpd::server_documentroot', '/srv/data/content/holidayrentpayment'),
        server_pidfile          => hiera('profile::prod_lighttpd::server_pidfile', '/var/run/lighttpd.pid'),
        server_tag              => hiera('profile::prod_lighttpd::server_tag', 'lighttpd'),
        server_maxconns         => hiera('profile::prod_lighttpd::server_maxconns', '2000'),
        server_maxfds           => hiera('profile::prod_lighttpd::server_maxfds', '4096'),
        server_accesslog        => hiera('profile::prod_lighttpd::server_accesslog', '/var/log/lighttpd/access_log'),
        server_errorlog         => hiera('profile::prod_lighttpd::server_errorlog', '/var/log/lighttpd/error_log'),
        service_name            => hiera('profile::prod_lighttpd::service_name', 'euro'),
      }
    }
    default: {
      class {'::yapstone_config::yap_prod_lighttpd':
        server_user             => hiera('profile::prod_lighttpd::server_user', 'wwwrun'),
        server_group            => hiera('profile::prod_lighttpd::server_group', 'www'),
        server_port             => hiera('profile::prod_lighttpd::server_port', '80'),
        server_documentroot     => hiera('profile::prod_lighttpd::server_documentroot', '/srv/data/content/holidayrentpayment'),
        server_pidfile          => hiera('profile::prod_lighttpd::server_pidfile', '/var/run/lighttpd.pid'),
        server_tag              => hiera('profile::prod_lighttpd::server_tag', 'lighttpd'),
        server_maxconns         => hiera('profile::prod_lighttpd::server_maxconns', '2000'),
        server_maxfds           => hiera('profile::prod_lighttpd::server_maxfds', '4096'),
        server_accesslog        => hiera('profile::prod_lighttpd::server_accesslog', '/var/log/lighttpd/access_log'),
        server_errorlog         => hiera('profile::prod_lighttpd::server_errorlog', '/var/log/lighttpd/error_log'),
      }
    }
  }

  # ensure there is logrotate for lighttpd logs
  include  ::yapstone_config::logrotate_lighttpd

}
