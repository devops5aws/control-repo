#
# Yapstone Puppet Dashboard
#
class yapstone_config::yap_pupdash (
  $prod_db_database              = undef,
  $prod_db_username              = undef,
  $prod_db_password              = undef,
  $prod_db_adapter               = undef,
  $prod_db_host                  = undef,
  $development                   = false,
  $dev_db_database               = undef,
  $dev_db_username               = undef,
  $dev_db_password               = undef,
  $dev_db_adapter                = undef,
  $dev_db_host                   = undef,
  ) {

  service { [ 
              'puppet-dashboard',
              'puppet-dashboard-workers'
            ]:
    ensure   => 'running',
    enable   => 'true',
  }

  file { '/usr/share/puppet-dashboard/config/database.yml':
    ensure    => present,
    content   => template('yapstone_config/database.yml.erb'),
    owner     => puppet-dashboard,
    group     => puppet-dashboard,
    mode      => '0640',
    notify    => Service[ 
                          'puppet-dashboard',
                          'puppet-dashboard-workers'
                        ],
    require   => [ 
                   Package[ 'gcc' ],
                   Package[ 'mysql' ],
                   Package[ 'ruby-devel' ],
                   Package[ 'mysql-devel' ],
                   Package[ 'puppet-dashboard' ],
                   Yumrepo[ 'yap-tools' ],
                 ],
  }

  exec { 'initialize_db':
    command => "rake gems:refresh_specs ; rake db:migrate ; touch /tmp/initialize_db",
    onlyif  => '/usr/bin/test ! -f /tmp/initialize_db',
    cwd     => '/usr/share/puppet-dashboard',
    path    => [
                 '/bin',
                 '/tmp',
                 '/usr/bin',
                 '/usr/local/bin',
                 '/usr/share/puppet-dashboard',
               ],
    require => Package['puppet-dashboard'],
  }
}
