#
#  Python Script that will run with Upstart
#  This will verify if FTDv's are up and down 
#  NOC will be alerted via API and it will modify
#  the routing table respectivily
class profile::yap_ftdv_monitoring {

  class { 'yapstone_config::yap_ftdv_monitoring':
    aws_region      =>  hiera('profile::yap_aws_zone::region_zone'),
    apiurl          =>  hiera('profile::ftdv::apiurl', 'noctools.it.yapstone.com/NOCToolsWebService.svc/HostStatus'),
    ftdv_routetable =>  hiera('profile::ftdv::routetable'),
    ftdv1_ip        =>  hiera('profile::ftdv::ftdv1_ip'),
    ftdv2_ip        =>  hiera('profile::ftdv::ftdv2_ip'),
    ftdv1_eni       =>  hiera('profile::ftdv::ftdv1_eni'),
    ftdv2_eni       =>  hiera('profile::ftdv::ftdv2_eni'),
    ftdv_vpn_ip1    =>  hiera('profile::ftdv::vpn_ip1'),
    ftdv_vpn_ip2    =>  hiera('profile::ftdv::vpn_ip2'),
  }

  # Logrotate
  ::logrotate::rule { 'ftdv':
    path          => '/var/log/ftdv*log',
    rotate        => 366,
    rotate_every  => 'week',
    sharedscripts => true,
    compress      => true,
    missingok     => true,
    copytruncate  => true,
    dateext       => true,
    ifempty       => false,
    postrotate    => '/sbin/restart verify-ftdv',
  }
}
