#
# User Access for NOC Read Only
#

class profile::user_access::user_ro_noc {

  $groups     = hiera('profile::user_noc::group', 'noc')
  $sudo_user  = [ 'selliott',
                  'schakrabarty',
                  'rmcmann'
                ]

  group { $groups:
    ensure     => 'present',
  }

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

}
