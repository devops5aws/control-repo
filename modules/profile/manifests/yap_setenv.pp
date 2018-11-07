#
# Puts /etc/sysconfig/setenv.sh
#
class profile::yap_setenv {

  class {'yapstone_config::aws_setenv':
    heapconfig        =>  hiera('profile::setenv::heapconfig'),
    heapdumppath      =>  hiera('profile::setenv::heapdumppath'),
    gclogpath         =>  hiera('profile::setenv::gclogpath'),
    gcoption          =>  hiera('profile::setenv::gcoption', '-XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode'),
    maxpermsize       =>  hiera('profile::setenv::maxpermsize', '256m'),
    apphome           =>  hiera('profile::setenv::apphome', '/home/webapps/rentpayment'),
    proxyhost         =>  hiera('profile::setenv::proxyhost', 'proxy'),
    proxyport         =>  hiera('profile::setenv::proxyport', '3128'),
    nonproxyhosts     =>  hiera('profile::setenv::nonproxyhosts'),
    javaagent         =>  hiera('profile::setenv::javaagent', '/usr/share/newrelic/newrelic.jar'),
    sslprotocols      =>  hiera('profile::setenv::sslprotocols'),
    add_line          =>  hiera_array('profile::setenv::add_line'),
  }
}
