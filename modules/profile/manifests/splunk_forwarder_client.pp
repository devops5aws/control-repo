#
# Splunk Forwarder Client
# Sends logs to Splunk
class profile::splunk_forwarder_client {
  case "$ec2_tag_product-$ec2_tag_component" {
    /^(hforwarder|indexlog|shlog|clusterlog)-op_(usw2|euw1)/: {
    }
    default: {
      class {'::yapstone_splunk::splunk_forwarder':
        targetUri                   => hiera('profile::splunk_forwarder_client::targetUri'),
      }
    }
  }
}
