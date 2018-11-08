require 'spec_helper'
describe 'yapstone_config' do

  context 'with defaults for all parameters' do
    it { should contain_class('yapstone_config') }
  end
end
