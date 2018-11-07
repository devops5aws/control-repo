#
# S3 sync to grab Key File
#
class profile::yap_key_files {

  $s3_bucket_dir      = hiera('profile::yap_key_files::s3_bucket_dir')
  $key_dir            = hiera('profile::yap_key_files::key_dir', '/opt/yapstone/socketServer/conf/keys')
  $s3_bucket_jar      = hiera('profile::yap_key_files::s3_bucket_jar')
  $jar_dir            = hiera('profile::yap_key_files::key_dir', '/usr/java/jdk1.7.0_25/jre/lib/security')

    case $ec2_tag_component {
      'qa_usw2': {
        exec { 'qa_s3_sync' :
          command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
          path    => [ "/usr/bin", "$key_dir" ],
          onlyif  => "/usr/bin/test ! -f $key_dir/Key1-1enc.key",
          before  => Class['profile::upstart_tomcat_key'],
        }
      }
      'st_usw2': {
        exec { 'st_s3_sync' :
          command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
          path    => [ "/usr/bin", "$key_dir" ],
          onlyif  => "/usr/bin/test ! -f $key_dir/Key1-1enc.key",
          before  => Class['profile::upstart_tomcat_key'],
        }
      }
      'pd_usw2', 'pd_euw1': {
        exec { 'pd_s3_sync' :
          command => "/usr/bin/aws s3 sync s3://$s3_bucket_dir $key_dir --sse",
          path    => [ "/usr/bin", "$key_dir" ],
          onlyif  => "/usr/bin/test ! -f $key_dir/Key1-1enc.key",
          before  => Class['profile::upstart_tomcat_key'],
      }
    }
  }

  exec { 's3_security_jar' :
    command => "/usr/bin/aws s3 sync s3://$s3_bucket_jar $jar_dir --sse && touch /tmp/puppet_s3_security_jar",
    path    => [ "/bin", "/usr/bin" ],
    onlyif  => "/usr/bin/test ! -f /tmp/puppet_s3_security_jar",
    require => Package['jdk'],
  }

  # Ensures Key Files own by yapstone
  file { [
           '/opt/yapstone/socketServer/conf/',
           '/opt/yapstone/socketServer/conf/keys',
         ]:
    ensure    => directory,
    owner     => 'yapstone',
    group     => 'yapstone',
    mode      => '0400',
    require   => Package['yap-socketServer'], 
  }

  file { $jar_dir:
    ensure    => directory,
    owner     => 'root',
    group     => 'root',
    mode      => '0644',
    require   => [
                   Package['yap-socketServer'],
                   Package['jdk'],
                 ],
  }
}
