#
# User Access for DevOps Team
#

class profile::user_access::user_devops {

  $groups     = hiera('profile::user_access::group', 'root')
  $sudo_user  = [ 'lhnguyen',
                  'jhogue',
                  'vabbina',
                  'zstevens',
                  'mbixby',
                  'vsarnatckii',
                  'vkimaro',
                  'gmalik',
                  'tchau',
                  'akuncewitch',
                  'jwilliams',
                  'mporter',
                  'skoorapati',
                ]

  yapstone_config::yap_useradd { 'lhnguyen':
    username     => 'lhnguyen',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::lhnguyen'),
  }

  yapstone_config::yap_useradd { 'jhogue':
    username     => 'jhogue',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jhogue'),
  }

  yapstone_config::yap_useradd { 'mbixby':
    username     => 'mbixby',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::mbixby'),
  }

  yapstone_config::yap_useradd { 'zstevens':
    username     => 'zstevens',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::zstevens'),
  }

yapstone_config::yap_useradd { 'vabbina':
    username     => 'vabbina',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::vabbina'),
  }

  yapstone_config::yap_useradd { 'vsarnatckii':
    username     => 'vsarnatckii',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::vsarnatckii'),
  }

  yapstone_config::yap_useradd { 'vkimaro':
    username     => 'vkimaro',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::vkimaro'),
  }

  yapstone_config::yap_useradd { 'gmalik':
    username     => 'gmalik',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::gmalik'),
  }

  yapstone_config::yap_useradd { 'tchau':
    username     => 'tchau',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::tchau'),
  }

  yapstone_config::yap_useradd { 'akuncewitch':
    username     => 'akuncewitch',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::akuncewitch'),
  }

  yapstone_config::yap_useradd { 'jwilliams':
    username     => 'jwilliams',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jwilliams'),
  }

  yapstone_config::yap_useradd { 'mporter':
    username     => 'mporter',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::mporter'),
  }

  yapstone_config::yap_useradd { 'skoorapati':
    username     => 'skoorapati',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::skoorapati'),
  }

  user { [
     'dwheet',
     'zhanna',
     'tturner',
     'jquinteiro',
    ]:
     ensure => 'absent',
  }

  sudo::sudoers {'admin':
    ensure    => 'present',
    users     => $sudo_user,
    runas     => ['ALL'],
    cmnds     => ['ALL'],
    tags      => ['NOPASSWD'],
  }

  sudo::sudoers {'admin_puppet':
    ensure    => 'present',
    users     => $sudo_user,
    runas     => ['ALL'],
    cmnds     => ['/usr/bin/puppet',
                  '/sbin/service puppet',
                 ],
    tags      => ['NOPASSWD'],
    defaults  => ['!requiretty'],
  }

  file { '/etc/sudoers.d/':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0750',
  }

  case $::operatingsystemrelease {
    '5.11': {
      file_line { "/etc/sudoers":
        path      => "/etc/sudoers",
        line      => "#includedir /etc/sudoers.d",
      }
    }
  }
}
