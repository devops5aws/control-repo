#
# YapStone Squid Config
#
class profile::yap_squid {
  case $ec2_tag_component {
    'pd_usw2': {
      class { '::yapstone_config::yap_squid':
        http_port             =>  hiera('profile::yap_squid::http_port', '3128'),
        cidr_whitelist        =>  hiera('profile::yap_squid::cidr_ip', '10.55.32.0/19'),
        ssl_ports             =>  hiera_array('profile::yap_squid::ssl_port', ['8443', '443']),
        safe_ports            =>  hiera_array('profile::yap_squid::safe_port', ['8443']),
        acl_app_server        =>  hiera('profile::yap_squid::acl_app_server', 'undef'),
        acl_config            =>  hiera_array('profile::yap_squid::acl_config', []),
        http_access           =>  hiera_array('profile::yap_squid::http_access', []),
        app_whitelist         =>  hiera_array('profile::yap_squid::app_whitelist', []),
        db_whitelist          =>  hiera_array('profile::yap_squid::db_whitelist', []),
        solr_whitelist        =>  hiera_array('profile::yap_squid::solr_whitelist', []),
        common_whitelist      =>  hiera_array('profile::yap_squid::common_whitelist', []),
        key_whitelist         =>  hiera_array('profile::yap_squid::key_whitelist', []),
        web_whitelist         =>  hiera_array('profile::yap_squid::web_whitelist', []),
        ftp_whitelist         =>  hiera_array('profile::yap_squid::ftp_whitelist', []),
      }
    }
    default: {
      class { '::yapstone_config::yap_squid':
        http_port             =>  hiera('profile::yap_squid::http_port', '3128'),
        cidr_whitelist        =>  hiera('profile::yap_squid::cidr_ip'),
        ssl_ports             =>  hiera_array('profile::yap_squid::ssl_port', ['8443', '443']),
        safe_ports            =>  hiera_array('profile::yap_squid::safe_port', ['8443']),
        acl_app_server        =>  hiera('profile::yap_squid::acl_app_server', 'undef'),
        acl_config            =>  hiera_array('profile::yap_squid::acl_config', []),
        http_access           =>  hiera_array('profile::yap_squid::http_access', []),
        acl_whitelist_dir     =>  hiera('profile::yap_squid::acl_whitelist_dir', '/etc/squid/whitelist'),
        whitelist             =>  hiera_array('profile::yap_squid::whitelist', []),
        common_whitelist      =>  hiera_array('profile::yap_squid::common_whitelist', []),
        db_whitelist          =>  hiera_array('profile::yap_squid::db_whitelist', []),
        app_whitelist         =>  hiera_array('profile::yap_squid::app_whitelist', []),
        aws_whitelist         =>  hiera_array('profile::yap_squid::aws_whitelist', []),
        admin_whitelist       =>  hiera_array('profile::yap_squid::admin_whitelist', []),
      }
    }
  }
}
