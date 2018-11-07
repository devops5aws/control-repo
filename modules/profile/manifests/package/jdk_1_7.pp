#
# RPM for jdk 1.7
#
class profile::package::jdk_1_7 {
  package {'jdk':
    ensure => hiera('profile::package::jdk_ver', '1.7.0_25-fcs'),
    require => Yumrepo[ hiera('profile::yum_yap::repo_name') ],
  }
}
