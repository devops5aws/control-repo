#
# This module to be used for managing wordpress lighttpd servers.
# rentpayment.com duespayment.com holidayrentpayment.com innpayment.com
# parishpay.com storagerentpayment.com vacationrentpayment.com yapstone.com

class yapstone_wordpress (
  $server_user            = $::yapstone_wordpress::params::server_user,
  $server_group           = $::yapstone_wordpress::params::server_group,
  $server_port            = $::yapstone_wordpress::params::server_port,
  $server_documentroot    = $::yapstone_wordpress::params::server_documentroot,
  $server_pidfile         = $::yapstone_wordpress::params::server_pidfile,
  $server_tag             = $::yapstone_wordpress::params::server_tag,
  $server_maxconns        = $::yapstone_wordpress::params::server_maxconns,
  $server_maxfds          = $::yapstone_wordpress::params::server_maxfds,
  $server_rp              = $::yapstone_wordpress::params::server_rp,
  $server_dp              = $::yapstone_wordpress::params::server_dp,
  $server_ip              = $::yapstone_wordpress::params::server_ip,
  $server_vp              = $::yapstone_wordpress::params::server_vp,
  $server_sp              = $::yapstone_wordpress::params::server_sp,
  $server_hp              = $::yapstone_wordpress::params::server_hp,
  $server_yp              = $::yapstone_wordpress::params::server_yp,
  $server_pp              = $::yapstone_wordpress::params::server_pp,
  $wp_dbname              = $::yapstone_wordpress::params::wp_dbname,
  $wp_dbuser              = $::yapstone_wordpress::params::wp_dbuser,
  $wp_dbpasswd            = $::yapstone_wordpress::params::wp_dbpasswd,
  $wp_dbhost              = $::yapstone_wordpress::params::wp_dbhost,
  ) inherits yapstone_wordpress::params {

  class {'::yapstone_wordpress::user':
    server_user      => $server_user,
    server_group     => $server_group,
  }

  class {'::yapstone_wordpress::url':
    server_user       => $server_user,
    server_group      => $server_group,
    server_rp         => $server_rp,
    server_dp         => $server_dp,
    server_ip         => $server_ip,
    server_vp         => $server_vp,
    server_sp         => $server_sp,
    server_hp         => $server_hp,
    server_yp         => $server_yp,
    server_pp         => $server_pp,
  }

  class {'::yapstone_wordpress::wp_config':
    server_rp         => $server_rp,
    server_dp         => $server_dp,
    server_ip         => $server_ip,
    server_vp         => $server_vp,
    server_sp         => $server_sp,
    server_hp         => $server_hp,
    server_yp         => $server_yp,
    server_pp         => $server_pp,
    wp_dbname         => $wp_dbname,
    wp_dbuser         => $wp_dbuser,
    wp_dbpasswd       => $wp_dbpasswd,
    wp_dbhost         => $wp_dbhost,
  }

  if $ec2_tag_component == 'qa' or $ec2_tag_component == 'stg' {
    file {"/etc/lighttpd/lighttpd.conf":
      ensure    => present,
      content   => template('yapstone_wordpress/lighttpd_stg.conf.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   => Package['lighttpd'],
    }
  }
  else {
    file {"/etc/lighttpd/lighttpd.conf":
      ensure    => present,
      content   => template('yapstone_wordpress/lighttpd.conf.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   => Package['lighttpd'],
    }
  }

}
