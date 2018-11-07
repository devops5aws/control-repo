#
# User Access for contractors on QA env Read Only
#

class profile::user_access::user_ro_qa_contractors {

  $groups     = hiera('profile::user_qa_contractors::group', 'qa_contractors')
  
  group { $groups:
    ensure     => 'present',
  }

  yapstone_config::yap_useradd { 'c-rgajjar':
    username     => 'c-rgajjar',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::c-rgajjar'),
  }

}
