#
# RPM for Zookeeper Server
#
class profile::package::zookeeper_server {
  package {'zookeeper-server':
    ensure  => hiera('profile::package::zookeeper_server', 'present'),
    before  => Class[ '::yapstone_zookeeper' ],
    require => [
                 Yumrepo[ hiera('profile::yum_tools::repo_name') ],
                 Yumrepo[ hiera('profile::yum_os_centos::repo_name', 'CentOS-S3-Base') ],
                 Yumrepo[ hiera('profile::yum_updates_centos::repo_name', 'CentOS-S3-Updates') ],
                 Package[ 'zookeeper' ],
                 Package[ 'bigtop-utils' ],
                 Package[ 'jdk1.8.0_74' ],
               ],
  }
}
