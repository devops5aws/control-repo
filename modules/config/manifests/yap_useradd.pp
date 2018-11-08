#
# Allows User and Ssh_Authorized_keys to be used
#
define yapstone_config::yap_useradd (
  $username          = undef,
  $groups            = undef,
  $ssh_key_type      = undef,
  $ssh_key           = undef,
) {

  user { "$username":
    home       => "/home/$username",
    managehome => "true",
    groups     => "$groups",
    purge_ssh_keys => true,
  }

  ssh_authorized_key { "default-ssh-key-for-$username":
    user   => "$username",
    ensure => present,
    type   => "$ssh_key_type",
    key    => "$ssh_key",
  }
}
