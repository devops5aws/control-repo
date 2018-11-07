#
# Yapstone Environment
#
class yapstone_config::yapstone_env (
  $yap_env      = undef,
  ) {

  if $ec2_tag_component == 'qa-app' {
    file { "/etc/sysconfig/yapstone":
      ensure     => present,
      content    => template('yapstone_config/yapstone_env.erb'),
      owner      => root,
      group      => root,
      mode       => '0644',
      before     => [ 
                      Package['ha-base'],
                      Package['ha-conf'],
                      Package['daemontools'],
                      Package['rp-webapp-app'],
                      Package['apache-tomcat']
                    ],
    }
  }
  elsif $ec2_tag_component == 'qa-web' {
    file { "/etc/sysconfig/yapstone":
      ensure     => present,
      content    => template('yapstone_config/yapstone_env.erb'),
      owner      => root,
      group      => root,
      mode       => '0644',
      before     => [
                      Package['yaprpmq_xinetd'],
                      #Package['yap-ha-lighttpd-conf'],
                      Package['daemontools'],
                      Package['rp-webapp-static']
                      #Package['Yap_ha_domestic']
                    ],
    }
  }
  elsif $ec2_tag_product == 'key' {
    file { "/etc/sysconfig/yapstone":
      ensure     => present,
      content    => template('yapstone_config/yapstone_env.erb'),
      owner      => root,
      group      => root,
      mode       => '0644',
      before     => [
                      Package['daemontools'],
                    ],
    }
  }
  elsif $ec2_tag_product == 'app' {
    file { "/etc/sysconfig/yapstone":
      ensure     => present,
      content    => template('yapstone_config/yapstone_env.erb'),
      owner      => root,
      group      => root,
      mode       => '0644',
      before     => [
                      Package['yaprpmq_xinetd'],
                      Package['daemontools'],
                    ],
    }
  }
  else {
    file { "/etc/sysconfig/yapstone":
      ensure     => present,
      content    => template('yapstone_config/yapstone_env.erb'),
      owner      => root,
      group      => root,
      mode       => '0644',
    }
  }
}
