#
# Base packages Ruby Devel
# 
class profile::package::ruby_devel {
  package { ruby-devel:
    ensure => present,
  }
}
