require 'spec_helper'
describe 'yapstone_openswan' do

  context 'with defaults for all parameters' do
    it { should contain_class('yapstone_openswan') }
  end
end
