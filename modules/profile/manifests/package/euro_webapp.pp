#
# RPM for Yapstone Euro WebApp
#

class profile::package::euro_webapp {
  package {'euro-webapp':
    ensure => hiera('profile::package::euro_webapp_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ 'jdk' ],
                 Package[ 'euro-base' ],
                 Package[ 'euro-conf' ],
		 File[ hiera('profile::package::yapstone_env', '/etc/sysconfig/yapstone') ],
               ],
  }
}
