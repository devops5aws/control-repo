#
# RPM for Yapstone Cathedral WebApp
#

class profile::package::cathedral_webapp_app {

  package { 'cathedral-webapp-app':
    ensure => hiera('profile::package::cathedral_webapp_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 Package[ 'cathedral-base' ],
                 Package[ 'cathedral-conf' ],
               ],
  }
}
