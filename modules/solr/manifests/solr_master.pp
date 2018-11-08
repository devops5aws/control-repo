#
# Yapstone Custom Solr Master
#
class yapstone_solr::solr_master (
  $server_user                = undef,
  $server_group               = undef,
  $db_server                  = undef,
  $db_port                    = undef,
  $db_name                    = undef,
  $db_username                = undef,
  $db_passwd                  = undef,
  ) { 

  # Create Solr Configs for rp
  exec { "solr_create_core":
    command   => "/etc/init.d/solr start && sleep 10; \
                  su - solr -c '/opt/solr/bin/solr create -c rp -d basic_configs'; \
                  touch /var/solr/create_core_done",
    path      => ['/usr/bin', '/bin'],
    creates   => "/var/solr/create_core_done",
    before    => [
                   Exec['solr_reload_core'],
                   File['/var/solr/data/rp/conf/solrconfig.xml'],
                   File['/var/solr/data/rp/conf/data-config.xml'],
                 ],
    require   => Package['apache-solr'],
    logoutput => true,
  }

  # Reloads the configs, should be the last to execute
  exec { "solr_reload_core":
    command   => "chown -R solr:solr /var/solr; /etc/init.d/solr restart; sleep 10; \
                  curl -v 'http://localhost:8983/solr/admin/cores?action=RELOAD&core=rp'; \
                  touch /var/solr/reload_core_done",
    path      => ['/usr/bin', '/bin'],
    creates   => "/var/solr/reload_core_done",
    require   => [
                   Package['apache-solr'],
                   Exec['solr_create_core'],
                   File['/var/solr/data/rp/conf/solrconfig.xml'],
                   File['/var/solr/data/rp/conf/data-config.xml'],
                 ],
    logoutput => true,
  }

  # Grab Language Librarys from S3 Bucket
  exec { "add_solr_lang":
    command   => "aws s3 sync s3://yapstone-solr/qa/lang /var/solr/data/rp/conf/lang",
    path      => [ "/usr/bin" ],
    onlyif    => "/usr/bin/test ! -e /var/solr/data/rp/conf/lang/stopwords_ar.txt",
    before    => Exec['solr_reload_core'],
    require   => Exec['solr_create_core'],
    logoutput => true,
  }

  # Grabs the Jar Librarys from S3 Bucket
  exec { "add_solr_lib":
    command   => "aws s3 sync s3://yapstone-solr/qa/lib /var/solr/data/rp/lib",
    path      => [ "/usr/bin" ],
    onlyif    => "/usr/bin/test ! -d /var/solr/data/rp/lib",
    before    => Exec['solr_reload_core'],
    require   => Exec['solr_create_core'],
    logoutput => true,
  }

  ## Templates use by Hiera ##
  file { "/var/solr/data/rp/conf/solrconfig.xml":
    ensure    => present,
    content   => template('yapstone_solr/solrconfig.xml.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0664',
    require   => Package['apache-solr'],
    notify    => Service['solr'],
  }

  file { "/var/solr/data/rp/conf/data-config.xml":
    ensure    => present,
    content   => template('yapstone_solr/data-config.xml.erb'),
    owner     => $server_user,
    group     => $server_group,
    mode      => '0664',
    require   => Package['apache-solr'],
    notify    => Service['solr'],
  }
  ## END Templates ##

  # Ensures Solr Daemon is running
  service { 'solr':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => [
      Package['apache-solr'],
    ],
    start     => '/etc/init.d/solr start',
    restart   => '/etc/init.d/solr restart',
    status    => '/etc/init.d/solr status',
  }

  ## Static Files Solr Needs ##
  file { "/var/solr/data/rp/conf/schema.xml":
    ensure    => present,
    owner     => $server_user,
    group     => $server_group,
    mode      => '0664',
    source    => 'puppet:///modules/yapstone_solr/schema.xml',
    before    => Exec['solr_reload_core'],
    require   => Exec['solr_create_core'],
  }

  file { "/var/solr/data/rp/conf/elevate.xml":
    ensure    => present,
    owner     => $server_user,
    group     => $server_group,
    mode      => '0664',
    source    => 'puppet:///modules/yapstone_solr/elevate.xml',
    before    => Exec['solr_reload_core'],
    require   => Exec['solr_create_core'],
  }

  file { "/var/solr/data/rp/conf/wdfftypes.txt":
    ensure    => present,
    owner     => $server_user,
    group     => $server_group,
    mode      => '0664',
    source    => 'puppet:///modules/yapstone_solr/wdfftypes.txt',
    before    => Exec['solr_reload_core'],
    require   => Exec['solr_create_core'],
  }

  file { "/var/solr/data/rp/conf/synonyms.txt":
    ensure    => present,
    owner     => $server_user,
    group     => $server_group,
    mode      => '0664',
    source    => 'puppet:///modules/yapstone_solr/synonyms.txt',
    before    => Exec['solr_reload_core'],
    require   => Exec['solr_create_core'],
  }
  ## END Static Files ###

  # Adding Solr User/Group
  group { $server_group:
    ensure  => present,
  }

  user { $server_user:
    ensure       => present,
    comment      => 'User for solr',
    groups       => $server_group,
    managehome   => true,
    home         => '/home/solr',
    shell        => '/bin/bash',
  }
}
