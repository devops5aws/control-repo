#
# S3 sync to grab Key File
#
class profile::yap_farms_key {

  $s3_bucket_dir      = hiera('profile::yap_farms_key::s3_bucket_dir')
  $key_dir            = hiera('profile::yap_farms_key::key_dir', '/opt/yapstone/webapp-conf/farms/conf/keys')
  $key1_farms_file    = hiera('profile::yap_farms_key::key1', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-1.key')
  $key2_farms_file    = hiera('profile::yap_farms_key::key2', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-2.key')
  $key3_farms_file    = hiera('profile::yap_farms_key::key3', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-3.key')
  $key4_farms_file    = hiera('profile::yap_farms_key::key4', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-4.key')
  $key5_farms_file    = hiera('profile::yap_farms_key::key5', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-5.key')
  $key7_farms_file    = hiera('profile::yap_farms_key::key7', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-7.key')
  $key8_farms_file    = hiera('profile::yap_farms_key::key8', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-8.key')
  $key9_farms_file    = hiera('profile::yap_farms_key::key9', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-9.key')
  $key200_farms_file  = hiera('profile::yap_farms_key::key200', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-200.key')
  $key202_farms_file  = hiera('profile::yap_farms_key::key202', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-202.key')
  $key203_farms_file  = hiera('profile::yap_farms_key::key203', '/opt/yapstone/webapp-conf/farms/conf/keys/Key2-203.key')
  $s3_bucket_jar      = hiera('profile::yap_farms_key::s3_bucket_jar', 'yapstone-key-server/qa-farms-security-jar')
  $jar_dir            = hiera('profile::yap_farms_key::key_dir', '/usr/java/jdk1.8.0_74/jre/lib/security')

  # Ensures Key Files own by yapstone
  case $ec2_tag_product {
    'eur_farms', 'eu_farms' :  {
      $farms_name = 'farmsgd1-conf'
    }
    default: {
      $farms_name = 'farms-conf'
    }
  }

  case $ec2_tag_component {
    'qa_usw2': {
      exec { 'farms_usqa_app_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
        path    => [ "/usr/bin", "$key_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_farms'],
      }
      file { [ $key1_farms_file,
               $key2_farms_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[ $farms_name ],
      }
    }
    'st_usw2': {
      exec { 'farms_usstg_app_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
        path    => [ "/usr/bin", "$key_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_farms'],
      }
      file { [ $key1_farms_file,
               $key2_farms_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[ $farms_name ],
      }
    }
    'pd_euw1': {
      exec { 'farms_euprod_app_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
        path    => [ "/usr/bin", "$key_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_farms'],
      }
      file { [ $key1_farms_file,
               $key2_farms_file,
               $key200_farms_file,
               $key202_farms_file,
               $key203_farms_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[ $farms_name ],
      }
    }
    'pd_usw2': {
      exec { 'farms_usprod_app_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
        path    => [ "/usr/bin", "$key_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_farms'],
      }
      file { [ $key1_farms_file,
               $key2_farms_file,
               $key3_farms_file,
               $key4_farms_file,
               $key5_farms_file,
               $key7_farms_file,
               $key8_farms_file,
               $key9_farms_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[ $farms_name ],
      }
    }
  }

  exec { 's3_security_jar' :
    command => "/usr/bin/aws s3 sync s3://$s3_bucket_jar $jar_dir --sse && touch /tmp/puppet_s3_security_jar",
    path    => [ "/bin", "/usr/bin" ],
    onlyif  => "/usr/bin/test ! -f /tmp/puppet_s3_security_jar",
    require => Package['jdk1.8.0_74'],
  }

  file { $jar_dir:
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    require   => Package[ $farms_name ],
    recurse   => true,
  }
}
