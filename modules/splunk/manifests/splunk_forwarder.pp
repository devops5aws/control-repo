#
# Splunk Forwarder for Client Server
#
class yapstone_splunk::splunk_forwarder (

  $targetUri           = undef,
  ) {

  file {'/opt/splunkforwarder/etc/system/local/inputs.conf':
    ensure    => present,
    owner     => 'splunk',
    group     => 'splunk',
    mode      => 0644,
    before    => Service['splunk'],
    content   => template('yapstone_splunk/splunk_forwarder_inputs.conf.erb'),
    require   => Package['splunkforwarder'],
  }

  file {'/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/app.conf':
    ensure    => present,
    owner     => 'splunk',
    group     => 'splunk',
    mode      => 0644,
    before    => Service['splunk'],
    content   => template('yapstone_splunk/splunk_forwarder_app.conf.erb'),
    require   => Package['splunkforwarder'],
  }

  file {'/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/deploymentclient.conf':
    ensure    => present,
    owner     => 'splunk',
    group     => 'splunk',
    mode      => '0644',
    before    => Service['splunk'],
    content   => template('yapstone_splunk/splunk_forwarder_deploymentclient.conf.erb'),
    require   => Package['splunkforwarder'],
  }

  file {'/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/metadata/local.meta.conf':
    ensure    => present,
    owner     => 'splunk',
    group     => 'splunk',
    mode      => '0644',
    before    => Service['splunk'],
    content   => template('yapstone_splunk/splunk_forwarder_local.meta.conf.erb'),
    require   => Package['splunkforwarder'],
  }

  exec { 'initialize_splunk':
    command   =>   "/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt",
    creates   =>   "/tmp/lock_initialize_splunk",
    onlyif    =>   '/usr/bin/test ! -f /tmp/lock_initialize_splunk',
    require   =>   [
                      Package['splunkforwarder'],
                      File['/opt/splunkforwarder/etc/system/local/inputs.conf'],
                   ],
  }

    file { [
            '/opt/splunkforwarder/etc/apps/ys_all_deploymentclient',
            '/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local',
            '/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/metadata',
           ]:
    ensure    => 'directory',
    owner     => 'splunk',
    group     => 'splunk',
    mode      =>  0644,
    before    => [
                   File['/opt/splunkforwarder/etc/system/local/inputs.conf'],
                   File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/app.conf'],
                   File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/deploymentclient.conf'],
                   File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/metadata/local.meta.conf'],
                 ], 
    require   => Package['splunkforwarder'],
  }

  exec { 'initial_splunk_kill':
    command   =>   "kill -9 $(ps auwx |egrep 'spl[u]nk'| awk '{print $2}'|sort |head -1 |xargs); touch /tmp/lock_initialize_splunk",
    path      =>   ['/usr/bin', '/bin',],
    creates   =>   "/tmp/lock_initialize_splunk",
    onlyif    =>   '/usr/bin/test ! -f /tmp/lock_initialize_splunk',
    before    =>   File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/deploymentclient.conf'],
    require   =>   [
                      Package['splunkforwarder'],
                      File['/opt/splunkforwarder/etc/system/local/inputs.conf'],
                      Exec['initialize_splunk'],
                   ],
  }

   exec { 'create_splunk':
     command   =>   "/bin/chown -R splunk:splunk /opt/splunkforwarder; /opt/splunkforwarder/bin/splunk enable boot-start -user splunk; /bin/chown -R splunk::splunk /opt/splunkforwarder; /etc/init.d/splunk start",
     creates   =>   "/etc/init.d/splunk",
     before    =>   Service['splunk'],
     require   =>   [
                       Package['splunkforwarder'],
                       File['/opt/splunkforwarder/etc/system/local/inputs.conf'],
                       Exec['initialize_splunk'],
                       Exec['initial_splunk_kill'],
                       File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/app.conf'],
                       File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/local/deploymentclient.conf'],
                       File['/opt/splunkforwarder/etc/apps/ys_all_deploymentclient/metadata/local.meta.conf'],
                       File['/opt/splunkforwarder/etc/system/local/inputs.conf'],
                    ],
   }

 # Ensures Splunk Daemon is running
  service { 'splunk':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    require   =>   [
                      Package['splunkforwarder'],
                      File['/opt/splunkforwarder/etc/system/local/inputs.conf'],
                      Exec['initialize_splunk'],
                   ],
    start     => '/etc/init.d/splunk start',
    restart   => '/etc/init.d/splunk restart',
    status    => '/etc/init.d/splunk status',
  }
}
