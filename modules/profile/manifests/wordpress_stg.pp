#
# Lighttpd Configs for Wordpress
#
class profile::wordpress_stg {

  class { '::yapstone_wordpress':
    server_user           => hiera('profile::lighttpd_wordpress::server_user', 'wwwrun'),
    server_group          => hiera('profile::lighttpd_wordpress::server_group', 'www'),
    server_port           => hiera('profile::lighttpd_wordpress::server_port', '80'),
    server_documentroot   => hiera('profile::lighttpd_wordpress::server_documentroot', '/srv/data/content/wordpress'),
    server_pidfile        => hiera('profile::lighttpd_wordpress::server_pidfile', '/var/run/lighttpd.pid'),
    server_tag            => hiera('profile::lighttpd_wordpress::server_tag', 'lighttpd'),
    server_maxconns       => hiera('profile::lighttpd_wordpress::server_maxconns', '2000'),
    server_maxfds         => hiera('profile::lighttpd_wordpress::server_maxfds', '4096'),
    server_rp             => hiera('profile::lighttpd_wordpress::server_rp', 'rentpayment'),
    server_dp             => hiera('profile::lighttpd_wordpress::server_dp', 'duespayment'),
    server_ip             => hiera('profile::lighttpd_wordpress::server_ip', 'innpayment' ),
    server_pp             => hiera('profile::lighttpd_wordpress::server_pp', 'parishpay'),
    server_sp             => hiera('profile::lighttpd_wordpress::server_sp', 'storagerentpayment'),
    server_vp             => hiera('profile::lighttpd_wordpress::server_vp', 'vacationrentpayment'),
    server_hp             => hiera('profile::lighttpd_wordpress::server_hp', 'holidayrentpayment'),
    server_yp             => hiera('profile::lighttpd_wordpress::server_yp', 'yapstone'),
    wp_dbname             => hiera('profile::lighttpd_wordpress::wp_dbname'),
    wp_dbuser             => hiera('profile::lighttpd_wordpress::wp_dbuser'),
    wp_dbpasswd           => hiera('profile::lighttpd_wordpress::wp_dbpasswd'),
    wp_dbhost             => hiera('profile::lighttpd_wordpress::wp_dbhost'),
  }

  $repo_name   = hiera('profile::yum_wordpress_repo::repo_name')

  package { "wp-yapstone_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-yapstone_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-duespayment_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-duespayment_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-innpayment_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-innpayment_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-parishpay_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-parishpay_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-rentpayment_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-rentpayment_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-storagerentpayment_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-storagerentpayment_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-holidayrentpayment_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-holidayrentpayment_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-vacationrentpayment_staging_base": ensure => present, require => Yumrepo[ $repo_name ], }
  package { "wp-vacationrentpayment_staging_theme": ensure => present, require => Yumrepo[ $repo_name ], }

  exec { 'yum-clean-expire-cache':
    user => 'root',
    path => '/usr/bin',
    command => 'yum clean expire-cache',
    require => Yumrepo[ $repo_name ],
  }

  package { "lighttpd":
    ensure => hiera('profile::lighttpd_wordpress::ver', '1.4.37-1.el6'),
    before => Class['yapstone_wordpress'],
  }

  package { "lighttpd-fastcgi":
    ensure  => hiera('profile::lighttpd_wordpress::fastcgi_ver', '1.4.37-1.el6'),
    require => Package['lighttpd'],
  }

  package { "php-cli":
    ensure  => hiera('profile::lighttpd_wordpress::phpcli_ver', '5.3.3-46.el6_6'),
    require => Package['lighttpd'],
  }

  service { "lighttpd":
    enable => true,
    ensure => true,
    hasrestart => true,
  }

}
