#
# Profile for package jq
# https://stedolan.github.io/jq/

class profile::package::jq {
  package {'jq':
    ensure => installed,
  }
}
