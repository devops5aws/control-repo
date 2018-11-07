#
# Upstart: Samza
# 

class profile::upstart_samza {

  include ::upstart

  ::upstart::job { 'samza-ha':
    description     => 'Used for running Samza Services',
    console         => output,
    chdir           => '/opt/yap-notifications',
    script          => 'runuser -l samza -c bin/run-samza-ha.sh | logger -t yap-notifications-ha',
    post_stop       => 'pkill -f yap-notifications-ha',
    require         => [
                         Package['jdk1.8.0_74'],
                         Package['yap-notifications-server'],
                       ],
  }
  ::upstart::job { 'samza-rp':
    description     => 'Used for running Samza Services',
    console         => output,
    chdir           => '/opt/yap-notifications',
    script          => 'runuser -l samza -c bin/run-samza-rp.sh | logger -t yap-notifications-rp',
    post_stop       => 'pkill -f yap-notifications-rp',
    require         => [
                         Package['jdk1.8.0_74'],
                         Package['yap-notifications-server'],
                       ],
  }

  ::upstart::job { 'samza-eu':
    description     => 'Used for running Samza Services',
    console         => output,
    chdir           => '/opt/yap-notifications',
    script          => 'runuser -l samza -c bin/run-samza-eu.sh | logger -t yap-notifications-eu',
    post_stop       => 'pkill -f yap-notifications-eu',
    require         => [
                         Package['jdk1.8.0_74'],
                         Package['yap-notifications-server'],
                       ],
  }
}
