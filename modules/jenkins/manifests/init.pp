#
# Jenkins
#
class yapstone_jenkins (
  $jenkins_home                         = undef,
  $jenkins_java_cmd                     = undef,
  $jenkins_user                         = undef,
  $jenkins_java_options                 = undef,
  $jenkins_port                         = undef,
  $jenkins_listen_address               = undef,
  $jenkins_https_port                   = undef,
  $jenkins_https_keystore               = undef,
  $jenkins_https_keystore_password      = undef,
  $jenkins_https_listen_address         = undef,
  $jenkins_ajp_port                     = undef,
  $jenkins_ajp_listen_address           = undef,
  $jenkins_debug_level                  = undef,
  $jenkins_enable_access_log            = undef,
  $jenkins_handler_max                  = undef,
  $jenkins_handler_idle                 = undef,
  $jenkins_args                         = undef,
  $ad_account                           = [],
  $ad_creds                             = undef,
  $aws_slave_id                         = undef,
  $aws_slave_secret                     = undef,
  $aws_slave_key_pair                   = undef,
  $aws_slave_instancecap                = undef,
  $aws_slave_ami                        = undef,
  $aws_slave_name                       = undef,
  $aws_slave_sg                         = undef,
  $aws_slave_dir                        = undef,
  $aws_slave_instance_type              = undef,
  $aws_slave_initscript                 = undef,
  $aws_slave_numexecutors               = undef,
  $aws_slave_subnet                     = undef,
  $aws_slave_iam_profile                = undef,
  $aws_slave_hostname                   = undef,
  $aws_slave_region                     = undef,
  $deploy_private_key                   = undef,
  ) {

  $install_plugins    = hiera('profile::jenkins::plugin')
  $jenkins_cli_jar    = hiera('profile::jenkins::cli_jar', '/var/cache/jenkins/war/WEB-INF/jenkins-cli.jar')
  $jenkins_local_url  = hiera('profile::jenkins::local_url', 'http://127.0.0.1:8080')
  
  file {"/etc/sysconfig/jenkins":
    ensure    => file,
    content   => template('yapstone_jenkins/jenkins.erb'),
    owner     => 'root',
    group     => 'root',
    mode      => '0600',
    require   => [
                  Package['jenkins'],
                  Package[ hiera('profile::jenkins::java', 'jdk1.8.0_31') ],
                  Exec['jenkins_plugin'],
                  File['/tmp/aws_create_ebs.py'],
                 ],
  }

  file {"/var/lib/jenkins/config.xml":
    ensure    => present,
    content   => template('yapstone_jenkins/config.xml.erb'),
    replace   => false,
    owner     => 'jenkins',
    group     => 'jenkins',
    mode      => '0600',
    require   => [
                  Package['jenkins'],
                  Package[ hiera('profile::jenkins::java', 'jdk1.8.0_31') ],
                  Exec['jenkins_plugin'],
                  File['/tmp/aws_create_ebs.py'],
                 ],
  }

  file {"/var/lib/jenkins/credentials.xml":
    ensure    => present,
    content   => template('yapstone_jenkins/credentials.xml.erb'),
    replace   => false,
    owner     => 'jenkins',
    group     => 'jenkins',
    mode      => '0600',
    require   => [
                  Package['jenkins'],
                  Package[ hiera('profile::jenkins::java', 'jdk1.8.0_31') ],
                  Exec['jenkins_plugin'],
                  File['/tmp/aws_create_ebs.py'],
                 ],
  }

  file { '/var/lib/jenkins':
    ensure  => 'link',
    target  => '/mnt/ebs1',
    require => File['/tmp/aws_create_ebs.py'],
    before  => Package['jenkins'],
  }

  exec { 'jenkins_plugin':
    command    =>   "/sbin/service jenkins start && sleep 30; \
                    java -jar ${jenkins_cli_jar} -s ${jenkins_local_url}/ install-plugin ${install_plugins} \
                    $(java -jar ${jenkins_cli_jar} -s ${jenkins_local_url}/ list-plugins | grep -e \")\$\" | awk \'{ print \$1 }\' |xargs); \
                    aws s3 sync s3://yapstone-jenkins/binary-secrets /var/lib/jenkins/secrets; \
                    aws s3 sync s3://yapstone-jenkins/backup-jobs/$(date +'%Y-%m-%d') /var/lib/jenkins/jobs; \
                    chown -R jenkins: /var/lib/jenkins/jobs && chown -R jenkins: /var/lib/jenkins; \
                    /etc/init.d/jenkins restart",
    path       => [ '/bin/', '/sbin/', '/tmp', '/usr/bin/' ],
    onlyif     => '/usr/bin/test ! -d /var/lib/jenkins/plugins/ec2/',
    logoutput  => true,
    require    => [
                    Package['jenkins'],
                    File['/tmp/aws_create_ebs.py'],
                  ],
  }
}
