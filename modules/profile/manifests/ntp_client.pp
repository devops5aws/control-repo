class profile::ntp_client {

#  include ::ntp

  class {'ntp':
    restrict                               => hiera('profile::ntp_client::restrict', ['IPV4: restrict default limited kod nomodify notrap nopeer noquery', 'IPv6: restrict -6 default limited kod nomodify notrap nopeer noquery']),
    servers                                => hiera('profile::ntp_client::servers'),
#    enable                                 => hiera('profile::ntp_server::enable', 'true'),
  }

}