#
# Yapstone Java Environment
#
class yapstone_config::yap_java_env (
  $java_home         = undef,
  $java_opts         = undef,
  $java_bindir       = undef,
  $java_root         = undef,
  ) {

  file { "/etc/profile.d/java-env.sh":
    ensure     => present,
    content    => template('yapstone_config/java_env.sh.erb'),
    owner      => root,
    group      => root,
    mode       => '0664',
  }

  file { '/etc/java':
    ensure     => directory,
    owner      => 'root',
    group      => 'root',
    mode       => 0755,
  }

  file { '/etc/java/java.conf':
    ensure     => 'link',
    target     => '/etc/profile.d/java-env.sh',
    require    => File[ '/etc/profile.d/java-env.sh' ],
  }
}
