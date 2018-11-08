#
# NAT Config VIA Puppet
#
class yapstone_config::yap_nat_conf (
  $eni_id_mgmt                 = undef,
  $eni_id_prod                 = undef,
  $eni_id_dev                  = undef,
  ) {

  file {"/var/tmp/eni-id.txt":
    ensure    => present,
    content   => template('yapstone_config/eni-id.txt.erb'),
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
  }

  file {"/var/tmp/eni-id.txt":
    ensure    => present,
    content   => template('yapstone_config/eni-id.txt.erb'),
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
  }

  package { "puppet": ensure => present, }
}
