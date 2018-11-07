#
# Yapstone DB Credentials
#
class profile::yapstone_db_user {

  class { 'yapstone_config::yap_db_user':
    yap_username     => hiera('profile::yap_db::username'),
    yap_passwd       => hiera('profile::yap_db::passwd'),
  }
}
