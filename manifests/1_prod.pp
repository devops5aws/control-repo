######################################
# Puppet-test US
######################################

# Puppet test Agents
node default {
  # This is where you can declare classes for all nodes.
  # Example:
     class { 'my_class': }
       }
  
node '52.55.43.246'{
#node /^puppet\d+-agent-/ {
  #include roles::usw2_prod_haweb
}
