#
# Base packages mysql-devel
# 
class profile::package::mysql_devel {
  package { mysql-devel:
    ensure => present,
  }
}
