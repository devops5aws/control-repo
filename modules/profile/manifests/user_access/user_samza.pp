#
# User samza for EMB
#
class profile::user_access::user_samza {
  group { 'samza':
          ensure => 'present',
  }
  user { 'samza':
       ensure           => 'present',
       home             => '/opt/yap-notifications',
       password         => '!!',
       password_max_age => '99999',
       password_min_age => '0',
       shell            => '/bin/bash',
       comment          => 'Yapstone notifications samza user.',
       groups           => [ 'samza', 'newrelic' ],
  }
}
