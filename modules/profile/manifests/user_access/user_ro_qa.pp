#
# User Access for QA Read Only
#

class profile::user_access::user_ro_qa {

  $groups     = hiera('profile::user_qa::group', 'qa')
  

  group { $groups:
    ensure     => 'present',
  }

  yapstone_config::yap_useradd { 'vgorodetskiy':
    username     => 'vgorodetskiy',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::vgorodetskiy'),
  }

  yapstone_config::yap_useradd { 'kumakanthan':
    username     => 'kumakanthan',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::kumakanthan'),
  }

  yapstone_config::yap_useradd { 'tbanks':
    username     => 'tbanks',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::tbanks'),
  }

  yapstone_config::yap_useradd { 'sdharma':
    username     => 'sdharma',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sdharma'),
  }

  yapstone_config::yap_useradd { 'ryu':
    username     => 'ryu',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::ryu'),
  }

  yapstone_config::yap_useradd { 'arandhawa':
    username     => 'arandhawa',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::arandhawa'),
  }

  yapstone_config::yap_useradd { 'mstadlin':
    username     => 'mstadlin',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::mstadlin'),
  }

  yapstone_config::yap_useradd { 'ptullao':
    username     => 'ptullao',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::ptullao'),
  }

  yapstone_config::yap_useradd { 'ratre':
    username     => 'ratre',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::ratre'),
  }

  yapstone_config::yap_useradd { 'sbei':
    username     => 'sbei',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sbei'),
  }

  yapstone_config::yap_useradd { 'pmehta':
    username     => 'pmehta',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::pmehta'),
  }

  yapstone_config::yap_useradd { 'rmehta':
    username     => 'rmehta',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::rmehta'),
  }

  yapstone_config::yap_useradd { 'smuttukuru':
    username     => 'smuttukuru',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::smuttukuru'),
  }

  yapstone_config::yap_useradd { 'skeesara':
    username     => 'skeesara',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::skeesara'),
  }

  yapstone_config::yap_useradd { 'gheath':
    username     => 'gheath',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::gheath'),
  }

  yapstone_config::yap_useradd { 'sgovindaraj':
    username     => 'sgovindaraj',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sgovindaraj'),
  }

  yapstone_config::yap_useradd { 'vkrishna':
    username     => 'vkrishna',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::vkrishna'),
  }

  yapstone_config::yap_useradd { 'pladdha':
    username     => 'pladdha',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::pladdha'),
  }

  yapstone_config::yap_useradd { 'abhayani':
    username     => 'abhayani',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::abhayani'),
  }

  yapstone_config::yap_useradd { 'ssakhawalkar':
    username     => 'ssakhawalkar',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::ssakhawalkar'),
  }

  yapstone_config::yap_useradd { 'lhollister':
    username     => 'lhollister',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::lhollister'),
  }

  yapstone_config::yap_useradd { 'skobbaji':
    username     => 'skobbaji',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::skobbaji'),
  }

  yapstone_config::yap_useradd { 'sjoshi':
    username     => 'sjoshi',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::sjoshi'),
  }

  yapstone_config::yap_useradd { 'jjawle':
    username     => 'jjawle',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jjawle'),
  }

  yapstone_config::yap_useradd { 'brai':
    username     => 'brai',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::brai'),
  }

  yapstone_config::yap_useradd { 'erosen':
    username     => 'erosen',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::erosen'),
  }

  yapstone_config::yap_useradd { 'dchelyadnik':
    username     => 'dchelyadnik',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::dchelyadnik'),
  }

  ssh_authorized_key { 'skobbaji_win':
    ensure     => present,
    user       => 'skobbaji',
    type       => 'rsa',
    key        => hiera('profile::pub_key::skobbaji_win'),
  }

  ssh_authorized_key { 'lhollister_win':
    ensure     => present,
    user       => 'lhollister',
    type       => 'rsa',
    key        => hiera('profile::pub_key::lhollister_win'),
  }
}
