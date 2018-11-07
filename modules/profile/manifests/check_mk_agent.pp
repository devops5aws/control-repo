#
# check_mk agent
#

class profile::check_mk_agent {

  class { 'check_mk::agent':
    version => hiera('profile::check_mk_agent::version','1.2.6p12-1'),
    package_check_mk  => 'check-mk-agent',
    ip_whitelist => hiera_array('profile::check_mk_agent::ip_whitelist', ['127.0.0.1']),
  }
}
