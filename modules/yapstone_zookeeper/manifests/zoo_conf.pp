#
# zoo.cfg
#
class yapstone_zookeeper::zoo_conf (
  $server1                = undef,
  $server2                = undef,
  $server3                = undef,
  $server4                = undef,
  $server5                = undef,
  $data_dir               = undef,
  $tick_time              = undef,
  $init_limit             = undef,
  $sync_limit             = undef,
  $client_port            = undef,
  $leader_port            = undef,
  $leader_election_port   = undef,
  $myid                   = undef,
  $zookeeper_rpm          = undef,
  $zookeeper_server_rpm   = undef,
  $bigtop_utils_rpm       = undef,
  $rpm_url                = undef,
  ) {

  file { '/etc/zookeeper/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => 0755,
  }

 file { '/etc/zookeeper/conf':
    ensure => 'link',
    target => '/etc/zookeeper/conf.dist',
  }

  service { 'zookeeper-server':
    ensure  => 'running',
    enable  => true,
    require => Package['zookeeper-server'],
  }

  exec { 'initialize_zookeeper':
    command => "/etc/init.d/zookeeper-server init",
    onlyif  => '/usr/bin/test ! -d /var/lib/zookeeper/version-2/',
    require => Package['zookeeper-server'],
  }

  file {'/etc/zookeeper/conf.dist/zoo.cfg':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    notify    => Service['zookeeper-server'],
    content   => template('yapstone_zookeeper/zoo.cfg.erb'),
    require   => [ 
                   Package[ 'zookeeper' ],
                   Package[ 'zookeeper-server' ],
                   Exec[ 'initialize_zookeeper'],
                   Yumrepo[ hiera('profile::yum_os_centos::repo_name', 'CentOS-S3-Base') ],
                   Yumrepo[ hiera('profile::yum_updates_centos::repo_name', 'CentOS-S3-Updates') ],
                 ],
  }

  file {'/var/lib/zookeeper/myid':
    ensure    => present,
    group     => 'root',
    mode      => '0644',
    content   => template('yapstone_zookeeper/myid.erb'),
    require   => Package['zookeeper-server'],
  }

}
