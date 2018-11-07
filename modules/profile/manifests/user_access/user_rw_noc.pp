#
# User Access for NOC root
#

class profile::user_access::user_rw_noc {

  $groups     = hiera('profile::user_noc::group', 'root')
  $sudo_user  = [ 'selliott',
                  'schakrabarty',
                  'rmcmann'
                ]

  yapstone_config::yap_useradd { 'selliott':
    username     => 'selliott',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::selliott'),
  }

  yapstone_config::yap_useradd { 'schakrabarty':
    username     => 'schakrabarty',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::schakrabarty'),
  }

  yapstone_config::yap_useradd { 'rmcmann':
    username     => 'rmcmann',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::rmcmann'),
  }

  sudo::sudoers {'noc_rw':
    ensure  => 'present',
    users   => $sudo_user,
    runas   => ['ALL'],
    cmnds   => ['ALL'],
    tags    => ['NOPASSWD'],
  }
}
