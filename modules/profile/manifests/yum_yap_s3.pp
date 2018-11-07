#
# Yapstone Repo for Prod/Stage/Dev/QA
#
class profile::yum_yap_s3 (
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
      $repo_name = hiera('profile::yum_yap::repo_name', 'yap-s3-default')

      yumrepo { $repo_name:
        descr        => hiera('profile::yum_yap::repo_descr', 'Yapstone S3 Default'),
        baseurl      => hiera('profile::yum_yap::baseurl', 'https://s3-us-west-2.amazonaws.com/yapstone-rpm-repo/$releasever/default'),
        enabled      => hiera('profile::yum_yap::enable', '1'),
        gpgcheck     => hiera('profile::yum_yap::gpgcheck', '0'),
      }
    }
    default: {
      notice("#### NOT Using Centos Yum Repo ####")
    }
  }
}
