require 'spec_helper'


describe file('/etc/yum.repos.d/') do
  it { should be_directory }
  it 'should contain only the node_a.repo and node_b.repo files' do
    Dir.glob('/etc/yum.repos.d/*').should match_array [ '/etc/yum.repos.d/node_a.repo', '/etc/yum.repos.d/node_b.repo' ]
  end
end