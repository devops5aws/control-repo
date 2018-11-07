#
# cathedral_webapp_static
#

class profile::package::cathedral_webapp_static {
  package { 'cathedral-webapp-static':
    ensure => hiera('profile::package::cathedral_webapp_static_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'lighttpd' ],
               ],
  }
}
