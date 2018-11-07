#
# Yapstone Lighttpd Config for QA  Web Server
#
class profile::yap_qa_lighttpd {

  case $ec2_tag_product {
    'place_holder': {
      class {'::yapstone_config::yap_qa_lighttpd':
        server_user             => hiera('profile::qa_lighttpd::server_user', 'wwwrun'),
        server_group            => hiera('profile::qa_lighttpd::server_group', 'www'),
        server_port             => hiera('profile::qa_lighttpd::server_port', '80'),
        server_documentroot     => hiera('profile::qa_lighttpd::server_documentroot'),
        server_pidfile          => hiera('profile::qa_lighttpd::server_pidfile', '/var/run/lighttpd.pid'),
        server_tag              => hiera('profile::qa_lighttpd::server_tag', 'lighttpd'),
        server_maxconns         => hiera('profile::qa_lighttpd::server_maxconns', '2000'),
        server_maxfds           => hiera('profile::qa_lighttpd::server_maxfds', '4096'),
        server_accesslog        => hiera('profile::qa_lighttpd::server_accesslog', '/var/log/lighttpd/access_log'),
        server_errorlog         => hiera('profile::qa_lighttpd::server_errorlog', '/var/log/lighttpd/error_log'),
        yap_verticle            => hiera('profile::qa_lighttpd::yap_verticle'),
        proxy_url_script        => hiera('profile::qa_lighttpd::proxy_url_script', '/etc/lighttpd/inc/proxy_url.sh'),
        service_name            => hiera('profile::qa_lighttpd::service_name', 'homeaway'),
        proxy_url_ip            => hiera('profile::qa_lighttpd::proxy_url_ip'),
        proxy_url_server_port   => hiera('profile::qa_lighttpd::proxy_url_server_port', '8080'),
        app_hostname            => hiera('profile::qa_lighttpd::app_hostname', '%{::ec2_tag_app_hostname}'),
        proxy_url               => hiera_array('profile::qa_lighttpd::proxy_url'),
      }
    }
    default: {
      class {'::yapstone_config::yap_qa_lighttpd':
        server_user             => hiera('profile::qa_lighttpd::server_user', 'wwwrun'),
        server_group            => hiera('profile::qa_lighttpd::server_group', 'www'),
        server_port             => hiera('profile::qa_lighttpd::server_port', '80'),
        server_documentroot     => hiera('profile::qa_lighttpd::server_documentroot'),
        server_pidfile          => hiera('profile::qa_lighttpd::server_pidfile', '/var/run/lighttpd.pid'),
        server_tag              => hiera('profile::qa_lighttpd::server_tag', 'lighttpd'),
        server_maxconns         => hiera('profile::qa_lighttpd::server_maxconns', '2000'),
        server_maxfds           => hiera('profile::qa_lighttpd::server_maxfds', '4096'),
        server_accesslog        => hiera('profile::qa_lighttpd::server_accesslog', '/var/log/lighttpd/access_log'),
        server_errorlog         => hiera('profile::qa_lighttpd::server_errorlog', '/var/log/lighttpd/error_log'),
        yap_verticle            => hiera('profile::qa_lighttpd::yap_verticle'),
        proxy_url_script        => hiera('profile::qa_lighttpd::proxy_url_script', '/etc/lighttpd/inc/proxy_url.sh'),
        http_remoteip           => hiera('profile::qa_lighttpd::http_remoteip', '^(10\.3\.110\.5[12]|127\.0\.0\.1|10\.1\.41\.|10\.1\.3\.)$'),
        ssl_pemfile             => hiera('profile::qa_lighttpd::ssl_pemfile'),
        ssl_ca_file             => hiera('profile::qa_lighttpd::ssl_ca_file', '/etc/lighttpd/ssl/SSL_CA_Bundle.pem'),
        verticle_pem_key        => hiera('profile::qa_lighttpd::verticle_pem_key'),
        ssl_ca_bundle_pem       => hiera('profile::qa_lighttpd::ssl_ca_bundle_pem'),
        proxy_url_ip            => hiera('profile::qa_lighttpd::proxy_url_ip'),
        proxy_url_server_port   => hiera('profile::qa_lighttpd::proxy_url_server_port', '8080'),
        app_hostname            => hiera('profile::qa_lighttpd::app_hostname', '%{::ec2_tag_app_hostname}'),
        proxy_url               => hiera_array('profile::qa_lighttpd::proxy_url'),
        service_name            => hiera('profile::qa_lighttpd::service_name', 'undef'),
      }
    }
  }

  # ensure there is logrotate for lighttpd logs
  include  ::yapstone_config::logrotate_lighttpd

}
