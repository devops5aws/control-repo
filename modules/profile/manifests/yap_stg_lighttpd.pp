#
# Yapstone Lighttpd Config for Staging Web Server
#
class profile::yap_stg_lighttpd {

  case $ec2_tag_product {
    default: {
      class {'::yapstone_config::yap_stg_lighttpd':
        server_user             => hiera('profile::stg_lighttpd::server_user', 'wwwrun'),
        server_group            => hiera('profile::stg_lighttpd::server_group', 'www'),
        server_port             => hiera('profile::stg_lighttpd::server_port', '80'),
        server_documentroot     => hiera('profile::stg_lighttpd::server_documentroot', '/srv/data/content/holidayrentpayment'),
        server_pidfile          => hiera('profile::stg_lighttpd::server_pidfile', '/var/run/lighttpd.pid'),
        server_tag              => hiera('profile::stg_lighttpd::server_tag', 'lighttpd'),
        server_maxconns         => hiera('profile::stg_lighttpd::server_maxconns', '2000'),
        server_maxfds           => hiera('profile::stg_lighttpd::server_maxfds', '4096'),
        server_accesslog        => hiera('profile::stg_lighttpd::server_accesslog', '/var/log/lighttpd/access_log'),
        server_errorlog         => hiera('profile::stg_lighttpd::server_errorlog', '/var/log/lighttpd/error_log'),
        proxy_url_script        => hiera('profile::stg_lighttpd::proxy_url_script', '/etc/lighttpd/inc/proxy_url.sh'),
        co_uk_remoteip          => hiera('profile::stg_lighttpd::co_uk_remoteip', '10.55.64.0/19|127.0.0.1|10.1.|10.2.'),
        eurotest_rp_remoteip    => hiera('profile::stg_lighttpd::eurotest_rp_remoteip', '10.55.64.0/19|127.0.0.1|10.1.|10.2.'),
        ssl_pemfile             => hiera('profile::stg_lighttpd::ssl_pemfile', '/etc/lighttpd/ssl/wildcard.rentpayment.com.pem'),
        ssl_ca_file             => hiera('profile::stg_lighttpd::ssl_ca_file', '/etc/lighttpd/ssl/SSL_CA_Bundle.pem'),
        verticle_pem_key        => hiera('profile::stg_lighttpd::verticle_pem_key'),
        ssl_ca_bundle_pem       => hiera('profile::stg_lighttpd::ssl_ca_bundle_pem'),
        proxy_url_ip            => hiera('profile::stg_lighttpd::proxy_url_ip', 'undef'),
        proxy_url_server_port   => hiera('profile::stg_lighttpd::proxy_url_server_port', '8080'),
        app_hostname            => hiera('profile::stg_lighttpd::app_hostname', '%{::ec2_tag_app_hostname}'),
        farms_remoteip          => hiera('profile::stg_lighttpd::farms_remoteip', '10.55.64.0/19'),
        proxy_url_farms         => hiera('profile::stg_lighttpd::proxy_url_farms', 'v1/ysfarmsaas'),
        app_farms_hostname      => hiera('profile::stg_lighttpd::app_farms_hostname', 'usw2-st01-eufarms-001'),
        http_remoteip           => hiera('profile::stg_lighttpd::http_remoteip', 'undef'),
      }
    }
  }

  # ensure there is logrotate for lighttpd logs
  include  ::yapstone_config::logrotate_lighttpd

}
