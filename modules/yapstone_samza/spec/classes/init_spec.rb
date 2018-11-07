require 'spec_helper'
describe 'yapstone_samza' do

  context 'with defaults for all parameters' do
    it { should contain_class('yapstone_samza') }
  end
end
