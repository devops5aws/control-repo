require 'spec_helper'
describe 'yapstone_splunk' do

  context 'with defaults for all parameters' do
    it { should contain_class('yapstone_splunk') }
  end
end
