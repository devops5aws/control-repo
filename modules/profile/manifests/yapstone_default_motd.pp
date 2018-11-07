#
# YapStone Default MOTD
# No Puppet Manifest

class profile::yapstone_default_motd {
  file { '/etc/motd':
    source => 'puppet:///modules/profile/yapstone_default_motd',
    owner  => root,
    group  => root,
    mode   => 644,
  }
}
