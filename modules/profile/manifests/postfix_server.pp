class profile::postfix_server {

  class {'postfix':
 
    smtp_listen                            => hiera('profile::postfix::smtp_listen', '0.0.0.0'),
    inet_interfaces                        => hiera('profile::postfix::inet_interfaces', 'all'),
    myorigin                               => hiera('profile::postfix::myorigin'),
    mynetworks                             => hiera('profile::postfix::mynetworks', '127.0.0.1'),
    mta                                    => true,
    relayhost                              => 'direct', 
    	
  }

}

  