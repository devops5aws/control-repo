#
# Jenkins Slave
#
class yapstone_jenkins::jenkins_slave {

  ssh_authorized_key { 'jenkins':
    ensure     => present,
    user       => 'root',
    type       => 'rsa',
    key        => hiera('profile::jenkins::root_pubkey'),
  }

  file { '/var/jenkins':
    ensure    => 'directory',
    owner     => 'root',
    group     => 'root',
    mode      => 0755,
  }
}
