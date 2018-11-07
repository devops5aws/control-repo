#
# User Access for Qualy's
#
class profile::user_access::user_rw_qualys {

  $group       = hiera('profile::user_qualys::group', 'root')
  $bashrc_user = 'qualys'

  user { 'qualys':
    ensure       => 'present',
    groups       => $group,
    managehome   => 'true',
    shell        => '/bin/bash',
    password     => hiera('profile::passwd::qualys', '$1$HZmc4iUq$EmAy/LkkPP317z295CDGi/'),
  }

  file { '/home/qualys/.bashrc':
    ensure     => present,
    content    => template('profile/bashrc.erb'),
    owner      => qualys,
    group      => qualys,
    mode       => '0644',
    require    => User['qualys'],
  }

  sudo::sudoers {'admin_qualys':
     ensure  => 'present',
     users   => 'qualys',
     runas   => ['ALL'],
     cmnds   => ['ALL'],
     tags    => ['NOPASSWD'],
  }
}
