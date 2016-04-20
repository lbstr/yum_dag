require 'spec_helper'

# make sure there are no repos
describe file('/etc/yum.repos.d/') do
  it { should be_directory }
  it 'should be empty' do
    Dir.glob('/etc/yum.repos.d/*').should match_array []
  end
end