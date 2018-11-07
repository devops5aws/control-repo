#
# YapStone MOTD
#

class profile::yapstone_motd {
  file { '/etc/motd':
    ensure    => 'present',
    owner     => 'root',
    group     => 'root',
    mode      => 0644,
    content   => template('profile/yapstone_motd.erb'),
  }
}
