#
# User Access for Finance Read Only
#

class profile::user_access::user_ro_finance {

  $groups     = hiera('profile::user_finance::group', 'finance')
  $sudo_user  = [ 'jskilbeck',
                ]

  group { $groups:
    ensure     => 'present',
  }

  yapstone_config::yap_useradd { 'jskilbeck':
    username     => 'jskilbeck',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::jskilbeck'),
  }

}
