#
# Yapstone Custom NewRelic Config
#
class yapstone_config::yap_newrelic (
  $license_key                            = undef,
  $agent_enabled                          = true,
  $app_name                               = undef,
  $samza_eu_app_name                      = undef,
  $samza_ha_app_name                      = undef,
  $samza_rp_app_name                      = undef,
  $kafka_app_name                         = undef,
  $zk_app_name                            = undef,
  $high_security                          = false,
  $enable_auto_app_naming                 = false,
  $enable_auto_transaction_naming         = true,
  $log_level                              = undef,
  $audit_mode                             = false,
  $log_file_count                         = '1',
  $log_limit_in_kbytes                    = '0',
  $log_daily                              = true,
  $log_file_path                          = '/var/log/newrelic/',
  $log_file_name                          = 'newrelic_agent.log',
  $proxy_host                             = undef,
  $proxy_port                             = undef,
  ) {

  $newrelic_license_key       = hiera('profile::yap_newrelic::license_key')
  
  group { 'newrelic':
    ensure    => 'present',
    gid       => '10000'
  }

  file { [
         '/usr/share/newrelic',
         '/var/log/newrelic'
         ]:
    ensure    => directory,
    owner     => 'root',
    group     => 'newrelic',
    mode      => '0775',
    before    => Package['newrelic-sysmond'],
  }

  file {'/usr/share/newrelic/newrelic.yml':
    ensure    => present,
    owner     => 'root',
    group     => 'newrelic',
    mode      => '0644',
    content   => template('yapstone_config/newrelic.yml.erb'),
    require   => Package['newrelic-sysmond'],
    notify    => Service['newrelic-sysmond'],
  }

  case "$ec2_tag_product" {
    'kafka': {
      file {'/usr/share/newrelic/kafka-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/kafka-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
    }
    'zk': {
      file {'/usr/share/newrelic/zk-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
    }
    'infra', 'rinfra' : {
      file {'/usr/share/newrelic/zk-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/zk-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
      file {'/usr/share/newrelic/kafka-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/kafka-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
      file {'/usr/share/newrelic/samza-eu-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/samza-eu-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
      file {'/usr/share/newrelic/samza-rp-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/samza-rp-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
      file {'/usr/share/newrelic/samza-ha-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/samza-ha-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
    }
    'notification': {
      file {'/usr/share/newrelic/samza-eu-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/samza-eu-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
      file {'/usr/share/newrelic/samza-rp-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/samza-rp-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
      file {'/usr/share/newrelic/samza-ha-newrelic.yml':
        ensure    => present,
        owner     => 'root',
        group     => 'newrelic',
        mode      => '0644',
        content   => template('yapstone_config/samza-ha-newrelic.yml.erb'),
        require   => Package['newrelic-sysmond'],
        notify    => Service['newrelic-sysmond'],
      }
    }
  }

  file {'/etc/newrelic/nrsysmond.cfg':
    ensure    => present,
    owner     => 'root',
    group     => 'newrelic',
    mode      => '0644',
    content   => template('yapstone_config/nrsysmond.cfg.erb'),
    require   => Package['newrelic-sysmond'],
    notify    => Service['newrelic-sysmond'],
  }

  # Ensures Sysmond Newrelic Running
  service {'newrelic-sysmond':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   => Package['newrelic-sysmond'],
    start     => '/etc/init.d/newrelic-sysmond start',
    restart   => '/etc/init.d/newrelic-sysmond restart',
    status    => '/etc/init.d/newrelic-sysmond status',
  }
}
