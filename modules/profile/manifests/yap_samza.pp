#
# Yapstone Samza Configs
#
class profile::yap_samza {
  include yapstone_samza

  class {'::yapstone_samza::samza_ha':
    server_user                    => hiera('profile::samza::server_user'),
    server_group                   => hiera('profile::samza::server_group'),
    samzaha_zk_server              => hiera('profile::samza::zk_server'),
    samzaha_bootstrap_server       => hiera('profile::samza::bootstrap_server'),
    samzaha_task_replication       => hiera('profile::samza::task_replication'),
    samzaha_proxy_server           => hiera('profile::samza::proxy_server'),
    samzaha_proxy_port             => hiera('profile::samza::proxy_port'),
    samzaha_job_replication        => hiera('profile::samza::job_replication'),
    samzaha_jobid                  => hiera('profile::samzaha::jobid'),
    samzaha_jobconfig              => hiera('profile::samzaha::jobconfig'),
    samzaha_sender_url             => hiera('profile::samzaha::sender_url'),
    samzaha_aggregatedid           => hiera('profile::samzaha::aggregatedid'),
    samzaha_username               => hiera('profile::samzaha::username'),
    samzaha_passwd                 => hiera('profile::samzaha::passwd'),
    samzaha_subscribed_event_types => hiera('profile::samzaha::subscribed_event_types'),
  }
  class {'::yapstone_samza::samza_rp':
    server_user                    => hiera('profile::samza::server_user'),
    server_group                   => hiera('profile::samza::server_group'),
    samzarp_zk_server              => hiera('profile::samza::zk_server'),
    samzarp_bootstrap_server       => hiera('profile::samza::bootstrap_server'),
    samzarp_task_replication       => hiera('profile::samza::task_replication'),
    samzarp_proxy_server           => hiera('profile::samza::proxy_server'),
    samzarp_proxy_port             => hiera('profile::samza::proxy_port'),
    samzarp_job_replication        => hiera('profile::samza::job_replication'),
    samzarp_jobid                  => hiera('profile::samzarp::jobid'),
    samzarp_jobconfig              => hiera('profile::samzarp::jobconfig'),
    samzarp_sender_url             => hiera('profile::samzarp::sender_url'),
    samzarp_aggregatedid           => hiera('profile::samzarp::aggregatedid'),
    samzarp_username               => hiera('profile::samzarp::username'),
    samzarp_passwd                 => hiera('profile::samzarp::passwd'),
    samzarp_subscribed_event_types => hiera('profile::samzarp::subscribed_event_types'),
  }
  class {'::yapstone_samza::samza_eu':
    server_user                    => hiera('profile::samza::server_user'),
    server_group                   => hiera('profile::samza::server_group'),
    samzaeu_zk_server              => hiera('profile::samza::zk_server'),
    samzaeu_bootstrap_server       => hiera('profile::samza::bootstrap_server'),
    samzaeu_task_replication       => hiera('profile::samza::task_replication'),
    samzaeu_proxy_server           => hiera('profile::samza::proxy_server'),
    samzaeu_proxy_port             => hiera('profile::samza::proxy_port'),
    samzaeu_job_replication        => hiera('profile::samza::job_replication'),
    samzaeu_jobid                  => hiera('profile::samzaeu::jobid'),
    samzaeu_jobconfig              => hiera('profile::samzaeu::jobconfig'),
    samzaeu_sender_url             => hiera('profile::samzaeu::sender_url'),
    samzaeu_aggregatedid           => hiera('profile::samzaeu::aggregatedid'),
    samzaeu_username               => hiera('profile::samzaeu::username'),
    samzaeu_passwd                 => hiera('profile::samzaeu::passwd'),
    samzaeu_subscribed_event_types => hiera('profile::samzaeu::subscribed_event_types'),
  }
}
