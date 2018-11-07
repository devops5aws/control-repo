#
# Yapstone Custom Solr Config 
#
class profile::yap_solr {

  case $ec2_tag_product {
    'solr_master': {
      class { '::yapstone_solr::solr_master':
        server_user                     => hiera('profile::yap_solr::username', 'solr'),
        server_group                    => hiera('profile::yap_solr::groupname', 'solr'),
        db_server                       => hiera('profile::yap_solr::db_server'),
        db_port                         => hiera('profile::yap_solr::db_port', '1433'),
        db_name                         => hiera('profile::yap_solr::db_name'),
        db_username                     => hiera('profile::yap_solr::db_username'),
        db_passwd                       => hiera('profile::yap_solr::db_passwd'),
      }
    }
    'solr_slave': {
      class { '::yapstone_solr::solr_slave':
        server_user                     => hiera('profile::yap_solr::username', 'solr'),
        server_group                    => hiera('profile::yap_solr::groupname', 'solr'),
        solr_master                     => hiera('profile::yap_solr::solr_master', 'solr-master'),
        solr_port                       => hiera('profile::yap_solr::solr_port', '8983'),
      }
    }
  }
}
