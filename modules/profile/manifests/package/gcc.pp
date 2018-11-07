#
# Base packages gcc
# 
class profile::package::gcc {
  package { gcc:
    ensure => present,
  }
}
