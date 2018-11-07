#
# RPM for newrelic-sysmond
#
class profile::package::newrelic_sysmond {
  package {'newrelic-sysmond':
    ensure => hiera('profile::package::newrelic_sysmond_ver', 'present'),
    require => Yumrepo[ hiera('profile::yum_tools::repo_name') ],
  }
}
