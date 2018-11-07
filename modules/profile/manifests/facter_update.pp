#
# Script Used for updating facter tags every run
#
class profile::facter_update {

  file {'/var/tmp/facter_update.sh':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0744',
    source => 'puppet:///modules/profile/facter_update.sh',
  }

  exec { 'Facter UPDATE':
    command    => "/var/tmp/facter_update.sh",
    path       => ["/bin", "/usr/bin", "/var/tmp", "/etc/facter/facts.d/"],
  }
}
