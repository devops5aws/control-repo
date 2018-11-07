#
# Bind Utils for server
#
class profile::package::bind_utils {
  package {'bind-utils':
    ensure => hiera('profile::package::bind_utils', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
