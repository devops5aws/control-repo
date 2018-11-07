#
# VPN sysctl config
#
class profile::sysctl_vpn {

  ::sysctl {'net.ipv4.ip_forward':
    value   => '1',
  }

  ::sysctl {'net.ipv4.conf.all.accept_redirects':
    value   => '0',
  }

  ::sysctl {'net.ipv4.conf.all.send_redirects':
    value   => '0',
  }
} 
