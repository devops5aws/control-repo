require 'spec_helper'
describe 'tripwire_tchau' do

  context 'with defaults for all parameters' do
    it { should contain_class('tripwire_tchau') }
  end
end
