#
#  Yapstone Java Env
#
class profile::yap_java_env {

  class { '::yapstone_config::yap_java_env':
    java_home            => hiera('profile::yap_java::java_hame', '/usr/java/jdk1.7.0_25'),
    java_opts            => hiera('profile::yap_java::java_opts', '-server -Xms256m -Xmx512m'),
    java_bindir          => hiera('profile::yap_java::java_bindir', '$JAVA_HOME/jre/bin'),
    java_root            => hiera('profile::yap_java::java_root', '$JAVA_HOME'),
  }
}
