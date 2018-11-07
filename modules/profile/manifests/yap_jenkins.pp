#
# Jenkins Configs
#
class profile::yap_jenkins {

  case $ec2_tag_product {
    'jenkins': {
      class { yapstone_jenkins:
        jenkins_home                    => hiera('profile::jenkins::jenkins_home', '/var/lib/jenkins'),
        jenkins_java_cmd                => hiera('profile::jenkins::jenkins_java_cmd', ''),
        jenkins_user                    => hiera('profile::jenkins::jenkins_user', 'jenkins'),
        jenkins_java_options            => hiera('profile::jenkins::jenkins_java_options', '-Djava.awt.headless=true'),
        jenkins_port                    => hiera('profile::jenkins::jenkins_port', '8080'),
        jenkins_listen_address          => hiera('profile::jenkins::jenkins_listen_address', ''),
        jenkins_https_port              => hiera('profile::jenkins::jenkins_https_port', ''),
        jenkins_https_keystore          => hiera('profile::jenkins::jenkins_https_keystore', ''),
        jenkins_https_keystore_password => hiera('profile::jenkins::jenkins_https_keystore_password', ''),
        jenkins_https_listen_address    => hiera('profile::jenkins::jenkins_https_listen_address', ''),
        jenkins_ajp_port                => hiera('profile::jenkins::jenkins_ajp_port', '8009'),
        jenkins_ajp_listen_address      => hiera('profile::jenkins::jenkins_ajp_listen_address', ''),
        jenkins_debug_level             => hiera('profile::jenkins::jenkins_debug_level', '5'),
        jenkins_enable_access_log       => hiera('profile::jenkins::jenkins_enable_access_log', 'no'),
        jenkins_handler_max             => hiera('profile::jenkins::jenkins_handler_max', '100'),
        jenkins_handler_idle            => hiera('profile::jenkins::jenkins_handler_idle', '20'),
        jenkins_args                    => hiera('profile::jenkins::jenkins_args', ''),
        ad_account                      => hiera_array('profile::jenkins::ad_account'),
        ad_creds                        => hiera('profile::jenkins::ad_creds'),
        aws_slave_id                    => hiera('profile::jenkins::aws_slave_id'),
        aws_slave_secret                => hiera('profile::jenkins::aws_slave_secret'),
        aws_slave_key_pair              => hiera('profile::jenkins::aws_slave_key_pair'),
        aws_slave_instancecap           => hiera('profile::jenkins::aws_slave_instancecap', '5'),
        aws_slave_ami                   => hiera('profile::jenkins::aws_slave_ami'),
        aws_slave_name                  => hiera('profile::jenkins::aws_slave_name', 'jenkins-slave'),
        aws_slave_sg                    => hiera('profile::jenkins::aws_slave_sg', 'ops_mgmt_client, jenkins_server_access'),
        aws_slave_dir                   => hiera('profile::jenkins::aws_slave_dir', '/var/jenkins'),
        aws_slave_instance_type         => hiera('profile::jenkins::aws_slave_instance_type', 'C4Large'),
        aws_slave_initscript            => hiera('profile::jenkins::aws_slave_initscript'),
        aws_slave_numexecutors          => hiera('profile::jenkins::aws_slave_numexecutors', '4'),
        aws_slave_subnet                => hiera('profile::jenkins::aws_slave_subnet', 'subnet-15210770'),
        aws_slave_iam_profile           => hiera('profile::jenkins::aws_slave_iam_profile', 'arn:aws:iam::638730873711:instance-profile/JenkinsServer'),
        aws_slave_hostname              => hiera('profile::jenkins::aws_slave_hostname', 'usw2-op01-jkslave'),
        aws_slave_region                => hiera('profile::jenkins::aws_slave_region', 'us-west-2'),
        deploy_private_key              => hiera('profile::jenkins::deploy_private_key'),
      }
    }
    'jenkins_dev': {
      class { yapstone_jenkins::jenkins_dev:
        jenkins_home                    => hiera('profile::jenkins::jenkins_home', '/var/lib/jenkins'),
        jenkins_java_cmd                => hiera('profile::jenkins::jenkins_java_cmd', ''),
        jenkins_user                    => hiera('profile::jenkins::jenkins_user', 'jenkins'),
        jenkins_java_options            => hiera('profile::jenkins::jenkins_java_options', '-Djava.awt.headless=true'),
        jenkins_port                    => hiera('profile::jenkins::jenkins_port', '8080'),
        jenkins_listen_address          => hiera('profile::jenkins::jenkins_listen_address', ''),
        jenkins_https_port              => hiera('profile::jenkins::jenkins_https_port', ''),
        jenkins_https_keystore          => hiera('profile::jenkins::jenkins_https_keystore', ''),
        jenkins_https_keystore_password => hiera('profile::jenkins::jenkins_https_keystore_password', ''),
        jenkins_https_listen_address    => hiera('profile::jenkins::jenkins_https_listen_address', ''),
        jenkins_ajp_port                => hiera('profile::jenkins::jenkins_ajp_port', '8009'),
        jenkins_ajp_listen_address      => hiera('profile::jenkins::jenkins_ajp_listen_address', ''),
        jenkins_debug_level             => hiera('profile::jenkins::jenkins_debug_level', '5'),
        jenkins_enable_access_log       => hiera('profile::jenkins::jenkins_enable_access_log', 'no'),
        jenkins_handler_max             => hiera('profile::jenkins::jenkins_handler_max', '100'),
        jenkins_handler_idle            => hiera('profile::jenkins::jenkins_handler_idle', '20'),
        jenkins_args                    => hiera('profile::jenkins::jenkins_args', ''),
        ad_account                      => hiera_array('profile::jenkins::ad_account'),
        ad_dev_account                  => hiera_array('profile::jenkins::ad_dev_account'),
        ad_creds                        => hiera('profile::jenkins::ad_creds'),
        deploy_private_key              => hiera('profile::jenkins::deploy_private_key'),
      }
    }
    'jenkins_slave': {
      include yapstone_jenkins::jenkins_slave
    }
  }
}
