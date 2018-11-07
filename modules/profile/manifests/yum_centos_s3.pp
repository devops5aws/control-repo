#
# Yapstone Repo for CentOS Base
#
class profile::yum_centos_s3 (
  $descr       = undef,
  $baseurl     = undef,
  $enabled     = undef,
  $gpgcheck    = undef,
  $includepkgs = undef,
  $exclude     = undef,
  $gpgkey      = undef,
  ) {

  case $::operatingsystem {
    'CentOS': {
      $repo_os_name = hiera('profile::yum_os_centos::repo_name', 'CentOS-S3-Base')
      $repo_updates_name = hiera('profile::yum_updates_centos::repo_name', 'CentOS-S3-Updates')

      yumrepo { $repo_os_name:
        descr        => hiera('profile::yum_os_centos::repo_descr', 'CentOS-$releasever - S3 Base'),
        baseurl      => hiera('profile::yum_os_centos::baseurl', 'https://s3-us-west-2.amazonaws.com/yapstone-centos6/$releasever/os/$basearch/'),
        enabled      => hiera('profile::yum_os_centos::enable', '1'),
        gpgcheck     => hiera('profile::yum_os_centos::gpgcheck', '1'),
        gpgkey       => hiera('profile::yum_os_centos::gpgkey', 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'),
      }

      yumrepo { $repo_updates_name:
        descr        => hiera('profile::yum_updates_centos::repo_descr', 'CentOS-$releasever - S3 Updates'),
        baseurl      => hiera('profile::yum_updates_centos::baseurl', 'https://s3-us-west-2.amazonaws.com/yapstone-centos6/$releasever/updates/$basearch/'),
        enabled      => hiera('profile::yum_updates_centos::enable', '1'),
        gpgcheck     => hiera('profile::yum_updates_centos::gpgcheck', '1'),
        gpgkey       => hiera('profile::yum_updates_centos::gpgkey', 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'),
      }
    }
    default: {
      notice("#### NOT Using Centos Yum Repo ####")
    }
  }
}
