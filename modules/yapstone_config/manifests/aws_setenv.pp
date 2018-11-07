#
# Yapstone AWS setenv.sh
#
class yapstone_config::aws_setenv (
  $heapconfig        = undef,
  $heapdumppath      = undef,
  $gclogpath         = undef,
  $gcoption          = undef,
  $maxpermsize       = undef,
  $apphome           = undef,
  $proxyhost         = undef,
  $proxyport         = undef,
  $nonproxyhosts     = undef,
  $javaagent         = undef,
  $sslprotocols      = undef,
  $add_line          = [],
  ) {

  case "$ec2_tag_product-$ec2_tag_component" {
    /^eu_app-(st|pd)_(usw2|euw1)/: {
      $yap_base = 'euro-base'
    }
    /^ha_app-(st|pd)_usw2/: {
      $yap_base = 'ha-base'
    }
    /^(eu_)farms-(st|pd)_(usw2|euw1)/: {
      $yap_base = 'farms-base'
    }
    /^farms-(st|pd)_(usw2|euw1)/: {
      $yap_base = 'farms-base'
    }
  }

  file { '/etc/sysconfig/aws-setenv.sh':
    ensure     => present,
    content    => template('yapstone_config/aws_setenv.sh.erb'),
    owner      => root,
    group      => root,
    mode       => '0644',
    before     => Package[ $yap_base ],
  }
}
