#
# RPM for Apache Solr
#
class profile::package::apache_solr {
  package {'apache-solr':
    ensure => hiera('profile::package::apache_solr_ver', 'present'),
    require => [
                 Yumrepo[ hiera('profile::yum_tools::repo_name', 'yap-tools') ],
                 Package[ hiera('profile::package::jdk8_ver', 'jdk1.8.0_74') ],
               ],
  }
}
