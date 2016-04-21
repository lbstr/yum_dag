require 'spec_helper'

# make sure we have rpms in our local repo
describe file('/var/www/yum') do
  it { should be_directory }
  it "should have rpms" do
    Dir.glob('/var/www/yum/*.rpm').should_not be_empty
  end
end

# make sure we have a repo file for our local repo
describe file('/etc/yum.repos.d/local.repo') do
  it { should exist }
end

# make sure the local repo is included in the repolist
describe command('yum repolist') do
  its(:stdout) { should contain('local') }
end

# make sure local repo has been created and enabled
describe yumrepo('local') do
  it { should exist }
  it { should be_enabled }
end

# make sure we've installed createrepo
describe package('createrepo') do
  it { should be_installed }
end

# confirm that we've createded a repo in the right place
describe file("/var/www/yum/repodata") do
  it { should exist }
  it { should be_directory }
end

# make sure we have a repo file for our upstream repo
describe file('/etc/yum.repos.d/node_a.repo') do
  it { should exist }
end

# make sure we have a repo file for our upstream repo
describe file('/etc/yum.repos.d/node_b.repo') do
  it { should exist }
end

# make sure the upstream repo is included in the repolist
describe command('yum repolist') do
  its(:stdout) { should contain("node_a") }
  its(:stdout) { should contain("node_b") }
end

# make sure our upstream repo has been created and enabled
describe yumrepo('node_a') do
  it { should exist }
  it { should be_enabled }
end

# make sure our upstream repo has been created and enabled
describe yumrepo('node_b') do
  it { should exist }
  it { should be_enabled }
end
