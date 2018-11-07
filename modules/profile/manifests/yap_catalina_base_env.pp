#
#  Catalina Base Env
#
class profile::yap_catalina_base_env {

  class { '::yapstone_config::yap_catalina_env':
    yap_catalina_env     =>  hiera_array('profile::yap_catalina::environment'),
  }
}
