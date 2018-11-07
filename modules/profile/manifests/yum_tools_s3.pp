#
# Yapstone Tools Repo
#
class profile::yum_tools_s3 (
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
      $repo_name = hiera('profile::yum_tools::repo_name')
      yumrepo { $repo_name:
        descr        => hiera('profile::yum_tools::repo_descr'),
        baseurl      => hiera('profile::yum_tools::baseurl'),
        enabled      => hiera('profile::yum_tools::enable', '1'),
        gpgcheck     => hiera('profile::yum_tools::gpgcheck', '0'),
        before       => [
                          Package['ntp'],
                          Package['xinetd'],
                        ],
      }
    }
    default: {
      $repo_name = hiera('profile::yum_tools::repo_name')
      yumrepo { $repo_name:
        descr        => hiera('profile::yum_amzn_tools::repo_descr', 'Amazon Linux Tools'),
        baseurl      => hiera('profile::yum_amzn_tools::baseurl', 'https://s3-us-west-2.amazonaws.com/yapstone-rpm-repo/6/tools/x86_64'),
        enabled      => hiera('profile::yum_amzn_tools::enable', '1'),
        gpgcheck     => hiera('profile::yum_amzn_tools::gpgcheck', '0'),
        before       => [
                          Package['ntp'],
                          Package['xinetd'],
                        ],
      }
    }
  }
}
