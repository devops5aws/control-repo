#
# User Access for Contractors root
#

class profile::user_access::user_rw_splunk {

  $groups     = hiera('profile::user_splunk::group', 'root')
  $sudo_user  = [ 'psompalli',
                  'mhopkins',
                ]

  yapstone_config::yap_useradd { 'psompalli':
    username     => 'psompalli',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::psompalli'),
  }
  yapstone_config::yap_useradd { 'mhopkins':
    username     => 'mhopkins',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::mhopkins'),
  }
  user { [
     'chopper',
     'bshuler',
    ]:
     ensure => 'absent',
  }
  sudo::sudoers {'splunk_rw':
     ensure  => 'present',
     users   => $sudo_user,
     runas   => ['ALL'],
     cmnds   => ['ALL'],
     tags    => ['NOPASSWD'],
  }
}
