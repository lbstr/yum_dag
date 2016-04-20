#
# Cookbook Name:: yum_dag
# Recipe:: enable_downstreams
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# install apache
yum_package 'httpd' do
  notifies :create, 'httpd_config[localyum]'
end

# create and start apache
httpd_service 'default' do
  action [:create, :start]
end

# configure apache
httpd_config 'localyum' do
  source 'httpd.conf.erb'
  action :create
  notifies :restart, 'httpd_service[default]'
  variables({
    :ip => node['ipaddress'],
    :doc_root => node['yum_dag']['local_repo']['location'],
    :server_name => node['yum_dag']['local_repo']['id']
  })
end