#
# RPM for jdk 1.8
#
class profile::package::jdk_1_8 {
  package {'jdk1.8.0_74':
    ensure => hiera('profile::package::jdk8_ver', 'present'),
    require => Yumrepo['yap-tools'],
  }
}
