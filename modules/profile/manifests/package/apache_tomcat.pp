#
# RPM for Yapstone Apache Tomcat
#
class profile::package::apache_tomcat {
  package {'apache-tomcat':
    ensure => hiera('profile::package::apache_tomcat_ver', '7.0.53-20140724'),
    require => [
                 Yumrepo[ hiera('profile::yum_yap::repo_name') ],
                 Package[ hiera('profile::package::jdk_pkg', 'jdk') ],
                 Package[ 'daemontools' ],
               ],
  }
}
