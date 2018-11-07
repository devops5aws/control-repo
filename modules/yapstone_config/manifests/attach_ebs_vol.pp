#
# Creating EBS Volume and Mounting
#
class yapstone_config::attach_ebs_vol (

  $aws_region         = undef,
  $aws_diskspace      = undef,
  $aws_availzone      = undef,
  $aws_disktype       = undef,
  $aws_retrysec       = undef,
  ) {

  $aws_devicepath = hiera('profile::create_ebs_vol::devicepath', '/dev/xvdg')
  $aws_mountdest  = hiera('profile::create_ebs_vol::mountdest', '/mnt/ebs1')

  mount { $aws_mountdest:
    ensure    => 'mounted',
    device    => $aws_devicepath,
    fstype    => 'ext4',
    options   => 'defaults',
    atboot    => 'true',
    require   => [
                   File['/tmp/aws_create_ebs.py'],
                   Exec['Format and Mount Fstab'],
                   Exec['Create and Attach EBS'],
                 ],
  }

  file { $aws_mountdest:
    ensure    => directory,
    owner     => 'jenkins',
    group     => 'jenkins',
    mode      => '0664',
    before    => [
                   Mount[ $aws_mountdest ],
                 ],
  }

  file {'/tmp/aws_create_ebs.py':
    ensure    => present,
    owner     => 'root',
    group     => 'root',
    mode      => '0744',
    content   => template('yapstone_config/aws_create_ebs.py.erb'),
    before    => [ 
                   File[ $aws_mountdest ],
                 ],
  }

  exec {'Create and Attach EBS':
    command   => "python2.7 /tmp/aws_create_ebs.py && sleep 10",
    path      => ['/sbin', '/bin', '/usr/bin'],
    onlyif    => "/usr/bin/test ! -e ${aws_devicepath}",
    require   => [
                   File['/tmp/aws_create_ebs.py'],
                   Package['yap-python27'],
                   Yumrepo[ hiera('profile::yum_tools::repo_name') ],
                 ],
    logoutput => true,
  }

  exec {'Format and Mount Fstab':
    command   => "/sbin/mkfs.ext4 ${aws_devicepath} ; mount -a",
    path      => ['/sbin', '/bin'],
    onlyif    => "/usr/bin/test ! -d ${aws_mountdest}/lost+found",
    require   => [
                   File['/tmp/aws_create_ebs.py'],
                   Exec['Create and Attach EBS'],
                 ],
    logoutput => true,
  }
}
