require 'spec_helper'
describe 'pam_access' do

  context 'with defaults for all parameters' do
    it { should contain_class('pam_access') }
  end
end
