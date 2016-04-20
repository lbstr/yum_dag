#
# Cookbook Name:: yum_dag
# Recipe:: create_repo
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install createrepo package
yum_package 'createrepo'

# createrepo in destination
bash 'createrepo' do
  code "createrepo #{node['yum_dag']['local_repo']['location']}"
end

# configure the repository
yum_repository node['yum_dag']['local_repo']['id'] do
  baseurl       "file://#{node['yum_dag']['local_repo']['location']}"
  description   node['yum_dag']['local_repo']['description'] || node['yum_dag']['local_repo']['id']
  enabled       true
  gpgcheck      false
  action        :create
end
