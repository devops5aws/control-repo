#
# Cron Enable/Start Puppet
#
class profile::cron_puppet_agent {

  cron { 'enable_puppet_agent':
    ensure      => present,
    command     => 'if [ -f "/var/lib/puppet/state/agent_disabled.lock" ] ; then /sbin/service puppet --enable; fi 2>&1',
    user        => 'root',
    hour        => '1',
  }

  cron { 'start_puppet_agent':
    ensure      => present,
    command     => 'if [ `ps auwx|grep -c pu[p]pet` == 0 ] ; then /usr/bin/puppet agent start; fi 2>&1',
    user        => 'root',
    hour        => '2',
  }
}
