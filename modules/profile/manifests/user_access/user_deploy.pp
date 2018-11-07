#
# User Deploy used for deploying jobs
#

class profile::user_access::user_deploy {

  $groups     	= hiera('profile::user_access::group', 'deploy')
  $sudo_cmd   	= hiera_array('profile::user_access::deploy_cmd')
  $bashrc_user 	= 'deploy' 

  yapstone_config::yap_useradd { 'deploy':
    username     => 'deploy',
    groups       => $groups,
    ssh_key_type => 'ssh-rsa',
    ssh_key      => hiera('profile::pub_key::deploy'),
  }

  group { $groups:
    ensure     => 'present',
  }

  file { '/home/deploy/.bashrc':
    ensure     => present,
    content    => template('profile/bashrc.erb'),
    owner      => 'deploy',
    group      => 'deploy',
    mode       => '0644',
    require    => User['deploy'],
  }

  sudo::sudoers {'admin_deploy_cmd':
    ensure    => 'present',
    users     => 'deploy',
    runas     => ['ALL'],
    cmnds     => [ $sudo_cmd ],
    tags      => ['NOPASSWD'],
    defaults  => ['!requiretty'],
  }

}
