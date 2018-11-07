#
# Upstart: Manage via Supervise for splunk
# 

class profile::upstart_splunk_forwarder {

  include ::upstart

  ::upstart::job { 'splunk-forwarder':
    description     => 'Used for Monitoring splunk_forwarder Services',
    respawn         => true,
    respawn_limit   => '10 5',
    console         => none,
    post_stop       => 'pkill -f splunkd',
    script          => "runuser -l splunk -c '/opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt'",
    require         => Package['splunkforwarder'],
  }
}
