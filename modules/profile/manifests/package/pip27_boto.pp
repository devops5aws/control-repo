#
# PIP 2.7 install boto
#
class profile::package::pip27_boto {
  exec {'pip27_update_boto':
    command   =>  'pip2.7 install --upgrade boto ; touch /tmp/puppet_boto_update',
    path      =>  [ '/bin/', '/sbin/', '/usr/bin/', '/usr/local/bin/'],
    creates   =>  '/tmp/puppet_boto_update',
    logoutput =>  true,
    require   =>  [
                    Package['yap-python27'],
                    Package['yap-pip27'],
                  ],
  }
}
