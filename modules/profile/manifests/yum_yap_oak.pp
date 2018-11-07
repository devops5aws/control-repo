#
# Yapstone Custom Repo for Build
#
class profile::yum_yap_oak (
  $descr       = undef,
  $baseurl     = undef,
  $enabled     = undef,
  $gpgcheck    = undef,
  $includepkgs = undef,
  $exclude     = undef,
  $gpgkey      = undef,
  ) {

  $repo_name   = hiera('profile::yum_yapbuild_repo::repo_name')

  yumrepo { $repo_name:
    descr        => hiera('profile::yum_yapbuild_repo::repo_descr'),
    baseurl      => hiera('profile::yum_yapbuild_repo::baseurl'),
    enabled      => hiera('profile::yum_yapbuild_repo::enable', '1'),
    gpgcheck     => hiera('profile::yum_yapbuild_repo::gpgcheck', '0'),
  } 
}
