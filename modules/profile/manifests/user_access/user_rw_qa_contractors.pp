#
# User Access for Contractors root on QA Env
#

class profile::user_access::user_rw_qa_contractors {

  $groups     = hiera('profile::user_qa_contractors::group', 'root')
  $sudo_user  = [ 'c-rgajjar',
                ]

  yapstone_config::yap_useradd { 'c-rgajjar':
    username     => 'c-rgajjar',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::c-rgajjar'),
  }
  

  sudo::sudoers {'contractors_rw':
    ensure  => 'present',
    users   => $sudo_user,
    runas   => ['ALL'],
    cmnds   => ['ALL'],
    tags    => ['NOPASSWD'],
  }
}
