#
# Configs for App Servers
#
class profile::yap_app_config {

 
  case "$ec2_tag_product-$ec2_tag_component" {
    /^eu_app-pd_euw1/: {
      file {'/home/webapps/rentpayment/logs':
        ensure   => 'link',
        target   => '/var/log/tomcat/euro',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['euro-base']
      }

      file {'/srv/www/tomcat/euro/logs':
        ensure   => 'link',
        target   => '/var/log/tomcat/euro',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['euro-base']
      }

      file {'/srv/www/tomcat/euro/work':
        ensure   => 'link',
        target   => '/var/cache/tomcat/euro',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['euro-base']
      }
    }
    /^ha_app-pd_usw2/: {
      file {'/home/webapps/rentpayment/logs':
        ensure   => 'link',
        target   => '/var/log/tomcat/ha',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['ha-base']
      }

      file {'/srv/www/tomcat/ha/logs':
        ensure   => 'link',
        target   => '/var/log/tomcat/ha',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['ha-base']
      }

      file {'/srv/www/tomcat/ha/work':
        ensure   => 'link',
        target   => '/var/cache/tomcat/ha',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['ha-base']
      }
    # This will only effect HA
    # Move it this down to effect all in case
    include yapstone_config::logrotate_tomcat
    }
  }
}
