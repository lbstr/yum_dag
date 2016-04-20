require 'spec_helper'

# make sure there are only the expect .repo files in place
describe file('/etc/yum.repos.d/') do
  it { should be_directory }
  it 'should contain only the upstream and local repo files' do
    Dir.glob('/etc/yum.repos.d/*').should match_array [ 
      '/etc/yum.repos.d/node_a.repo',
      '/etc/yum.repos.d/local.repo',
    ]
  end
end

# make sure the remote repo is included in the repolist
describe command('yum repolist') do
  its(:stdout) { should contain("node_a") }
  its(:stdout) { should contain("local") }
end