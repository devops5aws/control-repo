#
# Yapstone Custom NewRelic Config
#
class profile::yap_newrelic {

  class { '::yapstone_config::yap_newrelic':
    license_key                            => hiera('profile::yap_newrelic::license_key', '3be079bdf7c7c009e43c421ae77e7492a7941bf1'),
    app_name                               => hiera('profile::yap_newrelic::app_name', '%{::ec2_tag_name}'),
    kafka_app_name                         => hiera('profile::yap_newrelic::kafka_app_name', '%{::ec2_tag_hostgroup}'),
    zk_app_name                            => hiera('profile::yap_newrelic::zk_app_name', '%{::ec2_tag_hostgroup}'),
    samza_ha_app_name                      => hiera('profile::yap_newrelic::samza_ha_app_name', '%{::ec2_tag_name}_samza-ha'),
    samza_eu_app_name                      => hiera('profile::yap_newrelic::samza_eu_app_name', '%{::ec2_tag_name}_samza-eu'),
    samza_rp_app_name                      => hiera('profile::yap_newrelic::samza_rp_app_name', '%{::ec2_tag_name}_samza-rp'),
    log_level                              => hiera('profile::yap_newrelic::log_level', 'info'),
    proxy_host                             => hiera('profile::yap_newrelic::proxy_host', 'proxy'),
    proxy_port                             => hiera('profile::yap_newrelic::proxy_port', '3128'),
  }
}
