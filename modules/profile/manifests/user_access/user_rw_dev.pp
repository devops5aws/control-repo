#
# User Access for dev root
#

class profile::user_access::user_rw_dev {

  $groups     = hiera('profile::user_dev::group', 'root')
  $sudo_user  = [ 'kpogula',
                  'snizar',
                  'c-pelamkootil',
                  'mmccartney',
                  'vtieu',
                  'spatil',
                  'smuraleedharan',
                  'ssung',
                  'flu',
                  'jsabhnani',
                  'dmadan',
                  'rlo',
                  'rtulloh',
                  'avoinovan',
                  'uortiz',
                  'sjaksic',
                  'kboylan',
                  'apatil',
                  'spethe',
                  'wlear',
                  'sthummati',
                  'jkemper',
                ]

  yapstone_config::yap_useradd { 'kpogula':
    username     => 'kpogula',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::kpogula'),
  }

  yapstone_config::yap_useradd { 'snizar':
    username     => 'snizar',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::snizar'),
  }

  yapstone_config::yap_useradd { 'c-pelamkootil':
    username     => 'c-pelamkootil',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::c-pelamkootil'),
  }

  yapstone_config::yap_useradd { 'vtieu':
    username     => 'vtieu',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::vtieu'),
  }

  yapstone_config::yap_useradd { 'sjaksic':
    username     => 'sjaksic',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sjaksic'),
  }

  yapstone_config::yap_useradd { 'kboylan':
    username     => 'kboylan',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::kboylan'),
  }

  yapstone_config::yap_useradd { 'apatil':
    username     => 'apatil',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::apatil'),
  }

  yapstone_config::yap_useradd { 'mmccartney':
    username     => 'mmccartney',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::mmccartney'),
  }

  yapstone_config::yap_useradd { 'spatil':
    username     => 'spatil',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::spatil'),
  }

  yapstone_config::yap_useradd { 'smuraleedharan':
    username     => 'smuraleedharan',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::smuraleedharan'),
  }

  yapstone_config::yap_useradd { 'ssung':
    username     => 'ssung',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::ssung'),
  }

  yapstone_config::yap_useradd { 'flu':
    username     => 'flu',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::flu'),
  }

  yapstone_config::yap_useradd { 'jsabhnani':
    username     => 'jsabhnani',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jsabhnani'),
  }

  yapstone_config::yap_useradd { 'dmadan':
    username     => 'dmadan',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::dmadan'),
  }

  yapstone_config::yap_useradd { 'rlo':
    username     => 'rlo',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::rlo'),
  }

  yapstone_config::yap_useradd { 'rtulloh':
    username     => 'rtulloh',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::rtulloh'),
  }

  yapstone_config::yap_useradd { 'avoinovan':
    username     => 'avoinovan',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::avoinovan'),
  }

  yapstone_config::yap_useradd { 'uortiz':
    username     => 'uortiz',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::uortiz'),
  }

  yapstone_config::yap_useradd { 'spethe':
    username     => 'spethe',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::spethe'),
  }

  yapstone_config::yap_useradd { 'wlear':
    username     => 'wlear',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::wlear'),
  }

  yapstone_config::yap_useradd { 'sthummati':
    username     => 'sthummati',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sthummati'),
  }

yapstone_config::yap_useradd { 'jkemper':
    username     => 'jkemper',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jkemper'),
  }

  user { [
     'eseaberg',
    ]:
     ensure => 'absent',
  }
 
  sudo::sudoers {'dev_rw':
    ensure  => 'present',
    users   => $sudo_user,
    runas   => ['ALL'],
    cmnds   => ['ALL'],
    tags    => ['NOPASSWD'],
  }
}
