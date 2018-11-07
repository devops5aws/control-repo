#
# Upstart: verify-ftdv.conf
# 

class profile::upstart_verify_ftdv {

  include ::upstart

  ::upstart::job { 'verify-ftdv':
    description     => 'Used for Monitoring FTDv Services',
    respawn         => true,
    respawn_limit   => '5 10',
    console         => none,
    exec            => '/opt/scripts/check_ftdv_status.py',
  }
}
