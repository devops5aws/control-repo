#
# Package to put the newrelic.jar in /usr/share/newrelic/
#
class profile::package::yap_newrelic {
  package {'yap-newrelic':
    ensure => hiera('profile::package::yap_newrelic_ver', 'present'),
    require => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
