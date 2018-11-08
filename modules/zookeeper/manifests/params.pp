#
# Params class
#

class yapstone_zookeeper::params {
  $server1                = undef
  $server2                = undef 
  $server3                = undef 
  $server4                = undef 
  $server5                = undef 
  $data_dir               = undef 
  $tick_time              = undef 
  $init_limit             = undef 
  $sync_limit             = undef 
  $client_port            = undef 
  $leader_port            = undef
  $leader_election_port   = undef
  $zookeeper_rpm          = undef
  $zookeeper_server_rpm   = undef
  $bigtop_utils_rpm       = undef
  $rpm_url                = undef
  $myid                   = undef
}
