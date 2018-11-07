#
# Cron Job that checks the IP to update Security Group
#
class profile::cron_verify_vpn {

  cron { 'Verify and UPdate VPN IP':
    ensure        => present,
    command       => 'sh /etc/bootstrap/bootstrap.sh get_vpn_ip > /dev/null 2>&1',
    user          => 'root',
    minute        => '5',
  }
}
