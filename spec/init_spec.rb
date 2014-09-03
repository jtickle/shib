require 'spec_helper'
describe 'shib' do

  context 'with defaults for all parameters' do
    it { should contain_class('shib') }
  end
end
