#
# Jar Security Crypto
#
class profile::java_security_jar {

  $s3_bucket_1_7_jar      = hiera('profile::yap_key_files::s3_bucket_1_7_jar', 'yapstone-key-server/security-jar/1.7')
  $jar_1_7_dir            = hiera('profile::yap_key_files::jar_1_7_dir', '/usr/java/jdk1.7.0_25/jre/lib/security')
  $s3_bucket_1_8_jar      = hiera('profile::yap_key_files::s3_bucket_1_8_jar', 'yapstone-key-server/security-jar/1.8')
  $jar_1_8_dir            = hiera('profile::yap_key_files::jar_1_8_dir', '/usr/java/jdk1.8.0_31/jre/lib/security')

  exec { 's3_security_7_jar' :
    command   => "/usr/bin/aws s3 sync s3://$s3_bucket_1_7_jar $jar_1_7_dir --sse && touch /tmp/puppet_7_security_jar", 
    path      => [ "/bin", "/usr/bin" ],
    logoutput => true,
    onlyif    => "/usr/bin/test ! -f /tmp/puppet_7_security_jar",
    unless    => "/usr/bin/test ! -d $jar_1_7_dir",
  }

  exec { 's3_security_8_jar' :
    command   => "/usr/bin/aws s3 sync s3://$s3_bucket_1_8_jar $jar_1_8_dir --sse && touch /tmp/puppet_8_security_jar",
    path      => [ "/bin", "/usr/bin" ],
    logoutput => true,
    onlyif    => "/usr/bin/test ! -f /tmp/puppet_8_security_jar",
    unless    => "/usr/bin/test ! -d $jar_1_8_dir",
  }
}
