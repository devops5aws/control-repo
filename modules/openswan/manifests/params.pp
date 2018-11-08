#
# Params class
#

class yapstone_openswan::params {
  $ensure         = present
  $type           = undef
  $connect_name   = undef
  $authby         = undef
  $left           = undef
  $leftid         = undef
  $leftsubnet     = undef
  $leftnexthop    = undef
  $right          = undef
  $rightsubnet    = undef
  $pfs            = undef
  $auto           = undef
  $compress       = undef
  $pre_shared_key = undef
}
