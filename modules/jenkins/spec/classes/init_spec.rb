require 'spec_helper'
describe 'yapstone_jenkins' do

  context 'with defaults for all parameters' do
    it { should contain_class('yapstone_jenkins') }
  end
end
