#
# Yapstone Catalina Environment
#
class yapstone_config::yap_catalina_env (
  $yap_catalina_env          = [],
  ) {

  file { "/etc/sysconfig/tomcat/env/CATALINA_BASE":
    ensure     => present,
    content    => template('yapstone_config/yap_catalina_env.erb'),
    owner      => root,
    group      => root,
    mode       => '0644',
  }

  file { [ '/etc/sysconfig/tomcat',
           '/etc/sysconfig/tomcat/env',
         ]:
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
    recurse => true,
  }
}
