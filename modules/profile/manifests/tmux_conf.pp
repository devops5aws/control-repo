#
# Tmux Config with ssh-agent
#

class profile::tmux_conf {

  $tmux_location = hiera('profile::tmux_conf::tmux_location', '/home/deploy/.tmux.conf')
  $rc_location   = hiera('profile::rc_conf::rc_location', '/home/deploy/.ssh/rc')
  $owner_server  = hiera('profile::tmux_conf::owner_server', 'deploy')
  $group_server  = hiera('profile::tmux_conf::group_server', 'deploy')

  file { $tmux_location:
    source => 'puppet:///modules/profile/tmux.conf',
    owner  => $owner_server,
    group  => $group_server,
    mode   => 0644,
  }

  file { $rc_location:
    source => 'puppet:///modules/profile/rc',
    owner  => $owner_server,
    group  => $group_server,
    mode   => 0700,
  }
}
