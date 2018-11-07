#
# RPM for Puppet Dashboard
#
class profile::package::puppet_dashboard {
  package {'puppet-dashboard':
    ensure => hiera('profile::package::pupdash_ver', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
