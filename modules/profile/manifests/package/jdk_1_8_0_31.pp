#
# RPM for jdk1.8.0_31
#
class profile::package::jdk_1_8_0_31 {
  package {'jdk1.8.0_31':
    ensure => hiera('profile::package::jdk18_ver', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
