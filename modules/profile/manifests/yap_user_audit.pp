#
# This is YapStone Internal User auditing
#
class profile::yap_user_audit (
  $kms_key      = hiera('profile::yap_user_audit::kms_key'),
  $region_zone  = hiera('profile::yap_aws_zone::region_zone'),
  ) {

  case $ec2_tag_component {
    'qa_usw2', 'dev_usw2':  {
       notice("Server is not monitor by root audit")
    }
    default: {
      file {'/etc/profile.d/yap_user_audit_profile.sh':
        ensure    => present,
        owner     => 'root',
        group     => 'root',
        mode      => '0644',
        content   => template('profile/yap_user_audit_profile.sh.erb'),
      }

      file {'/usr/local/sbin/yap-user-audit.sh':
        ensure    => present,
        owner     => 'root',
        group     => 'root',
        mode      => '0700',
        content   => template('profile/yap_user_audit.sh.erb'),
      }

      file {'/var/log/yap-user-audit':
        ensure    => 'directory',
        owner     => 'root',
        group     => 'root',
        mode      => 0700,
      }
    }
  }
}
