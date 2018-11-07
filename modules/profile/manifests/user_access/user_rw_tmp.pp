#
# User Access for Temp Production
#

class profile::user_access::user_rw_tmp {

  $groups     = hiera('profile::user_tmp::group', 'root')
  $sudo_user  = []

  user { [
     'c-akuncewitch',
     'c-skhanna',
    ]:
     ensure => 'absent',
  }

##  sudo::sudoers {'admin_tmp':
##    ensure  => 'present',
##    users   => $sudo_user,
##    runas   => ['ALL'],
##    cmnds   => ['ALL'],
##    tags    => ['NOPASSWD'],
##  }
}
