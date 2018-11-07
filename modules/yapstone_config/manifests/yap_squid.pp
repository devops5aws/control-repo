#
# Yapstone Squid Configs
#
class yapstone_config::yap_squid (
  $http_port                     = undef,
  $ssl_ports                     = [],
  $safe_ports                    = [],
  $acl_whitelist_dir             = '/etc/squid/whitelist',
  $acl_app_server                = undef,
  $cidr_whitelist                = undef,
  $whitelist                     = [],
  $app_whitelist                 = [],
  $db_whitelist                  = [],
  $solr_whitelist                = [],
  $web_whitelist                 = [],
  $key_whitelist                 = [],
  $ftp_whitelist                 = [],
  $admin_whitelist               = [],
  $aws_whitelist                 = [],
  $common_whitelist              = [],
  $acl_config                    = [],
  $http_access                   = [],
  ) {

  service { 'squid':
    ensure   => 'running',
    enable   => 'true',
  }

  file {'/etc/squid/squid.conf':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid.conf.erb'),
    require   => Package[ 'squid' ],
  }

  file { '/etc/squid/whitelist':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid_whitelist.erb'),
    require   => Package[ 'squid' ],
  }

  file { '/etc/squid/app_whitelist':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid_app_whitelist.erb'),
    require   => Package[ 'squid' ],
  }

  file { '/etc/squid/aws_whitelist':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid_aws_whitelist.erb'),
    require   => Package[ 'squid' ],
  }

  file { '/etc/squid/admin_whitelist':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid_admin_whitelist.erb'),
    require   => Package[ 'squid' ],
  }

  file { '/etc/squid/common_whitelist':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid_common_whitelist.erb'),
    require   => Package[ 'squid' ],
 }

  file { '/etc/squid/db_whitelist':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service[ 'squid' ],
    content   => template('yapstone_config/squid_db_whitelist.erb'),
    require   => Package[ 'squid' ],
  }

  case $ec2_tag_component {
    'pd_usw2': {
      file { '/etc/squid/solr_whitelist':
        ensure    => present,
        owner     => 'root',
        group     => 'root',
        mode      => '0644',
        notify    => Service[ 'squid' ],
        content   => template('yapstone_config/squid_solr_whitelist.erb'),
        require   => Package[ 'squid' ],
      }
      file { '/etc/squid/key_whitelist':
        ensure    => present,
        owner     => 'root',
        group     => 'root',
        mode      => '0644',
        notify    => Service[ 'squid' ],
        content   => template('yapstone_config/squid_key_whitelist.erb'),
        require   => Package[ 'squid' ],
      }
      file { '/etc/squid/web_whitelist':
        ensure    => present,
        owner     => 'root',
        group     => 'root',
        mode      => '0644',
        notify    => Service[ 'squid' ],
        content   => template('yapstone_config/squid_web_whitelist.erb'),
        require   => Package[ 'squid' ],
      }
      file { '/etc/squid/ftp_whitelist':
        ensure    => present,
        owner     => 'root',
        group     => 'root',
        mode      => '0644',
        notify    => Service[ 'squid' ],
        content   => template('yapstone_config/squid_ftp_whitelist.erb'),
        require   => Package[ 'squid' ],
      }
    }
  }
}
