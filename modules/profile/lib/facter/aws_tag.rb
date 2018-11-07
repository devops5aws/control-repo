##tags=`ls /etc/facter/facts.d/`
## 
###tags.each do |ec2_tags.txt|
##        value = `cat /etc/facter/facts.d/#{ec2_tags.txt}`
##        fact = "ec2_tag_#{ec2_tags.txt.chomp}"
##        #Facter.add(fact) { setcode { value.chomp } }
###end
##  Facter.add(ec2_tags) do
##    setcode do
##      Facter::Core::Execution.execute('cat /etc/facter/facts.d/ec2_tags.txt')
##    end
##  end
