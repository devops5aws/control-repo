#
# rp-webapp-static
#
class profile::package::rp_webapp_static{
  package {'rp-webapp-static':
    ensure => hiera('profile::package::rp_webapp_static_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
