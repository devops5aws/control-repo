#
# RPM for Yapstone yaprpmq xinetd service
#
class profile::package::yaprpmq_xinetd {
  package {'yaprpmq_xinetd':
    ensure => hiera('profile::package::yaprpmq_ver', 'present'),
    require => Yumrepo[ hiera('profile::yum_yap::repo_name') ],
  }
}
