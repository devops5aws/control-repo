#
# Profile to Create and Mount EBS Volume
#
# These 2 are here for reference they get called at the module
# yapstone_config::attach_ebs_vol
# $aws_devicepath = hiera('profile::create_ebs_vol::devicepath', '/dev/xvdg')
# $aws_mountdest  = hiera('profile::create_ebs_vol::mountdes', '/mnt/ebs')
class profile::attach_ebs_vol {

  class {'yapstone_config::attach_ebs_vol':
    aws_region        => hiera('profile::attach_ebs_vol::region', 'us-west-2'),
    aws_diskspace     => hiera('profile::attach_ebs_vol::diskspace', '500'),
    aws_availzone     => hiera('profile::attach_ebs_vol::availzone', '%{::ec2_placement_availability_zone}'),
    aws_disktype      => hiera('profile::attach_ebs_vol::disktype', 'gp2'),
    aws_retrysec      => hiera('profile::attach_ebs_vol::retrysec', '30'),
  }
}
