#
# RPM for jenkins
#
class profile::package::jenkins {
  case $ec2_tag_product {
    'jenkins', 'jenkins_dev': {
      package {'jenkins':
        ensure => hiera('profile::package::jenkins', 'present'),
        require => [
                     Yumrepo['yap-tools'],
                     Package[ hiera('profile::jenkins::java', 'jdk1.8.0_31') ],
                     File['/tmp/aws_create_ebs.py'],
                     Exec['Format and Mount Fstab'],
                     Exec['Create and Attach EBS'],
                   ],
      }
    }
    default: {
      package {'jenkins':
        ensure => hiera('profile::package::jenkins', 'present'),
        require => [
                     Yumrepo['yap-tools'],
                     Package[ hiera('profile::jenkins::java', 'jdk1.8.0_31') ],
                   ],
      }
    }
  }
}
