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

# make sure apache is installed
describe package('httpd') do
  it { should be_installed }
end

# make sure our httpd config is in place
describe file('/etc/httpd/conf/httpd.conf') do
  it { should exist }
end

# make sure our httpd config is in place
describe file('/etc/httpd-default/conf.d/localyum.conf') do
  it { should exist }
end

