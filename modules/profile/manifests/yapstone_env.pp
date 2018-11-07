#
# Yapstone Environment
#
class profile::yapstone_env {

  class { 'yapstone_config::yapstone_env':
    yap_env       => hiera('profile::yapstone::environment'),
  }
}
