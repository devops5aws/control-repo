#
# S3 sync to grab App Key File
#
class profile::yap_app_key {

  $s3_app_bucket_dir      = hiera('profile::yap_key_files::s3_app_bucket_dir')
  $key_app_dir            = hiera('profile::yap_key_files::key_app_dir', '/home/webapps/rentpayment/conf/keys')
  $s3_bucket_jar          = hiera('profile::yap_key_files::s3_bucket_jar')
  $jar_dir                = hiera('profile::yap_key_files::key_dir', '/usr/java/jdk1.7.0_25/jre/lib/security')
  $key1_app_file          = hiera('profile::yap_key_files::key1', '/home/webapps/rentpayment/conf/keys/Key2-1.key')
  $key2_app_file          = hiera('profile::yap_key_files::key2', '/home/webapps/rentpayment/conf/keys/Key2-2.key')
  $key3_app_file          = hiera('profile::yap_key_files::key3', '/home/webapps/rentpayment/conf/keys/Key2-3.key')
  $key4_app_file          = hiera('profile::yap_key_files::key4', '/home/webapps/rentpayment/conf/keys/Key2-4.key')
  $key5_app_file          = hiera('profile::yap_key_files::key5', '/home/webapps/rentpayment/conf/keys/Key2-5.key')
  $key7_app_file          = hiera('profile::yap_key_files::key7', '/home/webapps/rentpayment/conf/keys/Key2-7.key')
  $key8_app_file          = hiera('profile::yap_key_files::key8', '/home/webapps/rentpayment/conf/keys/Key2-8.key')
  $key9_app_file          = hiera('profile::yap_key_files::key9', '/home/webapps/rentpayment/conf/keys/Key2-9.key')
  $key200_app_file        = hiera('profile::yap_key_files::key200', '/home/webapps/rentpayment/conf/keys/Key2-200.key')
  $key202_app_file        = hiera('profile::yap_key_files::key202', '/home/webapps/rentpayment/conf/keys/Key2-202.key')
  $key203_app_file        = hiera('profile::yap_key_files::key203', '/home/webapps/rentpayment/conf/keys/Key2-203.key')

  # Ensures Key Files own by tomcat
  case $ec2_tag_product {
    'rp_app', 'rpr_app':  {
      $rp_name = 'rp-conf'
    }
    'ip_app', 'ipr_app': {
      $rp_name = 'ip-conf'
    }
    'eu_app', 'eur_app': {
      $rp_name = 'euro-conf'
    }
    'ha_app', 'har_app': {
      $rp_name = 'ha-conf'
    }
    'ca_app', 'car_app': {
      $rp_name = 'cathedral-conf'
    }
  }

  case $ec2_tag_component {
    'qa_usw2': {
      exec { 'qa_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_app_bucket_dir $key_app_dir --sse",
        path    => [ "/usr/bin", "$key_app_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_app_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_app'],
      }
      file { [ $key1_app_file,
               $key2_app_file,
               $key3_app_file,
               $key4_app_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[$rp_name],
      }
    }
    'st_usw2', 'dm_usw2', 'wh_usw2': {
      exec { 'st_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_app_bucket_dir $key_app_dir --sse",
        path    => [ "/usr/bin", "$key_app_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_app_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_app'],
      }
      file { [ $key1_app_file,
               $key2_app_file,
               $key3_app_file,
               $key4_app_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[$rp_name],
      }
    }
    'pd_euw1': {
      exec { 'pd_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_app_bucket_dir $key_app_dir --sse",
        path    => [ "/usr/bin", "$key_app_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_app_dir/Key2-200.key",
        before  => Class['profile::upstart_tomcat_app'],
      }
      file { [ $key1_app_file,
               $key2_app_file,
               $key200_app_file,
               $key202_app_file,
               $key203_app_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[$rp_name],
      }
    }
    'pd_usw2': {
      exec { 'pd_s3_sync' :
        command => "/usr/bin/aws s3 sync s3://$s3_app_bucket_dir $key_app_dir --sse",
        path    => [ "/usr/bin", "$key_app_dir" ],
        onlyif  => "/usr/bin/test ! -f $key_app_dir/Key2-1.key",
        before  => Class['profile::upstart_tomcat_app'],
      }
      file { [ $key1_app_file,
               $key2_app_file,
               $key3_app_file,
               $key4_app_file,
               $key5_app_file,
               $key7_app_file,
               $key8_app_file,
               $key9_app_file,
             ]:
        ensure    => present,
        owner     => 'tomcat',
        group     => 'tomcat',
        mode      => '0400',
        require   => Package[$rp_name],
      }
    }
  }

  exec { 's3_security_jar' :
    command => "/usr/bin/aws s3 sync s3://$s3_bucket_jar $jar_dir --sse && touch /tmp/puppet_s3_security_jar",
    path    => [ "/bin", "/usr/bin" ],
    onlyif  => "/usr/bin/test ! -f /tmp/puppet_s3_security_jar",
    require => Package['jdk'],
  }


  file { $jar_dir:
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    require   => Package[$rp_name],
    recurse   => true,
  }
}
