#
# Used for Lighttpd URL
#
class yapstone_wordpress::url (
  $server_user       = undef,
  $server_group      = undef,
  $server_rp         = undef,
  $server_dp         = undef,
  $server_ip         = undef,
  $server_vp         = undef,
  $server_sp         = undef,
  $server_hp         = undef,
  $server_yp         = undef,
  $server_pp         = undef,
  ) {

  file {"/etc/lighttpd/lighttpd-$server_rp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_url.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_dp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_url.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_ip.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_url.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_pp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_url.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_sp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_url.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_vp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_vacationrentpayment.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_hp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_url.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }

  file {"/etc/lighttpd/lighttpd-$server_yp.conf":
    ensure    => present,
    content   => template('yapstone_wordpress/lighttpd_yapstone.conf.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0644',
  }
}

