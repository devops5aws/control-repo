require 'spec_helper'
describe 'yapstone_lighttpd' do

  context 'with defaults for all parameters' do
    it { should contain_class('yapstone_lighttpd') }
  end
end
