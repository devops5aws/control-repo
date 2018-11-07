#
# User Deploy used for dev-deploying jobs
#

class profile::user_access::user_dev_deploy {

  $groups     = hiera('profile::user_access::group', 'dev-deploy')
  $sudo_cmd   = hiera_array('profile::user_access::dev_deploy_cmd')

  yapstone_config::yap_useradd { 'dev-deploy':
    username     => 'dev-deploy',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::dev_deploy'),
  }

  group { $groups:
    ensure     => 'present',
  }

  sudo::sudoers {'admin_dev_deploy_cmd':
    ensure    => 'present',
    users     => 'dev-deploy',
    runas     => ['ALL'],
    cmnds     => ['ALL'],
    tags      => ['NOPASSWD'],
    defaults  => ['!requiretty'],
  }

}
