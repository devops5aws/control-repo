#
# Used for Word Press Config
#
class yapstone_wordpress::wp_config (
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
  $wp_dbname         = undef,
  $wp_dbuser         = undef,
  $wp_dbpasswd       = undef,
  $wp_dbhost         = undef,
  ) {
  if $ec2_tag_component  == 'qa' or $ec2_tag_component  == 'stg' {
    file {"/srv/data/content/$server_rp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-rp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-rentpayment_staging_base' ] ],
    }

    file {"/srv/data/content/$server_dp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-dp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-duespayment_staging_base' ] ],
    }
  
    file {"/srv/data/content/$server_ip/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-ip.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-innpayment_staging_base' ] ],
    }
  
    file {"/srv/data/content/$server_vp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-vp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-vacationrentpayment_staging_base' ] ],
    }
  
    file {"/srv/data/content/$server_sp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-sp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-storagerentpayment_staging_base' ] ],
    }
  
    file {"/srv/data/content/$server_hp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-hp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-holidayrentpayment_staging_base' ] ],
    }
  
    file {"/srv/data/content/$server_yp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-yp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-yapstone_staging_base' ] ],
    }
  
    file {"/srv/data/content/$server_pp/yapstone-config-dev.php":
      ensure    => present,
      content   => template('yapstone_wordpress/yapstone-config-dev-pp.php.erb'),
      owner     => $server_user,
      group     => $server_group,
      mode      => '0644',
      require   =>[ Exec[ 'yum-clean-expire-cache'], Package[ 'wp-parishpay_staging_base' ] ],
    }
  }
  else {
  }
}
