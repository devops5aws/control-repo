#
# Configs for FARMS Servers
#
class profile::yap_farms_config {

 
  case "$ec2_tag_product-$ec2_tag_component" {
    /^eu_farms-pd_euw1/: {
      file {'/srv/www/tomcat/farms/logs':
        ensure   => 'link',
        target   => '/var/log/tomcat/farms',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['farms-base']
      }

      file {'/srv/www/tomcat/farms/work':
        ensure   => 'link',
        target   => '/var/cache/tomcat/farms',
        owner    => 'tomcat',
        group    => 'tomcat',
        mode     => '0644',
        require  => Package['farms-base']
      }
    }
  }
}
