#
# Script Used for adding app hostname to web server
#
class profile::add_server_host {

  file {'/var/tmp/add_server_host.sh':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0744',
    source => 'puppet:///modules/profile/facter_add_host.sh',
  }

  exec { 'add_server_host':
    command => "/var/tmp/add_server_host.sh",
    path    => ["/bin", "/usr/bin", "/usr/sbin", "/etc/facter/facts.d/"],
    onlyif  => "/usr/bin/test ! -f /etc/facter/facts.d/ec2_app_hostname.txt",
    before  => [ 
                 Class['profile::upstart_lighttpd'],
               ],
  }
}
