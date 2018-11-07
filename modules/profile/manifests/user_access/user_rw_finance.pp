#
# User Access for Finance
#

class profile::user_access::user_rw_finance {

  $groups     = hiera('profile::user_finance::group', 'root')
  $sudo_user  = [ 'jskilbeck',
                ]

  yapstone_config::yap_useradd { 'jskilbeck':
    username     => 'jskilbeck',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jskilbeck'),
  }

  sudo::sudoers {'finance_rw':
    ensure  => 'present',
    users   => $sudo_user,
    runas   => ['ALL'],
    cmnds   => ['ALL'],
    tags    => ['NOPASSWD'],
  }
}
