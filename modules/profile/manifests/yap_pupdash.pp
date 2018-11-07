#
# Yapstone Puppet Dashboard
#
class profile::yap_pupdash {

  class {'::yapstone_config::yap_pupdash':
    prod_db_database  => hiera('profile::yap_pupdash::prod_db_database', 'dashboard_production'),
    prod_db_username  => hiera('profile::yap_pupdash::prod_db_username', 'pupdash'),
    prod_db_password  => hiera('profile::yap_pupdash::prod_db_password'),
    prod_db_adapter   => hiera('profile::yap_pupdash::prod_db_adapter', 'mysql'),
    prod_db_host      => hiera('profile::yap_pupdash::prod_db_host'),
  }
}
