#
# DB Passwd encrypted via hiera
#
class yapstone_config::yap_db_user (
  $yap_username      = undef,
  $yap_passwd        = undef,
  ) {
  file { "/etc/sysconfig/yap-db-user.m4":
    ensure     => present,
    content    => template('yapstone_config/yap-db-user.m4.conf.erb'),
    owner      => root,
    group      => root,
    mode       => '0600',
    before     => [ 
                    Package['daemontools'],
                    Package['apache-tomcat']
                  ],
  }
}
