#
# Tools for Yapstone
#
class profile::package::lua {
  package {'lua':
    ensure  => hiera('profile::package::lua_ver', '5.1.5-ks1'),
    before  => [ Class['profile::upstart_svscanboot'], Package['lighttpd-1.4.35-20140717svc'] ],
  }
}
