#
# User Access for contractors Read Only
#

class profile::user_access::user_ro_contractors {

  $groups     = hiera('profile::user_contractors::group', 'contractors')
  
  group { $groups:
    ensure     => 'present',
  }

  yapstone_config::yap_useradd { 'jkerak':
    username     => 'jkerak',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jkerak'),
  }
  yapstone_config::yap_useradd { 'bnewshel':
    username     => 'bnewshel',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::bnewshel'),
  }
  yapstone_config::yap_useradd { 'schandra':
    username     => 'schandra',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::schandra'),
  }
  yapstone_config::yap_useradd { 'jshin':
    username     => 'jshin',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jshin'),
  }
  yapstone_config::yap_useradd { 'sjoolee':
    username     => 'sjoolee',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sjoolee'),
  } 
  yapstone_config::yap_useradd { 'sderr':
    username     => 'sderr',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sderr'),
  }
  yapstone_config::yap_useradd { 'rambrose':
    username     => 'rambrose',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::rambrose'),
  }
  yapstone_config::yap_useradd { 'psompalli':
    username     => 'psompalli',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::psompalli'),
  }
  yapstone_config::yap_useradd { 'arauchut':
    username     => 'arauchut',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::arauchut'),
  }
  yapstone_config::yap_useradd { 'jderr':
    username     => 'jderr',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jderr'),
  }
  yapstone_config::yap_useradd { 'jalvarez':
    username     => 'jalvarez',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jalvarez'),
  }
  yapstone_config::yap_useradd { 'afrazier':
    username     => 'afrazier',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::afrazier'),
  }
  yapstone_config::yap_useradd { 'avillanueva':
    username     => 'avillanueva',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::avillanueva'),
  }
  yapstone_config::yap_useradd { 'mhopkins':
    username     => 'mhopkins',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::mhopkins'),
  }
  yapstone_config::yap_useradd { 'kdesai':
    username     => 'kdesai',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::kdesai'),
  }
}
