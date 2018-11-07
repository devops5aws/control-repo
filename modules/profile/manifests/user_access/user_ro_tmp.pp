#
# User Access for Temp Production Read Only
#

class profile::user_access::user_ro_tmp {

  $groups     = hiera('profile::user_tmp::group', 'temp')
  $sudo_user  = []


  user { [
     'c-akuncewitch',
     'c-skhanna',
    ]:
     ensure => 'absent',
  }

#  group { $groups:
#    ensure     => 'present',
#  }

}
